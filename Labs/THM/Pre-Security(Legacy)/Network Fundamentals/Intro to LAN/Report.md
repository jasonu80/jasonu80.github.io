
# Network Fundamentals - Intro to LAN - TryHackMe Walkthrough

[Room link](https://tryhackme.com/room/introtolan)

## Report Objectives

1. Understand different types of LAN topologies and their weaknesses.
2. Understand how LAN topologies are working.
3. Provide solutions for business to tackle problems relating LAN topologies.

## Table of Contents

1. Concept Summary
2. Challenges Faced - Hands-on labs
3. Conclusion

## Concept Summary

LAN has a number of different topologies available. There are various of them, discussed below:
1. Ring topology - A collection of devices that is connected to each other that sends the data packets in a loop.
2. Bus topology - A type of network topology that the devices are connected to a backbone network.
3. Star topology - A type of network topology that the devices are connected to a single switch.

## Challenges Faced/thoughts - Hands-on labs

![Ring topology](Assets/0.png "Ring topology broken.")

My brain thought something while I was reading this sentence. **Why does the devices cannot communicate within each other while the connection to the other computers connected to each other? (Not the broken cable)**

One of the reason is because the data of a device needs to send the received data to another device and it is a one way direction. If the cable was disconnected, one of the devices cannot receive data from another device. As a result, the device that is connected with the other device cannot send data within the disconnected device because the disconnected device cannot send data to the device connected.

![Bus topology](Assets/1.png "Bus topology")

Because the bus topology relies on a backbone network, the data transmission across other devices would take some amount of time to be fully delivered to the device destination. The question arises: **Why does a device need some amount of time to deliver the data into the destination?**

One of the crucial culprits is the devices are connected together into the same cable that makes it ineffective for the long-term usage.

![Star topology](Assets/2.png "Star topology")

Question: **Why does star topology relies or connects within a single switch across multiple devices?** 

Answer: Because the main purpose of this topology is to connect all individual devices into a single and centralised device as a place to communicate. Imagine device 1 wants to communicate with device 2, but they do not have any cables to connect with each other. That is the purpose of this external device (switch), to make a bridge between device 1 and device 2 to communicate and send data to each other.

## Conclusion

I found that this room contains a lot of fundamental concepts that needs to be understood before moving to the penetration testing stage, especially in the concept of ARP and DHCP since these protocols are most widely used in Cyber Security. This later will help on relating numerous concepts that helps along the Cyber Security journey.
