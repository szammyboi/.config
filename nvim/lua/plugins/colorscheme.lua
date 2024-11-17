return {
	{
	    "catppuccin/nvim",
	    name = "catppuccin",
	    lazy = true,
	    priority = 1000,
	    init = function()
	    	--vim.cmd([[colorscheme catppuccin]])
	    end,
	},
	{
		"savq/melange-nvim",
		lazy = false,
		priority = 1000,
		init = function()
			--vim.cmd([[colorscheme melange]])
		end
	},
	{
		"Biscuit-Theme/nvim",
		lazy = false,
		priority = 1000,
		init = function()
			--vim.cmd([[colorscheme biscuit]])
		end
	},
	{
		"Shadorain/shadotheme",
		lazy = false,
		priority = 1000,
		init = function()
			local function hl(...)
				vim.api.nvim_set_hl(0, ...)
			end
			vim.cmd([[colorscheme shado]])
			--hl("ColorColumn", { bg = "#616683" })
			hl("NonText", { fg = "#616683" })
		end
	},
	{
		"lmburns/kimbox",
		lazy = false,
		priority = 1000,
		init = function()
			--vim.cmd([[colorscheme kimbox]])
		end
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			--vim.cmd([[colorscheme kanagawa]])
		end
	},
	{
		"szammyboi/halloween.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			--vim.cmd([[colorscheme halloween]])
		end
	}
}
