vim.cmd('packadd packer.nvim')

function get_setup(name)
    
    return string.format('require("configs/%s")', name)

end

return require('packer').startup(function()
   
    use {'wbthomason/packer.nvim'}

    use {'echasnovski/mini.nvim', config = get_setup('mini') }

    use {'folke/tokyonight.nvim'}

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = get_setup("treesitter")}
    
    use {'nvim-tree/nvim-tree.lua'}

    use {'nvim-tree/nvim-web-devicons'}

    -- use {   'glenpnir/galaxyline.nvim',
    --      config = get_setup("galaxyline")
    --  }

    use {   "nvim-telescope/telescope-file-browser.nvim",
            config = get_setup("telescope")
        }

    use {   'nvim-telescope/telescope.nvim', tag = '0.1.0',
            config = get_setup("telescope"),
            requires = { {'nvim-lua/plenary.nvim'} } 
        }

    use {   'startup-nvim/startup.nvim',
            requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
            config = get_setup("startup")
        }

    -- use { 
    --     'lewis6991/gitsigns.nvim',
    --     config = get_setup('gitsigns'),
    --     requires = {
    --         'nvim-lua/plenary.nvim',
    -- } 'minimap.vim' use {'yavko/minimap.vim', config = get_setup('minimap')}


end)

