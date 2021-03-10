local M = {}

function M.setup()
  local lsp_config = require'lspconfig'
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

    -- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

    buf_set_keymap('n', '<leader>ee', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '<leader>ep', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', '<leader>en', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    -- buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    buf_set_keymap("n", "<leader>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    buf_set_keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

    -- Lspsaga mappings
    -- buf_set_keymap('n', 'gr', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
    -- buf_set_keymap('n', 'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
    -- buf_set_keymap('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
    -- buf_set_keymap('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
    -- buf_set_keymap('n', 'gs', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
    -- buf_set_keymap('n', 'ga', "<cmd>lua require'lspsaga.codeaction'.code_action()<CR>", opts)
    -- buf_set_keymap('v', 'ga', "<cmd>'<,'>lua require'lspsaga.codeaction'.range_code_action()", opts)
    -- buf_set_keymap('n', 'gn', "<cmd>lua require'lspsaga.rename'.rename()<CR>", opts)
    -- buf_set_keymap('n', 'gp', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)
    -- buf_set_keymap('n', '<leader>ee', "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", opts)
    -- buf_set_keymap('n', '<leader>ep', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)
    -- buf_set_keymap('n', '<leader>en', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)
  end

  -- Saga
  -- local saga = require 'lspsaga'
  -- saga.init_lsp_saga()

  -- Snippet Support
  require'snippets'.use_suggested_mappings()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  -- Use a loop to conveniently both setup defined servers
  -- and map buffer local keybindings when the language server attaches
  local servers = { "tsserver", "vuels", "cssls", "html" }
  for _, lsp in ipairs(servers) do
    lsp_config[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities
    }
  end

  lsp_config["intelephense"].setup {
    on_attach = on_attach
  }

  -- Make sure uncomment
    -- use 'RishabhRD/popfix'
    -- use 'RishabhRD/nvim-lsputils'
  -- vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
  -- vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
  -- vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
  -- vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
  -- vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
  -- vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
  -- vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
  -- vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
end

return M
