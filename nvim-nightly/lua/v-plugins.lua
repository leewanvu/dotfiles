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
  use 'airblade/vim-rooter'
  use 'dyng/ctrlsf.vim'

  -- Utils
  use {
    'easymotion/vim-easymotion',
    config = function()
      vim.g.EasyMotion_do_mapping = 0
      vim.g.EasyMotion_smartcase = 1
    end
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

  -- LSP
  use {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function() require'v-plugs/coc'.setup() end,
  }
end)
