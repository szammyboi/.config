return {
	{ 
		"folke/todo-comments.nvim", 
		opts = {},
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{"williamboman/mason.nvim"},
	{
    'williamboman/mason-lspconfig',
		config = function(self, opts)
			require("mason").setup()
			require("mason-lspconfig").setup {
				ensure_installed = { "lua_ls", "clangd" },
				automatic_installation = true
			}
		end
	}, -- everything in this table is a spec 
	{'neovim/nvim-lspconfig'},  -- same	
}
