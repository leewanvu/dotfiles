-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim', opt = true }

  -- Themes
  use {
    'arcticicestudio/nord-vim',
    config = function() require('vux.nord').setup() end
  }

  -- Status line & tab
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- Explore
  use 'kyazdani42/nvim-tree.lua'

  -- Project manager
  use 'mhinz/vim-startify'

  -- Comment
  use 'tpope/vim-commentary'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Find Picker
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
  }

  -- LSP config
  use 'neovim/nvim-lspconfig'

  -- Snippets
  -- use 'norcalli/snippets.nvim'

  -- Autocompletion
  -- use 'nvim-lua/completion-nvim'
  -- use 'steelsojka/completion-buffers'
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- Git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use {
    'f-person/git-blame.nvim',
    config = function()
      vim.g.gitblame_enabled = 0
      vim.g.gitblame_message_template = ' <author> • <date> • <summary>'
      vim.g.gitblame_date_format = '%c'
    end
  }

  -- Documention generator
  use {
    'kkoomen/vim-doge',
    run = ':call doge#install()'
  }

  -- Motion
  use 'easymotion/vim-easymotion'

  -- Surroundings: parentheses, brackets, quotes, XML tags, and more
  use 'tpope/vim-surround'

  -- Auto close brackets
  -- use 'jiangmiao/auto-pairs'

  -- Indent line
  use 'yggdroot/indentline'

  -- Strip whitespace
  use 'ntpeters/vim-better-whitespace'

  -- Search string
  use 'dyng/ctrlsf.vim'

  -- Float termial
  use 'voldikss/vim-floaterm'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Tabline
  use 'romgrk/barbar.nvim'

  -- Status line
  -- use {
  --   'glepnir/galaxyline.nvim',
  --   branch = 'main'
  -- }
end)
