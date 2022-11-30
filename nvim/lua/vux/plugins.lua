-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

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
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/playground'
  -- use {
  --   'nvim-treesitter/nvim-treesitter-context',
  --   config = function()
  --     require('vux.ts-context').setup()
  --   end
  -- }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('vux.telescope').setup()
    end
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- LSP config
  use {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  }
  use { "williamboman/mason-lspconfig.nvim" }
  use "neovim/nvim-lspconfig"

  -- use {
  --   'simrat39/symbols-outline.nvim',
  --   config = function()
  --     require('vux.symbol-outline').setup()
  --   end
  -- }

  -- Lsp signature
  use 'ray-x/lsp_signature.nvim'

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('vux.nvim-cmp').setup()
    end
  }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-nvim-lsp'}
  use { 'hrsh7th/cmp-path' }
  use { 'saadparwaiz1/cmp_luasnip' }

  use {
    'L3MON4D3/LuaSnip',
    config = function()
      require("vux.luasnip")
    end,
  }
  use { 'rafamadriz/friendly-snippets' }

  -- Autopairs
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('vux.autopairs').setup()
    end,
  }

  use {'kevinhwang91/nvim-bqf', ft = 'qf'}

  -- Themes
  use { "folke/tokyonight.nvim", branch = "main" }
  -- use { 'Mofiqul/vscode.nvim' }

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
  -- use {
  --   'norcalli/nvim-colorizer.lua',
  --   config = function()
  --     require('vux.colorize').setup()
  --   end
  -- }

  -- Explore
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('vux.nvimtree').setup()
    end,
  }

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require'vux.lualine'.setup()
    end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }

  use {
    'utilyre/barbecue.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'SmiteshP/nvim-navic',
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require('vux.barbecue').setup()
    end,
  }

  -- Dashboard
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require('vux.alpha').setup()
    end
  }

  -- Git
  use 'tpope/vim-fugitive'
  -- use 'airblade/vim-gitgutter'
  use {
    'lewis6991/gitsigns.nvim',
    -- event = "BufRead",
    config = function()
      require('vux.gitsign').setup()
    end,
  }
  -- use 'sindrets/diffview.nvim'

  -- Documention generator
  -- use {
  --   'kkoomen/vim-doge',
  --   run = ':call doge#install()'
  -- }
  -- use {
  --   "danymat/neogen",
  --   config = function()
  --     require('neogen').setup({
  --       enable = true,
  --       snippet_engine = "luasnip",
  --     })
  --   end,
  --   requires = "nvim-treesitter/nvim-treesitter",
  -- }

  -- Comment
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('vux.comment').setup()
    end
  }

  -- Motion
  use {
    'ggandor/lightspeed.nvim',
    config = function()
    end
  }

  -- Surroundings: parentheses, brackets, quotes, XML tags, and more
  use 'tpope/vim-surround'

  -- Indent line
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('vux.indent-blankline').setup()
    end,
  }

  -- Search string
  use {
    'dyng/ctrlsf.vim',
    config = function()
      require('vux.ctrlsf').setup()
    end,
  }

  -- Search and replace
  -- use {
  --   'windwp/nvim-spectre'
  -- }

  -- Terminal
  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require('vux.toggleterm').setup()
    end,
  }

  -- Smooth scroll
  -- use 'karb94/neoscroll.nvim'

  -- Which keys
  use {
    'folke/which-key.nvim',
    config = function()
      require('vux.whichkey').setup()
    end,
  }

  -- Zen mode
  use {
    'folke/zen-mode.nvim',
    config = function()
      require('vux.zenmode').setup()
    end,
  }

  use {
    'nacro90/numb.nvim',
    config = function()
      require('numb').setup{
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end
  }

  -- Close buffers
  use {
    'kazhala/close-buffers.nvim'
  }

  -- Switch projects
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require('vux.project').setup()
    end
  }

  use {
    'nvim-zh/colorful-winsep.nvim',
    config = function()
      require('vux.colorful-winsep').setup()
    end
  }
end)
