-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  use {
    'arcticicestudio/nord-vim',
    config = function() vim.cmd "colorscheme nord" end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require'tree-config'.setup() end
  }

  use {
    'vim-airline/vim-airline',
    config = function() require'airline-config'.setup() end
  }
  use 'vim-airline/vim-airline-themes'
end)

