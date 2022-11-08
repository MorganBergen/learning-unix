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
Tue Nov  8 09:53:16 CST 2022
```

### `who` command

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

- some unix programs work only with window systems such as `open -a Safari`

- You control program from the unix command line by typing arguments from a shell prompt before you start running the program.  After you start the program you want to wait for it to finish and you generally don't want to interact with it.  

- Some unix programs that work in terminals have commands of their own such as `zsh` shell.
