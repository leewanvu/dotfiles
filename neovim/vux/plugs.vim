call plug#begin('~/.vim/plugged')

" Manage projects
Plug 'mhinz/vim-startify'

" Explore
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'majutsushi/tagbar'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'

" Fuzzy Find
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'airblade/vim-rooter'

" Terminal
Plug 'voldikss/vim-floaterm'

" Utils
Plug 'easymotion/vim-easymotion'
" Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
" Plug 'ntpeters/vim-better-whitespace'
Plug 'preservim/nerdcommenter'
Plug 'yggdroot/indentline'

" LSP & autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax
" Plug 'StanAngeloff/php.vim'
" Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'

" Colorschemes
" Plug 'leewanvu/onedark.vim'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
" Plug 'tomasiser/vim-code-dark'
" Plug 'cocopon/iceberg.vim'
" Plug 'arzg/vim-colors-xcode'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Nightly Version
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
" Plug 'christianchiarulli/nvcode-color-schemes.vim'

call plug#end()
