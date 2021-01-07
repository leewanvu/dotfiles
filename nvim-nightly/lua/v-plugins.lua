-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Themes
  use {
    'arcticicestudio/nord-vim',
    config = function() require'v-plugs/nord'.setup() end
  }

  -- Status line
  use {
    'vim-airline/vim-airline',
    config = function() require'v-plugs/airline'.setup() end
  }
  use 'vim-airline/vim-airline-themes'

  -- Project manager
  use {
    'mhinz/vim-startify',
    config = function() require'v-plugs/starrtify'.setup() end
  }

  -- Explore
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require'v-plugs/tree'.setup() end
  }

  use {
    'francoiscabrol/ranger.vim',
    config = function()
      vim.g.ranger_map_keys = 0
    end
  }
  use 'rbgrouleff/bclose.vim'

  -- Fuzzy finder
  use 'junegunn/fzf'
  use {
    'junegunn/fzf.vim',
    config = function() require'v-plugs/fzf'.setup() end
  }
  use {
    'airblade/vim-rooter',
    config = function()
      vim.g.rooter_pattern = {
        '.git',
        '.env',
        'Makefile',
      }
    end
  }
  use 'dyng/ctrlsf.vim'

  -- Utils
  use {
    'easymotion/vim-easymotion',
    config = function() require'v-plugs/easymotion'.setup() end
  }
  use 'tpope/vim-surround'
  use 'jiangmiao/auto-pairs'
  use {
    'preservim/nerdcommenter',
    config = function() require'v-plugs/nerdcommenter'.setup() end
  }

  -- Documention generator
  use {
    'kkoomen/vim-doge',
    run = ':call doge#install()'
  }

  -- Git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use {
    'APZelos/blamer.nvim',
    config = function() require'v-plugs/blamer'.setup() end
  }

  -- Terminal
  use {
    'voldikss/vim-floaterm',
    config = function() require'v-plugs/floatterm'.setup() end
  }
  -- use {
  --   'akinsho/nvim-toggleterm.lua',
  --   config = function() require'v-plugs/toggleterm'.setup() end
  -- }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require'v-plugs/ts'.setup() end,
  }

  -- LSP
  -- use {
  --   'neoclide/coc.nvim',
  --   branch = 'release',
  --   config = function() require'v-plugs/coc'.setup() end
  -- }
  use {
    'neovim/nvim-lspconfig',
    config = function() require'v-plugs/lsp'.setup() end
  }

  -- Completion
  use {
    'nvim-lua/completion-nvim',
    config = function() require'v-plugs/completion'.setup() end
  }
end)
