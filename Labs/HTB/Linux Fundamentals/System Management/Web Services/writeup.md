# Web Services -- HTB hands-on labs

[Link](https://academy.hackthebox.com/app/module/18/section/74)

## Questions

1. Find a way to start a simple HTTP server inside Pwnbox or your local VM using `npm`. Submit the command that starts the web server on port 8080 (use the short argument to specify the port number).
2. Find a way to start a simple HTTP server inside Pwnbox or your local VM using `php`. Submit the command that starts the web server on the localhost (127.0.0.1) on port 8080.

## Thinking Steps

### Question 1

Hmm, I think I have heard how to start a web server in npm.

It is using node, if I have not mistaken.

I opened up a hint that written like this:

```
Npm is a package manager that allows you to download a basic web server package. This package also provides the option to specify the port. No need to install it. How would the command look after installing the corresponding package with a specified listening port?
```

It has something to do with install.

So, we can see the manual page for installing: `npm help install`.

I searched with the keyword port and one of them pops up:

```
...
Installs the package from the hosted git provider, cloning it with git. For a full git remote url, only that URL will be attempted. 

<protocol>://[<user>[:<password>]@]<hostname>[:<port>][:][/]<path>[#<commit-ish> | #semver:<semver>]
...
```

It does not specify anything about initialising a web server other than this point.

I ended up looking into the forums and one of the answers said: [Source](https://forum.hackthebox.com/t/starting-web-server-with-npm/3811)

```
You can find the npm website about simplehttpserver here → https://www.npmjs.com/package/simplehttpserver .The command to start a webserver is simply “simplehttpserver [directory to be web root,default is the current working directory]”.Also to install simplehttpserver through npm “npm install simplehttpserver -g”.Hope it helps :)
```

Hmmm, I tried and it does not specify the port.

Interesting. It also does not use the actual keyword `npm`.

Looking through the comments, it does use a different package.

So, it is simpleserver.

Oh, misspelled it, it was `http-server`.

So, I tried to install `http-server`.

Command: `npm install http-server -g`.

Then, look up into the readme in `https://www.npmjs.com/package/http-server`.

There was the port, using the flag `-p`.

So, to start the web server in npm, we can use `http-server -p 8080`.

### Question 2

Let's check the manual of the page.

We can see from the manual page we see that there is a keyword that contains a web server:

```
...
-S addr:port   Start built-in web server on the given local address and port
...
```

So, the full command will be: `php -S 127.0.0.1:8080`

