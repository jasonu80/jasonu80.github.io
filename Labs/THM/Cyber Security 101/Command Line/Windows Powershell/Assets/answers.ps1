
# Task 1: Build a pipeline of cmdlets to sort and filter the output with the goal of displaying the largest file in the C:\Users\captain\Documents\captain-cabin directory.

# I had difficulties on how to sort in descending order and find the option to display only 1 file. 

Get-ChildItem | Select-Object -Property "Name" -First 1 | Sort-Object -Property Length -Descending

<# What does this command do:

Get-ChildItem: Display all files in the current directory.
Select-Object: The piping command that is utilised for filtering the columns.
  -Property: The column that the console displays.
  -First: Display the first results, followed with a number.
Sort-Object: Sort the results in ascending order.
  -Property: Column name that wants to be filtered
  -Descending: Sort in Descending order

Output:

Name
----
ship-flag.txt

#>

# Task 2: Retrieve the items in the current directory with size greater than 100.

# There are 2 possible, similar solutions:

Get-ChildItem | Where-Object Length -gt 100

Get-ChildItem | Where-Object -Property "Length" -gt 100

<# Explanation: 

Get-ChildItem: Retrieve files in the current directory
Where-Object: Filters the column name with a condition
-gt: Greater than operator. 

#>

#Output will be the same:

<# 

    Directory: C:\Users\captain\Documents\captain-cabin


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----          9/4/2024  12:14 PM            264 captain-hat.txt
-a----          9/4/2024  12:37 PM           2116 ship-flag.txt

#>

# Task 3: Navigate the file system of the user p1r4t3 and find the hidden treasure.

# Currently, the user is still in the captain folder. It needs to move to user p1r4t3 and display the files inside that directory. 

Set-Location C:\Users\p1r4t3

# Move to the directory located in C:\Users\p1r4t3

Get-ChildItem

<# Output: 

    Directory: C:\Users\p1r4t3


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-r---         8/29/2024   3:53 PM                Desktop
d-r---         8/29/2024  11:33 AM                Documents
d-r---          5/8/2021   9:15 AM                Downloads
d-r---          5/8/2021   9:15 AM                Favorites
d-----         8/29/2024   1:15 PM                hidden-treasure-chest
d-r---          5/8/2021   9:15 AM                Links
d-r---          5/8/2021   9:15 AM                Music
d-r---          5/8/2021   9:15 AM                Pictures
d-----          5/8/2021   9:15 AM                Saved Games
d-r---          5/8/2021   9:15 AM                Videos

#>

Set-Location .\hidden-treasure-chest\

Get-ChildItem

<# Output: 

    Directory: C:\Users\p1r4t3\hidden-treasure-chest


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         8/29/2024   1:15 PM            322 big-treasure.txt

#>

Get-Content .\big-treasure.txt

# Display the output of big-treasure.txt file.

<# Output: 

            ___
        .-"; ! ;"-.
      .'!  : | :  !`.
     /\  ! : ! : !  /\
    /\ |  ! :|: !  | /\
   (  \ \ ; :!: ; / /  )
  ( `. \ | !:|:! | / .' )
  (`. \ \ \!:|:!/ / / .')
   \ `.`.\ |!|! |/,'.' /
    `._`.\\\!!!// .'_.'
       `.`.\\|//.'.'
        |`._`n'_.'|  hjw
        "----^----"

FLAG: THM{REDACTED}

#>

# Task 4: Generate the hash value of the file on task 3.

Get-FileHash .\big-treasure.txt

<# Output: 

Algorithm       Hash                                                                   Path
---------       ----                                                                   ----
SHA256        REDACTED                                          C:\Users\p1r4t3\hidden-treasure-chest\big-treasure.txt

#>

# Task 5: Find the service name with the description written the motto of user p1r4t3.

# Since the motto is part of the answer in the room, it will be redacted.

Get-Service | Where-Object DisplayName -like "motto*"

<# Command Explanation: 

Get-Service: Display all services that are listed on the system.
Where-Object: Filters the column with a condition
  -like: match the keyword with the word motto followed with other characters.

#>

<# Output: 

Status   Name               DisplayName
------   ----               -----------
Running  REDACTED           REDACTED

#>

# Task 6: Run a command Get-ChildItem with the computer name User. Assume the user has no credentials.

Invoke-Command -ComputerName User -ScriptBlock { Get-ChildItem }

<# Explanation: 

Invoke-Command: Running the powershell command on a local or remote user. It displays everything.
  -ComputerName: The computer name that is written on the computer
  -ScriptBlock: The powershell command that the user wants to run in the local or remote machine. 

#>

# If it has a credential:

Invoke-Command -ComputerName User -Credential THM\admin -ScriptBlock { Get-ChildItem } #In this context, the domain is THM with the username admin.

<# Additional explanation:

-Credential: Provide the credentials of the user who is authorised to run the powershell syntax.

#>
