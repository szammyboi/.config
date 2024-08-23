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
	  "lervag/vimtex",
	  lazy = false,     -- we don't want to lazy load VimTeX
	  -- tag = "v2.15", -- uncomment to pin to a specific release
	  init = function()
		-- VimTeX configuration goes here, e.g.
		vim.g.vimtex_view_general_viewer = 'okular'
		vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
	  end
	},
}
