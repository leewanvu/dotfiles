filetype plugin on
filetype plugin indent on

" Spaces & Tabs {{{
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
set smarttab        " Makes tabbing smarter will realize you have 2 vs 4
set smartindent     " Makes indenting smart
set showtabline=2   " Always show tabs
" }}} Spaces & Tabs

" Clipboard {{{
set clipboard+=unnamedplus   " Copy paste between vim and everything else
" }}} Clipboard

" UI Config {{{
set hidden                   " Required to keep multiple buffers open multiple buffers
set number                   " show line number
set relativenumber
"set list
set showcmd                  " show command in bottom bar
"set cursorline               " highlight current line
set wildmenu                 " visual autocomplete for command menu
"set showmatch                " highlight matching brace
set laststatus=2             " window will always have a status line
set noswapfile
set nowrap                   " Display long lines as just one line
set noshowmode
set encoding=utf-8
set mouse=a                  " Enable your mouse
set scroll=10
set history=1000
set undolevels=1000
set lazyredraw
set visualbell
set noerrorbells
set pumheight=10             " Makes popup menu smaller
set fileencoding=utf-8       " The encoding written to file
set ruler                    " Show the cursor position all the time
set cmdheight=2              " More space for displaying messages
set iskeyword+=-             " treat dash separated words as a word text object
set splitbelow               " Horizontal splits will automatically be below
set splitright               " Vertical splits will automatically be to the right
set laststatus=0             " Always display the status line
" set cursorcolumn
" set colorcolumn=80
set timeoutlen=500           " By default timeoutlen is 1000 ms
" set autochdir                " Your working directory will always be the same as your working directory
" set synmaxcol=200
" }}} UI Config

" Search {{{
set incsearch       " search as characters are entered
set hlsearch        " highlight matche
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is lower case
" }}} Search

" COC recommend {{{
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
set nowritebackup
set nobackup
" }}}

" Syntax {{{
syntax on
set termguicolors
" }}}
