local M = {}

M.setup = function()
  vim.g.better_whitespace_enabled = 0
  vim.g.strip_whitespace_on_save = 0
  vim.g.better_whitespace_ctermcolor = '15'
  vim.g.better_whitespace_guicolor = '#ffffff'
end

return M
