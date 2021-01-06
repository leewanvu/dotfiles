local M = {}

function M.setup()
  vim.g.floaterm_keymap_toggle = '<F10>'
  vim.g.floaterm_keymap_next   = '<F8>'
  vim.g.floaterm_keymap_prev   = '<F9>'
  vim.g.floaterm_keymap_new    = '<F7>'

  vim.g.floaterm_wintype = 'floating'
  vim.g.floaterm_position = 'center'
  vim.g.floaterm_gitcommit = 'floaterm'
  vim.g.floaterm_autoinsert = 1
  vim.g.floaterm_width = 0.8
  vim.g.floaterm_height = 0.8
  vim.g.floaterm_wintitle = 0
  vim.g.floaterm_autoclose = 1
  vim.g.floaterm_rootmarkers = {'.git', '.env'}
end

return M
