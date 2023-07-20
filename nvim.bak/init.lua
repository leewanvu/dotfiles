-- Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent=true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('vux.plugins')
require('vux.options')
require('vux.colorscheme')
require('vux.lsp')
require('vux.keymaps')

-- Sourcing statusline.lua when switch colorscheme
-- vim.api.nvim_command('augroup switchcolorscheme')
-- vim.api.nvim_command('autocmd!')
-- vim.api.nvim_command('autocmd ColorScheme * luafile ~/.config/nvim/lua/vux/statusline.lua')
-- vim.api.nvim_command('augroup END')
