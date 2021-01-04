local M = {}

function M.setup()
  vim.g.nord_italic_comments = 1
  vim.g.nord_cursor_line_number_background = 1
  vim.g.nord_bold = 1
  vim.g.nord_italic = 1
  vim.g.nord_italic_comments = 1
  vim.g.nord_underline = 1
  vim.g.airline_theme='nord'
  vim.cmd "colorscheme nord"
end

return M
