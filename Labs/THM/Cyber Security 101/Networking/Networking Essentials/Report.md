
# Networking - Networking Essentials - Summary Report

[Room Link](https://tryhackme.com/room/networkingessentials)

## Concepts covered

#### DHCP (Dynamic Host Configuration Protocol)

DHCP (Dynamic Host Configuration Protocol) is a protocol on a device that looks an unused IP address to assign for the device. When a user wants to visit a website, the client looks for a local DHCP server, then the server responds by offering the IP address that is available for the client. After that, the client accepts the IP address offered by DHCP, then the DHCP acknowledged it that the IP address has been setup for the client itself. This is what is known as the DORA (Discover, Offer, Request, and Acknowledge) process for DHCP protocol.

#### ARP (Address Resolution Protocol)

ARP (Address Resolution Protocol) is a network protocol that is utilised to translate and find any IP address to a MAC address of the device that is served on the ethernet. This protocol is encapsulated with the ethernet protocol. It does not mean that this protocol operates at layer 1, it operates at layer 2 as the main function for encoding IP addresses into MAC Addresses.

#### ICMP (Internet Control Message Protocol)

![ICMP Request](Assets/ICMPPingRequest.png)

ICMP (Internet Control Message Protocol) is a network protocol that is utilised in a device to check the connectivity or status of other servers. This is beneficial for performing network troubleshooting, such as internet connectivity with the host and finding the route to the server itself, using `ping` and `traceroute`. 

#### Routing

Routing, in networking terms, is a method of a networking device or router to find the shortest destination to reach the server. There are several algorithms that are available for routing, such as OSPF (Open Shortest Path First), EIGRP (Enhanced Interior Gateway Routing Protocol) for cisco networks, BGP (Border Gateway Protocol), and RIP (Routing Information Protocol). 

#### NAT (Network Address Translation)

NAT (Network Address Translation) is a network type that allows a device to connect to a single public IP address by a number of devices. Some devices could connect to the other device via a private IP address if it connects within the same network. This is the solution to handle a number of IPv4 addresses that are overload. 

## Conclusion

This room covers in-depth about the fundamental protocols in networking. It covers on how these protocols communicate between each other and provide the fundamental concepts on how these protocols are work together that fits into how the network works.
