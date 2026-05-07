
# How The Web Works - HTTP in Detail - TryHackMe Documentation

[Room Link](https://tryhackme.com/room/httpindetail)

## Why does this matter?

This room teaches on much more detail about how the web server works in a much broader scope. This covers the topic about HTTP requests and responses, cookies, different types of HTTP status codes as well as HTTP methods in a web server. One of the most concerning aspect of a web is cookies, where private information could be stored when a cookie is stored in a personal computer. Take Adam, for example, he stores his credentials in a web server and allowing all cookies that it has offered. One of the pitfalls of this is Adam's session could be taken over by someone else if he or she knows Adam's cookie. One of the ways to prevent this is to make sure that not to accept every single cookie that is offered in the web browser, as it could lead to session hijacking.

## Table of Contents

1. Underlying Concepts
2. Challenges Faced
3. Conclusion

## Underlying Concepts

#### What is HTTP(S)?

HTTP - A protocol that is utilised for communicating with web server to transmit data webpages, such as HTML, images, videos, etc.
HTTPS - A protocol that has the similar function with HTTP that equips with encryption while sending and receiving data.

#### Requests and Responses

URL - The instruction on how to access a resource, example: `https://google.com/`, `ftp://username:password@domain.com:21/users?id=0#FirstName`.

Request - The HTTP method that is acquired to retrieve or send data from or to the web server. Example: 
```
GET /dashboard/ HTTP/1.1

Host: xyz.com
User-Agent: Mozilla/5.0 Firefox/87.0
Referer: http://xyz.com
```

Response - The answer that the HTTP web server is receiving after performing the request. Example:
```
HTTP/1.1 200 OK

Server: apache/1.9.2
Date: Sat, 10 Apr 2021 02:20:51 GMT
Content-Type: text/txt
Content-Length: 10

Hello war!
```

#### HTTP Methods

GET - Retrieve Information from the web server. Example: Visiting a website.
POST - Submit information to the web server. Example: Entering credentials in a login form, Clicking the submit in an online form.
PUT - Update information to the web server. Example: Change username or password in a service.
DELETE - Delete information in a web server. Example: Delete account or repository of a service.

#### HTTP Status Codes

Here are common HTTP status codes that are likely to appear:

- 200 (OK) - Request is successfully received by the web server. Example: A web server is up and running.
- 201 (Created) - A resource has been created. Example: Repository is created, a file is created inside or outside the repository.
- 301 (Moved Permanently) - Redirect client to the new webpage **permanently**. Example: A client visited Google search that appears to be HTTP status code 301, redirecting to DuckDuckGo search for a second.
- 302 (Found) - Redirect client to the new webpage **temporarily**. Example: When a web server is down, it redirects temporarily to a site that tells the web server is down temporarily.
- 400 (Bad Request) - Something is either wrong or missing in the browser request. Example: Inputting an email in a phone number on a form.
- 401 (Not Authorised) - You are not authorised to view the site, only authorised viewers can view. Example: When you are not logged in on a service or viewing from an account that does not have the rights to view the content.
- 403 (Forbidden) - Not authorised whenever you are logged in or not. Example: No one can view the content of real usernames and passwords.
- 404 (Not Found) - The page does not exist.
- 405 (Method not allowed) - The site does not allow this method request. Example: Sending a GET request while the site only accepts a POST request.
- 500 (Internal Server Error) - The server encountered an error from the request that it does not know how to handle it. This occurs when there is an unexpected server error.
- 503 (Service Unavailable) - The site is under maintenance/unoperational.

#### Headers

There are 2 types of headers: Request and response headers. This documentation walks into the brief explanation of these 2 types.

Request Headers - Headers that are sent from the client to the server. Example of commonly used request headers, followed by examples are:
- Host - bing.com
- User-Agent - Mozilla/5.0 Firefox/133.0
- Content-Length - 5
- Accept-Encoding - text/txt
- Cookie - c00k13

Response Headers - Headers that are returned to the client from the server. Example of commonly used response headers, followed by examples are:
- Set-Cookie - c00k13
- Cache-Control - public, max-age:99999999
- Content-Type - text/txt
- Content-Encoding - txt

#### Cookies

Cookie - Small piece of data that is stored inside of a device. It reminds of the web server of who you are, alongside with personal settings that you saved. Example: When Playing sudoku, your progress will be saved because it has cookies in it. If you remove all the history of the web browser, the progress as well as the cookies will be gone forever.

## Challenges Faced

#### Identifying an unsecure webpage

![Identifying an unsecure webpage](Assets/0.png "Identify an unsecure webpage")

At this step, I was confused on what to interact with, as there are no buttons or textboxes this time. There is a clue on the question, written below:

"On the mock webpage on the right there is an issue, once you've found it, click on it. What is the challenge flag?"

My brain thinks: "What is the issue?". I clicked and it did nothing! On the bottom, it is written website check, which means it is checking whether it is related to encryption? 

After thinking about it, I click the crossed lock and I got the answer. It is part of cyber hygiene that I did not know about.

#### Making HTTP Requests

![Performing a POST Request](Assets/1.png "Performing a POST request to the web server")

This is an interesting challenge. This challenge helps me to reinforce my understanding on how different HTTP methods work, such as GET, POST, PUT, DELETE, etc. On this image given above, I performed a POST request that challenges me to understand how parameters can be passed together in order to fulfil the request. Wihtout any parameters, the request will not run. The challenge also provides the request as well as the response formatted in HTTP. This helps on understanding more detail about what is happening in the backend of the web server itself.

#### Wrong Answer

![Thought it was 500](Assets/2.png "It was 503")

At this question, I was mixed the HTTP error code between 500 and 503. They have similarities. After reading the question again, it has the word "cannot access its database", which I expect that the client cannot access the web server in any kind. The first thought was it has a generic error in a request, so I answered 500. 

## Conclusion

This room provides a valuable material about HTTP, where it is the core fundamental of how the web works in general. This room is recommended for anyone who wants to deep dive into web application security, as this is the critical layer of the web itself. 
