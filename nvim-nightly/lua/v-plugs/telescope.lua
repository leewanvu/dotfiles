local M = {}

function M.setup()
  require'telescope'.setup {
  }

  local opts = { noremap = true, silent = true }

  vim.api.nvim_set_keymap('n', '<leader>p', "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
  vim.api.nvim_set_keymap('n', '<leader>g', "<cmd>lua require('telescope.builtin').git_status()<cr>", opts)
  -- vim.api.nvim_set_keymap('n', '<leader>/', "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
  vim.api.nvim_set_keymap('n', '<leader>/', "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", opts)
end

return M
