local opt = vim.opt

-- Tabs
opt.autoindent     = true
opt.cindent        = true
opt.wrap           = true

opt.tabstop        = 2
opt.shiftwidth     = 2
opt.softtabstop    = 2
opt.expandtab      = true
opt.smartindent    = true
opt.copyindent     = true
opt.showtabline    = 2

opt.hidden = true
opt.number = true
opt.relativenumber = true
opt.mouse = 'n' -- 'a'
opt.scroll = 10
opt.lazyredraw = true
opt.visualbell = true
opt.fileencoding = 'utf-8'
opt.showmode = false
opt.showcmd = true
opt.cmdheight = 1
-- opt.pumheight = 10
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 500
-- opt.colorcolumn = 80
-- opt.cursorcolumn = true
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 100
opt.iskeyword = opt.iskeyword + '$'
-- opt.backup = 'on'
opt.signcolumn = 'yes'
opt.termguicolors = true
opt.syntax = 'on'
-- opt.shortmess = opt.shortmess + 'c'
-- opt.clipboard = opt.clipboard + 'unnamedplus'

-- opt('o', 'termguicolors', true)
-- opt('b', 'syntax', 'on')
-- opt('o', 'listchars', "eol:↲,tab:»\\ ")
-- opt('o', 'list', true)

-- set clipboard+=unnamedplus
-- set shortmess+=c
-- set iskeyword+=$
vim.api.nvim_exec([[
  set noswapfile
  set nowritebackup
  set nobackup
  set noerrorbells
  set nowrap
  set completeopt=menuone,noinsert,noselect
  set wildmenu
  set noshowmode
  set encoding=utf-8
  set history=1000
  set undolevels=1000
  ]], '')

-- set foldmethod=expr
-- set foldexpr=nvim_treesitter#foldexpr()
