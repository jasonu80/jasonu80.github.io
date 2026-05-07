
# How The Web Works - Putting it all together - TryHackMe Documentation

[Room Link](https://tryhackme.com/room/puttingitalltogether)

## Table of Contents

1. How this topic relates with Cyber Security in Business context
2. Underlying Concepts with Security relevance
3. Challenges Faced
4. Conclusion

## How this topic relates with Cyber Security in Business context

This topic helps a number of businesses to update or audit their websites and the technology that they are using. One of the likely cause is that the developer creates a accidental comment that provides insight to threat actors on how to break into the system. For example, the website is using a PHP version `8.x.x`, which opens up the gate to attackers on listing all the available vulnerabilities of the programming language of PHP `8.x.x`. This can be mitigated by performing regular audits and updates of the infrastructure of the web server itself, to prevent any future attacks of the web server and patching a number of bugs in the programming language itself.

## Underlying Concepts with security relevance

#### How the web works in a bigger picture

1. The client requests a website in a browser
2. The DNS translates that into an IP address
3. It finds the IP address of the web server and display the content that needs to be displayed by the client
4. The web is viewed.

*Security Relevance*: It is recommended that a client visit websites that are encrypted (a.k.a using a HTTPS protocol) to prevent anyone to intercept the data of the website that the client will visit.

#### Other Components

Load Balancers - Ensuring that when a web server deals a significant amount of traffic, it manages the load of the web server and provide a failover if a server becomes unresponsive. It runs a health check to ensure that the server or host that is requested by the user or client is up and running. It will stop sending traffic if the server is not running.

CDN (Content Delivery Networks) - Reduces the number of traffic on a website, by hosting the front-end components of your website to multiple servers. The task of CDN is to bring the user or client the nearest server available where the client is located. For example, Restaurant X has many branches, and the main branch is located at California. It is possible that a user from UK wants to access restaurant X at California, but it would take a lot of time and resources to invest. Instead of that, Restaurant X opens a number of branches in the UK, so that the people in UK enjoys the restaurant X that is based on California, without going to California itself.

Databases - A tool that is utilised for store and recall data that includes a metadata in it. 

WAF (Web Application Firewall) - A tool to filter any incoming and outgoing network traffic that is located between the web request and the web server.

*Security Relevance*: Always run sanity checks on Databases as it have security limitations on implementing it.

#### How web servers work

Web Server - Software that listens for incoming connections and utilises an HTTP protocol to serve the clients. Example: Apache, nginx, NodeJS, etc.

Virtual Hosts - A web server that hosts multiple websites using different domain names. The location is different based on the hard drive, for instance the website `x.com` is located at a different path when compared with `y.com`.

Static and Dynamic Content

Static - The content that a file has limited changes when a client or user interacts with the web. Example: Images, Videos, Text, etc. 

Dynamic - The content of a file has a number of changes when a client or user interacts with a web. Example: When a user reloads the news webpage, it displays the latest news instead of the ones that has been displayed for 3 to 5 minutes ago.

Scripting and Backend Languages

There are a number of them that are widely utilised by web developers, such as PHP, Python, Ruby, perl, and many more. These languages have the ability to interact with databases, fetching external services such as API, process data from the user when logging into a website, and many more. The client will not able to view the PHP code because the code is processed in the backend. This interaction is not created securely in most web applications.

*Security Relevance*: When hosting a server to the internet, make sure that the configuration files and the interaction between user and server are sanitised properly as these factors will lead into a vulnerability issues.

## Challenges Faced

#### Matching how web works in a whole.

![Got the first second step wrong](Assets/0.png "First 2 wrong")

I think if you request a website to the browser, then it passes through the load balancer so that it checks whether the server is up and running or not. Well, I missed something important. **What if you have never visited that website before? How about if you visit the website on a new device?** This is the factor that is usually missed out.

![Got wrong on the 6th step](Assets/1.png "6th step wrong")

I thought if you already got the IP Address, you can check the connectivity of the web server, whether it is 80 or 443. However, there is a number of steps that are not yet been passed through, which is the ability to request it to a third party tool that helps you check whether the web app is up and running or not as well as the security feature that it has.

![Another one in the last 3 steps](Assets/2.png "Last 3 steps is wrong.")

After connecting to the web server on a specific port, which is 80 or 443, the web application is able to interact with the database itself. In contrast, this is not true as it requires an additional step before that. The request of the client is delivered to the web server, then what will happen afterwards? After the client's request is delivered to the web server, it responds with a HTTP request that the client needs, either viewing a website, or submitting a form, etc. 

## Conclusion

This room is meant for beginners to learn how the whole web actually works. This covers from understanding the additional components of the web as well as the process on how a client gets the content they/she/he need/needs to be able to view the website itself.
