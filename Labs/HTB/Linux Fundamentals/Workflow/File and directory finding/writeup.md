# File and Directory Finding -- HTB Hands-on Labs

[Room link](https://academy.hackthebox.com/app/module/18/section/81)

# Instructions

SSH: htb-student:HTB_@cademy_stdnt!

# Questions

1. What is the name of the config file that has been created after 2020-03-03 and is smaller than 28k but larger than 25k?
2. How many files exist on the system that have the ".bak" extension?
3. Submit the full path of the "xxd" binary.
4. (optional) Try the different utilities and find everything related to the `netcat / nc` tool.

# Thinking Steps

## Question 1

Hmm, there should be a filter while doing a file search. -> `man find`.

Okay, there is a filter called `%A` in the find command, which filters time and date in the find command.

Let's try list all the config files, using the find command. (Need some refreshment of searching the exact file name.)

Syntax: `find / -name "*.conf"`.

Results:

```
find: ‘./sys/kernel/debug’: Permission denied
find: ‘./sys/fs/pstore’: Permission denied
find: ‘./sys/fs/fuse/connections/50’: Permission denied
find: ‘./sys/fs/fuse/connections/45’: Permission denied
find: ‘./lost+found’: Permission denied
find: ‘./home/mrb3n/.gnupg’: Permission denied
find: ‘./home/mrb3n/.cache’: Permission denied
find: ‘./home/mrb3n/.ssh’: Permission denied
find: ‘./home/mrb3n/.local/share’: Permission denied
find: ‘./home/cry0l1t3/.gnupg’: Permission denied
find: ‘./home/cry0l1t3/.cache’: Permission denied
find: ‘./home/cry0l1t3/.ssh’: Permission denied
find: ‘./home/cry0l1t3/.local/share’: Permission denied
find: ‘./var/spool/rsyslog’: Permission denied
find: ‘./var/spool/postfix/incoming’: Permission denied
find: ‘./var/spool/postfix/maildrop’: Permission denied
find: ‘./var/spool/postfix/flush’: Permission denied
find: ‘./var/spool/postfix/bounce’: Permission denied
find: ‘./var/spool/postfix/defer’: Permission denied
find: ‘./var/spool/postfix/public’: Permission denied
find: ‘./var/spool/postfix/corrupt’: Permission denied
./var/spool/postfix/etc/nsswitch.conf
./var/spool/postfix/etc/resolv.conf
./var/spool/postfix/etc/host.conf
find: ‘./var/spool/postfix/trace’: Permission denied
find: ‘./var/spool/postfix/deferred’: Permission denied
find: ‘./var/spool/postfix/hold’: Permission denied
find: ‘./var/spool/postfix/active’: Permission denied
find: ‘./var/spool/postfix/private’: Permission denied
find: ‘./var/spool/postfix/saved’: Permission denied
find: ‘./var/spool/cron/atspool’: Permission denied
find: ‘./var/spool/cron/crontabs’: Permission denied
find: ‘./var/spool/cron/atjobs’: Permission denied
find: ‘./var/cache/ldconfig’: Permission denied
find: ‘./var/cache/apt/archives/partial’: Permission denied
./var/log/installer/subiquity-curtin-install.conf
find: ‘./var/log/unattended-upgrades’: Permission denied
find: ‘./var/log/mysql’: Permission denied
find: ‘./var/log/samba’: Permission denied
find: ‘./var/log/apache2’: Permission denied
./var/lib/ucf/cache/:etc:dovecot:conf.d:20-imap.conf
./var/lib/ucf/cache/:etc:dovecot:conf.d:10-master.conf
./var/lib/ucf/cache/:etc:dovecot:conf.d:10-logging.conf
./var/lib/ucf/cache/:etc:dovecot:conf.d:10-director.conf
...
```

Okay, at least we get the filename .conf at the end.

We can filter based on the date, using `%AF 2020-03-03`.

Apply to the command and we get an error:

```bash
htb-student@nixfund:/$ find . -name "*.conf" %AF 2020-03-03
find: paths must precede expression: `%AF'
```

Now we know where it is wrong: It uses -printf %AF 2020-03-03.

Let's see if this changes the result:

```bash
htb-student@nixfund:/$ find . -name "*.conf" -printf %AF 2020-03-03
find: paths must precede expression: `2020-03-03'
```

I got stuck and try to read the instructions and take certain command notes from there.

After experimenting with a number of different commands, we get the file and folder that we are looking: 

```bash
htb-student@nixfund:/$ find . -name "*.conf" -newermt 2020-03-03 -size +25k -size -28k -exec ls -la {} \; 2>/dev/null
-rw-r--r-- 1 root root 27422 Jun 12  2020 ./usr/share/drirc.d/00-mesa-defaults.conf
```

There are certain filters that I learn here, here is the flags:

`-newermt` is the filter where it filters the file after the date specified.

`-size` specifies the minimum or maximum size of the file that we want to find.

`-exec` executes a command

`{}` put the results in the curly brackets from the `-exec` flag.

`\` The backslash will escape the character. It will not run the command if we do not escape it.

`2>/dev/null` redirects standard error to NULL. It means that we are not displaying the standard error of the results while finding it.

## Question 2

The objective of this question is to find the `.bak` files in the system.

So, the command for this is:

```bash
htb-student@nixfund:/$ find . -name "*.bak" -type f -exec ls -la {} \; 2>/dev/null
-rw------- 1 root shadow 1362 Sep 23  2020 ./var/backups/shadow.bak
-rw------- 1 root shadow 716 Sep 23  2020 ./var/backups/gshadow.bak
-rw------- 1 root root 860 Sep 23  2020 ./var/backups/group.bak
-rw------- 1 root root 2014 Sep 23  2020 ./var/backups/passwd.bak
```

There is a `-f` flag, which specifies that the target is the file.

### EFFICIENT WAY

Use the command `locate *.bak` to get the number of files in the system. The drawback for this command is the limited abilities to filter files that we want to search.

## Question 3

We can use the command `which` to see the path of `xxd` library.

```bash
htb-student@nixfund:/$ which xxd
/usr/bin/xxd
```

## Question 4

I tried different command utilities and here are some path locations, including netcat itself:

```bash
htb-student@nixfund:/$ which netcat
/bin/netcat
htb-student@nixfund:/$ which sudo
/usr/bin/sudo
htb-student@nixfund:/$ which awk
/usr/bin/awk
htb-student@nixfund:/$ which ufw
/usr/sbin/ufw
```
