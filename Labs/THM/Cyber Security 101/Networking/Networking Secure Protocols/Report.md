
# Networking - Networking Secure Protocols - Report Summary

[Room Link](https://tryhackme.com/room/networkingsecureprotocols)

## Fundamental Concepts 

#### TLS (Transport Layer Security) / SSL (Secure Socket Layer)

A server identifies itself by issuing a TLS (Transport Layer Security) Certificate. The process of TLS Certificate creation is that the server administrator creates a CSR (Certificate Signing Request) and sends it to the CA (Certificate Authority). The CA will check the authenticity of CSR and if it is accurate, it will issue the digital certificate. Free TLS Signature: [Let's Encrypt](https://letsencrypt.org). There is another way to verify certificate, which is self-signed certificate, but this usually does not verify the authenticity of the digital certificate as there are no third party inolved in the process.

#### HTTPS (HyperText Transfer Protocol Secure)

This protocol works pretty similar like HTTP Protocol, with the addition of the establishment of the TLS session. It adds after the establishment of the three way handshake protocol. The encryption key is obtained by extracting the private and decryption key. 

#### SMTPS, POP3S, IMAPS

These mail protocols are work similarly like HTTPS. The TLS adds up to the protocol once the protocol has performed a three way handshake. The TCP port number is also different between the standard and secure protocols. 

#### SSH

SSH (Secure Shell) is the secure version of telnet. It offers security benefits when compared with telnet itself, such as data encryption. SSH works differently when compared with telnet, it needs to provide the username and hostname of the server to connect with the host. If the username and the hostname are the same, then the hostname is enough. If the public key authentication is used, then the password is not needed. 

#### SFTP & FTPS

SFTP (Secure FTP) is FTP protocol that runs on SSH. Compared with FTP, it has different commands as it runs unix-like commands. FTPS (FTP Secure) requires SSL to setup, which is different from SFTP that requires only SSH.

#### VPN

A VPN (Virtual Private Network) is a type of network that allows clients to create a secure tunnel to browse publicly. The device needs to be connected to a VPN client, which encrypts the traffic and passes it through the main branch via the established VPN tunnel. Once the tunnel is established, all information will be routed in the VPN tunnel. When we browse publicly, it shows the VPN's server public IP address. To prevent any threats that may happen, it is recommended to run a DNS leak test as some VPN providers may leak the actual IP address of the client.

## Hands-on Labs

Task: Find the login credentials, in Wireshark, that is captured in HTTPS traffic.  

Solution and step-by-step process: [Solution](Assets/Solutions.md)

## Skills learned

#### Hard Skills 

Security protocols

Wireshark

#### Soft Skills

Analytical thinking

## Conclusion

This room covers on how to secure protocols that are listed on the network. It is recommended to understand how these protocols integrate together as it provides numerous benefits to the client who utilises it.  
