
# Networking - Networking Concepts - Summary Report

[Room Link](https://tryhackme.com/room/networkingconcepts)

## Concepts

This room deeps dive into the detailed structure from Pre-Security path. 

## Concepts

#### OSI Layer: Detailed

There are 7 layers of the OSI model and here are the detailed breakdown on how each layer perform their duties:

Layer 1 - Physical Layer -> The layer where a physical connection is connected to a device.

Layer 2 - Data Link layer -> The layer where data transfers are occurred within a number of devices in the **same** network.

Layer 3 - Network Layer -> The layer where data transfers are occured in a **different** network within a number of devices.

Layer 4 - Transport Layer -> Perform an end-to-end communication between running apps on different hosts.

Layer 5 - Session Layer -> Establishes/Starts the communication between 2 different hosts.

Layer 6 - Presentation Layer -> Deliver data that layer 7 will understand, by encoding and decoding it.

Layer 7 - Application Layer -> Provide services to applications that is directly seen by the end user.

#### TCP/IP Model

Similar like the OSI Layer, this layer provides a shorter layer:

4 layer version: 

Layer 1 - Link Layer -- maps to Layer 1 and 2 OSI layer

Layer 2 - Internet Layer -- maps to Layer 3 OSI layer

Layer 3 - Transport Layer -- maps to Layer 4 OSI layer

Layer 4 - Application Layer -- maps to Layer 5 to 7 OSI layer

5 layer version, according to Computer Networking: A Top-Down Approach 8th Edition, Kurose and Ross:

Layer 1 - Physical Layer -- maps to Layer 1 OSI layer

Layer 2 - Link Layer -- maps to Layer 2 OSI layer

Layer 3 - Internet Layer -- maps to Layer 3 OSI layer

Layer 4 - Transport Layer -- maps to Layer 4 OSI layer

Layer 5 - Application Layer -- maps to Layer 5 to 7 OSI layer

#### IP Addresses and subnets

IP (Internet Protocol) address is a computer-based identity that is unique which is utilised to identify itself in a public and private network. 

IP address can be broken into 4 2^8 digits separated with a dot `.`, which is called octet. Example include: `192.168.0.1`.

A network has an address from `192.168.0.1` - `192.168.0.254`, 2 IP addresses are reserved which ends with 0 (Broadcast address) and 255 (Network address).

There are 2 types of IP address:

1. Public IP address - able to be viewed via the internet or public network.
2. Private IP address - able to be viewed by the terminal, which cannot be accessed by public.

There are 3 defined addresses for an IP that is private, according to RFC 1918:

1. `10/8`
2. `172.16/12`
3. `192.168/16`

The slashes are also known as subnets, which means that the first 8 bits of the network would not change, and the rest of the bits are changed.

#### UDP & TCP

These two protocols that are located at layer 4 play an important role in networking, especially when a user visits a web browser. 

UDP (User Datagram Protocol) is a connection type that is stateless, which is the connected network will accept the packet with acknowledgement from the receiver, then the server sends the data without any further acknowledgement. This protocol is useful for running video games or watching a youtube video. 

TCP (Transmission Control Protocol) is a connection that is stateful, which the connected network will accept the packet with acknowledgement from the receiver of the network. The server sends the data with the confirmation if the receiver responds back. This protocol is useful for performing chats, SMS Messaging, etc.  

#### Encapsulation

Encapsulation is the action of adding a trail or header in every layer in the network. This layer starts from the application data, which is the first layer, packed with info from Layer 5 to 7. Then, adding the header for layer 4 which is a segment (TCP) or Datagram (UDP). Some sources cited that Datagram runs at layer 3. After that, Layer 3 is adding the IP address header called packet, then adding Layer 2 which consists of the header that contains the MAC address of the device, called frame. 

If the process has finished, the headers will be sent to across different routers, checking every single router if the header contains the destination address. If a router has it, then it performs the process called decapsulation, which removes a trail or header in every network layer. It is the reverse of encapsulation.

## Hands-on Lab: Telnet

### What is Telnet? 

Telnet or Teletype Network is a network protocol that is utilised to communicate and connect with a remote system. It also allows the user to issue text commands. 

Here are the commands that I ran on TryHackMe's lab machine:

```bash
# telnet <IP Address> <Port number>

telnet 10.49.128.242 7

# Port 7 is utilised for testing if the server responded using text.

# Output:

#Trying 10.49.128.242...
#Connected to 10.49.128.242.
#Escape character is '^]'.
#Hi
#Hi
#Hello
#Hello
#How are you?
#How are you?
#Bye :)
#Bye :)
#^]
#telnet> quit
#Connection closed.

telnet 10.49.128.242 13

#Output:

#Trying 10.49.128.242...
#Connected to 10.49.128.242.
#Escape character is '^]'.
#Mon Jan 12 09:27:30 AM UTC 2026
#Connection closed by foreign host.

telnet 10.49.128.242 80

#Output:

#Trying 10.49.128.242...
#Connected to 10.49.128.242.
#Escape character is '^]'.
#GET / HTTP/1.1
#Host: telnet.thm

#After entering twice

#HTTP/1.1 200 OK
#Content-Type: text/html
#ETag: "2920831920"
#Last-Modified: Thu, 20 Jun 2024 12:39:38 GMT
#Content-Length: 20
#Accept-Ranges: bytes
#Date: Mon, 12 Jan 2026 09:28:22 GMT
#Server: REDACTED

#REDACTED

#Connection closed by foreign host.
```

## Skills and Tools Learned

#### Hard skills

Networking

telnet

#### Soft skills

Communication

Understand technical language

## Conclusion

This room covers broadly about the concept of network, diving into the processes of the OSI layer and encapsulation, which is an essential concept in networking itself. It is recommended to learn networking before diving into any cyber security concepts, as this concept is the fundamental building block of every cyber security concept. 
