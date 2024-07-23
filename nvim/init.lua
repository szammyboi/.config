-- TODO: fix the theme loading issue

local autocmd = vim.api.nvim_create_autocmd

local function is_modded_buffer_open(buffers)
	for _, v in pairs(buffers) do
		if v.name:match("NvimTree_") == nil then
			return true
		end
	end
	return false
end

autocmd('BufEnter', {
	nested = true,
	pattern = "*",
	callback = function ()
		if
			#vim.api.nvim_list_wins() == 1
			and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil
			and is_modded_buffer_open(vim.fn.getbufinfo({bufmodified = 1})) == false
		then
			vim.cmd("quit")
		end
	end
})

--[[autocmd('VimEnter', {
	pattern = "*",
	command = "NvimTreeOpen | wincmd p"
})]]

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>n', ':NvimTreeFocus<CR>')

vim.g.have_nerd_font=true
vim.opt.relativenumber=true
vim.opt.showmode=false
vim.opt.breakindent=true
vim.opt.undofile=true
vim.opt.smartcase=true
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4

vim.opt.signcolumn='number'

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'
require('config.lazy')
