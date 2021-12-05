local opt = vim.opt

opt.tabstop        = 2
opt.shiftwidth     = 2
opt.softtabstop    = 2
opt.expandtab      = true
opt.smartindent    = true
opt.copyindent     = true
opt.showtabline    = 0
opt.autoindent     = true
opt.cindent        = true
opt.wrap           = true
opt.hidden = true
opt.number = true
opt.relativenumber = true
opt.mouse = 'a'
opt.scroll = 10
opt.lazyredraw = true
opt.visualbell = true
opt.fileencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.showmode = false
opt.showcmd = true
opt.cmdheight = 1
opt.pumheight = 10
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 500
opt.cursorline = true
-- opt.colorcolumn = 80
-- opt.cursorcolumn = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 100
opt.iskeyword = opt.iskeyword + '$'
opt.backup = false
opt.signcolumn = 'yes'
opt.termguicolors = true
opt.syntax = 'on'
-- opt.listchars = "eol:↲,tab:»\\ "
--[[ opt.listchars = {
  eol = "↴"
} ]]
-- opt.list = true
opt.clipboard = 'unnamedplus'
opt.history = 1000
-- opt.completeopt = 'menuone,noinsert,noselect'
opt.completeopt = 'menuone,noselect'
opt.undolevels = 1000
opt.wildmenu = true
opt.wrap = false
opt.errorbells = false
opt.writebackup = false
opt.swapfile = false
opt.spell = false
opt.spelllang = 'en'
-- opt.shortmess = opt.shortmess + 'c'
vim.o.shortmess = vim.o.shortmess .. 'c'

-- set foldmethod=expr
-- set foldexpr=nvim_treesitter#foldexpr()
opt.guifont=[[JetBrainsMono Nerd Font:h15]]
-- opt.guifont=[[Hack Nerd Font:h15]]
-- opt.guifont=[[DroidSansMono Nerd Font:h15]]
