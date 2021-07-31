local M = {}

M.setup = function()
  vim.g.indent_blankline_char = '│'
  vim.g.indent_blankline_filetype = {'html', 'javascript', 'vue'}
end

return M
