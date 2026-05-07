:: Commands learned:

set 
:: Displays the environment of the path.

ver 
:: Displays the version of the Windows machine

systeminfo 
:: Displays detailed system information about the machine

ipconfig 
:: Displays the IP address of the machine, detailed can use the flag /a

type 
:: view files

tasklist 
:: list processes that are currently running on the system

taskkill 
:: Kill processes that are currently running on the system

:: The files and directories command in Windows are similar with the Linux Operating System.

@echo off
Task 1: View the Windows version.
Task 2: View the physical address of the machine.
Task 3: Filter the tasklist of the process called "app.exe".
Task 4: Kill the PID of a specific app with the number 1517.

: EndCommentBlock

:: task 1

ver

@echo off
Output (it has the answer to the question)
Microsoft Windows [Version {REDACTED}]

: EndCommentBlock

:: task 2

ipconfig /all

@echo off
output: 
Windows IP Configuration

   Host Name . . . . . . . . . . . . : [REDACTED]
   Primary Dns Suffix  . . . . . . . :
   Node Type . . . . . . . . . . . . : Hybrid
   IP Routing Enabled. . . . . . . . : No
   WINS Proxy Enabled. . . . . . . . : No
   DNS Suffix Search List. . . . . . : eu-west-1.compute.internal
                                       eu-west-1.ec2-utilities.amazonaws.com
                                       ap-south-1.compute.internal
                                       ap-south-1.ec2-utilities.amazonaws.com

Ethernet adapter Ethernet:

   Connection-specific DNS Suffix  . : ap-south-1.compute.internal
   Description . . . . . . . . . . . : Amazon Elastic Network Adapter
   Physical Address. . . . . . . . . : 02-F8-CA-B3-BF-6B
   DHCP Enabled. . . . . . . . . . . : Yes
   Autoconfiguration Enabled . . . . : Yes
   Link-local IPv6 Address . . . . . : fe80::4000:292f:19fc:a701%5(Preferred) 
   IPv4 Address. . . . . . . . . . . : 10.48.138.251(Preferred)
   Subnet Mask . . . . . . . . . . . : 255.255.192.0
   Lease Obtained. . . . . . . . . . : Friday, January 9, 2026 8:44:19 AM
   Lease Expires . . . . . . . . . . : Friday, January 9, 2026 9:44:19 AM
   Default Gateway . . . . . . . . . : 10.48.128.1
   DHCP Server . . . . . . . . . . . : 10.48.128.1
   DHCPv6 IAID . . . . . . . . . . . : 84601211
   DHCPv6 Client DUID. . . . . . . . : 00-01-00-01-2D-B9-B7-EF-00-0C-29-FF-E5-C8
   DNS Servers . . . . . . . . . . . : 10.48.0.2
   NetBIOS over Tcpip. . . . . . . . : Enabled

: End Comment

:: Task 3

tasklist /FI "IMAGENAME eq app.exe"

:: It displays the image name with the PID related with it. 

:: Task 4

taskkill /PID 1517

:: This automatically kills the process ID of the task 1517.



:: Question on TryHackMe: The command shutdown /s can shut down a system. What is the command to restart the system? 

::Hint: shutdown /? | more

:: I got stuck here without the hint, after looking at the hint, I able to answer the question.
