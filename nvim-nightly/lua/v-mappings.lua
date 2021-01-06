local g = vim.g

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

g.mapleader = ' '

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
map('n', '<C-m>', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

-- Editor
map('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
map('n', '<leader>q', ':bd<CR>', { noremap = true, silent = true })
map('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
map('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })
map('n', '<leader>n', ':nohlsearch<CR>', { noremap = true, silent = true })
map('n', '<C-c>', '<Esc>', { noremap = true, silent = true })

map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-h>', '<C-w>h')

map('i', '<C-j>', '<C-w>j')
map('i', '<C-k>', '<C-w>k')
map('i', '<C-l>', '<C-w>l')
map('i', '<C-h>', '<C-w>h')

map('i', '<C-j>', '<C-n>', { noremap = true, expr = true })
map('i', '<C-k>', '<C-p>', { noremap = true, expr = true })

map('v', '<', '<gv', { noremap = true })
map('v', '>', '>gv', { noremap = true })

map('x', 'K', ':move \'<-2<CR>gv-gv', { noremap = true })
map('x', 'J', ':move \'>+1<CR>gv-gv', { noremap = true })

-- Terminal
-- map('t', '<Esc>', '<C-\\><C-n>')
-- map('t', '<A-j>', '<C-\\><C-n><C-w>j')
-- map('t', '<A-k>', '<C-\\><C-n><C-w>k')
-- map('t', '<A-h>', '<C-\\><C-n><C-w>h')
-- map('t', '<A-l>', '<C-\\><C-n><C-w>l')

-- Fzf
map('n', '<leader>p', ':Files<CR>', { noremap = true, silent = true })
map('n', '<leader>b', ':Buffers<CR>', { noremap = true, silent = true })
map('n', '<leader>g', ':GFiles?<CR>', { noremap = true, silent = true })

-- Easy motion
-- map('n', '<leader>f', '<Plug>(easymotion-bd-f)')
-- map('n', '<leader>f', '<Plug>(easymotion-overwin-f)', { noremap = true })
-- map('n', 's', '<Plug>(easymotion-overwin-f2)', { noremap = true })
vim.api.nvim_exec([[
  map <Leader>f <Plug>(easymotion-bd-f)
  nmap <Leader>f <Plug>(easymotion-overwin-f)
  nmap s <Plug>(easymotion-overwin-f2)
]], '')

-- Ranger
map('n', '<leader>r', ':Ranger<CR>')

-- LSP
-- map('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
map('n', 'gd>', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
-- map('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
-- map('n', '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap = true, silent = true })
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
map('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', { noremap = true, silent = true })
map('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', { noremap = true, silent = true })
-- map('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
