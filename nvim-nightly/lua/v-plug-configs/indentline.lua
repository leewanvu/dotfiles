vim.g.indentLine_enabled = 0
-- vim.g.indentLine_setColors = 1
-- vim.g.indentLine_bgcolor_term = 202
-- vim.g.indentLine_bgcolor_gui = '#2E3440'
vim.g.indentLine_defaultGroup = 'SpecialKey'
vim.g.indentLine_char = '│'
-- vim.g.indentLine_char = '⎸'
-- vim.g.indentLine_char = '⁞'
-- vim.g.indentLine_char = '┊'
vim.cmd "autocmd FileType html,javascript,vue :IndentLinesEnable"
