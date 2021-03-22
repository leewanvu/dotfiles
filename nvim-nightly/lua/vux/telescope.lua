require'telescope'.setup {
}

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>p', "<cmd>lua require('telescope.builtin').find_files({ find_command = { 'rg', '--files', '--hidden', '--no-ignore-vcs', '-g', '!{node_modules,.git,vendor}' } })<cr>", opts)
vim.api.nvim_set_keymap('n', '<leader>g', "<cmd>lua require('telescope.builtin').git_status()<cr>", opts)
-- vim.api.nvim_set_keymap('n', '<leader>/', "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
vim.api.nvim_set_keymap('n', '<leader>/', "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", opts)
