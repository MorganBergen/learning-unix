-- options
vim.opt.nu = true
vim.opt.relativenumber = false
vim.opt.tabstop = 4
vim.smartindent = true
vim.opt.mouse = "a"
vim.opt.softtabstop = 4
vim.opt.wrap = true
vim.opt.incsearch = true
vim.opt.linebreak = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.mouse = "v"
vim.g.mapleader = " "
vim.g.minimap_width = 10
vim.g.minimap_auto_start = 1
vim.g.minimap_auto_start_win_enter = 1
vim.g.minimap_auto_start = 1
vim.g.minimap_git_colors = 1

function set_underline_cursor()
	vim.cmd('highlight! CursorLine cterm=NONE gui=NONE guibg=#282c34')
	vim.cmd('highlight! Cursor cterm=underline gui=underline')
end

return { set_underline_cursor = set_underline_cursor }

-- github copilot file types
vim.g.copilot = {
	enabled = true,
	auto_start = true

}

-- key maps
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- nvimtree mapping
-- vim.keymap.set("n, <leader>e :NvimTreeToggle<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- colorscheme
vim.cmd(":set termguicolors")

vim.cmd(":colorscheme tokyonight-moon")
-- vim.cmd(":colorscheme tokyonight-storm")
-- vim.cmd(":colorscheme tokyonight-day")
-- vim.cmd(":colorscheme tokyonight-night")
-- vim.cmd("set background=light")

-- change backgroudn to transparent
-- vim.cmd("set background=transparent")
