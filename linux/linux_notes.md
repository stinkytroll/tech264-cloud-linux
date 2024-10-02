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
  - [What value would assign read + write permissions?](#what-value-would-assign-read--write-permissions)
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
- revents unauthorized access to sensitive data.

- Ensures that users have the correct level of permissions to perform necessary operations.
- Helps maintain system stability by restricting critical system files to trusted users like root or administrators.
- Prevents accidental modifications or deletions by non-privileged users

## What is the command to view file ownership?
To view file ownership, you can use the `ls` command with the `-l` option to display detailed information about files, including the owner and group.

## What permissions are set when a user creates a file or directory? Who does file or directory belong to?
**For files**: By default, files are created without execute permissions. 

**For directories**: Directories are created with execute permissions to allow navigation. 

By default, when a user creates a file or directory, it belongs to:
- The **user** who created the file.
- The **group** to which the user belongs (the user’s primary group).

Permissions can be checked using `umask`. 

## Why does the owner, by default, not recieve X permissions when they create a file?

When a file is created, it is assumed to be a regular file, which do not need permissiosn to be executed. **Scripts** (so they can be run as programs) and **binary files** (so they can be executed by the system) required execute permissions.

`chmod` can be used to change the permissions if the file is meant to be executed.

## What command is used to change the owner of a file or directory?
`chown` (change owner): Can be used to change the owneship of a file or directory.

`sudo chown newowner filename` : Used to change **owner** of a file

`sudo chown newowner:newgroup filename` : Used to change both **owner** and **group**.

# Managing File Permissions

## Does being the owner of a file mean you have full permissions on that file? Explain.

**No**, being the owner of a file does not automatically mean you have full permissions on the file. File permissions are controlled by three sets of permissions:
- User (owner).
- Group.
- Others (everyone else).

The owner's permissions examples can vary. Ff the owner has read `r` and write `w` permissions but not execute `x`, they can modify the file but cannot execute it as a program.

## If you give permissions to the User entity, what does this mean?
When you give permissions to the User entity, you are setting what the owner of that file or directory can do.

- The **user (owner)** is the person who created the file or directory by default, but this can be changed with the chown command.
- Permissions for the user affect only that specific owner.

## If you give permissions to the Group entity, what does this mean?
When you give permissions to the Group entity, you're specifying what the members of that group can do with the file or directory.

- Every file or directory is associated with a **group**. By default, this is the primary group of the **user** who created the file.
- Members of the **group** can have different permissions from the **owner**.
- Permissions for the **group** affect all users who belong to that **group**.

## If you give permissions to the Other entity, what does this mean?
When you set permissions for the Other entity, you're controlling what all other users who are not part of the file’s owner or group can do.

- These permissions apply to any **user** who doesn't match the file's **owner** or **group**.
- It's the broadest category and typically has the most restricted permissions for security reasons.

## You give the following permissions to a file: User permissions are read-only, Group permissions are read and write, Other permissions are read, write and execute. You are logged in as the user which is owner of the file. What permissions will you have on this file? Explain.

You would only have have the **owner** permissions, as they take priority over **group** and **other** permissions. This means the **owner** will will **read-only**. 

## Here is one line from the ls -l. Work everything you can about permissions on this file or directory. 

`-rwxr-xr-- 1 tcboony staff  123 Nov 25 18:36 keeprunning.sh`

- `-rwxr-xr--` Represents a regular file `(-)`, followed by the **owner** - permissions `(rwx)`, then the **group** permissions `(r-x)` and lastly **other** permissions `(r--)`. 
- `1` indicates that there is one link to the file.
- `tcboony` is the user who owns the file. They have all permissions.
-`staff` is the group associated with the file. They have read and execute permissions.
- `123` is the file size in bytes.
- `Nov 25 18:36` is the last modification date and time of the file.
- `keeprunning.sh` is the name of the file.

# Managing File Permissions Using Numeric Values

## What numeric values are assigned to each permission?
The numeric values assigned to each permission are as follows:
- **Read (r)**: 4
- **Write (w)**: 2
- **Execute (x)**: 1
 
## What value would assign read + write permissions?
To assign **read + write** permissions, you would add the numeric values for read and write:
- Read (4) + Write (2) = **6**

## What value would assign read, write and execute permissions?
To assign **read, write, and execute permissions**, you would add the numeric values for read, write and execute:
- Read (4) + Write (2) + Execute (1) = **7**

## What value would assign read and execute permissions?
To assign **read and execute permissions**, you would add the numeric values for read and execute:
Read (4) + Execute (1) = **5**

## Often, a file or directory's mode/permissions are represented by 3 numbers. What do you think 644 would mean?
Each digit represents the **owner**, **group** and **other**. 644 would mean that the **owner** has **read and write** permissions, while both the **group** and **other** have **read only** permissions.

# Changing File Permissions

## What command changes file permissions?
The command used to change file permissions in Linux is `chmod` (change mode).

## To change permissions on a file what must the end user be? (2 answers)
- The Owner: The **user** who owns the file can change its permissions.
- A Super user (Root): A **user** with administrative privileges (typically root) can change permissions on any file.


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

