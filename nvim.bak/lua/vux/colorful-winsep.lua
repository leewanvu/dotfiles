-- local status, colorful_winsep = pcall(require, "colorful-winsep")
-- if not status then
--   return
-- end
local M = {}

M.setup = function()
  require("colorful-winsep").setup({
    -- Window divider color definition
    highlight = {
      guibg = "None",
      guifg = "#29a4bd",
    },
    -- timer refresh rate
    interval = 30,
    -- filetype in the list, will not be executed
    no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
    -- Split line symbol definition
    symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
    close_event = function()
      -- Executed after closing the window divider
    end,
    create_event = function()
      -- Executed after creating the window divider
    end,
  })
end

return M
