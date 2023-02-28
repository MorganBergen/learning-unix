# learning unix  

`open Documents/morgan/books/unix.pdf` 

<img width="128" align="right" alt="AppIcon" src="https://user-images.githubusercontent.com/65584733/200620956-10bed40e-746a-41c5-8881-2fdf19f61638.png">

<img width="128" align="right" alt="Terminal" src="https://user-images.githubusercontent.com/65584733/200620973-bdc622a1-fd62-414e-a3b0-30d0783a3677.png">


this will be a collection of notes and command listings for learning the unix operating system.  in general an operating system is simply a set of programs that control a computer.  some other operating systems such as microsoft windows and macos are designed for certain types of hardware, however unix runs on almost any kind and if you learn unix you will be able to use many kinds of computers without having to learn an entirely new operating system.

unix doesnt have a windowing system, instead it uses a text based interface, which has a higher learning curve, but is much more flexible and powerful.  the **interfaces to unix** was originally used on typerwriter-like terminals, from a shell prompt on a command line.  

There are many reasons why using the traditional command-line interface is more powerful and important.  

1.  every unix system has a command-line interface, so if you know how to use the command line, you'll always be able to use any system.

2.  If you become a more-advance unix user, you'll fin dthat the command line is actually much more flexible than the windowing interface.  Unix programs are designed to use together from the command line as "building blocks" where there is almost an infinite number of combinations to do an infinite number of tasks.

3.  You have the power to launch and close windowing programs from the cli, however windowing programs cannot launch and close or even affect the command line.

4.  When you learn how to use the command line, you'll be able to use to use the same techniques in order to write _scripts_.  Scripts are programs that automate jobs which you'd have to do manually and repetitively with a window system.


<p><a href="https://commons.wikimedia.org/wiki/File:Window_(windowing_system).svg#/media/File:Window_(windowing_system).svg"><img width=30% align"right" src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Window_%28windowing_system%29.svg/1200px-Window_%28windowing_system%29.svg.png" alt="Window (windowing system).svg"></a><br>By Shmuel Csaba Otto Traian, <a href="https://creativecommons.org/licenses/by-sa/3.0" title="Creative Commons Attribution-Share Alike 3.0">CC BY-SA 3.0</a>, <a href="https://commons.wikimedia.org/w/index.php?curid=28861125">Link</a></p>

### learning objectives

- [ ] learn how to use the command line
- [ ] basic system utility commands to get started with unix
- [ ] learn how to use the bash shell

### terminal shell

apple's macOS command line tool.

**start here**

**what is terminal?**

An apple app that provides a command line to enter commands for macOS (Macintosh Operating System) to perform.  Terminal is a type of program called a "Terminal Emulator" commonly found on UNIX-based computers.  A terminal emulator also knon as a terminal application is a computer program that emulates (copies) a video terminal within some other display architecture.  Umulate is meant to reproduce or copy a function or action of a software system.  A terminal emulator is  synonymous with shell, text terminal, or terminal application.  

### guide of zshrc

[link](https://medium.com/featurepreneur/guide-to-iterm2-46cd4625d55a)

### git and github

```cli
❯ git init learning-unix

❯ cd learning-unix/

❯ touch README.md

❯ git add README.md

❯ git commit -m "first commit"

❯ git push -u origin master

❯ git remote -v
origin	https://github.com/MorganBergen/learning-unix.git (fetch)
origin	https://github.com/MorganBergen/learning-unix.git (push)
~/Documents/GitHub/learning-unix master !1                     09:27:46 AM
```

<img width="30%" align="center" alt="book" src="https://user-images.githubusercontent.com/65584733/200623785-ea1cc479-a9d5-495c-b4ac-c3b517829d5c.jpg"> 

## nvim commands

how to search in a document?

```
: / search term
```

how to search and replace in a document?

```
To find and replace a word in Neovim, you can use the :%s/old-word/new-word/g command. This will search for the string old-word in the entire document and replace it with new-word.

Here's an example of how you would use this command:

Open a file in Neovim.
Press Esc to enter Normal mode.
Type :%s/old-word/new-word/g and press Enter.
This will find and replace all occurrences of old-word with new-word in the entire document. If you want to only search for and replace a word in a specific range of lines, you can use a range before the s command. For example, :5,10s/old-word/new-word/g will find and replace old-word with new-word only in lines 5 through 10.

You can also use the :%s/old-word/new-word/gc command to perform a search and replace operation that prompts you for confirmation before replacing each occurrence.

:%s/search term/replace term/g
```

how to move from highlighted found term to highlighted found term?

```
n
```

how to exit out of search from the highlighted search term?

```
: nohl
```

show color pallette

```
for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done

```

how to split and see the same file in two different windows?

```
: split
```
