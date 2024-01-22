-- @pwd		~/.config/nvim/after/plugin/colors.lua
-- @source	https://github.com/rose-pine/neovim/blob/main/readme.md
-- @source	https://video.cs50.io/w7i4amO_zaE?start=427&end=548
-- @commands	:lua ColorMyPencils()

function ColorMyPencils(colors)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "non" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "non" })
end

ColorMyPencils()

-- REPLACEMENT COLOR SCHEME
-- @source https://github.com/catppuccin/nvim/blob/main/README.md

-- function ColorMyPencils(colors)
-- 	color = color or "catppuccin"
-- 	vim.cmd.colorscheme(color)
--
-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "non" })
--	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "non" })
-- end
--
-- ColorMyPencils()
