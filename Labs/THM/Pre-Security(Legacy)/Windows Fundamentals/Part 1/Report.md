
# Windows Fundamentals - Part 1 - TryHackMe Walkthrough

[Room Link](https://tryhackme.com/room/windowsfundamentals1xbx)

## Executive Summary

This room covers about the fundamental Windows Operating System that covers mostly on how to manage and add/remove users/groups in a system, explore the settings and control panel of the Operating System, as well as set permissions of a local user account. In addition, the room covers about a Task Manager application to view processes and applications running in the system.

## Hands-on Activity with explanations

#### Answering the first question inside Windows Operating System

![Discussion Question 1](Assets/0.png "Answering the question inside Windows machine.")

Since Windows is not my main Operating System, it is difficult for me to answer this question without interacting the Windows machine itself. Therefore, I started the Windows machine located on Task 3 to interact within the Windows machine to answer questions in Task 2. After reading the theory and explanation carefully on Task 2, it is much more easier to answer the questions as it has access directly to the Windows Operating System. 

#### Answering the third question on Windows Operating System

![Challenge](Assets/1.png "The difficulty")

Since I did not know what is the name of the icon, I find a challenge to determine the name of the icon beside the Clock and Network that is visible in the Notification Area. I thought you click the little triangle and that is the answer. It is not as the words does not fit into the answer (Audio Service). Because of that, the answer would be something located on the right side, which I did not know what that icon is. Therefore, this is what I do:

![Process](Assets/2.png "The Process on solving the challenge")

This is where I discovered the name of the message icon. I perform a right click on the taskbar and open its settings, and navigate down to the notifications area, where there is an option called "Turn system icons on or off". These lists the number of settings and features that are enabled and disabled on the taskbar. Since I need to determine the name of the message popup located at the bottom right of the screen, it provides me the answer rightaway. Therefore, I got the answer. 

#### Setting file and folder Permissions on Windows NTFS file system

![Challenge](Assets/3.png "Setting file and folder permissions")

While I was reading about NTFS features, the task provides another additional material which discusses more about permissions. This is an interesting part as this manages the permission from users and groups as well as the owner to able to view, modify/write, and execute the file. Windows features more permission settings when compared with UNIX Operating Systems. Just select any file or folder, then click the Security section. It shows exactly the settings displayed above (in the image, it is displayed as the **Windows** folder).

#### Wrong thought on Task 5 discussion question

![Question](Assets/4.png "Wrong thought")

As I went through the material back in January 2025, I thought I would get the answer right. However, the reality speaks the opposite. The question asks on the system variable that is located on Windows folder, not the name of the folder. 

#### Viewing users and groups in a Windows machine

![Viewing users and groups inside a Windows Operating System](Assets/5.png "View users and groups")

In the application of Local Users and Groups Manager, I could see the folder named Users and Groups. To view the user accounts that are listed on the system, it is possible to view the Users folder and it lists a number of users listed on the account, both enabled and disabled. It is the same when you want to add other users to the system.

## Reflection

- What new things do I learn from the room?

I learned about adding a new user in a Windows machine, limiting a number of applications that require administrative privileges, modifying user account privileges, viewing applications and processes running in the system, and exploring settings as well as control panel in the Windows Operating System.

- How do I apply these concepts in the real world?

These are the fundamental concepts that requires the learner to understand what Windows Operating System in a general context. This may applicable if there are generic issues that are resolved by the general user, such as connect a Windows OS to a printer, modify permissions for a number of users in the system, etc.

## Appendix

- Windows Edition - The version history of the Windows Operating Systems as well as its flavours(Home, Pro, etc.).
- Desktop/GUI - The welcome screen once you are logged in to the Windows machine.
- Taskbar - The section where the applications are listed and opened, located at the bottom of the screen.
- NTFS (New Technology File System) - The file system of the Windows Operating System in modern version.
- FAT (File Allocation Table) - The file system that are widely utilised in USB devices or old Windows Operating Systems.
- System32 - The folder that is located on the Windows directory that stores critical files as well as folders to make the Windows function as normal.
- Administrator - The user that has the highest hierarchy, which it can modify system settings, add or remove users in the Operating System, etc.
- Local User and Group Management (lusrmgr.msc) - The Windows application that function to view and modify users in a system.
- User Account Control - The set of permissions that is configured inside a local user account to prevent any unwanted actions.
- Settings - The application to modify any system that is based on Software, such as wallpaper, device lock, etc.
- Control Panel - Similar to settings, but it also has additional features that is related with the system, such as modifying hardwares like printers, PCs, etc.
- Task Manager - The list of applications and processes that are running on a system.
