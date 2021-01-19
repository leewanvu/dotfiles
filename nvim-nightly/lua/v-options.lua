local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
local api = vim.api

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

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
opt('o', 'cmdheight', 1)
opt('o', 'splitbelow', true)
opt('o', 'splitright', true)
opt('o', 'laststatus', 2)
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
  set noswapfile
  set nowritebackup
  set nobackup
  set clipboard+=unnamedplus
  set shortmess+=c
  set iskeyword+=-
  set noerrorbells
  set nowrap
  set completeopt=menuone,noinsert,noselect
  set wildmenu
  set noshowmode
  set encoding=utf-8
  set history=1000
  set undolevels=1000
  ]], '')
