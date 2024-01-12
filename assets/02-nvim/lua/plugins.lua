local vim = vim

vim.cmd('packadd packer.nvim')

function get_setup(name)
    return string.format('require("configs/%s")', name)
end

return require('packer').startup(function(use)

    use {'wbthomason/packer.nvim'}
    use {'folke/tokyonight.nvim'}
    use {'nvim-tree/nvim-tree.lua'}
    use {'nvim-tree/nvim-web-devicons'} 
    use {'tpope/vim-fugitive'}

    use {'nvim-treesitter/playground'}
    
    use {'nvim-treesitter/nvim-treesitter', 
        run = ':TSUpdate', 
        config = get_setup("treesitter")
    }

    use {'nvim-telescope/telescope-file-browser.nvim',
        config = get_setup("telescope")
    }

    use {'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- use {'nvim-telescope/telescope.nvim',
    --     tag = '0.1.0',
    --     config = get_setup("telescope"),
    --     requires = {{'nvim-lua/plenary.nvim'}}
    -- }

    use {'startup-nvim/startup.nvim',
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
        config = get_setup("startup")
    }

    use({"folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })

    use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }



end)

