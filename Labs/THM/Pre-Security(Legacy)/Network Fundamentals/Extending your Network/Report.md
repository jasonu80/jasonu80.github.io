
# Network Fundamentals - Extending your Network - TryHackMe Walkthrough

[Room link](https://tryhackme.com/room/extendingyournetwork)

## Report Objectives

1. Understand how to configure a firewall
2. Understand how routing works between different devices.
3. Understand how to read Network logs

## Table of Contents

1. Concept Summary
2. Challenges Faced
3. Conclusion

## Concept Summary

#### Port Forwarding

This is the concept where devices are connected to a single router to perform a port forwarding to the internet. Without port forwarding, the active web server will only be accessed inside the internal network, which is an intranet. To make it accessible to the public (which is the internet), it needs to implement port forwarding, where other devices able to visit devices in a different network with a public IP address. 

**Intranet**: A type of network that is utilised for sharing files and folders. This type of network is popular among businesses as this is a bridge of communication between an employer and an employee of the company.

**Internet**: A public network that is accessible for everyone, even unauthorised or guest user could access.

#### Firewall

Firewall is a security device or software that is facilitated to perform a permission to access the network for a specific device. This helps cover mass attacks such as DDoS attack (Distributed Denial-of-Service), as it helps control the traffic of the network. 

#### VPN

VPN (Virtual Private Network) is a type of network that allows the device to communicate with the server using a private network. This allows the user to connect the internet via a secret tunnel, so that the IP address is masked.

#### LAN Networking Devices - Router & Switch

Router - A networking device that is utilised for passing the data to the internet. It means that if a device is connected to a router, then it can access to a different device by using the shortest and optimal paths possible.

Switch - A networking device that is facilitated for connecting multiple devices together. These devices will be forwarded to the router by the switch itself to exchange data and maintain communication between devices.

VLAN - A LAN that is splitted up into multiple small groups that connects into a switch. The difference between a LAN is VLAN cannot perform communication between 2 different groups, since they have different IP Addresses while they have the same benefits to connect the internet. 

## Challenges Faced

#### Firewall Practical

![Configure firewall rule to block malicious IP Address](Assets/0.png "Block the malicious IP address from making the web unavailable.")

This challenge is time-based, where you need to configure the firewall rule before the server went down (the battery is full). On the first attempt, I was overwhelmed with the challenge and unable to save the server from flooding. In the next attempt, I got it managed by changing the rules quickly to block the traffic of the malicious IP address itself. 

#### Network Simulator

![Understanding how communication between 2 devices occur](Assets/1.png "How 2 devices communicate with each other.")

This challenge helps me on how 2 devices communicate between each other. The first time I think was it is stuffed with a lot of things to cover. So, because of that, I was trying other features in the Packet Type. There are multiple of them, such as TCP, UDP, ARP Request/Response, and Ping Request/Response. At first, I answered the question that how many handshakes of this communication? I realised that the device needs to establish communication first within the networking devices to be able to talk with the other device. So, because of that, there are additional handshakes that the device needs to perform. After the handshake, it sends the data in the form of TCP between 2 devices.

## Conclusion

This room covers additional things that needs to be understand in networking, such as VPN, firewall, and LAN Networking devices in a much broader context. This helps to reinforce the ability to understand stronger network concepts and apply it in the cyber security context.
