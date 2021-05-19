local M = {}

M.setup = function()

vim.g.nord_italic_comments = 1
vim.g.nord_cursor_line_number_background = 1
vim.g.nord_bold = 1
vim.g.nord_italic = 1
vim.g.nord_italic_comments = 1
vim.g.nord_underline = 1
-- vim.g.nord_transparent = 1

vim.cmd('colorscheme nord')

-- Airline
-- vim.g.airline_theme = 'nord'

-- Nord colors
-- nord0 = "#2E3440",
-- nord1 = "#3B4252",
-- nord2 = "#434C5E",
-- nord3 = "#4C566A",
-- nord3_bright = "#616E88",
-- nord4 = "#D8DEE9",
-- nord5 = "#E5E9F0",
-- nord6 = "#ECEFF4",
-- nord7 = "#8FBCBB",
-- nord8 = "#88C0D0",
-- nord9 = "#81A1C1",
-- nord10 = "#5E81AC",
-- nord11 = "#BF616A",
-- nord12 = "#D08770",
-- nord13 = "#EBCB8B",
-- nord14 = "#A3BE8C",
-- nord15 = "#B48EAD",

-- Transparent background
vim.cmd('highlight Normal ctermbg=NONE guibg=NONE')
vim.cmd('highlight VertSplit ctermbg=NONE guibg=NONE')
vim.cmd('highlight SignColumn ctermbg=NONE guibg=NONE')
-- NvimTree
vim.cmd('highlight NvimTreeIndentMarker guifg=#4C566A')
-- Floaterm
vim.cmd('highlight FloatermBorder guifg=#D8DEE9')

-- Barbar
-- format: "Buffer" + status + part
--
-- status:
--     *Current: current buffer
--     *Visible: visible but not current buffer
--    *Inactive: invisible but not current buffer
--
-- part:
--        *Icon: filetype icon
--       *Index: buffer index
--         *Mod: when modified
--        *Sign: the separator between buffers
--      *Target: letter in buffer-picking mode
--
-- BufferTabpages: tabpage indicator
-- BufferTabpageFill: filler after the buffer section
-- vim.cmd('hi BufferCurrent guifg=#ECEFF4 guibg=#4C566A')
-- vim.cmd('hi BufferCurrentIndex guifg=#88C0D0 guibg=#4C566A')
-- vim.cmd('hi BufferCurrentMod guifg=#EBCB8B guibg=#4C566A')
-- vim.cmd('hi BufferCurrentSign guifg=#88C0D0 guibg=#4C566A')
-- vim.cmd('hi BufferCurrentTarget guifg=#D08770 guibg=#4C566A gui=bold')

-- vim.cmd('hi BufferVisible guifg=#ECEFF4 guibg=#4C566A')
-- vim.cmd('hi BufferVisibleIndex guifg=#88C0D0 guibg=#4C566A')
-- vim.cmd('hi BufferVisibleMod guifg=#EBCB8B guibg=#4C566A')
-- vim.cmd('hi BufferVisibleSign guifg=#88C0D0 guibg=#4C566A')
-- vim.cmd('hi BufferVisibleTarget guifg=#D08770 guibg=#4C566A gui=bold')

-- vim.cmd('hi BufferInactive guifg=#ECEFF4 guibg=#2E3440')
-- vim.cmd('hi BufferInactiveIndex guifg=#ECEFF4 guibg=#2E3440')
-- vim.cmd('hi BufferInactiveMod guifg=#EBCB8B guibg=#2E3440')
-- vim.cmd('hi BufferInactiveSign guifg=#ECEFF4 guibg=#2E3440')
-- vim.cmd('hi BufferInactiveTarget guifg=#D08770 guibg=#2E3440 gui=bold')

-- vim.cmd('hi BufferTabpages guifg=#2E3440 guibg=#88C0D0')
-- vim.cmd('hi BufferTabpageFill guifg=#2E3440 guibg=#2E3440')

end

return M
