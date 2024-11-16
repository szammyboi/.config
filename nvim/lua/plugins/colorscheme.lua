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
			--vim.cmd([[colorscheme shado]])
		end
	},
	{
		"lmburns/kimbox",
		lazy = false,
		priority = 1000,
		init = function()
			vim.cmd([[colorscheme kimbox]])
		end
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			--vim.cmd([[colorscheme kanagawa]])
		end
	}
}
