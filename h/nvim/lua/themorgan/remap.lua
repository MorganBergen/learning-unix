-- @pwd		~/.config/nvim/lua/themorgan/remap.lua
-- @source	https://video.cs50.io/w7i4amO_zaE?start=109
-- @command	:so pv

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- with the move command you can do the following
-- :Vj on the first line of a paragraph
-- :JJJ then you can move down with a J the entire line 
-- :KKK up with a capital K with the entire line 
vim.keymap.set("v", "J", ":m '>+1CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


-- control d half page jumping keeps the cursor in the same position
-- control u half page jumping keeps the cursor in the same position
-- allows for search terms to stay in the middle with the command / or ?
-- /search_term
-- ?search_term
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

