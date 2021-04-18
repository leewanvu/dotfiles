-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim', opt = true }

  -- Themes
  use {
    -- 'arcticicestudio/nord-vim',
    'leewanvu/nord-vim',
    branch = 'develop',
    config = function() require('vux.nord').setup() end
  }

  -- Status line & tab
  -- use 'vim-airline/vim-airline'
  -- use 'vim-airline/vim-airline-themes'

  -- Explore
  use 'kyazdani42/nvim-tree.lua'

  -- Project manager
  -- use 'mhinz/vim-startify'
  use 'glepnir/dashboard-nvim'

  -- Comment
  -- use 'tpope/vim-commentary'
  use 'b3nj5m1n/kommentary'

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
  -- vscode-like pictograms
  use 'onsails/lspkind-nvim'

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
  -- use 'easymotion/vim-easymotion'
  use { 'phaazon/hop.nvim', as = 'hop' }

  -- Surroundings: parentheses, brackets, quotes, XML tags, and more
  use 'tpope/vim-surround'

  -- Auto close brackets
  -- use 'jiangmiao/auto-pairs'

  -- Indent line
  -- use 'yggdroot/indentline'
  use { 'lukas-reineke/indent-blankline.nvim', branch = 'lua' }

  -- Strip whitespace
  use 'ntpeters/vim-better-whitespace'

  -- Search string
  use 'dyng/ctrlsf.vim'

  -- Float termial
  -- use 'voldikss/vim-floaterm'
  use 'numtostr/FTerm.nvim'
  -- use 'oberblastmeister/termwrapper.nvim'
  -- use 'akinsho/nvim-toggleterm.lua'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Tabline
  -- use 'romgrk/barbar.nvim'
  -- use 'akinsho/nvim-bufferline.lua'

  -- Status line
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main'
  }
  -- use 'hoob3rt/lualine.nvim'

  -- Autopairs
  use 'windwp/nvim-autopairs'

  -- Auto tags
  -- use 'windwp/nvim-ts-autotag'

  -- Colors
  use 'norcalli/nvim-colorizer.lua'
  -- use 'tjdevries/colorbuddy.vim'
  -- use 'maaslalani/nordbuddy'
end)
