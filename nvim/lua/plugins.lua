-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

-- vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

return require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim', opt = true }

  -- Must to have
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    -- run = ':TSUpdate',
    config = function ()
      require('vux.treesitter').setup()
    end
  }
  use 'nvim-treesitter/playground'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('vux.telescope').setup()
    end
  }

  -- LSP config
  use 'neovim/nvim-lspconfig'
  use {
    'kabouzeid/nvim-lspinstall',
    event = "VimEnter",
    config = function()
      require'lspinstall'.setup()
    end,
  }

  use {
    'simrat39/symbols-outline.nvim',
    config = function()
      require('vux.symbol-outline').setup()
    end
  }

  -- Lsp signature
  use 'ray-x/lsp_signature.nvim'

  -- Autocompletion
  --[[ use {
    'hrsh7th/nvim-compe',
    event = 'InsertEnter',
    config = function()
      require('vux.compe').setup()
    end
  } ]]

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('vux.nvim-cmp').setup()
    end
  }
  -- use { 'hrsh7th/cmp-vsnip', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }
  use { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' }

  -- Snippets
  --[[ use {
    'hrsh7th/vim-vsnip',
    event = 'InsertCharPre',
  } ]]
  use {
    'L3MON4D3/LuaSnip',
    -- wants = "friendly-snippets",
    -- after = "nvim-cmp",
    config = function()
      require("vux.luasnip")
    end,
  }
  use { 'rafamadriz/friendly-snippets' }

  -- Make themes
  use 'rktjmp/lush.nvim'

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
    config = function()
      require('vux.transparent').setup()
    end,
    -- event = { 'VimEnter', 'ColorScheme' },
    -- cmd = { 'TransparentEnable', 'TransparentDisable', 'TransparentToggle' },
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
    config = function()
      require('vux.colorize').setup()
    end
  }

  -- Explore
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('vux.nvimtree').setup()
    end,
  }

  -- Status line
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function() require('vux.galaxyline') end,
    event = "BufWinEnter",
  }
  -- use {
  --   'hoob3rt/lualine.nvim',
  --   config = [[require('vux.lualine')]],
  --   requires = {'kyazdani42/nvim-web-devicons', opt = true}
  -- }

  -- Dashboard
  use {
    'glepnir/dashboard-nvim',
    event = 'BufWinEnter',
    config = function()
      require('vux.dashboard').setup()
    end,
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
    config = function()
      require('vux.gitsigns').setup()
    end,
  }
  use 'sindrets/diffview.nvim'
  -- use 'kdheepak/lazygit.nvim'

  -- Documention generator
  use {
    'kkoomen/vim-doge',
    -- run = ':call doge#install()'
  }

  -- Comment
  use {
    'b3nj5m1n/kommentary',
    event = "BufWinEnter",
    config = function()
      require('vux.kommentary')
    end,
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
    -- event = "BufRead",
    config = function()
      require('vux.indent-blankline').setup()
    end,
  }

  -- Strip whitespace
  use {
    'ntpeters/vim-better-whitespace',
    event = 'BufWinEnter',
    config = function()
      require('vux.whitespace').setup()
    end,
  }

  -- Search string
  use {
    'dyng/ctrlsf.vim',
    event = 'BufWinEnter',
    config = function()
      require('vux.ctrlsf').setup()
    end,
  }

  -- Terminal
  use {
    'akinsho/nvim-toggleterm.lua',
    -- event = "BufWinEnter",
    config = function()
      require('vux.nvim-toggleterm').setup()
    end,
  }

  -- Autopairs
  use {
    'windwp/nvim-autopairs',
    -- event = "InsertEnter",
    -- after = "nvim-compe",
    config = function()
      require('nvim-autopairs').setup({
        map_cr = true, --  map <CR> on insert mode
        map_complete = true, -- it will auto insert `(` after select function or method item
        auto_select = true -- automatically select the first item
      })
    end,
  }

  -- Smooth scroll
  -- use 'karb94/neoscroll.nvim'

  -- Which keys
  use {
    "folke/which-key.nvim",
    config = function()
      require('vux.whichkey').setup()
    end,
    event = "BufWinEnter",
  }

  -- Zen mode
  -- use 'Pocco81/TrueZen.nvim'
  use {
    "folke/zen-mode.nvim",
    config = function()
      require('vux.zenmode').setup()
    end,
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

  -- Note taking
  use {
    'kristijanhusak/orgmode.nvim',
    config = function()
      require('orgmode').setup({
        org_agenda_files = {'~/Work/org/*'},
        org_default_notes_file = '~/Work/org/notes.org',
      })
    end
  }

  -- Close buffers
  use {
    'kazhala/close-buffers.nvim'
  }
end)
