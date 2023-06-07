# start here

**summary**

- Working with the unix enviroment

- Syntax of unix command lines

- Types of commands

- Dealing with the unresponsive terminal


### the unix shell

The unix shell is a command line interpreter or shell that provides a traditional Unix-like command line user interface. Users can type commands that cause actions. Shell takes the commands from the keyboard and gives them to the operating system to perform.  Once you have a shell prompt youre working with a program called a _shell_.  Common shells include Borne (sh), bash, zsh.  

## the shell prompt

When your system is ready to run a command the shell outputs a _prompt_ to tell you that you can enter a command line.  This prompt usually ends with a `$` or `%` or `❯`.  A prompt that ends witha `#` usually means that you're logged in as the _superuser_, and they do not have protections for standard users that are built into the unix system.  

If you want to find out which shell you're using run the command `echo $SHELL` and `ps $$`. 

```cli
Last login: Tue Nov  8 09:27:36 on ttys001
❯ echo $SHELL
/bin/zsh
~                                                         09:50:12 AM
❯
```

## `date` command

```
❯ date
Tue Nov  8 09:53:16 CST 2022 ```

### `who` command

This is your hostname of the computer.

```cli
❯ who am i
owner            ttys001      Nov  8 09:48
~                                                         09:53:32 AM
❯
```

- `who` command tells you who is logged in
- `owner` is the username
- `ttys001` is the terminal
- `Nov  8 09:48` is the time in which you logged in


### `exit` command

```cli
❯ exit
 Session Ended
Last login: Tue Nov  8 09:48:16 on ttys001
~                                                              10:10:20 AM
❯
```


### `fuck` command

```cli
❯ dare
zsh: command not found: dare
❯ fuck
date [enter/↑/↓/ctrl+c]
Tue Nov  8 09:55:14 CST 2022
~                                                         09:55:14 AM
❯
```

### unicode versions of Mac OS X keys

- `⌘` command
- `⌥` option
- `⌃` control
- `⇧` shift

### common control characters

- `^H` is the backspace character
- `^C` - interrupt the current command
- `^D` - exit the shell
- `^U` - erase the line
- `^W` - erase the word
- `^R` - search the history
- `^L` - clear the screen

### syntax of unix command lines

Unix command lines are simple, one-word entries such as the `date` command or they can be more complex where you need to type more than one command or program name.

Unix commands may or may not have something called **_arguments_**.  An rgument can be an option or a filename.  The general format for unix command lines are:
:
```cli
command [options] [arguments]
command [option(s)] [filename(s)]
```

There isn't a single set of rules for writing unix commands and arguments, however these are the general rules.

### general rules for writing unix commands

1.  enter commands in lowercase
2.  separate commands and arguments with spaces
3.  _options_ modify the way in whcih the command works.  Options are often single letters prefixed with a dash/hyphen/minus `-` and set off by any number of spaces or tabs.  Multiple options in one command line can be set off individually such as `-a -b` or `-ab`.  Some commands have options made from complete words such as `--help` or `--delete` or `--confirm-delete`.  When you enter a command line you can use this option style, the single-letter option, or both.

4.  The argument `filename` is the name of a file that you want to use.  Most unix programs also accept multiple filenames, separated by spaces.  If you don't enter a filename correctly, you may get the following...

```cli
❯ open askjdhasd.pdf
The file /Users/owner/askjdhasd.pdf does not exist.
```

5.  You must type spaces between commands, options, and filenames.

6.  You can use the `tab` key to complete filenames.  If you type the first few letters of a filename and then press the `tab` key, the shell will complete the filename for you.  If there is more than one filename that matches the letters you've typed, the shell will display a list of possible filenames.  You can then type more letters to narrow down the list or press the `tab` key again to see the next list of filenames.

7.  Options come before filename

## types of commands

Some unix programs work only with window systems such as `open -a Safari`.  You control program from the unix command line by typing arguments from a shell prompt before you start running the program.  After you start the program you want to wait for it to finish and you generally don't want to interact with it. 

Some unix programs that work in terminals have commands of their own such as `zsh` shell.  


### terminal windows

One of the most important windows is a _terminal window_.  A terminal window has a unix session inside with a shell prompt, just like a miniature alphanumeric terminal.  You can have several terminal windows running simultaneously.  

Few programs make their own terminal windows.  One of the best known programs is `xterm`. 

If you would like to know the executable path of your program you can view it at 

```zsh
❯ which nvim
/opt/homebrew/bin/nvim
❯ which zsh
/bin/zsh
```

- Your terminal will have a shell prompt
- The block cursor indicates your insertion point.


### using your unix account

**summary**

- unix file system
- looking inside files with less
- protecting and sharing files
- graphical filesystem browsers
- completing file and directory names
- customizing your account

Unix provides the following

- a place in the unix filesystem wher eyou can store your files
- a username that indetifies you and lets you control access to your files and is an address for your email
- an enviroment you can customize

### unix filesystem

A file is a unit of storage in unix, as in most other systems.  A file can store and hold anything:  text, a program, digitally encoded pictures or sound, and so on.  A file at the end of the day is just a sequence of raw data until they're interpreted by the right program.

In unix, files are organized into directories, a diectory is a special kind of file where the system store information about other files.  You can think of a directory a a place, so that files are said to be contained.  

**home directory**  When you log into unix, youre automatically placed within your home directory.  This directory is a unique place in the unix filesystem, contains the files you use almost everytime you login.  

**working directory** A _working_ directory is a directory that you're currently working in.  Everytime you login your home directory is your present working directory.  All commands that you enter apply to the files in your working directory.  In the sam eway, when you create files they're created in your working directory unless you specify another directory.  For instance, if you type the command `pico` **report**, the pico editor is started on a file named report in your working directory.  However if you type the command `pico /home/joan/report` a report _file_ is edited in a different directory without changing your working directory.


If you have more than one terminal window open at a time, each sesion has its own working directory, changing the working directory in one session doesnt effect the other.

**directory tree** All directories on a unix system are organized into a hierachical structure that you can imagine as a family tree.  The parent directory of the tree (the directory that conatins all other directories) is known as the **root directory**.  The root conatins several direcories and is written as a forward shash /.

### `/` root directory

The root contain several directories.  Your tree looks as follows

```clli

/
├── Applications
├── Library
├── System
├── Users
├── Volumes
├── bin
├── cores
├── dev
├── etc
├── home
├── opt
├── private
├── sbin
├── tmp
├── usr
└── var
```

`bin`, `etc`, `users`, `tmp` `usr` are some of the _subdirectories_ of the root directory.  Most of those listed directories are faily standard directories, they usually contain specific kinds of system files.  For instance, `bin` contains many Unix programs.  Not all systems have a directory named _users_.  It may be called `u` or `home`.  The `bin` directory contain all of my unix executable files including `mkdir` this is a binary executable that is ready on use of command.  Each directory has only one parent directory, but can have many children.  On a basic unix system all files in the filesystem are stored on disks connected to your computer.  It isn't always easy to use the files on someone else's computer or for someone on another computer to use your files.  Your system may have an easier way:  _a netorked filesystem_.  Networked filesystems make a remote computer's files appear as if they're part of your computer's directory tree.   


**absolute pathnames**

Unix filesystems organize its files and directories in an inverted tree structure with the root directory as the root node.  In a pathname you put slashes `/` between directory names.  For example this would be an abolute pathname.  An absolute pathname always starts with a slash.  

**relative pathnames**

A relative pathname is a name that give sthe location relative to your working directory.  Unless you use an absolute pathname, unix assume that youre using a relative pathname.  


```cli 
Last login: Wed Nov  9 18:51:32 on ttys003
❯ pwd
/Users/owner
```

## commands

1.  `ls -a` list all directories, including hidden ones.

When you use `ls -a` you 'll always see at least two entries with the names 

"." (dot) and ".." (dot dot)

"." always stands for its working directory, which is useful ith commands like `cp` copying files.  ".." is always for its relative pathname to parent directory.  

2. `ls -l` || `l`

The long ls format provides the following information about each item

```cli
❯ l
total 40
drwxr-xr-x@  5 owner  staff   160B Nov  8 10:21 .
drwxr-xr-x@  5 owner  staff   160B Nov  8 10:44 ..
-rw-r--r--@  1 owner  staff   6.0K Nov  9 18:08 .DS_Store
-rw-r--r--   1 owner  staff   9.4K Nov  9 19:24 README.md
drwxr-xr-x  57 owner  staff   1.8K Nov  9 17:33 assets
~/Documents/GitHub/learning-unix/01-start master !1 ?2                         07:31:57 PM
```

1.  `total n`

n is the amount of storage used by everything in this directory.  (This is measured in _blocks_.  On many systems, but not all, a full block holds 1024 bytes.  A block can also just be partially filled.  

2.  `type`

Tells you the type of object youre looking at, whether the item is a... (there are other less common types that won't be explained here.

`d` directory
`-` plain file

3.  access modes

Specifies three types of users (yourself, your group, and all others) who are allowed to... `r` read, `w` write, `x` execute your files.


The permissions have ten characters. The first character shows the file type (d for directory or - for a plain file). The other characters come in groups of three. The first group, characters 2–4, show the permissions for the file’s owner, which is yourself if you created the file. The second group, characters 5–7, show permissions for other members of the file’s group. The third group, characters 8–10, show permissions for all other users.

For example, the permissions for .profile are -rw-r- -r- -, so it’s a plain file. The owner, john, has both read and write permissions. Other users who belong to the file’s group doc, as well as all other users of the sys- tem, can only read the file; they don’t have write permission, so they can’t change what’s in the file. No one has execute (x) permission, which should only be used for executable files (files that hold programs).

In the case of directories, x means the permission to access the direc- tory—for example, to run a command that reads a file there or to use a subdirectory. Notice that the two directories shown in the example are executable (accessible) by john, by users in the doc group, and by every- one else on the system. A directory with w (write) permission allows delet- ing, renaming, or adding files within the directory. Read (r) permission allows listing the directory with ls.


4.  Links

The number of files or directories linked to this one (This isnt the same sort of _link_ as in a web page.

5.  Owner

The user who created or owns this file or directory.

6.  Group 

The group that owns the file or diretcory 

7.  Size

The side of the file or directory.  

8.  Modification date

When the file was last modified or the directory contents last changed.

9.  Name

The name of the file or directory

### looking inside files with less

Thus far we have been looking at files from the outside.  It's kind of like going to a bookstore and looking at all the covers, but never getting to read a word.  Let's look at a program for reading files.  If you want to "read" a long file on the scree, your system may have the `less` command to display the one "page" (a terminal filled from top to bottom) of text at a time. 

If you don't have `less` you' probably have similar programs named `more` or `pg`

`less option(s) file(s)`

`less` lets you move forward or backard in the files by any number of pages or lines, you can also move back and forth beteen two or more files specified on the command line.  When you invoke less, the first "page" of the file appears.  A prompt appears at the bottom of the terminal window.  The basic less prompt is just a colon (:), althrough for the first screenful less displa:wys the file's name as a prompt.


## customizing your zsh profile

REFERENCE THGE UNIX.PDF BOOK IN PAGE 63

your home dir may have multiple different hidden files, this files are prefixed with `.` notation.  Revealing these hidden can be used with `ls -a`.  All of these example files are what is called __shell set up files__ which are invoked when you start up your machine through your operating system:

```cli
.bash_history
.bash_profile
.bash_sessions
.bashrc
```

within the the `.zshrc` file you are revealed the pathname that is used when you search and make a command.  In other words the path tells the shell which directories to search for unix programs.  This saves you the time in having to manually type in the path name everytime.  


```
set path = 
PATH=
# or in our case within the .zshrc file 
`export PATH=$HOME/bin:/usr/local/bin:$PATH`
```
questions to address:

1. what directories and unix executable files exist within bin?

### zsh - the Z shell

see the compatability section & invoke the manual via the following command.  This is a shell script command processor, unlike bash or what have you zsh will give you the following feature sets... command like editing, built in spelling correction, programmable command completion, shell fuctions with auto loading, history mechanism, and a whole host of additional features.  

the manual to the user guide can be found [here](http://zsh.sourceforge.net/Guide/)

with explanations and hints on issues where the manual can be cabbalistic, hierographic, or downright mystifying (for example, the word `hierographic' does not exist).

```cli
man zsh
```

Note that `:h` within the man zsh will give you the help page.
Just like how you can throw commands through the CLI, you can also insert them into into your `.zshrc` file.

### text editors and word processors 

neovim is a sophisticated, extremely flexible editor, for all plain text files.  `.md`, `.py`, `.cpp` can all be used within neovim of course.  The documentation for neovim is provided however for some reason it's quite esoteric and convoluted.  When we refer to the phrase plain text we mean a file only with letters, symbols, characters, digits, and what have you.  All plain text files get used for your operating system and system configuration.


files with zsh

       $ZDOTDIR/.zshenv
       $ZDOTDIR/.zprofile
       $ZDOTDIR/.zshrc
       $ZDOTDIR/.zlogin
       $ZDOTDIR/.zlogout
       ${TMPPREFIX}*   (default is /tmp/zsh*)
       /etc/zshenv
       /etc/zprofile
       /etc/zshrc
       /etc/zlogin
       /etc/zlogout    (installation-specific - /etc is the default)


call
man zshroadmap
nvim ~./zshrc
