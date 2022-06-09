-- nord
vim.g.nord_italic_comments = 1
vim.g.nord_cursor_line_number_background = 1
vim.g.nord_bold = 1
vim.g.nord_italic = 1
vim.g.nord_italic_comments = 1
vim.g.nord_underline = 1

-- everforest
vim.g.everforest_background = 'hard'
vim.g.everforest_enable_italic = 0
vim.g.everforest_sign_column_background = 'none'
vim.g.everforest_diagnostic_text_highlight = 0
vim.g.everforest_diagnostic_virtual_text = 'grey'

-- tokyonight
vim.g.tokyonight_style = "storm" -- storm | night | day
vim.g.tokyonight_terminal_colors = true
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = false
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_italic_variables = false
vim.g.tokyonight_transparent = false
vim.g.tokyonight_hide_inactive_statusline = false
vim.g.tokyonight_sidebars = {}
vim.g.tokyonight_transparent_sidebar = false
vim.g.tokyonight_dark_sidebar = false
vim.g.tokyonight_dark_float = true
vim.g.tokyonight_colors = {}
vim.g.tokyonight_day_brightness = 0.3
vim.g.tokyonight_lualine_bold = false

-- vscode
vim.g.vscode_style = "dark"
vim.g.vscode_italic_comment = 1
vim.g.vscode_disable_nvimtree_bg = true

-- background
vim.o.background = "dark"
-- vim.o.background = "light"

-- use colorscheme?
-- vim.cmd[[colorscheme everforest]]
-- vim.cmd[[colorscheme nord]]
vim.cmd[[colorscheme tokyonight]]
-- vim.cmd[[colorscheme vscode]]
