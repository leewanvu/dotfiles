vim.g.completion_auto_change_source = 1
vim.g.completion_matching_strategy_list = {'exact', 'fuzzy'}
vim.g.completion_enable_snippet = 'snippets.nvim'
-- vim.g.completion_enable_auto_signature = 1
vim.g.completion_trigger_keyword_length = 1
vim.g.completion_enable_auto_paren = 1
-- vim.g.completion_enable_server_trigger = 1

vim.g.completion_chain_complete_list = {
  default = {
    {complete_items = {'lsp', 'snippet'}},
    {complete_items = {'buffers'}},
    {complete_items = {'path'}},
    { mode = { '<c-p>' } },
    { mode = { '<c-n>' } }
  },
  string = {
    {complete_items = {'path'}},
    {complete_items = {'buffers'}},
  },
  comment = {complete_items = {'buffers'}},
}

vim.api.nvim_exec([[
  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
]], '')
-- imap <silent> <c-p> <Plug>(completion_trigger)
-- imap <tab> <Plug>(completion_smart_tab)
-- imap <s-tab> <Plug>(completion_smart_s_tab)

-- Use completion-nvim in every buffer
vim.cmd "autocmd BufEnter * lua require'completion'.on_attach()"
