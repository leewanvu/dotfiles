vim.g.ctrlsf_auto_focus = { at = 'done', duration_less_than = 1000 }
vim.g.ctrlsf_auto_preview = 1
-- vim.g.ctrlsf_default_view_mode = 'compact'

vim.api.nvim_exec([[
  nmap     <Leader>ff <Plug>CtrlSFPrompt
  vmap     <Leader>ff <Plug>CtrlSFVwordPath
  nmap     <Leader>fn <Plug>CtrlSFCwordPath
  nmap     <Leader>fp <Plug>CtrlSFPwordPath
  nnoremap <Leader>fo :CtrlSFOpen<CR>
  nnoremap <Leader>ft :CtrlSFToggle<CR>
]], '')
