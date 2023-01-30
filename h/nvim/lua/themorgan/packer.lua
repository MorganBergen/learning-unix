-- @pwd		~/.config/nvim/lua/themorgan/packer.lua	
-- @sources	https://github.com/wbthomason/packer.nvim#quickstart
-- 		https://github.com/nvim-telescope/telescope.nvim#installation
-- 		https://github.com/rose-pine/neovim#usage
-- 		https://github.com/nvim-treesitter/nvim-treesitter#installation
-- 		https://github.com/nvim-treesitter/playground#setup
-- @commands	:so
-- 		:PackerSync
-- 		:lua ColorMyPencils()



-- run the following commands in nvim to get started
-- :so
-- :PackerSync
-- :lua ColorMyPencils()


-- this file can be loaded by calling `lua require('plugins')` from your init.vim
-- only required if you have packer configued as `op- Onlyt` vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

	-- https://github.com/wbthomason/packer.nvim#quickstart
	-- run the following command to get started
	-- git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 	-- ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	
	-- find code under then you can write your plugin specification in Lua
	-- e.g. (in ~/.config/nvim/lua/plugins.lua):
	-- packer can manage itself
	-- this is your plugin specification, your package manager
	use 'wbthomason/packer.nvim'
	
	-- https://github.com/nvim-telescope/telescope.nvim#installation
	-- find code under using packer.nvim
	-- this is your fuzzy finder over lists
	-- other location can be found on /nvim/after/plugin/telescope.lua
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0'
		-- or			       , branch = '0.1.x'
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- https://github.com/rose-pine/neovim#usage
	-- find code under with packer.nvim
	-- this is your color scheme
	use ({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
		vim.cmd('colorscheme rose-pine')
		end
	})

	-- REPLACEMENT COLOR SCHEME
	-- https://github.com/catppuccin/nvim/blob/main/README.md#installation
	-- find plugin in at ~/.config/nvim/after/plugin/colors.lua
	-- this scheme is currented commented out
--	use ({ 
--		"catppuccin/nvim", 
--		as = "catppuccin", 
--		config = function()
--		vim.cmd.colorscheme "catppuccin"
--		end
--	})

	
	-- https://github.com/nvim-treesitter/nvim-treesitter#installation
	-- find code under installation, it was originally, but we needed to 
	-- translate it to lua
	-- Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	-- https://github.com/nvim-treesitter/playground#setup
	-- find code under Install the plugin (vim-plug shown):
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')

	-- @command :TSPlaygroundToggle

end)


require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
