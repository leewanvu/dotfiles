local M = {}

function M.setup()
  require'lspconfig'.intelephense.setup{
    -- on_attach = require'completion'.on_attach
  }

  -- Use completion-nvim in every buffer
  vim.cmd "autocmd BufEnter * lua require'completion'.on_attach()"
  
  vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {
    noremap = true,
    silent = true
  })
  vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {
    noremap = true,
    silent = true
  })
  vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {
    noremap = true,
    silent = true
  })

-- map('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
-- map('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
-- map('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
-- map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
-- map('n', '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap = true, silent = true })
-- map('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', { noremap = true, silent = true })
-- map('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', { noremap = true, silent = true })
end

return M
