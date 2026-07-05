# File System Management -- HTB Linux Hands-on labs

[Link](https://academy.hackthebox.com/app/module/18/section/2096)

# Questions

1. How many partitions exist in our Pwnbox? (Format: 0)

# Thinking steps

There are multiple ways to answer this question.

The first way is to use the command line: `sudo fdisk -l`, gives the number of partition in the system itself.

The second way is using GParted software, and view the number of disks: `gparted` in terminal, and it will open the software (If there is a software installed).