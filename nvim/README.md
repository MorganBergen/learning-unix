# neovim configuration 

###  contents

1.  [tree](#tree)
2.  [call tree](#call-tree)

###  call tree

1.  `/nvim/init.nvim`

```lua
lua require 'init'
```

2.  `/nvim/lua/init.lua`

```lua
require('set')
require('plugins')


```



###  tree
```
❯ tree
.
├── README.md
├── init.vim
├── lua
│   ├── configs
│   │   ├── mini.lua
│   │   ├── startup.lua
│   │   ├── telescope.lua
│   │   └── treesitter.lua
│   ├── init.lua
│   ├── plugins.lua
│   └── set.lua
├── pack
│   └── github
│       └── start
│           └── copilot.vim
│               ├── LICENSE.md
│               ├── README.md
│               ├── SECURITY.md
│               ├── autoload
│               │   ├── copilot
│               │   │   ├── agent.vim
│               │   │   ├── doc.vim
│               │   │   ├── job.vim
│               │   │   ├── logger.vim
│               │   │   └── panel.vim
│               │   └── copilot.vim
│               ├── copilot
│               │   └── dist
│               │       ├── agent.js
│               │       ├── agent.js.LICENSE.txt
│               │       ├── tokenizer.json
│               │       ├── tree-sitter-go.wasm
│               │       ├── tree-sitter-javascript.wasm
│               │       ├── tree-sitter-python.wasm
│               │       ├── tree-sitter-ruby.wasm
│               │       ├── tree-sitter-typescript.wasm
│               │       ├── tree-sitter.wasm
│               │       └── vocab.bpe
│               ├── doc
│               │   ├── copilot.txt
│               │   └── tags
│               ├── lua
│               │   └── _copilot.lua
│               └── plugin
│                   └── copilot.vim
└── plugin
    └── packer_compiled.lua

15 directories, 33 files
```
