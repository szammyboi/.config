-- TODO: fix the theme loading issue

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
