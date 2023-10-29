return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        style = "storm",
        transparent = true,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          sidebars = "transparent",
          floats = "transparent",
        },
      })
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      -- require("everforest").load()
    end,
  },
  {
    "askfiy/visual_studio_code",
    enabled  = false,
    priority = 1000,
    config = function()
      -- require("visual_studio_code").setup({
      --   mode = "dark",
      -- })
    end,
  },
  {
    "mcchrish/zenbones.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    dependencies = {
      "rktjmp/lush.nvim"
    },
    config = function()
      -- vim.opt.background = "dark"
      -- vim.cmd([[colorscheme zenbones]])
    end,
  },
  {
    "roobert/palette",
    lazy = false,
    priority = 1001,
    enabled = false,
    config = function()
      vim.cmd([[colorscheme palette]])
    end
  }
}
