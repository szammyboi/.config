return {
	{
	    "catppuccin/nvim",
	    name = "catppuccin"
	},
	{
		"savq/melange-nvim"
	},
	{
		"Biscuit-Theme/nvim"
	},
	{
		"Shadorain/shadotheme",
		init = function()
			local function hl(...)
				vim.api.nvim_set_hl(0, ...)
			end
			--vim.cmd([[colorscheme shado]])
			hl("ColorColumn", { bg = "#616683" })
			hl("NonText", { fg = "#616683" })
		end
	},
	{
		"lmburns/kimbox"
	},
	{
		"rebelot/kanagawa.nvim"
	},
	{
		"szammyboi/halloween.nvim"
	},
}
