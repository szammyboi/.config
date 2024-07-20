return {
	{ 
		"folke/todo-comments.nvim", 
		opts = {},
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{"williamboman/mason.nvim"},
	{
    'williamboman/mason-lspconfig',
		config = function(self, opts)
			require("mason").setup()
			require("mason-lspconfig").setup {
				ensure_installed = { "lua_ls", "clangd", "glsl_analyzer" },
				automatic_installation = true
			}

			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			require('lspconfig').lua_ls.setup {}
			require('lspconfig').clangd.setup {}
			require('lspconfig').glsl_analyzer.setup {}
		end
	}, -- everything in this table is a spec 
	{'neovim/nvim-lspconfig'},  -- same	
	{"p00f/clangd_extensions.nvim"},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
		config = function(self, opts)
			local cmp = require("cmp")
			vim.opt.completeopt = { "menu", "menuone", "noselect" }

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "luasnip" }, -- For luasnip users.
					-- { name = "orgmode" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end
	},
	{"tikhomirov/vim-glsl"}
}
