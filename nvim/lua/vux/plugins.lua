-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

-- vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim', opt = true }
  
  -- Must to have
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/playground'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    config = [[require('vux.telescope')]],
    event = 'BufWinEnter',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- LSP config
  use 'neovim/nvim-lspconfig'

  -- Autocompletion
  use {
    'hrsh7th/nvim-compe',
    event = 'InsertEnter',
    config = [[require('vux.compe')]]
  }
  use { "hrsh7th/vim-vsnip", event = 'InsertEnter' }

  -- Snippets
  use { 'rafamadriz/friendly-snippets', event = "InsertEnter" }
  use 'ray-x/lsp_signature.nvim'

  -- Themes
  use { 'leewanvu/nord-vim', branch = 'vux' }
  use 'sainnhe/everforest'
  -- use 'rktjmp/lush.nvim'
  -- use 'kunzaatko/nord.nvim'
  -- use {
  --   'projekt0n/github-nvim-theme',
  --   config = function()
  --     require('github-theme').setup({
  --       themeStyle = 'dark',
  --       commentStyle = 'italic',
  --       keywordStyle = 'NONE',
  --       functionStyle = 'NONE',
  --       variableStyle = 'NONE',
  --       hideInactiveStatusline = false,
  --       sidebars = {},
  --       darkSidebar = true,
  --       darkFloat = true,
  --       colors = {}
  --     })
  --   end
  -- }

  -- Transparent
  use {
    'xiyaowong/nvim-transparent',
    event = { 'VimEnter', 'ColorScheme' },
    -- cmd = { 'TransparentEnable', 'TransparentDisable', 'TransparentToggle' },
    config = [[require('vux.transparent')]]
  }

  -- Syntax
  use 'jwalton512/vim-blade'
  -- use 'posva/vim-vue'

  -- Icons
  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require'nvim-web-devicons'.setup{}
    end
  }

  -- Colors
  use {
    'norcalli/nvim-colorizer.lua',
    config = [[require('vux.colorize')]],
  }

  -- Explore
  use {
    'kyazdani42/nvim-tree.lua',
    -- cmd = { "NvimTreeToggle", "NvimTreeClose", "NvimTreeFindFile" },
    config = [[require('vux.nvimtree')]],
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- Status line
  -- use {
  --   'glepnir/galaxyline.nvim',
  --   branch = 'main',
  --   config = [[require('vux.statusline')]],
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }
  use {
    'hoob3rt/lualine.nvim',
    config = [[require('vux.lualine')]],
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Project manager
  use {
    'glepnir/dashboard-nvim',
    event = 'BufWinEnter',
    config = [[require('vux.dashboard')]]
  }

  -- Git
  use 'tpope/vim-fugitive'
  -- use 'airblade/vim-gitgutter'
  -- use {
  --   'f-person/git-blame.nvim',
  --   config = function()
  --     vim.g.gitblame_enabled = 0
  --     vim.g.gitblame_message_template = ' <author> • <date> • <summary>'
  --     vim.g.gitblame_date_format = '%c'
  --   end
  -- }
  use {
    'lewis6991/gitsigns.nvim',
    event = "BufRead",
    config = [[require('vux.gitsigns')]]
  }
  use 'sindrets/diffview.nvim'
  use 'kdheepak/lazygit.nvim'

  -- Documention generator
  use {
    'kkoomen/vim-doge',
    run = ':call doge#install()'
  }

  -- Comment
  use {
    'b3nj5m1n/kommentary',
    event = "BufWinEnter",
    config = [[require('vux.kommentary')]]
  }

  -- Motion
  -- use {
  --   'phaazon/hop.nvim',
  --   as = 'hop',
  --   config = [[require('vux.hop')]]
  -- }
  use {
    'ggandor/lightspeed.nvim',
    config = function()
    end
  }

  -- Surroundings: parentheses, brackets, quotes, XML tags, and more
  use 'tpope/vim-surround'

  -- Indent line
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = [[require('vux.indent-blankline')]]
  }

  -- Strip whitespace
  use {
    'ntpeters/vim-better-whitespace',
    event = 'BufWinEnter',
    config = [[require('vux.whitespace')]]
  }

  -- Search string
  use {
    'dyng/ctrlsf.vim',
    event = 'BufWinEnter',
    config = [[require('vux.ctrlsf')]]
  }

  -- Terminal
  use {
    'akinsho/nvim-toggleterm.lua',
    -- event = "BufWinEnter",
    config = [[require('vux.nvim-toggleterm')]]
  }

  -- Autopairs
  use {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    after = { "telescope.nvim" },
    config = [[require('vux.nvim-autopairs')]]
  }

  -- Smooth scroll
  -- use 'karb94/neoscroll.nvim'

  -- Which keys
  use {
    "folke/which-key.nvim",
    config = function()
      require('vux.whichkey')
    end,
    event = "BufWinEnter",
  }

  -- Zen mode
  -- use 'Pocco81/TrueZen.nvim'
  use {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    event = "BufRead",
    config = [[require('vux.zenmode')]]
  }

  use {
    'nacro90/numb.nvim',
    event = "BufRead",
    config = function()
      require('numb').setup{
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end
  }
end)
