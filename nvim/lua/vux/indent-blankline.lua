local M = {}

M.setup = function()
  vim.g.indent_blankline_char = '│'
  vim.g.indent_blankline_filetype = {'html', 'javascript', 'vue', 'php'}
  vim.g.indent_blankline_show_current_context = true
end

return M
