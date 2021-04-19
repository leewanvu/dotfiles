local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Editor
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>q', ':bd!<CR>')

-- Using barbar instead of
--[[ map('n', '<TAB>', ':bnext<CR>')
map('n', '<S-TAB>', ':bprevious<CR>') ]]

map('n', ']b', ':bnext<CR>')
map('n', '[b', ':bprevious<CR>')

map('n', '<leader>n', ':nohlsearch<CR>')
map('n', '<C-c>', '<Esc>')

map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-h>', '<C-w>h')

map('i', '<C-j>', '<C-w>j')
map('i', '<C-k>', '<C-w>k')
map('i', '<C-l>', '<C-w>l')
map('i', '<C-h>', '<C-w>h')

-- Better nav for omnicomplete
map('i', '<c-j>', '("\\<C-n>")', {expr = true})
map('i', '<c-k>', '("\\<C-p>")', {expr = true})

map('v', '<', '<gv')
map('v', '>', '>gv')

map('x', 'K', ':move \'<-2<CR>gv-gv')
map('x', 'J', ':move \'>+1<CR>gv-gv')

-- Terminal window navigation
map('t', '<C-h>', '<C-\\><C-N><C-w>h')
map('t', '<C-j>', '<C-\\><C-N><C-w>j')
map('t', '<C-k>', '<C-\\><C-N><C-w>k')
map('t', '<C-l>', '<C-\\><C-N><C-w>l')
map('t', '<Esc>', '<C-\\><C-n>')

-- Window Resizing (M = Alt | Option)
map('n', '<M-Up>', ':resize -2<CR>')
map('n', '<M-Down>', ':resize +2<CR>')
map('n', '<M-Left>', ':vertical resize -2<CR>')
map('n', '<M-Right>', ':vertical resize +2<CR>')

-- Ranger
-- map('n', '<leader>r', ':Ranger<CR>')

-- GitBlame
-- map('n', 'gb', ':GitBlameToggle<CR>')
