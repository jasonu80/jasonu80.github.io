
# How The Web Works - DNS in Detail - TryHackMe Walkthrough

[Room Link](https://tryhackme.com/room/dnsindetail)

## Why does this matter?

This room covers a broad concept of Domain Name System on the surface level. After finishing this room, you will be able to dig the IP address of the website itself and understand different types of subdomains. This provides an impact on some companies to expose the website public IP addresses unintentionally that opens a gate for threat actors to exploit.

## Table of Contents

1. Underlying Concepts
2. Challenges Faced
3. Conclusion

## Underlying concepts

#### DNS Definition

DNS (Domain Name System) is a way to communicate with other devices without having to remember the IP addresses. Example: Instead of remembering 10.28.199.27, we can remember it by `thisismywebsite.com`.

#### Domain Hierarchy

There are 3 types of domains:

- Top-Level Domain - Most righthand of the domain name. Example: com, org, edu, au, gov, etc.
- Second-Level Domain - The name of the domain that comes before TLD. Example: Github, Google, TryHackMe, Yahoo, etc.
- Subdomain - Located before SLD and utilises a period to separate it. Example for google: accounts, mail, maps, drive, etc.

#### Record Types

There exists a number of DNS Record types available, not only in a website:

- A Record - Resolve IPv4 Address
- AAAA Record - Resolve IPv6 Address
- CNAME Record - Resolve other DNS request to the other website.
- MX Record - Resolve the email handler for the domain queried.
- TXT Record - Text fields that data with the text format can be stored.

#### Making a request

1. The computer checks if you had a local cache of the DNS. If not, it will do a recursive DNS server.
2. If the recursive DNS server is found by your ISP, it will be sent back to the device that is requested.
3. The Root DNS Server will redirect to the TLD server
4. TLD server holds records to find an authoritative server to answer the DNS request.
5. Authoritative DNS Server is responsible to store records of DNS records of a particular domain name as well as the updates that it made. It then sent back to the recursive DNS server with a TTL Value.

## Challenges Faced

#### Building a request to make DNS queries and view the results using nslookup.

![Failed a few times in a row](Assets/0.png "Failed to get results")

At the early stage, I faced a challenge on how to select different kinds of DNS types available as well as typing the subdomain of the website. I failed to perform the right answer three times, as I have not entered the details thoroughly, as well as not reading carefully on the description provided by TryHackMe. After trying it, it worked and able to get all the answers from the static lab.

## Conclusion

This room is the introduction on how the web server works in the surface level. It introduces the concept of DNS and how it performs on the application level.

