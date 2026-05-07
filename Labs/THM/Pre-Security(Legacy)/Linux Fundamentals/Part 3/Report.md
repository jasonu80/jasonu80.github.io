
# Linux Fundamentals - Part 3 - TryHackMe Walkthrough

[Room Link](https://tryhackme.com/room/linuxfundamentalspart3)

## Table of Contents

1. How does this topic related with cyber security in Business
2. Underlying Concepts with Threats and Mitigations
3. Hands-on Labs with Challenges faced
4. Conclusion or Summary

## How does this topic relates with cyber security in Business

This room teaches about system processes and softwares in Linux. In Business scenario, this will be applicable for clients detecting anomalies and performing log analysis of a file. One of the reasons is that these methods are designed to prevent the system from to harm and apply the usage of services that are available in Linux to protect any future attacks.

## Underlying concepts

#### Terminal Text Editors 

What I know: There are multiple of text editors in Linux, the most popular are `vim` and `nano`. Both of the tools are utilised like a text editor.

What I discovered: `nano` is a standard and popular text editor in most Linux Distributions, while `vim` is the next-level text editor in Linux. 

Then what: By mastering these text editors, it will be easy for performing a number of operations in the terminal while searching in a file. For instance, if there is a giant piece of text, you would use `nano` for performing a search of a keyword, while using `vim` for navigating through different pages.

#### Processes

What I know: It shows how many memory consumed in a system.

What I discovered: Not only it shows how many memory consumed in a particular system, it also shows the ID that a kernel operates, which is called Process ID (PID). The PID does not decrease, it always increase. The command to run a process is `ps`. To view other users processes, add `aux` after `ps`. It displays the processes that the system is running. The interactive version of this command is called `top`, which the process will be refreshed every 10 seconds. The Process ID can be terminated to stop the application or service completely. For instance: if there is a PID of 9201 that runs an app, then to stop the app completely, we need to kill the PID 9201 by: `kill 9201`. 

If a client needs to start a process or service on a boot, then it is viable to use the command `systemctl`. It is a command that interacts with the process or daemon of the computer or laptop. The usage of the command is the following: `systemctl [start/enable/disable/stop] [service]`. To start or activate the service, a client could use `systemctl start service`. If a service or program is started but not enabled (means that the service is not started when the OS is booted up), the client could use `systemctl enable service`. This enables the service to start after boot up.

Background a process means that the process is stopped until we continue it, while foreground a process means that the process is continued from the background process. The background could be run by using a command followed with `&` or `bg` for bash files. Example: `echo "K" &`. This will pause the process of printing the word K. If a client wants to continue the process, he/she could use foreground, by typing `fg`. 

Then what: This helps determine what processes and services are running in a system. When a program or application crashed, it is possible to utilise the processes to kill the PID (Process ID) of the process itself so that the application restarts and continue the process as normal. The backgrounding process is useful when a client wants to run an additional script while the process is still at held. For instance, when a user run a command `echo "J"`, then backgrounding it would add another bash syntax to run after `echo "J"`. 

#### General or useful Utilities

What I know: None.

What I discovered: Commands that are useful for downloading resources from a web server or file transfer, as well as serving resources. These commands are `wget`, `scp`, and `http.server` (uses python for this feature). 

Then what: By knowing that it is possible to download and upload files in any protocol, then it is also possible to upload malicious scripts or download sensitive information from a vulnerable machine. 

#### How to maintain Linux System: Automation, Package Management, Logs.

What I know: Package Management is utilised for installing tools and packages, Logs for accessing traffic history.

What I discovered: Automation is possible to be run in a linux environment by using `cron` with its interactive version `crontabs`. It can be run using `crontab -e`, which means to edit the current crontab using a text editor (Source: man page of cron).

Package Management allows the client to install and add software installation in the `.list` format. It needs to be approved by the Operating System vendor list. If it is approved, then the programs and applications will be released into the "apt" repository. 

Logs in the Linux Operating System is located at /var/logs directory. There are a number of different services running in a Linux machine: Apache2 web server, Fail2ban service (For brute force purposes), and UFW service for firewall. There are 2 types of logs that are important, which are Access and error logs. 

Then what: It provides a guide to the client or the user in Linux for installing applications that are approved by the community and able to analyse logs in the machine to detect any anomalies of the system. 

## Hands-on Labs with challenges faced

#### Create a file using `nano`

![Create file](Assets/0.png "Create file using nano")

The command to get the popup above is: `nano myfile`. The `myfile` is the name of the file that you want to create or edit. If there is no file name exists in the working directory, it will create the file instead. To Save, hit `Ctrl+O`, enter, then `Ctrl+X` to exit. The `Ctrl` button is located next to `Fn` and beside the shift keys in some keyboards.

#### Retrieve contents from the vulnerable machine

There are multiple ways for performing this. The first way is using a `http.server` and `wget` on the vulnerable machine and download it from the other machine (from the image above) and the second way is using `scp` command.

##### First way: Serving and downloading the contents.

![Retrieve contents from vulnerable machine](Assets/1.png "Retrieve contents from a vulnerable machine")

![Download contents and view the content](Assets/2.png "Download and view the contents of the file.")

Possible errors: direct the output into a file with the same extension, such as `wget source/filename > filenameX; cat filenameX`. I tried this and the output (`filenameX`) does not show anything. The contents of the download will be viewable with the name of that is same within the source.

Proof-of-Concept:

![wget redirection output will not work](Assets/3.png "Don't redirect the output when using wget.")

##### Second Way: Using `scp` for retrieving the file.

The `scp` syntax works only with Source and destination only, with the files that will be sent or downloaded from the web server. Still, it requires the web server, if there is no web server, it is possible to only send the file. 

Upload: `scp file_on_local source@destination:file_on_transfer`

Download: `scp source@destination:file_available name_we_want`

The screenshot below demonstrates an SCP without the need to use `http.server`:

![Using SCP to transfer files](Assets/4.png "SCP to transfer files")

![Result check](Assets/5.png "Results")

More info about `http.server` with python3: [Link](https://docs.python.org/3/library/http.server.html)

#### Wrong Answer on discussion question

![Cleanly kill Process](Assets/6.png "Cleanly kill process")

To completely kill the process, there is a term that starts with the word "SIG" followed by the action to signalise that the process had been killed. 

#### How to find a process in `ps aux`

![Find the matching keyword](Assets/7.png "Find a keyword in ps aux")

To find a service, it is possible to utilise `grep` to find the keyword. There is an operator that is not covered in TryHackMe, which is the pipe (`|`) operator. This acts as an additional input command after the previous command has ran. This is useful when we want to perform a search in a specific file. For instance, `cat file.txt | grep "keyword"`.

#### Identify when the command is running using crontab

![Identify when a command is running using crontab](Assets/8.png "When a command is running")

To identify the command that is running inside cron, it is possible to check the comment that is located in the very bottom. This is utilised for automation purposes in a UNIX machine. To open the editor, use `crontab -e` to open the editor and identify what and when the command is running. On the image above, it is clear that the command `/var/opt/processes.sh` will run after the reboot. The command can be checked via [Crontabguru](https://crontab.guru/).

#### Viewing one of the application logs of a Linux Operating System

![View logs](Assets/9.png "View logs")

It is possible to view the logs of a service that runs in a linux Operating System, especially Debian Distros. In the image given above, it is apparent that the log access of the service apache2 has only 1 record, which can be accessed via the file `access.log.1`. The other access logs, however, is unable to be viewed due to file permissions. 

## Conclusion or Summary

This room is the final fundamentals room for learning Linux. The spirit of learning needs to be high to gain knowledge on Cyber Security both in theory and practice. This is a crucial building block for fundamentals as this room provides an additional important component that is build up from part 1 and part 2.
