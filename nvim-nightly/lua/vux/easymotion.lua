vim.g.EasyMotion_do_mapping = 0
vim.g.EasyMotion_smartcase = 1

vim.api.nvim_exec([[
  map <Leader>s <Plug>(easymotion-bd-f)
  nmap <Leader>s <Plug>(easymotion-overwin-f)
  nmap s <Plug>(easymotion-overwin-f2)
]], '')
