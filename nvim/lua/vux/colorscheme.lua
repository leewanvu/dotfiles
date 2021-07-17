-- nord
vim.g.nord_italic_comments = 1
vim.g.nord_cursor_line_number_background = 1
vim.g.nord_bold = 1
vim.g.nord_italic = 1
vim.g.nord_italic_comments = 1
vim.g.nord_underline = 1

-- nord transparent
if vim.g.vux.os == "linux" and vim.g.vux.is_bg_transparent then
  vim.g.nord_transparent = 1
end

vim.o.background = "dark"
-- vim.o.background = "light"
vim.cmd[[colorscheme nord]]

-- everforest
-- vim.o.background = "light"
vim.g.everforest_background = 'hard'
vim.g.everforest_enable_italic = 0
vim.g.everforest_sign_column_background = 'none'
vim.g.everforest_diagnostic_text_highlight = 0
vim.g.everforest_diagnostic_virtual_text = 'grey'
-- vim.cmd[[colorscheme everforest]]
