require'hop'.setup{}

vim.api.nvim_set_keymap('n', 's', "<cmd>lua require'hop'.hint_char2()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>s', "<cmd>lua require'hop'.hint_char1()<cr>", { noremap = true, silent = true })
