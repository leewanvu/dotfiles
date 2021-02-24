local M = {}

function M.setup()
  vim.g.completion_chain_complete_list = {
    -- { complete_items = {'lsp', 'snippet', 'buffers'} },
    { complete_items = {'lsp', 'snippet'} },
    -- ts
    -- { complete_items = { 'buffers' } },
    { complete_items = { 'ts', 'buffers' } },
    { mode = '<c-p>' },
    { mode = '<c-n>' }
  }
  vim.g.completion_auto_change_source = 1

  vim.api.nvim_exec([[
    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    imap <silent> <c-p> <Plug>(completion_trigger)
  ]], '')

  -- Use completion-nvim in every buffer
  vim.cmd "autocmd BufEnter * lua require'completion'.on_attach()"
end

return M
