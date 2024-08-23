return {
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			vim.opt.termguicolors = true
			require("nvim-tree").setup {}
		end
	},

	{
		"stevearc/aerial.nvim",
		config = function ()
			require('aerial').setup {
				on_attach = function(bufnr)
					vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
					vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
				end
			}
		end
	},
	{
    "nvim-neorg/neorg",
		lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		version = "*", -- Pin Neorg to the latest stable release
		config = function()
			require("neorg").setup {
			  load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.dirman"] = {
				  config = {
					workspaces = {
					  notes = "c:\\notes",
					},
					default_workspace = "notes",
				  },
				},
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					}
				},
				["core.integrations.nvim-cmp"] = {},
			  },
			}

			vim.wo.foldlevel = 99
			vim.wo.conceallevel = 2
		end
	}
}
