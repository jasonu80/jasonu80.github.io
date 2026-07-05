# Regex -- HTB Hands-on labs

# Questions

1. Show all lines that do not contain the # character.
2. Search for all lines that contain a word that starts with Permit.
3. Search for all lines that contain a word ending with Authentication.
4. Search for all lines containing the word Key.
5. Search for all lines beginning with Password and containing yes.
6. Search for all lines that end with yes.

# Thinking steps and answers

### My answers (Hypothesis):

1. grep -vE “#” /etc/ssh/sshd_config
2. grep -E "#Permit" /etc/ssh/sshd_config
3. grep -E "+(Authentication)" /etc/ssh/sshd_config
4. grep -E "(Key)[^s]" /etc/ssh/sshd_config
5. grep -E "(Password)" /etc/ssh/sshd_config | grep -E "yes" 
6. grep -E "yes" /etc/ssh/sshd_config

