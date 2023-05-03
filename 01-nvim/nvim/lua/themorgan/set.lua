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

-- github copilot file types
g_copilot_filetypes = {markdown = true}

-- github copilot file types
vim.g.copilot = {
  enabled = true,
  auto_start = true
}

-- key maps
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


