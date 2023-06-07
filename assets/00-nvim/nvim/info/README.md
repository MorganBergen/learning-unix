# 0 to LSP neovim rc from scratch

[link](https://video.cs50.io/w7i4amO_zaE?start=109)

steps
1. create my packer
2. install the plugin i want


## init.lua (neovim 0.5)

## ~/.config/nvim/init.lua
```lua
require("themorgan")
print("hello from init.lua")
```

## ~/.config/nvim/lua/themorgan/init.lua
```lua
require("themorgan.remap")
print("hello from themorgan")
```
:so pv

## ~/.config/nvim/lua/themorgan/remap.lua
```lua
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
```
:so pv

# plugin manager and fuzzy finder

## https://github.com/wbthomason/packer.nvim
## https://github.com/nvim-telescope/telescope.nvim
## https://github.com/nvim-treesitter/nvim-treesitter

# added packer with the following command
❯ git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
Cloning into '/Users/owner/.local/share/nvim/site/pack/packer/start/packer.nvim'...
remote: Enumerating objects: 52, done.
remote: Counting objects: 100% (52/52), done.
remote: Compressing objects: 100% (49/49), done.
remote: Total 52 (delta 2), reused 34 (delta 1), pack-reused 0
Receiving objects: 100% (52/52), 78.84 KiB | 1.79 MiB/s, done.
Resolving deltas: 100% (2/2), done.
❯ cd

## ~/.config/nvim/lua/themorgan/packer.lua
```lua
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Onlyrequired if you have packer configured as `op- Onlyt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
		-- Packer can manage itself
		use 'wbthomason/packer.nvim'

		use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
		}

		use({
			'rose-pine/neovim',
			as = 'rose-pine',
			config = function()
			vim.cmd('colorscheme rose-pine')
			end
			})

		end)
```
:so
:PackerSync
:so
:PackerSync

## ~/.config/nvim/after/plugin/telescope.lua
```lua
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	built.grep_string({ search = vim.fn.input("Grep > " });
end)
```

## ~/.config/nvim/after/plugin/colors.lua
```
function ColorMyPencils(colors)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "non" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "non" })
end

ColorMyPencils()
```






SO JUST LIKE HOW I WANTED TO INSTALL https://github.com/catppuccin/nvim#special-integrations

# `~/.config/nvim/lua/themorgan/packer.lua`
```lua
use ({
	"catppuccin/nvim",
	as = "catppuccin",
	config = function()
	vim.cmd.colorscheme "catppuccin"
	end
})
```

# `~/.config/nvim/after/plugin/colors.lua`
function ColorMyPencils(colors)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "non" })
	vim.api.nivm_set_hl(0, "NormalFloat", { bg = "non" })
end

ColorMyPencils()

```


##  https://github.com/catppuccin/nvim#installation
use { "catppuccin/nvim", as = "catppuccin" }

## https://github.com/catppuccin/nvim#usage


# files
`./plugin/packer_compiled.lua`
`./lua/themorgan/remap.lua`
`./lua/themorgan/packer.lua`
`./lua/themorgan/init.lua`
`./init.lua`
`./after/plugin/telescope.lua`
`./after/plugin/colors.lua`




