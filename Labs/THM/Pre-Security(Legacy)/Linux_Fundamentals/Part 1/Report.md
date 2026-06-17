
# Linux Fundamentals - Part 1 - TryHackMe Walkthrough

[Room Link](https://tryhackme.com/room/linuxfundamentalspart1)

## Table of Contents

1. How does this topic relates with cyber security
2. Underlying concepts
3. Hands-on labs with challenges faced
4. Conclusion
5. Achievements

## How does this topic relates with Cyber Security in Business context

This concept is a crucial building block for someone who wants to step in the Cyber Security industry, as these commands are the fundamental building blocks for achieving a success in finding vulnerabilities. If there is a back-end developer in your company, who sends you thousands of log lines that you need to analyse the vulnerability, what is the first thing that you need to do? Besides of understanding on how to filter keywords for a specific file, you need to understand several things, such as what is the system is running on (is it a web server, an FTP, or a USB communication?), What IP addresses that are visible in the logs, as well as how to store the specific keyword into a single file so that it is manageable and readable by Security analysts?

## Underlying concepts

#### Background about Linux

Linux is a term that is broad because it has a lot of Operating Systems that are based on UNIX. Open-source is one of its uniqueness that other Operating System does not implement. The first release of this Operating System is 1991 by Linus Torvalds to create a free Operating System kernel. 

*Security Context*: Linux is a popular operating system because it offers a lot of exploitation tools that helps the attacker to find vulnerabilities, as well as malware analysts to help analyse a number of evidences.

*Threat and Mitigation*: Because Linux is an Open-Source software, it is not as secure as other Operating Systems like Windows or MacOS. One of the mitigation that can be performed is doing an Operating System hardening.

## Hands-on labs with challenges faced and what I learn something new.

#### Interacting with the CLI

![Commands ran](Assets/0.png "Commands ran")

The first thing that this room wants you to run is the `echo` and `whoami` command in Linux. Both of these syntaxes perform a simple thing, which is to print a text written and displaying your username. For `echo` command, I just known that you do not have to use quotes to print a single text. Example: `echo this is a text`. This just outputs to the terminal `this is a text`. For the `whoami` command, it just prints the username of the system. 

![File systems](Assets/1.png "File systems")

The interesting thing is the question 2: `Which directory contains a file?`. I performed a simple command that checks all folders that contains a file or not. This helps efficiency to check a single folder whether a directory contains a file or not in the machine. 

![Fourth Discussion Question](Assets/2.png "Using cd to navigate the file and print the working directory.")

There is a question in one of the module, written as this: "Use the cd command to navigate to this file and find out the new current working directory. What is the path?". To maintain efficiency, we use the command above. This command is go to the folder that contains the file, then print the working directory. The semicolon `;` in the terminal indicates that it reads as a new line after the semicolon. For example: `cd Pictures/; ls`. This action will run the first command, whether it is successful or not, then it will execute the second one. 

![Interesting command](Assets/3.png "the wc command")

While I was reading the section called Searching for Files, I found one interesting command that is written, but does not mentioned. It is called `wc`. This command is performing a word or line count of a specific file (source: `man wc`). The command `wc -l <FILE>` means that the command `wc` is executed, then it filters out the option to filter how many lines of a specific file. In return, it returns the number of lines and the file name of the file entered. I also learned how to differentiate between `find` and `grep`. `find` is useful when searching for files in a system, while `grep` is useful when you are searching for a specific entry inside a file that you know. Combining these 2 commands will be powerful as it could find any file and search the content in it.

![Manual](Assets/3a.png "the wc command explained.")



![Operators](Assets/4.png "Operators")

I never knew that the '&' operator is utilised for running a command in the background. When I ran the command `ls & cat access.log`, it outputs both the command, with the results above. Then, what differentiates with the '&&' operator? The '&&' operator will run the second command, IF the first command ran is successful. For the '&' operator, it may run even if the first command has an error.

![Demo](Assets/5.png "Demonstration between & and &&.")

It is apparent that these differences can be seen. 

![Wrong answer](Assets/6.png "Wrong answer")

I thought it was using `grep`, because it finds the file of that name and replace it. But, the question specifies on the "replace contents of a **file** named "passwords" with the word "password123" ". It means: There is a file called passwords, and the task is to replace all the content of passwords file to password123. So, instead of using `grep`, it uses the command that is firstly introduced. 

![Differences between > and >>](Assets/7.png "Differences between > and >>")

There are slight difference between the bigger than operator. The `>` operator completely replaces the content of the file, while the `>>` operator adds the content to the file without losing any of the content of the file. Differences are seen by the image above. 

## Conclusion

This room introduces the concept of using a Command-Line Interface (CLI) in Linux Operating System who never uses it. It covers a fundamental concepts such as file listing, changing directories, searching for files, adding content to a specific file, and many more covered above.

## Achievements
Badge

[cat linux.txt](https://tryhackme.com/jsnjsnut1001/badges/terminaled)

![Analysis](Assets/8.png)


