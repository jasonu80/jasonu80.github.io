# Firewall rules -- HTB Hands-on writeup

[Link](https://academy.hackthebox.com/app/module/18/section/2099)

# Questions

1.	Launch a web server on TCP/8080 port on your target and use iptables to block incoming traffic on that port.
2.	Change iptables rules to allow incoming traffic on the TCP/8080 port.
3.	Block traffic from a specific IP address.
4.	Allow traffic from a specific IP address.
5.	Block traffic based on protocol.
6.	Allow traffic based on protocol.
7.	Create a new chain.
8.	Forward traffic to a specific chain.
9.	Delete a specific rule.
10.	List all existing rules.

# Thinking Steps + Answers

1. Start using `python3 -m http.server 8080` and block the packets using `sudo iptables -A INPUT -p tcp --dport 8080 -j DROP`
2. Remove and add a new rule: `sudo iptables --delete INPUT 1 && sudo iptables -A INPUT -p tcp --dport 8080 -j ACCEPT`.
3. `sudo iptables -A INPUT -s 10.10.14.127 -j DROP` --> Just the IP address, no protocols.
4. `sudo iptables -A INPUT -s 10.10.14.127 -j ACCEPT && sudo iptables -D INPUT 2` --> Same explanation as number 3.
5. `sudo iptables -A INPUT -p tcp -j DROP` --> Blocks the protocol.
6. `sudo iptables -A INPUT -p tcp -j ACCEPT` --> Accepts the protocol.
7. `sudo iptables --new BLACKBOX` --> Creates a new user-defined chain.
8. `sudo iptables -A BLACKBOX -p tcp -j ACCEPT`
9. `sudo iptables -D BLACKBOX 1`
10. `sudo iptables --list-rules`
