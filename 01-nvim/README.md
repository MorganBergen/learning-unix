# neovim information

**table of contents**

- [neovim information](#neovim-information)
  - [installation](#installation)
  - [configuration](#configuration)
  - [plugins](#plugins)
  - [keybindings](#keybindings)
  - [resources](#resources)
- [nvim commands](#nvim-commands)

# ~/.confg

.config is a hidden directory in your home directory that is used to store configuration files for various applications. These files typically have the filename extension ".conf" or ".ini" and contain settings that control the behavior of the application. The .config directory is typically used for application-specific configuration files, while system-wide configuration files are typically stored in the /etc directory. The .config directory is created automatically when you install an application that needs to store configuration files, and you can access it by typing "cd ~/.config" in a terminal or by using a file manager such as Nautilus (on Linux), Finder (on macOS), or File Explorer (on Windows).


# package manager

a vim package is a directory that contains plugins.  compared to normal plugins, a package can be downloaded as an archieve 

```zsh
❯ tree
.
├── init.vim
└── pack
    └── github
        └── start
            └── copilot.vim
                ├── LICENSE.md
                ├── README.md
                ├── SECURITY.md
                ├── autoload
                │   ├── copilot
                │   │   ├── agent.vim
                │   │   ├── doc.vim
                │   │   ├── job.vim
                │   │   ├── logger.vim
                │   │   └── panel.vim
                │   └── copilot.vim
                ├── copilot
                │   └── dist
                │       ├── agent.js
                │       ├── agent.js.LICENSE.txt
                │       ├── tokenizer.json
                │       ├── tree-sitter-go.wasm
                │       ├── tree-sitter-javascript.wasm
                │       ├── tree-sitter-python.wasm
                │       ├── tree-sitter-ruby.wasm
                │       ├── tree-sitter-typescript.wasm
                │       ├── tree-sitter.wasm
                │       └── vocab.bpe
                ├── doc
                │   ├── copilot.txt
                │   └── tags
                ├── lua
                │   └── _copilot.lua
                └── plugin
                    └── copilot.vim

12 directories, 24 files
```

# nvim commands 

normal mode commands
visual mode commands
insert mode commands
command-line command
command-line editing

Command	⌘
Shift 	⇧ 
Option 	⌥S
Control ⌃

terminology

`:sp`   means split pane of the same window
`:vsp`  means split pane of the same window
`:tabe` means open a new tab
`⇧v{any set of lines}=` this will reformat your work like beautify
`y` 		copy == yank
`d` 		cut == delete
`p`		paste == put
`<Esc>`		exit out of visual mode into normal mode

keybinding			command
`CTRL-R`			redo
`<Esc> u`			undo
`⌘ K`				go to reference if highlighted
`⇧ a`				insert at the end of a line
`⇧ i`				insert at the beginning of a line
`d`				delete/copy
`p`				paste
`:h`				help
`:v_word`			searches for wrord in a file
`CTRL-O`			goes back

# iterm keyboard shortcuts

keybinding			command
`⌘ ⇧ d`				split horizonally with current profile
`⌘ d`				split vertically with current profile


i_<Home> 			what is home REF quickref.txt	




In vim, text is selected by entering into visual mode.

`v`		begins visual mode
`<Esc>`		exists out of modes
`V`		begins linewise visual mode which selects entire lines
`ctrl` + `v`	enters block visual mode
`d`		deletes the text
`y`		copys the text
`p`		paste yoru clipboard text


 :tabnew 	
 `gT`		tab through 
 `gt`		tab through


