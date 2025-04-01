return {
  "gbprod/phpactor.nvim",
  enabled = false,
  -- build = require("phpactor.handler.update"), -- To install/update phpactor when installing this plugin
  build = function()
    require("phpactor.handler.update")
  end,
  dependencies = {
    "nvim-lua/plenary.nvim", -- required to update phpactor
    "neovim/nvim-lspconfig" -- required to automaticly register lsp serveur
  },
  config = function()
    require("phpactor").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    })
  end
}
