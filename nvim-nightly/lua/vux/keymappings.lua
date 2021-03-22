local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opts = { noremap = true, silent = true }

-- Editor
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>q', ':bd<CR>', opts)
map('n', '<TAB>', ':bnext<CR>', opts)
map('n', '<S-TAB>', ':bprevious<CR>', opts)
map('n', '<leader>n', ':nohlsearch<CR>', opts)
map('n', '<C-c>', '<Esc>', opts)

map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-h>', '<C-w>h')

map('i', '<C-j>', '<C-w>j')
map('i', '<C-k>', '<C-w>k')
map('i', '<C-l>', '<C-w>l')
map('i', '<C-h>', '<C-w>h')

map('i', '<C-j>', '<C-n>', { expr = true })
map('i', '<C-k>', '<C-p>', { expr = true })

map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

map('x', 'K', ':move \'<-2<CR>gv-gv', opts)
map('x', 'J', ':move \'>+1<CR>gv-gv', opts)

-- Terminal
-- map('t', '<Esc>', '<C-\\><C-n>')
-- map('t', '<A-j>', '<C-\\><C-n><C-w>j')
-- map('t', '<A-k>', '<C-\\><C-n><C-w>k')
-- map('t', '<A-h>', '<C-\\><C-n><C-w>h')
-- map('t', '<A-l>', '<C-\\><C-n><C-w>l')

-- Ranger
-- map('n', '<leader>r', ':Ranger<CR>', opts)

-- GitBlame
vim.api.nvim_set_keymap('n', '<leader>b', ':GitBlameToggle<CR>', { noremap = true, silent = true })
