-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  use {
    'arcticicestudio/nord-vim',
    config = function() require'nord-config'.setup() end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require'tree-config'.setup() end
  }

  use {
    'francoiscabrol/ranger.vim',
    config = function()
      vim.g.ranger_map_keys = 0
    end
  }
  use 'rbgrouleff/bclose.vim'

  use {
    'vim-airline/vim-airline',
    config = function() require'airline-config'.setup() end
  }
  use 'vim-airline/vim-airline-themes'

  use {
    'mhinz/vim-startify',
    config = function() require'starrtify-config'.setup() end
  }

  use 'junegunn/fzf'
  use {
    'junegunn/fzf.vim',
    config = function() require'fzf-config'.setup() end
  }

  use 'airblade/vim-rooter'

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
    config = function() require'nerdcommenter-config'.setup() end
  }

  -- Git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use {
    'APZelos/blamer.nvim',
    config = function() require'blamer-config'.setup() end
  }

  -- Terminal
  use {
    'voldikss/vim-floaterm',
    config = function() require'floatterm-config'.setup() end
  }
end)

