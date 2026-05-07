
# Network Fundamentals - Packets & Frames - TryHackMe Documentation

[Room Link](https://tryhackme.com/room/packetsframes)

## Report Objectives

1. Understand the TCP/IP Three way handshake based on 2 communications
2. Understand the thinking process when there is a wrong answer.

## Table of Contents

1. What I have tried
2. What I Observed
3. What I learned
4. How to approach uncertainty
5. Conclusion

## What I have tried

I have completed this room back in January 2025. I restarted the progress on 26th December 2025 to refresh my memory. 

In this room, I have tried to answer and understand the underlying concepts inside the room. I also simulated the hands-on labs provided in it, which is the three-way TCP/IP handshake. In addition, I tried to approach on how I answer the discussion question that I got wrong.

## What I observed

I observed that this room is useful for understanding more depth about networking, diving deep into the method on how 2 or more devices communicate within each other. This covers more about TCP and UDP in more detail with the method on how they exchange communication in-depth on the TCP/IP and UDP/IP handshake. In addition, this also covers about the definitions and their types of ports available that a device has. 

## What I learned

On this room, I am able to learn about:

- The differences between a frame and a packet - where a packet contains an encapsulated IP address while a frame contains an encapsulated MAC address.
- Understand the process of the three-way handshake for TCP/IP and UDP/IP - Because TCP is a stateful connection, which is a connection that ensures data is received to another device, the devices will have an active communication in both. While UDP offers a stateless connection, if one of the devices request on the other device, the other will just sent it to the device that requested the packet, no matter if the connection dropped. 

## How do I approach uncertainty

![Data passed on TCP/IP Three-Way Handshake](Assets/0.png "Three-Way Handshake")

At this part, I approached a little uncertain on what to choose from these options after successfully established a connection between 2 devices. I chose DATA for today as I learned that after the device has established their connectivity, the device will sent the data needed for the device that established the connection between the device that ask for connectivity.  

![Answer on Discussion Question](Assets/1.png "How I approach a theoretical question")

This part is based on the reading provided by TryHackMe. I am uncertain to answer as it is a question that relies on a fact. I need to understand the "why" after discovering the actual answer of this question. Based on the reading, I think it is clear that REDACTED provides the data integrity of a packet itself, in which if the actual output does not match on what is generated, then it is simply not secure. 

## Conclusion

Based on what I have learned, I feel that this is a fundamental and critical concept that any cybersecurity person needs to understand and apply with. The ports are also a crucial building blocks on determining the type of services or protocols that the device could run, such as HTTP is located on port 80, FTP on port 21, etc.

