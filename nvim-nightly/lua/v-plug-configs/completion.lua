vim.g.completion_chain_complete_list = {
  default = {
    { complete_items = { 'lsp' } },
    { complete_items = { 'buffers' } },
    { mode = { '<c-p>' } },
    { mode = { '<c-n>' } }
  },
}
-- vim.g.completion_auto_change_source = 1
-- vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'}
-- vim.g.completion_trigger_character = {'.', '::'}
-- vim.g.completion_enable_snippet = 'vim-vsnip'

-- vim.api.nvim_exec([[
--   inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
--   inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
--   imap <silent> <c-p> <Plug>(completion_trigger)
-- ]], '')

-- Use completion-nvim in every buffer
vim.cmd "autocmd BufEnter * lua require'completion'.on_attach()"
