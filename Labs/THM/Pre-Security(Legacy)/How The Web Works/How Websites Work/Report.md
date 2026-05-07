
# How The Web Works - How Websites Work - TryHackMe Documentation

## Table of Contents

1. Underlying Concepts
2. How these concepts are matter in Cyber Security
3. Challenges Faced in Hands-on Labs
4. Conclusion

## Underlying Concepts

#### How websites work

1. The browser (Safari, Firefox, Chrome, etc.) will request the data to the server via the internet. (Just like a customer wants to order a food to the chef that is passed via the waitress)
2. Then, if the server is up and running, it will respond to the data that is requested by the browser via the internet. (Just like a chef, if there is a chef, the food will be delivered to the customer via the waitress).

There are 2 major components of a website:
  1. Front-end (Client-side) - The way the website renders the data (Customer).
  2. Back-end (Server-side) - a server(chef & waitress) processes your request and return a response.

#### HTML

This is the basic structural language that creates a writing in a web. It builds with CSS for styling and Javascript for interaction as a basic front-end language. 

#### Javascript

This is the language that is utilised in the web application to function properly. Without Javascript, the web cannot interact within the user.

## How it is related to Cyber Security?

#### If the internet is compromised

Just like any restaurants, a waiter is sometimes do evil things to the customer. He/she could exploit the menu by modifying or adding some dishes that the customer did not order or adding the price of a specific dish by 1 or 2 dollars. Same as the internet, if someone (a.k.a the ISP is compromised by someone) is reading our data, then it could redirect to the website that we wish we will not visit, like a fake login page. 

##### Remediation

Make sure the website has an HTTPS signature before connecting it to the internet. If we make this as an analogy on restaurants, the waiter would use a device to record the order of a customer so it minimises the error of taking orders of the customer using pen & paper. Another method is to limit the permissions that a waiter and the higher authority had, so no modifications, in terms of price of a dish and drink, will be made accidentally by a single waiter.

#### Sensitive Data Exposure

![Sensitive Data Exposure](Assets/8.png "Sensitive Data Exposure")

This is a common mistake that a lot of developers may made, leaving credentials in an HTML application. It leads into a number of different impacts, such as credential stealing and unauthorised account. Remediation include removing credentials on the HTML application and store it into a password manager with a strong and unique password.

#### HTML Injection

![HTML Injection](Assets/9.png "HTML injection")

This is a type of vulnerability when a web application has an input field, an attacker may use the input to output a HTML code. This vulnerability could lead into a number of risks, such as cookie stealing or session hijacking. One way to remediate this vulnerability is by sanitising the input, hindering any programming language to execute any script running inside the input box itself to run as a programming language.

## Challenges Faced

#### Wrong format of image

![Wrong image format](Assets/0.png "Wrong image format to render an image")

This is the part where I got a little bit confusion with. The situation is that there is an incomplete HTML structure that needs to be completed, displaying a text followed by an image of a cat as well as the other cat, but the image of the other cat is not showing up. Then, the task is to add the extension in image format. My action is to add the image format in `.png`, but it still does not work. After changing it to `.jpg`, it worked well. So, the result is to follow what is the format written by TryHackMe. The comment below that asks for me to add a dog image, which is located on the discussion question below:

![Dog Image question](Assets/1.png "Discussion Question")

Looks like it uses the same image format as the first one. Therefore, it has nothing to change in the format. I added the same format and it worked.

#### Javascript Won't work using class tag

![Class name won't work](Assets/2.png "Class name")

I am experimenting to change the interaction by using a class. If `document.getElementById()` is working, should be the class also works (`doument.getElementByClassName`). But, after trying, it throws me an error:

![Error message popup](Assets/3.png "Error message")

It means that there is something wrong in the code provided. I modified the code and deleted the `document.getElementById()` section. Still, it throws an error. 

![Deleted the ID fetch](Assets/4.png "Deleted the ID fetch.")

Looking up into online on how to retrieve `document.getElementByClassName()`, it shows that it returns a collection of elements with specified class names, according to [W3Schools](https://www.w3schools.com/jsref/met_document_getelementsbyclassname.asp)

I tried doing this on a online coding source, thanks to [playcode](https://playcode.io) for providing me space to experiment. So, I wrote a simple HTML with a Javascript code to fetch the same class name. The code and result are shown below:

![HTML code](Assets/5.png "HTML Code")

![Javascript code](Assets/6.png "Javascript Code")

![Results](Assets/7.png "Results")

Well, the results show what it is expected. It counts the number of classes inside the HTML tag, shown in the first image above, and the result prints the number of tags that uses that name of class in the console.

## Conclusion

This room covers a number of different programming languages in web as well as their vulnerabilities listed. This is categorised as a foundational skill in Cyber Security field as it requires an introductory to Programming languages as well as their vulnerabilities present. 
