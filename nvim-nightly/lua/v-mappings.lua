local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

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

-- Ranger
map('n', '<leader>r', ':Ranger<CR>')

-- Ctrlsf
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
