return {
	{
		"folke/todo-comments.nvim",
		opts = {},
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"folke/lazydev.nvim",
		dependencies = {
			{ "Bilal2453/luvit-meta", lazy = true},
		},
		ft = "lua",
		opts = {
			library = {
				{ 'lazy.nvim', words = { 'lazy', 'LazySpec'} },
				{ path = 'luvit-meta/library', words = { 'vim%.uv' } },
			},
		}
	},
	{
		"nvim-treesitter/nvim-treesitter", 
		build = ":TSUpdate",
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"astro",
				"c",
				"bash",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"python",
				"tsx",
				"typescript",
				"vim",
				"svelte",
				"css",
				"c_sharp",
				"java",
				"go",
				"gosum",
				"gomod",
				"gotmpl",
				"elixir",
			}
		},
		config = function(self, opts)
			require('nvim-treesitter.configs').setup(opts)
		end
	},
	{"williamboman/mason.nvim"},
	{
    'williamboman/mason-lspconfig',
		config = function(self, opts)
			require("mason").setup()
			require("mason-lspconfig").setup {
				ensure_installed = { "mdx_analyzer", "astro", "lua_ls", "clangd", "glsl_analyzer", "svelte", "ts_ls", "markdown_oxide", "omnisharp", "jdtls", "ltex", "pyright", "gopls", "elixirls" },

				automatic_installation = true
			}

			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			

			require('lspconfig').gopls.setup {}
			require("lspconfig").mdx_analyzer.setup {}
			require("lspconfig").markdown_oxide.setup {}
			require('lspconfig').astro.setup {}
			require('lspconfig').lua_ls.setup {}
			require('lspconfig').clangd.setup {}
			require('lspconfig').glsl_analyzer.setup {}
			require('lspconfig').ts_ls.setup {}
			require('lspconfig').svelte.setup {}
			require('lspconfig').omnisharp.setup {}
			require('lspconfig').jdtls.setup {}
			require('lspconfig').ltex.setup {}
			require('lspconfig').pyright.setup {}
			require('lspconfig').elixirls.setup{}
		end
	},
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
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"L3MON4D3/LuaSnip",
		},
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name="lazydev",
				group_index=0,
			})
		end,
		config = function(self, opts)
			local cmp = require("cmp")
			vim.opt.completeopt = { "menu", "menuone", "noselect" }

			local luasnip = require("luasnip")
			local s = luasnip.snippet
			local t = luasnip.text_node
			luasnip.add_snippets("all", {
	     		s("box", {
				t("\\color{sz_red}\\begin{center}\\fbox{}\\end{center}\\color{sz_dark}"),
			  }),

			  s("parbox", {
				t("\\color{sz_red}\\begin{center}\\fbox{\\parbox{\\dimexpr\\linewidth-2\\fboxsep-2\\fboxrule\\relax}{}}\\end{center}\\color{sz_dark}"),
			  }),
			  
			  s("list", {
				t("\\begin{enumerate}\\item\\end{enumerate}"),

			  }),
s("equation", {
				t("\\begin{align}\\end{align}"),

			  }),
s("integral", {
				t("\\int_{}^{}"),

			  }),
				s("section", {
						t("\\color{sz_blue}\\section{Title}\\color{sz_text}")
				}),
				s("subsection", {
					t("\\color{sz_text}\\subsection{}\\color{sz_dark}")
				}),
			})

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = false}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "nvim_lsp_signature_help" },
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
