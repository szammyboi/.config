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
		lazy = true,
		priority = 1000,
		init = function()
			--vim.cmd([[colorscheme melange]])
		end
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		priority = 1000,
		init = function()
			vim.cmd([[colorscheme kanagawa]])
		end
	}
}
