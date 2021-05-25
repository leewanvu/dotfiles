vim.g.ctrlsf_auto_focus = { at = 'done', duration_less_than = 1000 }
vim.g.ctrlsf_auto_preview = 1
-- vim.g.ctrlsf_default_view_mode = 'compact'

vim.api.nvim_exec([[
  nmap     <leader>sf <Plug>CtrlSFPrompt
  vmap     <leader>sf <Plug>CtrlSFVwordPath
  vmap     <leader>sF <Plug>CtrlSFVwordExec
  nmap     <leader>sn <Plug>CtrlSFCwordPath
  nmap     <leader>sp <Plug>CtrlSFPwordPath
  nnoremap <leader>so :CtrlSFOpen<CR>
  nnoremap <leader>st :CtrlSFToggle<CR>
  nnoremap <leader>su :CtrlSFUpdate<CR>
]], '')
