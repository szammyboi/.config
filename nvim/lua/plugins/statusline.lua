return {
	{ 
		"nvim-lualine/lualine.nvim",
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function ()
			local theme = require("kanagawa.colors").setup().theme

			local kanagawa = {}

			kanagawa.normal = {
			  a = { bg = theme.syn.fun, fg = theme.ui.bg_m3 },
			  b = { bg = theme.diff.change, fg = theme.syn.fun },
			  c = { bg = theme.ui.bg_p1, fg = theme.ui.fg },
			}

			kanagawa.insert = {
			  a = { bg = theme.diag.ok, fg = theme.ui.bg },
			  b = { bg = theme.ui.bg, fg = theme.diag.ok },
			}

			kanagawa.command = {
			  a = { bg = theme.syn.operator, fg = theme.ui.bg },
			  b = { bg = theme.ui.bg, fg = theme.syn.operator },
			}

			kanagawa.visual = {
			  a = { bg = theme.syn.keyword, fg = theme.ui.bg },
			  b = { bg = theme.ui.bg, fg = theme.syn.keyword },
			}

			kanagawa.replace = {
			  a = { bg = theme.syn.constant, fg = theme.ui.bg },
			  b = { bg = theme.ui.bg, fg = theme.syn.constant },
			}

			kanagawa.inactive = {
			  a = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
			  b = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim, gui = "bold" },
			  c = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
			}

			require('lualine').setup {
			  options = {
				theme = kanagawa,
				component_separators = '',
				section_separators = { left = '', right = '' },
			  },
			  sections = {
				lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
				lualine_b = { 'filename', 'branch' },
				lualine_c = {
				  '%=', --[[ add your center compoentnts here in place of this comment ]]
				},
				lualine_x = {},
				lualine_y = { 'filetype', 'progress' },
				lualine_z = {
				  { 'location', separator = { right = '' }, left_padding = 2 },
				},
			  },
			  inactive_sections = {
				lualine_a = { 'filename' },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { 'location' },
			  },
			  tabline = {},
			  extensions = {},
			}
		end
	}
}
