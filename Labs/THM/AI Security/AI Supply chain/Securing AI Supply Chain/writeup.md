# Hands-on Activity (Securing AI Supply Chain) {Premium}

# Room Link

[Link](https://tryhackme.com/room/securing-the-ai-supplychain)

# Technical details and steps

### Question

Examine the checksums. Which model file does not match its expected hash? [First question](#first-question)

What severity level does ModelScan assign to an `os.system` call in a model file? [Second question](#second-question)

What is the name of the suspicious Lambda layer? [Third question](#third-question)

### Technical steps

### First question

I was scrolling through different directories to find the checksum directory, finally founded in the incident directory:

```bash
analyst@tryhackme-2204:/opt/supply-chain/incident/checksums$ ls
expected_hashes.json
analyst@tryhackme-2204:/opt/supply-chain/incident/checksums$ cat expected_hashes.json 
{
  "original_model.pkl": "793bb2f5bfdf4a1ceb448647885ade7909480a05dc12479c508e7c7f28d29077",
  "original_model.safetensors": "46329f0c011e4d59d588fef1370c0e81ebba132841b7d8d4e2c476d19a150635"
}
```

There are 2 models: The pickle and safetensors model.

Going back to the model directory, we can check the model checksums using `sha256sum`.

```bash
analyst@tryhackme-2204:/opt/supply-chain/incident/checksums$ cd ../models/
analyst@tryhackme-2204:/opt/supply-chain/incident/models$ ls
baseline_model.h5  candidate_model.h5  original_model.pkl  original_model.safetensors  production_model.pkl
analyst@tryhackme-2204:/opt/supply-chain/incident/models$ sha256sum original_model.pkl original_model.safetensors 
793bb2f5bfdf4a1ceb448647885ade7909480a05dc12479c508e7c7f28d29077  original_model.pkl
46329f0c011e4d59d588fef1370c0e81ebba132841b7d8d4e2c476d19a150635  original_model.safetensors

```

I have not checked for the production model, so I might want to check that one.

```bash
analyst@tryhackme-2204:/opt/supply-chain/incident/models$ sha256sum production_model.pkl 
c4e5d9e4436033b5af27d2c848025ca1f85f38c04a631703e24ecb761234fcd6  production_model.pkl
```

I got stuck over here, so I refer back to the steps that the TryHackMe has given. I realised that the directory should be located in the models instead of the incident, i.e `models/`, not `incident/models/`. 

So, I changed it and try to check the checksums:

```bash

analyst@tryhackme-2204:/opt/supply-chain/incident/models$ cd ../..
analyst@tryhackme-2204:/opt/supply-chain$ cd models
analyst@tryhackme-2204:/opt/supply-chain/models$ ls
checksums.json     code_reviewer_v1.pkl  image_classifier_v2.h5  product_recommender.pkl
code_reviewer.pkl  image_classifier.h5   model_review_v2.pkl     product_recommender.safetensors
analyst@tryhackme-2204:/opt/supply-chain/models$ cat checksums.json 
{
  "product_recommender.safetensors": "c59f50869015d4569412ddf6a56723fa3fafe9e81353fd31c710c6f993dfd83b",
  "model_review_v2.pkl": "b7c4d2e8f1a3b5c6d7e8f9a0b1c2d3e4f5a6b7c8d9e0f1a2b3c4d5e6f7a8b9c0",
  "product_recommender.pkl": "e4e71a435d614cbdc55b03a3024a011fa0b2da0193490dfa2b3bb309d37c5765"
}analyst@tryhackme-2204:/opt/supply-chain/models$ sha256sum product_recommender.safetensors model_review_v2.pkl product_recommender.pkl
c59f50869015d4569412ddf6a56723fa3fafe9e81353fd31c710c6f993dfd83b  product_recommender.safetensors
58ebc2e4ef8267e797a2aaa7821a5974e84cac2bb5fc5722064bcd3f1d9340db  model_review_v2.pkl
e4e71a435d614cbdc55b03a3024a011fa0b2da0193490dfa2b3bb309d37c5765  product_recommender.pkl

```

Now, we know that the model review pickle file extension is considered malicious, since it has the different hash with the expected checksum, which breaches the integrity of the file.

The answer for this question is: `model_review_v2.pkl`.

### Second question

The second question is part of the task 5, where it utilises the tool called **Fickling** and **ModelScan** to check if the file has vulnerability present.

**Fickling** is a python tool that conducts a static file analysis specific for pickle files. 

Let's see this in action!

```bash
analyst@tryhackme-2204:/opt/supply-chain/models$ fickling --check-safety code_reviewer.pkl
analyst@tryhackme-2204:/opt/supply-chain/models$ fickling --check-safety -p code_reviewer.pkl
`from os import system` is suspicious and indicative of an overtly malicious pickle file
Variable `_var0` is assigned value `system(...)` but unused afterward; this is suspicious and indicative of a malicious pickle file
Warning: Fickling detected that the pickle file may be unsafe.

Do not unpickle this file if it is from an untrusted source!
```

When I pass the file without the `-p` flag, it does not return any results to the terminal. That is where `-p` comes into play, where it prints the safety check in the terminal.

Let's check for other files as well.

```bash
analyst@tryhackme-2204:/opt/supply-chain/models$ fickling --check-safety -p code_reviewer_v1.pkl 
`from __main__ import _Room2_BenignModel` imports a Python module that is not a part of the standard library; this can execute arbitrary code and is inherently unsafe
Warning: Fickling detected that the pickle file may be unsafe.

Do not unpickle this file if it is from an untrusted source!

analyst@tryhackme-2204:/opt/supply-chain/models$ fickling --check-safety -p product_recommender.pkl

analyst@tryhackme-2204:/opt/supply-chain/models$ fickling --check-safety -p model_review_v2.pkl 
`from os import system` is suspicious and indicative of an overtly malicious pickle file
Variable `_var0` is assigned value `system(...)` but unused afterward; this is suspicious and indicative of a malicious pickle file
Warning: Fickling detected that the pickle file may be unsafe.

Do not unpickle this file if it is from an untrusted source!
```

The `product_recommender.pkl` does not return anything after being checked, which indicates that the pickle file is not malicious.


**ModelScan** is the next level of **fickling**. It supports the safety scan like **fickling**, but with the support of other models as well with pickle models.

### Difference

**Fickling**: Performs a static analysis only on *Pickle* models.

**ModelScan**: Performs a static analysis with all other models, such as TensorFlow, Keras, etc.

Let's see this in action!

```bash
analyst@tryhackme-2204:/opt/supply-chain/models$ modelscan -p code_reviewer.pkl

...
Scanning /opt/supply-chain/models/code_reviewer.pkl using modelscan.scanners.PickleUnsafeOpScan model scan

--- Summary ---

Total Issues: 1

Total Issues By Severity:

    - LOW: 0
    - MEDIUM: 0
    - HIGH: 0
    - CRITICAL: 1

--- Issues by Severity ---

--- CRITICAL ---

Unsafe operator found:
  - Severity: CRITICAL
  - Description: Use of unsafe operator 'system' from module 'os'
  - Source: /opt/supply-chain/models/code_reviewer.pkl
```

From here, it answers to the question second question: `CRITICAL`. This is because `system` is used for connecting the threat actor's address, leading to privilege escalation.

It also supports pickle file formats! Let's see for other models, such as TensorFlow & keras:

```bash
analyst@tryhackme-2204:/opt/supply-chain/models$ modelscan -p product_recommender.safetensors 
...
--- Summary ---

 No issues found! 🎉

--- Skipped --- 

Total skipped: 1 - run with --show-skipped to see the full list.

analyst@tryhackme-2204:/opt/supply-chain/models$ modelscan -p image_classifier.h5 
...
Scanning /opt/supply-chain/models/image_classifier.h5 using modelscan.scanners.H5LambdaDetectScan model scan

--- Summary ---

 No issues found! 🎉

```

### Third question

There is a tool called `inspect_h5_model` located in the tools directory (`/opt/supply-chain/tools`)

On there, it is possible to check any suspicious Keras model.

We check for each Keras model in the directory that has the suspicious model. 

```bash
analyst@tryhackme-2204:/opt/supply-chain/models$ ../tools/inspect_h5_model.py image_classifier.h5

=== Architecture Inspection: image_classifier.h5 ===

  Total layers: 4

  [OK]      InputLayer           input_layer
  [OK]      Flatten              flatten
  [OK]      Dense                dense
  [OK]      Dense                dense_1

  RESULT: All layers are standard. No suspicious layers detected.

analyst@tryhackme-2204:/opt/supply-chain/models$ ../tools/inspect_h5_model.py image_classifier_v2.h5

=== Architecture Inspection: image_classifier_v2.h5 ===

  Total layers: 5

  [OK]      InputLayer           input_layer_1
  [OK]      Flatten              flatten_1
  [OK]      Dense                dense_2
  [OK]      Dense                dense_3
  [WARNING] Lambda               manipulate_output (function: manipulate_output)

  RESULT: 1 layer(s) require review
    - Lambda (manipulate_output): Can contain arbitrary Python code that executes at inference time
```

Now, we know the second version is the suspicious one.

The lambda layer name is called `manipulate_output`. 


# Generate SBOM with Syft

**Syft** is a tool generator for SBOM (Software Bill of Materials) to analyse project directories and create SBOM in multiple formats. 

Let's see this in action!

```bash
analyst@tryhackme-2204:/opt/supply-chain/project$ syft ./ --exclude './venv/*' -o cyclonedx-json > ./sbom.json
[0030] ERROR failed to fetch latest version: Get "https://toolbox-data.anchore.io/syft/releases/latest/VERSION": dial tcp 172.66.171.139:443: i/o timeout
 ✔ Indexed file system                                                                                                                           . 
 ✔ Cataloged contents                                                             cdb4ee2aea69cc6a83331bbe96dc2caa9a299d21329efb0336fc02a82e1839a8 
   ├── ✔ Packages                        [6 packages]  
   ├── ✔ Executables                     [0 executables]  
   ├── ✔ File digests                    [1 files]  
   └── ✔ File metadata                   [1 locations]  
[0030]  WARN no explicit name and version provided for directory source, deriving artifact ID from the given path (which is not ideal)
```

Review what is identified by Syft:

```bash
analyst@tryhackme-2204:/opt/supply-chain/project$ syft ./ --exclude './venv/**' -o table
[0031] ERROR failed to fetch latest version: Get "https://toolbox-data.anchore.io/syft/releases/latest/VERSION": dial tcp 172.66.171.139:443: i/o timeout
 ✔ Indexed file system                                                                                                                           . 
 ✔ Cataloged contents                                                             cdb4ee2aea69cc6a83331bbe96dc2caa9a299d21329efb0336fc02a82e1839a8 
   ├── ✔ Packages                        [6 packages]  
   ├── ✔ File digests                    [1 files]  
   ├── ✔ File metadata                   [1 locations]  
   └── ✔ Executables                     [0 executables]  
[0031]  WARN no explicit name and version provided for directory source, deriving artifact ID from the given path (which is not ideal)
NAME          VERSION  TYPE      
accelerate    0.24.0   python    
numpy         1.24.3   python    
pillow        9.2.0    python    
safetensors   0.4.0    python    
torch         2.1.0    python    
transformers  4.35.0   python    
```

It provides the package name with the versions for the table.

Below is how to read json file using a Linux terminal:

```bash
cat sbom.json | python3 -m json.tool | less
```

This ensures that the JSON file is formatted to make it pretty and easy to see.