# Filter contents - HTB Hands-on Lab

SSH: htb-student:HTB_@cademy_stdnt!

# Questions

## Mandatory

1. How many services are listening on the target system on all interfaces? (Not on localhost and IPv4 only)
2. Determine what user the ProFTPd server is running under. Submit the username as the answer.
3. Use cURL from your Pwnbox (not the target machine) to obtain the source code of the "https://www.inlanefreight.com" website and filter all unique paths (https://www.inlanefreight.com/directory" or "/another/directory") of that domain. Submit the number of these paths as the answer.

## Extra Practice 

1.	A line with the username cry0l1t3.
2.	The usernames.
3.	The username cry0l1t3 and his UID.
4.	The username cry0l1t3 and his UID separated by a comma (,).
5.	The username cry0l1t3, his UID, and the set shell separated by a comma (,).
6.	All usernames with their UID and set shells separated by a comma (,).
7.	All usernames with their UID and set shells separated by a comma (,) and exclude the ones that contain nologin or false.
8.	All usernames with their UID and set shells separated by a comma (,) and exclude the ones that contain nologin and count all lines of the filtered output.


# Thinking Steps

## Mandatory

### Question 1

This question has been stucked for a few days, until I look up the writeup.

It uses `netstat -l` to list all the running services.

Well, I tried to get the first result from the IP and localhost: which there are 20 total IPv4 addresses and localhosts.

Command: `netstat -l | head -n 30`

Then, for the second result is not from the IP nor localhost: There are 86 of them.

Method: Count the total lines using `wc -l` then subtract the total lines on the IPv4 and localhost 

Total Lines: 118

Total lines for IPv4 and localhost (including inactive ones + headers from the non IPv4 nor localhost): 32

So, we want to print the last 86 lines from the netstat command.

The result is that all of the services are listening, which is a good news!

So, there are 86 + 20 = 106 active services running.

The answer is not correct, although this is not wrong.

Hmmm, where's my flaw?

After reading the writeup, the command is written:

`netstat -l | grep LISTEN | grep -v localhost | grep 0.0.0.0` [Credit](https://viscid.substack.com/p/htb-academy-linux-fundamentals-filter-contents-6a7e9ce626c6)

After re-reading a hundred times, I finally could understand the question: `(not on localhost AND ipv4 only)`

Logically: (NO Localhost) && (IPv4).

So, we don't want to have localhost in the system and filter only the IPv4 address.

We count the lines based on the command above.

We add: `wc -l`.

So, the final command is:

`netstat -l | grep LISTENING | grep -v localhost | grep 0.0.0.0 | wc -l`

We got 7 services listening.

Finally we got it correct!

### Question 2

We found that when we list `systemctl -all`, we found the name of proftpd.

So, we want to find the username.

I find through Google and found that there is a configuration file, located in `/etc/proftpd/proftpd.conf`.

Quickly, I found the file and read it.

It contains a lot of hashtags, which is comments. We need to get rid of it.

So, the command is: `cat /etc/proftpd/proftpd.conf | grep -v "#" | grep User`

If we want to ignore the case, we can use `-i` option in grep.

`cat /etc/proftpd/proftpd.conf | grep -v "#" | grep -i user`

### Question 3

The answer is 26 (Wrong btw).

`curl https://www.inlanefreight.com | grep -i https://www.inlanefreight.com/<directory>`

The directories and number of the subs are:

1. index.php -> 5
2. wp-includes -> 5
3. wp-content -> 16

From the [Source](https://viscid.substack.com/p/htb-academy-linux-fundamentals-filter-contents-6a7e9ce626c6) given, we need to truncate the space into `\n`.

So, it is possible to `tr " " "\n"`.

We found 6 duplicates of the original URL after filtering using `tr`.

`curl https://www.inlanefreight.com | tr " " "\n" | grep -i https://www.inlanefreight.com | wc -l`

50 total lines.

And we found 10 duplicates for the sections. (about, news, contact, etc.)

So, calculating that, we found: 50-10-6 = 34 unique links.

What if we have more than 9000 duplicates?

We can use `sort -u` to make it unique.

So, the command is:

`curl https://www.inlanefreight.com | tr " " "\n" | grep -i https://www.inlanefreight.com | sort -u | wc -l`

There are 38 different directories that are listed, one of them still contain a duplicate.

We can also filter using regex, based on the writeup given. 

Regex: `([^#"]+)`

It means that filter the words that does not contain "#" or a quotation mark '"' as well as the other words after.

Example: Hello"!JNDJJJNJNDhuduhfeuhg

Regex filter: Hello

Additional: `grep -oE 'https://www.inlanefreight.com/([^#"]+)'`

Final command:

`curl https://www.inlanefreight.com | tr " " "\n" | grep -i https://www.inlanefreight.com | sort -u | wc -l | grep -oE 'https://www.inlanefreight.com/([^#"]+)'`

## Extra Challenge

1. `cat /etc/passwd | grep -v /sbin/nologin |tr ":" " " | awk '{print $1}' | grep cry0l1t3`

`cat /etc/passwd`: Show the content of `/etc/passwd`

`grep -v /sbin/nologin`: Show the results that does not contain `/sbin/nologin`

`tr ":" " "`: Replace colon `:` with Space ` `

`awk '{print $1}` Print only the first line before the space

`grep cry0l1t3` Filter the keyword `cry0l1t3`

2. `cat /etc/passwd | grep -v /sbin/nologin | grep /bin/bash |tr ":" " " | awk '{print $1}'`

`grep /bin/bash` means that we filter the lines that only contain `/bin/bash`.

3. `cat /etc/passwd | grep -v /sbin/nologin |tr ":" " " | awk '{print $1, $3}' | grep cry0l1t3`

`awk '{print $1, $3}'` Print the first and third line of the filtered result.

4. `cat /etc/passwd | grep -v /sbin/nologin |tr ":" " " | awk '{print $1, $3}' | grep cry0l1t3 | tr " " ","`

`tr " " ","` replace the space with comma.

5. `cat /etc/passwd | grep -v /sbin/nologin |tr ":" " " | awk '{print $1, $3, $NF}' | grep cry0l1t3 | tr " " ","`

`$NF` means the end of the line.

6. `cat /etc/passwd | grep -v /sbin/nologin |tr ":" " " | awk '{print $1, $3, $NF}' | tr " " "," | grep /bin/bash`

7. `cat /etc/passwd | grep -v /sbin/nologin |tr ":" " " | awk '{print $1, $3, $NF}' | tr " " "," | grep -v /bin/false`

8. `cat /etc/passwd | grep -v /sbin/nologin |tr ":" " " | awk '{print $1, $3, $NF}' | tr " " "," | wc -l`

`wc -l` is counting the number of lines.











