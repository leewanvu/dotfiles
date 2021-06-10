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

vim.cmd('set background=dark')
vim.cmd('colorscheme nord')

-- NvimTree
vim.cmd('highlight NvimTreeIndentMarker guifg=#4C566A')

-- vim.cmd('highlight SignColumn guibg=#2f383e')

-- everforest
-- vim.g.everforest_background = 'dark'
-- vim.cmd('colorscheme everforest')

-- require('colorbuddy').colorscheme('nordbuddy')
