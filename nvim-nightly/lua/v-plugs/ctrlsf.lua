local M = {}

function M.setup()
  vim.g.ctrlsf_auto_focus = { at = 'done', duration_less_than = 1000 }
  vim.g.ctrlsf_auto_preview = 1
  -- vim.g.ctrlsf_default_view_mode = 'compact'
  
  vim.api.nvim_exec([[
    nmap     <C-F>f <Plug>CtrlSFPrompt
    nmap     <C-F>f <Plug>CtrlSFPrompt
    vmap     <C-F>f <Plug>CtrlSFVwordPath
    vmap     <C-F>F <Plug>CtrlSFVwordExec
    nmap     <C-F>n <Plug>CtrlSFCwordPath
    nmap     <C-F>p <Plug>CtrlSFPwordPath
    nnoremap <C-F>o :CtrlSFOpen<CR>
    nnoremap <C-F>t :CtrlSFToggle<CR>
    inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
  ]], '')
end

return M
