-- @pwd		~/.config/nvim/after/plugin/treesitter.lua
-- @source	https://github.com/nvim-treesitter/nvim-treesitter#modules
-- @source	https://video.cs50.io/w7i4amO_zaE?start=682
-- @command     :so
-- @output	[nvim-treesitter] [0/6] Downloading tree-sitter-rust...
-- @output	[nvim-treesitter] [1/6] Compiling...
-- @output	[nvim-treesitter] [2/6] Compiling...
-- @output	[nvim-treesitter] [3/6] Treesitter parser for c has been installed
-- @output	[nvim-treesitter] [4/6] Treesitter parser for javascript has been installed
-- @output	[nvim-treesitter] [5/6] Treesitter parser for typescript has been installed
-- @output	[nvim-treesitter] [6/6] Treesitter parser for rust has been installed
-- @command     :e

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "help", "javascript", "typescript", "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

  },
}


