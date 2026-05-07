# Fill in the blanks.

# Directory: /var/log
# Flag: thm-flag01-script

#!/bin/bash

# Defining the directory to search our flag
directory=" "

# Defining the flag to search
flag=" "

echo "Flag search in directory: $directory in progress..."

# Defining for loop to iterate over all the files with .log extension in the defined directory
for file in " "/*.log; do
    # Check if the file contains the flag
    if grep -q "$flag" "$file"; then
        # Print the filename
        echo "Flag found in: $(basename "$file")"
    fi
done

# Answer:

#user@tryhackme:~$ ./flag_hunt.sh 
#Flag search in directory: /var/log in progress...
#grep: /var/log/apport.log: Permission denied
#grep: /var/log/auth.log: Permission denied
#Flag found in: REDACTED
#grep: /var/log/cloud-init-output.log: Permission denied
#grep: /var/log/cloud-init.log: Permission denied
#grep: /var/log/kern.log: Permission denied
#user@tryhackme:~$ cat /var/log/REDACTED 
#REDACTED
#thm-flag01-script

