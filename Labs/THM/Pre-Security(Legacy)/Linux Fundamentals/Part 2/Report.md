
# Linux Fundamentals - Part 2 - TryHackMe Walkthrough

[Room Link](https://tryhackme.com/room/linuxfundamentalspart2)

## Table of Contents

1. How does this topic relates with Cyber Security Business
2. Underlying concepts with security relevance
3. Hands-on Labs with challenges faced
4. Conclusion or Summary with Reflection

## How does this topic relates with Cyber Security in Business

This topic would be applicable for the higher authority or Business owner to monitor the Operating Systems in the office because it uses a SSH and the ability to switch user and set permissions of difference departments. For instance, the Sales department folders and file systems cannot be viewed or accessed by the Marketing Department because they have different authorities and duties, but they could have a folder where all departments are working to achieve a certain target in a business.

## Underlying concepts with security relevance

#### SSH 

Secure shell or SSH is a protocol that are encrypted to connect between two different devices.

*Security Relevance*: Make sure that the client has implemented cyber hygiene when connecting 2 different devices, for example: If device A wants to connect to device B via SSH, then implementing a unique and long password are the security principles. 

**Possible threats and mitigation**: The SSH port can be checked using a tool called `nmap`, whether it is opened or not based on the results that the tool shows. One possible mitigation is to perform a hardening on the device, which is disable certain features that the device has enabled by default.

#### Common Directories in Linux Operating System

![List of common Directories in Linux Operating System](Assets/9.png "On TryHackMe Labs machine.")

On the image given, there are a lot of common directories in Linux Operating System. This report will explain a number of commands that are widely utilised for ethical hacking purposes:

1. /etc - Stores system files that are used inside the Linux Operating System. Several examples are installer tools (`apt`, `dpkg`), Firewall configurations, Usernames and passwords of the user stored inside the system, and much more. 
2. /var - Stores data that is frequently accessed by a number of different services and programs run inside the system. Several examples include log files, databases, mail services, data backups, etc.
3. /root - The actual home directory for the `root` user. 
4. /tmp - Stores data that is infrequently accessed. This is useful for penetration testing process as this folder allows the threat actor to write scripts into this folder.
5. /usr - Stores a number of helper tools or scripts that is installed in the machine. Examples include wordlists, games, libraries, packages, binaries, etc.

*Security Relevance*: The importance of Linux common directories is to explore a number of different tools and features that the Linux Operating System had, such as security features, wordlists, tools, and other things that are related to Cyber Security.

**Possible Threats and Mitigation**: The threat actor may gain a root access in various ways, from the web app that is not sanitised to zero day vulnerabilities that are difficult to detect. One of the mitigations is to implement a hardening in the system, to add an extra layer of security and to limit the attacker so that the attack would be more difficult to break in.

## Hands-on Labs with challenges faced

#### Creating a SSH connection between the AttackBox and the target

![How to connect a target via SSH](Assets/0.png "How to connect machine target via SSH")

This is the thing that I never knew before. Sometimes, I always forget on how to connect machines when there is a SSH port opened. On the image given above, it provides the command and the output itself. It needs 2 things, the username and the IP address of the target. If there is missing one of the two credentials, then it is not possible to connect the target. You will gain access to the target's machine once you have logged in via the SSH. 

#### Answering the discussion question about Flags and Switches

![How to answer the flag and switches question](Assets/1.png "What flag to use")

I encountered the question in the section about Flags and Switches, which is written "What flag would we use to display the output in a "human-readable" way?". My initial thought was: What is the context, and what command is it? This question is a trap and requires me to analyse what the command is. Because the first question requires the reader to see the `ls` manual command, so I assume this third question is related about the `ls` command as well. I went through the man page of `ls`, and to make things a little easier, I search the command with the word "readable", which is written on the question. To search in the man page, type the symbol `/`, followed by a keyword that you want to search for. In this context, the word is "readable".

#### Discovering what is -R flag in rm

![The meaning of -R](Assets/2.png "What is -R in rm?")

My curiosity spikes when I read the terminal in one of TryHackMe's guide in "filesystem interaction continued". One of the walkthroughs provided by TryHackMe gave this command:
```
tryhackme@linux2:~$ rm -R mydirectory
tryhackme@linux2:~$ ls           
folder1
```

This is useful for removing directory, even if the directory contains something in it. After searching through the terminal, it provides the output above. I do not understand what is the relation between the recursive process of removing a directory. Well, it is already a fact since the manual has written its relationship:

`By default, rm does not remove directories.  Use the --recursive (-r or -R) option to remove each listed directory, too, along with all of its contents.`

(Source: manual of `rm` command).

#### The mv command

![Usecase 1](Assets/3.png "Use mv to move a file to a folder that you want to insert in.")

The main usage for the command `mv` is to move a file to a specific folder that is available inside the system. If the folder does not exist in the current working directory, in the image above is `/home/tryhackme`, it will change the name of the file instead of moving it into the new folder. The explanation is made clear by viewing the image below:

![Usecase 2](Assets/4.png "Use mv to rename file names.")

#### Switching users & Permissions

![Difference using -l flag and none](Assets/5.png "Switching users differences")

To switch users in the Linux Command Line Interface, there is command called `su`. This command logs in the user via the shell. Usage: `su <USER>`. The difference between `-l` flag in `su` command and authorising without the flag is that the `-l` flag provides the user to enter the system within the environment of the user logged in. For instance, if you login to the terminal with the user `/home/alice` to the user named "bob", the path will stay to `/home/alice` with the system logged in as bob if utilised without the `-l` flag. However, if it is utilised using the `-l` flag, then it is apparent that Alice will have access directly to bob's environment (`/home/bob`) without needing to go to his home directory again. This will be related on the image given below.

![-h flag in ls](Assets/6.png "list files on a human-readable way")

The relationship between the previous explanation is when you want to access a file or a folder, you need to have permission on which account you are using; determining the name of the user who has access to a specific file in order to switch user. On the first column, it shows the permissions that is allowed to access the file. For instance, the first row shows the file `important` can be read by everyone, but it only `user2` has the access to write the file. 

Here are the visual differences with and without using `-l` on `su` command.

![Without -l](Assets/7.png "No -l")

![With -l](Assets/8.png "With -l")

## Conclusion or Summary with Reflection

This room covers detailed explanation and more hands-on labs in Linux, especially in switching users, connecting another device using SSH within the same Operating System, as well as configuring permissions in a file system and switching different users. This is the continued learning journey from the previous part of the Linux Fundamentals part 1, as this covers more in-depth and hands-on labs compared with the previous one.

#### Reflection

I previously learned this room back in January 2025 or December 2024. I revisited and attempted this material again in January 2026 to reinforce my linux skills for industry usages. 
