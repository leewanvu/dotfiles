local M = {}

function M.setup()
  vim.g.EasyMotion_do_mapping = 0
  vim.g.EasyMotion_smartcase = 1

  vim.api.nvim_exec([[
    map <Leader>f <Plug>(easymotion-bd-f)
    nmap <Leader>f <Plug>(easymotion-overwin-f)
    nmap s <Plug>(easymotion-overwin-f2)
  ]], '')
end

return M
