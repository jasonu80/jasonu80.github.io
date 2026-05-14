# Hands-on Activity (Securing AI Supply Chain) {Premium}

# Room Link

[Link](https://tryhackme.com/room/securing-the-ai-supplychain)

# Technical details and steps

### Question

Examine the checksums. Which model file does not match its expected hash?

What severity level does ModelScan assign to an `os.system` call in a model file?

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


