local M = {}

function M.setup()
  vim.g.airline = { extensions = { tabline = { enabled = 1, formatter = 'unique_tail' }, coc = { enabled = 0 } } }
  -- vim.g.airline#extensions#tabline#enabled = 1
  -- vim.g.airline#extensions#tabline#formatter = 'unique_tail'
  -- vim.g.airline#extensions#tabline#buffer_nr_show = 1
  -- vim.g.airline#extensions#tabline#left_sep = ''
  -- vim.g.airline#extensions#tabline#left_alt_sep = ''
  -- vim.g.airline#extensions#tabline#right_sep = ''
  -- vim.g.airline#extensions#tabline#right_alt_sep = ''
  -- vim.g.airline#extensions#coc#enabled = 0
  vim.g.airline_powerline_fonts = 1
  -- vim.g.airline_left_sep = ''
  -- vim.g.airline_right_sep = ''
end

return M
