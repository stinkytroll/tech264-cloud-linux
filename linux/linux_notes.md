- [File Ownership With Linux](#file-ownership-with-linux)
  - [Why is managing file ownership important?](#why-is-managing-file-ownership-important)
  - [What is the command to view file ownership?](#what-is-the-command-to-view-file-ownership)
  - [What permissions are set when a user creates a file or directory? Who does file or directory belong to?](#what-permissions-are-set-when-a-user-creates-a-file-or-directory-who-does-file-or-directory-belong-to)
  - [Why does the owner, by default, not recieve X permissions when they create a file?](#why-does-the-owner-by-default-not-recieve-x-permissions-when-they-create-a-file)
  - [What command is used to change the owner of a file or directory?](#what-command-is-used-to-change-the-owner-of-a-file-or-directory)
- [Managing File Permissions](#managing-file-permissions)
  - [Does being the owner of a file mean you have full permissions on that file? Explain.](#does-being-the-owner-of-a-file-mean-you-have-full-permissions-on-that-file-explain)
  - [If you give permissions to the User entity, what does this mean?](#if-you-give-permissions-to-the-user-entity-what-does-this-mean)
  - [If you give permissions to the Group entity, what does this mean?](#if-you-give-permissions-to-the-group-entity-what-does-this-mean)
  - [If you give permissions to the Other entity, what does this mean?](#if-you-give-permissions-to-the-other-entity-what-does-this-mean)
  - [You give the following permissions to a file: User permissions are read-only, Group permissions are read and write, Other permissions are read, write and execute. You are logged in as the user which is owner of the file. What permissions will you have on this file? Explain.](#you-give-the-following-permissions-to-a-file-user-permissions-are-read-only-group-permissions-are-read-and-write-other-permissions-are-read-write-and-execute-you-are-logged-in-as-the-user-which-is-owner-of-the-file-what-permissions-will-you-have-on-this-file-explain)
  - [Here is one line from the ls -l. Work everything you can about permissions on this file or directory.](#here-is-one-line-from-the-ls--l-work-everything-you-can-about-permissions-on-this-file-or-directory)
- [Managing File Permissions Using Numeric Values](#managing-file-permissions-using-numeric-values)
  - [What numeric values are assigned to each permission?](#what-numeric-values-are-assigned-to-each-permission)
  - [What can you with the values assign read + write permissions?](#what-can-you-with-the-values-assign-read--write-permissions)
  - [What value would assign read, write and execute permissions?](#what-value-would-assign-read-write-and-execute-permissions)
  - [What value would assign read and execute permissions?](#what-value-would-assign-read-and-execute-permissions)
  - [Often, a file or directory's mode/permissions are represented by 3 numbers. What do you think 644 would mean?](#often-a-file-or-directorys-modepermissions-are-represented-by-3-numbers-what-do-you-think-644-would-mean)
- [Changing File Permissions](#changing-file-permissions)
  - [What command changes file permissions?](#what-command-changes-file-permissions)
  - [To change permissions on a file what must the end user be? (2 answers)](#to-change-permissions-on-a-file-what-must-the-end-user-be-2-answers)
  - [Give examples of some different ways/syntaxes to set permissions on a new file (named testfile.txt) to:](#give-examples-of-some-different-wayssyntaxes-to-set-permissions-on-a-new-file-named-testfiletxt-to)
    - [Set User to read, Group to read + write + execute, and Other to read and write only](#set-user-to-read-group-to-read--write--execute-and-other-to-read-and-write-only)
    - [Add execute permissions (to all entities)](#add-execute-permissions-to-all-entities)
    - [Take write permissions away from Group](#take-write-permissions-away-from-group)
    - [Use numeric values to give read + write access to User, read access to Group, and no access to Other.](#use-numeric-values-to-give-read--write-access-to-user-read-access-to-group-and-no-access-to-other)
- [Some Linux Commands](#some-linux-commands)


# File Ownership With Linux

## Why is managing file ownership important?
File ownership determines who can read, modify, or execute a file or directory.

## What is the command to view file ownership?

## What permissions are set when a user creates a file or directory? Who does file or directory belong to?

## Why does the owner, by default, not recieve X permissions when they create a file?

## What command is used to change the owner of a file or directory?

# Managing File Permissions

## Does being the owner of a file mean you have full permissions on that file? Explain.

## If you give permissions to the User entity, what does this mean?

## If you give permissions to the Group entity, what does this mean?

## If you give permissions to the Other entity, what does this mean?

## You give the following permissions to a file: User permissions are read-only, Group permissions are read and write, Other permissions are read, write and execute. You are logged in as the user which is owner of the file. What permissions will you have on this file? Explain.

## Here is one line from the ls -l. Work everything you can about permissions on this file or directory.

# Managing File Permissions Using Numeric Values

## What numeric values are assigned to each permission?

## What can you with the values assign read + write permissions?

## What value would assign read, write and execute permissions?

## What value would assign read and execute permissions?

## Often, a file or directory's mode/permissions are represented by 3 numbers. What do you think 644 would mean?

# Changing File Permissions

## What command changes file permissions?
## To change permissions on a file what must the end user be? (2 answers)

## Give examples of some different ways/syntaxes to set permissions on a new file (named testfile.txt) to:

### Set User to read, Group to read + write + execute, and Other to read and write only

### Add execute permissions (to all entities)

### Take write permissions away from Group

### Use numeric values to give read + write access to User, read access to Group, and no access to Other.

# Some Linux Commands
- `uname` : Displays system information.
- `whoami` : Tells you who is logged in.
- `ps` : Displays current processes.
- `history` : Gives youl log of commands used.
  - `history -c` : Clears the history in memory for the current session.
  - `history -w` : Writes the cleared history to the .bash_history file, which effectively empties the history file.
- `ls -al` : Shows all files, as well the long format listing for more detailed information on each file / directory. A directory will appear blue.
- `curl` : Used to transfer data from or to a server using various network protocols, such as HTTP, HTTPS, FTP, and others. Very powerful tool.
- `wget` : Used to download files from the web.
- `file` : Used to see what the file type of specified file.
- `cp` : Copies a file.
- `rm` : Removes a file.
- `sudo` : Super user command input. 
  - `sudo apt update -y` : Makes sure the package information is up to date, but doesn't install anything. 
  - `sudo apt upgrade -y` : **Dangerous.** Installs packages which could break any work that requires particular versions.
- `cd /` : Changes the current working directory to the root directory.
- `sudo su` : Switches you to the superuser (root) account.
  - `exit` : Can be used to leave super user.

