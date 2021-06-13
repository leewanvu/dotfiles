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
-- vim.cmd[[colorscheme nord]]
require('colorbuddy').colorscheme('nordbuddy')

-- NvimTree
vim.cmd('highlight NvimTreeIndentMarker guifg=#4C566A')
