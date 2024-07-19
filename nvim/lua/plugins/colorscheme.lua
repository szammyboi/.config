return {
	{
	    "catppuccin/nvim",
	    name = "catppuccin",
	    lazy = true,
	    priority = 1000,
	    init = function()
	    	vim.cmd([[colorscheme catppuccin]])
	    end,
	},
}




--[[
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",	
		},
	}]]
