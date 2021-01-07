local M = {}

function M.setup()
  vim.api.nvim_exec([[
    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    imap <silent> <c-p> <Plug>(completion_trigger)
  ]], '')
end

return M
