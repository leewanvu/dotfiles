local M = {}

M.setup = function()
  vim.g.indent_blankline_char = '│'
  vim.g.indent_blankline_filetype = {'html', 'javascript', 'vue', 'php'}
  vim.g.indent_blankline_show_current_context = true
  vim.g.indent_blankline_context_patterns = {
    'class', 'function', 'method',
    'try', 'if', 'switch', 'case',
    'foreach', 'array', 'arguments'
  }
end

return M
