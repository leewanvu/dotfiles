-------------------- HELPERS -------------------------------
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
local g = vim.g
local api = vim.api

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function nvim_set_au(au_type, where, dispatch)
  vim.cmd(string.format("au! %s %s %s", au_type, where, dispatch))
end

-------------------- PLUGINS -------------------------------

require('plugins')

-------------------- OPTIONS -------------------------------
local indent = 2
opt('b', 'tabstop', indent)
opt('b', 'softtabstop', indent)
opt('b', 'shiftwidth', indent)
opt('b', 'expandtab', true)
opt('b', 'smartindent', true)
opt('b', 'autoindent', true)
opt('b', 'copyindent', true)
opt('o', 'showtabline', 2)

opt('o', 'hidden', true)
opt('w', 'number', true)
opt('w', 'relativenumber', true)
opt('o', 'showcmd', true)
opt('o', 'mouse', 'a')
opt('w', 'scroll', 10)
opt('o', 'lazyredraw', true)
opt('o', 'visualbell', true)
-- opt('o', 'pumheight', 10)
opt('b', 'fileencoding', 'utf-8')
opt('o', 'cmdheight', 2)
opt('o', 'splitbelow', true)
opt('o', 'splitright', true)
opt('o', 'laststatus', 0)
opt('o', 'timeoutlen', 500)
-- opt('w', 'cursorcolumn', true)
-- opt('w', 'colorcolumn', '80')

opt('o', 'ignorecase', true)
opt('o', 'smartcase', true)
opt('o', 'updatetime', 100)

-- opt('b', 'iskeyword', '-')
-- opt('o', 'nowritebackup', true)
-- opt('o', 'nobackup', true)
-- vim.o.shortmess = vim.o.shortmess .. 'c'
-- vim.o.clipboard = vim.o.clipboard .. 'unnamedplus'
-- opt('o', 'clipboard', 'unnamedplus')

opt('w', 'signcolumn', 'yes')

opt('o', 'termguicolors', true)
opt('b', 'syntax', 'on')

api.nvim_exec([[
  set nowritebackup
  set nobackup
  set clipboard+=unnamedplus
  set shortmess+=c
  set iskeyword+=-
  set noerrorbells
  ]], '')

-------------------- MAPPINGS ------------------------------
g.mapleader = ' '

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
map('n', '<C-m>', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

map('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
map('n', '<leader>q', ':bd<CR>', { noremap = true, silent = true })
map('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
map('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })
map('n', '<leader>n', ':nohlsearch<CR>', { noremap = true, silent = true })
map('n', '<C-c>', '<Esc>', { noremap = true, silent = true })

map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-h>', '<C-w>h')

map('i', '<C-j>', '<C-w>j')
map('i', '<C-k>', '<C-w>k')
map('i', '<C-l>', '<C-w>l')
map('i', '<C-h>', '<C-w>h')

map('i', '<C-j>', '<C-n>', { noremap = true, expr = true })
map('i', '<C-k>', '<C-p>', { noremap = true, expr = true })

map('v', '<', '<gv', { noremap = true })
map('v', '>', '>gv', { noremap = true })

map('x', 'K', ':move \'<-2<CR>gv-gv', { noremap = true })
map('x', 'J', ':move \'>+1<CR>gv-gv', { noremap = true })

-- Fzf
map('n', '<leader>p', ':Files<CR>', { noremap = true, silent = true })
map('n', '<leader>b', ':Buffers<CR>', { noremap = true, silent = true })
map('n', '<leader>g', ':GFiles?<CR>', { noremap = true, silent = true })

-- Easy motion
map('n', '<leader>f', '<Plug>(easymotion-bd-f)')
map('n', '<leader>f', '<Plug>(easymotion-overwin-f)', { noremap = true })
map('n', 's', '<Plug>(easymotion-overwin-f2)', { noremap = true })

-- Ranger
map('n', '<leader>r', ':Ranger<CR>')
