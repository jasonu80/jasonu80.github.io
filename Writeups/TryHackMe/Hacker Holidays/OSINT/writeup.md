# OSINT Day 0 Challenge - TryHackMe challenge writeup

[Link](https://tryhackme.com/room/hh-thebrochure-081f3e36)

# Challenge

1. What is the flag?

# Attachment given

!["ImageBrochure"](./thebrochure.png)

# Thinking Steps

When looking at the brochure, I fell into the rabbit hole of reading the description of the room itself.

After hours of looking the clues, I look the video solution. The first step is to create an insta account and search it up.

Then, after looking into that, it tells me to look up "lotus byte resorts". I got stuck after that.

Looking the video provided further, I noticed when she said: "there is 1 post, 1 follower and 1 following". 

Hmm, I assumed to check who is following? Maybe. I checked and it has another account.

Looking into that account, I saw a bunch of posts that are displaying base64 encoded texts.

We can decrypt it using cyberchef and using "from base64", we get the flag.

