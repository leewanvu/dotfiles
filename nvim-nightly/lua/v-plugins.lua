-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Themes
  use 'arcticicestudio/nord-vim'

  -- Status line
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- Project manager
  use 'mhinz/vim-startify'

  -- Explore
  use 'kyazdani42/nvim-tree.lua'

  use 'francoiscabrol/ranger.vim'
  use 'rbgrouleff/bclose.vim'

  -- Fuzzy finder
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'airblade/vim-rooter'
  use 'dyng/ctrlsf.vim'

  -- Utils
  use 'easymotion/vim-easymotion'
  use 'tpope/vim-surround'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-commentary'
  -- use 'nathanaelkane/vim-indent-guides'
  use 'yggdroot/indentline'
  use 'ntpeters/vim-better-whitespace'
  -- use 'tpope/vim-sleuth'

  -- Documention generator
  use { 'kkoomen/vim-doge', run = ':call doge#install()' }

  -- Git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use 'f-person/git-blame.nvim'

  -- Terminal
  use 'voldikss/vim-floaterm'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- LSP
  -- use { 'neoclide/coc.nvim', branch = 'release' }

  -- use 'neovim/nvim-lspconfig'
  -- use 'RishabhRD/popfix'
  -- use 'RishabhRD/nvim-lsputils'
  -- use 'glepnir/lspsaga.nvim'

  -- Completion
  -- use 'nvim-lua/completion-nvim'
  -- use 'steelsojka/completion-buffers'
  -- use 'nvim-treesitter/completion-treesitter'
  -- use 'hrsh7th/nvim-compe'

  -- Snippets
  -- use 'hrsh7th/vim-vsnip'
  -- use 'hrsh7th/vim-vsnip-integ'
  -- use 'norcalli/snippets.nvim'

  -- use {
  --   'nvim-telescope/telescope.nvim',
  --   requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  -- }
end)
