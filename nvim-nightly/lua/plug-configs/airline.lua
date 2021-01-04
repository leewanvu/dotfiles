local M = {}

function M.setup()
  vim.api.nvim_set_var('airline#extensions#tabline#enabled', 1)
  vim.api.nvim_set_var('airline#extensions#tabline#formatter', 'unique_tail')
  -- vim.api.nvim_set_var('airline#extensions#tabline#buffer_nr_show', 1)
  -- vim.api.nvim_set_var('airline#extensions#tabline#left_sep', '')
  -- vim.api.nvim_set_var('airline#extensions#tabline#left_alt_sep', '')
  -- vim.api.nvim_set_var('airline#extensions#tabline#right_sep', '')
  -- vim.api.nvim_set_var('airline#extensions#tabline#right_alt_sep', '')
  vim.api.nvim_set_var('airline#extensions#coc#enabled', 0)
  vim.g.airline_powerline_fonts = 1
  -- vim.g.airline_left_sep = ''
  -- vim.g.airline_right_sep = ''
end

return M
