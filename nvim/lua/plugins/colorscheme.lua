-- local THEME_DEFAULT = "github_dark"
-- local THEME_LIGHT = "github_light"
-- local THEME_DARK = "github_dark_dimmed"

local THEME_DEFAULT = "catppuccin-nvim"
local THEME_LIGHT = "github_light"
local THEME_DARK = "catppuccin-mocha"

-- local THEME_DEFAULT = "tokyonight"
-- local THEME_LIGHT = "tokyonight"
-- local THEME_DARK = "tokyonight-storm"

--- Check if it is morning
--- @return boolean
local function is_morning()
  local hour = tonumber(os.date("%H"))
  return hour >= 6 and hour < 12
end

--- Set colorscheme by time
--- @return string
local function set_colorscheme_by_time()
  if is_morning() then
    return THEME_LIGHT
  else
    return THEME_DARK
  end
end

return {
  --- Lazy load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = set_colorscheme_by_time(),
    },
  },
  {
    "tokyonight.nvim",
    -- priority = 1000,
    lazy = true,
    opts = function()
      return {
        style = "day",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
        sidebars = {
          "qf",
          "vista_kind",
          "terminal",
          "spectre_panel",
          "startuptime",
          "Outline",
        },
        day_brightness = 0,
        hide_inactive_statusline = false,
        dim_inactive = true,
        lualine_bold = false,
        -- on_colors = function(c)
        --   local hsluv = require("tokyonight.hsluv")
        --   local function randomColor(color)
        --     if color ~= "NONE" then
        --       local hsl = hsluv.hex_to_hsluv(color)
        --       hsl[1] = math.random(0, 360)
        --       return hsluv.hsluv_to_hex(hsl)
        --     end
        --     return color
        --   end
        --   local function set(colors)
        --     if type(colors) == "table" then
        --       for k, v in pairs(colors) do
        --         if type(v) == "string" then
        --           colors[k] = randomColor(v)
        --         elseif type(v) == "table" then
        --           set(v)
        --         end
        --       end
        --     end
        --   end
        --   set(c)
        -- end,
        on_highlights = function(hl, c)
          hl.CursorLineNr = { fg = c.orange, bold = true }
          -- hl.LineNr = { fg = c.orange, bold = true }
          -- hl.LineNrAbove = { fg = c.fg_gutter }
          -- hl.LineNrBelow = { fg = c.fg_gutter }
        end,
      }
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    config = function()
      require("rose-pine").setup({
        variant = "auto",
        dark_variant = "moon",
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlight = true,
          migration = true,
        },

        styles = {
          bold = true,
          italic = false,
          transparent = false,
        },

        highlight_groups = {
          -- borderless telescope
          TelescopeBorder = { fg = "overlay", bg = "overlay" },
          TelescopeNormal = { fg = "subtle", bg = "overlay" },
          TelescopeSelection = { fg = "text", bg = "highlight_med" },
          TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
          TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

          TelescopeTitle = { fg = "base", bg = "love" },
          TelescopePromptTitle = { fg = "base", bg = "pine" },
          TelescopePreviewTitle = { fg = "base", bg = "iris" },

          TelescopePromptNormal = { fg = "text", bg = "surface" },
          TelescopePromptBorder = { fg = "surface", bg = "surface" },

          -- lovely statusline
          StatusLine = { fg = "pine", bg = "pine", blend = 10 },
          -- StatusLine = { fg = "love", bg = "love", blend = 10 },
          StatusLineNC = { fg = "subtle", bg = "surface" },

          -- b0o/incline.nvim
          InclineNormal = { fg = "surface", bg = "pine" },
          InclineNormalNC = { fg = "text", bg = "surface" },
        },
      })

      -- vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = true,
    priority = 1000,
    config = function()
      require("github-theme").setup({
        options = {
          transparent = true,
        },
      })
    end,
  },
  --- auto dark mode
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 3000,
      set_dark_mode = function()
        print("[auto-dark-mode] dark mode: " .. THEME_DARK)
        vim.cmd("colorscheme " .. THEME_DARK)
      end,
      set_light_mode = function()
        print("[auto-dark-mode] light mode: " .. THEME_LIGHT)
        vim.cmd("colorscheme " .. THEME_LIGHT)
      end,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = false,
      float = {
        transparent = true,
        solid = false, -- use solid styling for floating windows, see |winborder|
      },
      no_italic = true, -- Force no italic
    },
  },
}
