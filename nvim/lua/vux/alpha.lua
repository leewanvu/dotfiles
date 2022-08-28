local M = {}

M.setup = function()
  local alpha = require("alpha")
  local dashboard = require("alpha.themes.dashboard")

  math.randomseed(os.time())

  local function pick_color()
    local colors = {"String", "Identifier", "Keyword", "Number"}
    return colors[math.random(#colors)]
  end

  local function footer()
    local total_plugins = #vim.tbl_keys(packer_plugins)
    local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
    local version = vim.version()
    local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

    return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
  end

  local logo = {
    "",
    "",
    "",
    "",
    "",
    "",
    "        ▄▄▄▄▄███████████████████▄▄▄▄▄     ",
    "      ▄██████████▀▀▀▀▀▀▀▀▀▀██████▀████▄   ",
    "     █▀████████▄             ▀▀████ ▀██▄  ",
    "    █▄▄██████████████████▄▄▄         ▄██▀ ",
    "     ▀█████████████████████████▄    ▄██▀  ",
    "       ▀████▀▀▀▀▀▀▀▀▀▀▀▀█████████▄▄██▀    ",
    "         ▀███▄              ▀██████▀      ",
    "           ▀██████▄        ▄████▀         ",
    "              ▀█████▄▄▄▄▄▄▄███▀           ",
    "                ▀████▀▀▀████▀             ",
    "                  ▀███▄███▀               ",
    "                     ▀█▀                  ",
    "",
    "",
  }

  -- set header
  dashboard.section.header.val = logo
  dashboard.section.header.opts.hl = pick_color()

  -- set menu
  dashboard.section.buttons.val = {
    dashboard.button( "r", "  Recently used files"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "f", "  Find file", ":lua require('vux.telescope').find_files()<CR>"),
    dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
    -- dashboard.button( "t", "  Find text", ":Telescope live_grep <CR>"),
    -- dashboard.button( "s", "  Settings" , ":e $HOME/.config/nvim/init.lua | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "q", "  Quit", ":qa<CR>"),
  }

  -- Set footer
  dashboard.section.footer.val = footer()
  dashboard.section.footer.opts.hl = "Constant"

  alpha.setup(dashboard.opts)

  vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
end

return M
