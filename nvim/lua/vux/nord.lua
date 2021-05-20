vim.g.nord_italic_comments = 1
vim.g.nord_cursor_line_number_background = 1
vim.g.nord_bold = 1
vim.g.nord_italic = 1
vim.g.nord_italic_comments = 1
vim.g.nord_underline = 1

if vim.g.vux.is_bg_transparent then
  vim.g.nord_transparent = 1
end

vim.cmd('colorscheme nord')

-- NvimTree
vim.cmd('highlight NvimTreeIndentMarker guifg=#4C566A')
