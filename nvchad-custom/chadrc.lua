---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "everforest",
  theme_toggle = { "everforest", "tokyodark" },
  statusline = {
    theme = "vscode",
    separator_style = "block",
    -- overriden_modules = function()
    --   local st_modules = require "nvchad_ui.statusline.vscode_colored"
    --
    --   return {
    --     mode = function()
    --       return st_modules.mode() .. " bruh "
    --       -- or just return "" to hide this module
    --     end,
    --   }
    -- end,
  },
  nvdash = {
    load_on_startup = true,
--     header = {
-- ",_,_,_,_,_,_,_,_,_,_|________________________________________________________",
-- "| | | | | | | | | | |_______________________________________________________/",
-- "'-'-'-'-'-'-'-'-'-'-|-------------------------------------------------------",
--     },
    buttons = {
      { "󰈞  Find File", "Spc f f", require("custom.utils").find_files() },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      -- { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      -- { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "󰒲  Lazy", "Spc l", "Lazy" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
      { "󰗼  Quit", "q", "qa" },
    }
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
