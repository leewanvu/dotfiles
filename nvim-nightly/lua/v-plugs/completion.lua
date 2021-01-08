local M = {}

function M.setup()
  vim.g.completion_chain_complete_list = {
    { complete_items = {'lsp', 'snippet', 'ts'} },
    { complete_items = { 'buffers' } },
    { mode = '<c-p>' },
    { mode = '<c-n>' }
  }
  vim.g.completion_auto_change_source = 1

  vim.api.nvim_exec([[
    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    imap <silent> <c-p> <Plug>(completion_trigger)
  ]], '')
end

return M
