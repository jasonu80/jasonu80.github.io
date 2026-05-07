#!/bin/bash

# This is what I recorded during the hands-on lab and room.

# First tool: nslookup

nslookup google.com

# Results: 

#Server:		::1
#Address:	::1#53

#Non-authoritative answer:
#Name:	google.com
#Address: 142.250.192.110 -> A Record type, IPv4 address.
#Name:	google.com
#Address: 2404:6800:4009:82a::200e -> AAAA Record type, IPv6 address.

# Second tool: whois

whois x.com

# Results: 

#Domain Name: X.COM
#   Registry Domain ID: REDACTED
#   Registrar WHOIS Server: whois.godaddy.com
#   Registrar URL: http://www.godaddy.com
#   Updated Date: 2024-12-03T21:03:37Z
#   Creation Date: 1993-04-02T05:00:00Z
#   Registry Expiry Date: 2034-10-20T19:56:17Z
#   Registrar: GoDaddy.com, LLC
#   Registrar IANA ID: 146
#   Registrar Abuse Contact Email: abuse@godaddy.com
#   Registrar Abuse Contact Phone: 480-624-2505
#   Domain Status: clientDeleteProhibited https://icann.org/epp#clientDeleteProhibited
#   Domain Status: clientRenewProhibited https://icann.org/epp#clientRenewProhibited
#   Domain Status: clientTransferProhibited https://icann.org/epp#clientTransferProhibited
#   Domain Status: clientUpdateProhibited https://icann.org/epp#clientUpdateProhibited
#   Name Server: A.R10.TWTRDNS.NET
#   Name Server: A.U10.TWTRDNS.NET
#   Name Server: B.R10.TWTRDNS.NET
#   Name Server: B.U10.TWTRDNS.NET
#   Name Server: C.R10.TWTRDNS.NET
#   Name Server: C.U10.TWTRDNS.NET
#   Name Server: D.R10.TWTRDNS.NET
#   Name Server: D.U10.TWTRDNS.NET
#   DNSSEC: unsigned
#   URL of the ICANN Whois Inaccuracy Complaint Form: https://www.icann.org/wicf/
#>>> Last update of whois database: 2026-01-14T06:14:17Z <<<

#For more information on Whois status codes, please visit https://icann.org/epp

#NOTICE: The expiration date displayed in this record is the date the
#registrar's sponsorship of the domain name registration in the registry is
#currently set to expire. This date does not necessarily reflect the expiration
#date of the domain name registrant's agreement with the sponsoring
#registrar.  Users may consult the sponsoring registrar's Whois database to
#view the registrar's reported date of expiration for this registration.

#TERMS OF USE: You are not authorized to access or query our Whois
#database through the use of electronic processes that are high-volume and
#automated except as reasonably necessary to register domain names or
#modify existing registrations; the Data in VeriSign Global Registry
#Services' ("VeriSign") Whois database is provided by VeriSign for
#information purposes only, and to assist persons in obtaining information
#about or related to a domain name registration record. VeriSign does not
#guarantee its accuracy. By submitting a Whois query, you agree to abide
#by the following terms of use: You agree that you may use this Data only
#for lawful purposes and that under no circumstances will you use this Data
#to: (1) allow, enable, or otherwise support the transmission of mass
#unsolicited, commercial advertising or solicitations via e-mail, telephone,
#or facsimile; or (2) enable high volume, automated, electronic processes
#that apply to VeriSign (or its computer systems). The compilation,
#repackaging, dissemination or other use of this Data is expressly
#prohibited without the prior written consent of VeriSign. You agree not to
#use electronic processes that are automated and high-volume to access or
#query the Whois database except as reasonably necessary to register
#domain names or modify existing registrations. VeriSign reserves the right
#to restrict your access to the Whois database in its sole discretion to ensure
#operational stability.  VeriSign may restrict or terminate your access to the
#Whois database for failure to abide by these terms of use. VeriSign
#reserves the right to modify these terms at any time.

#The Registry database contains ONLY .COM, .NET, .EDU domains and
#Registrars.
#This WHOIS server is being retired. Please use our RDAP service instead. Rate limit exceeded. Try again after: 2562047h47m16.854775807s.

# Tools 3: telnet (deep dive into this one)

# Task 1: Retrieve the file flag.html using telnet. 

# Process:

# 1. Connect to telnet using HTTP protocol, which is at port 80.
telnet <IP_Target> 80

#2. Then, specify the HTTP method and destination alongside with HTTP version, once logged in to telnet.

GET /flag.html HTTP/1.1
Host: anything 

# Enter twice, then it gets the output. 

#HTTP/1.1 200 OK
#Server: nginx/1.18.0 (Ubuntu)
#Date: Wed, 14 Jan 2026 06:21:59 GMT
#Content-Type: text/html
#Content-Length: 478
#Last-Modified: Thu, 27 Jun 2024 07:28:15 GMT
#Connection: keep-alive
#ETag: "667d148f-1de"
#Accept-Ranges: bytes

#<!DOCTYPE html>
#<html lang="en">
#<head>
#    <meta charset="UTF-8">
#    <meta name="viewport" content="width=device-width, initial-scale=1.0">
#    <title>Hidden Message</title>
#    <style>
#        body {
#            background-color: white;
#            color: white;
#            font-family: Arial, sans-serif;
#        }
#        .hidden-text {
#            font-size: 1px;
#        }
#    </style>
#</head>
#<body>
#    <div class="hidden-text">REDACTED</div>
#</body>
#</html>

# Here, I got the content of the web page itself, by connecting it via telnet.


# Task 2: Retrieve flag.txt using ftp protocol. 

# We know that FTP runs on port 21. Using the command ftp that is already installed in the Linux machine, the client is directly connected to the machine via ftp.

# Then, we need to provide the username and password if needed. 

# After that, list the files inside the ftp protocol and retrieve the file to the client system by using the command `get`. 

# Here is the process:

ftp <IP Address>

#Connected to <IP Address>.
#220 (vsFTPd 3.0.5)
#Name (<IP Address>:root): anonymous
#331 Please specify the password.
#Password: # No password is provided, so enter to proceed.
#230 Login successful.
#Remote system type is UNIX.
#Using binary mode to transfer files.
#ftp> ls
#200 PORT command successful. Consider using PASV.
#150 Here comes the directory listing.
#-rw-r--r--    1 0        0            1480 Jun 27  2024 coffee.txt
#-rw-r--r--    1 0        0              14 Jun 27  2024 flag.txt
#-rw-r--r--    1 0        0            1595 Jun 27  2024 tea.txt
#226 Directory send OK.
#ftp> get flag.txt
#local: flag.txt remote: flag.txt
#200 PORT command successful. Consider using PASV.
#150 Opening BINARY mode data connection for flag.txt (14 bytes).
#226 Transfer complete.
#14 bytes received in 0.00 secs (62.7150 kB/s)
#ftp> exit
#221 Goodbye.

ls

#burp.json  CTFBuilder  Desktop  Downloads  flag.txt  Instructions  Pictures  Postman  Rooms  Scripts  snap  thinclient_drives  Tools

cat flag.txt 

#REDACTED

# Task 3: Connect to POP3 and retrieve the flag with the username and password. (Username: Admin, Password: @dm1nistr@t0r12345!)

# There are no tools that are available for viewing messages in Linux distribution, so it uses telnet to connect to POP3 TCP protocol. 

# Here is the process:

telnet <IP Target> 110
# Trying <IP Target>...
# Connected to <IP Target>.
# Escape character is '^]'.
# +OK [XCLIENT] Dovecot (Ubuntu) ready.
# USER Admin PASS @dm1nistr@t0r12345!
# +OK
# STAT
# -ERR Unknown command.
# PASS adm1nistr@t0r12345!
# -ERR [AUTH] Authentication failed.
# PASS @dm1nistr@t0r12345!
# -ERR No username given.
# USER Admin
# +OK
# PASS @dm1nistr@t0r12345!
# +OK Logged in.
# STAT
# +OK 4 2216
# RETR 4
# +OK 454 octets
# Return-path: <user@client.thm>
# Envelope-to: linda@server.thm
# Delivery-date: Thu, 12 Sep 2024 20:12:42 +0000
# Received: from [10.11.81.126] (helo=client.thm)
# 	by example.thm with smtp (Exim 4.95)
# 	(envelope-from <user@client.thm>)
# 	id 1soqAj-0007li-39
# 	for linda@server.thm;
# 	Thu, 12 Sep 2024 20:12:42 +0000
#From: user@client.thm
#To: linda@server.thm
#Subject: Your Flag

#Hello!
#Here's your flag:
#REDACTED
#Enjoy your journey!
#.
#QUIT
#+OK Logging out.
#Connection closed by foreign host.

# The first thing is to connect to POP3 protocol using telnet by specifying the target of the IP address provided and the port that is running.

# Then, Provide the username first then enter the password afterwards. 

# The command STAT provides the information about how many mails are available inside of the inbox of a specific user. In this case, it is 4 mails.

# RETR means to retrieve, which is to fetch any mail number that is less than the number of mail that is provided on the STAT command. In this case, it is 4.

# QUIT means to logout from the server and continue on the current shell that is running.
