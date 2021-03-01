local M = {}

function M.setup()
  vim.g.neoterm_default_mod = 'botright'
  vim.g.neoterm_autoinsert = 1

  vim.api.nvim_exec([[
    let g:neoterm_callbacks = {}
    function! g:neoterm_callbacks.before_new()
      if winheight('.') < 36
        let g:neoterm_default_mod = 'rightbelow vertical'
      else
        let g:neoterm_default_mod = 'botright'
      end
    endfunction
  ]], '')

  vim.api.nvim_set_keymap('n', '<C-t>', ":<C-u>exec v:count.'Ttoggle'<CR>", {
    noremap = true,
    silent = true
  })

  vim.api.nvim_set_keymap('t', '<C-t>', "<C-\\><C-n>:Tclose<CR>", {
    noremap = true,
    silent = true
  })
end

return M
