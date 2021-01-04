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

-- Fzf
map('n', '<leader>p', ':Files<CR>', { noremap = true, silent = true })
map('n', '<leader>b', ':Buffers<CR>', { noremap = true, silent = true })
map('n', '<leader>g', ':GFiles?<CR>', { noremap = true, silent = true })

-- Easy motion
map('n', '<leader>f', '<Plug>(easymotion-bd-f)')
map('n', '<leader>f', '<Plug>(easymotion-overwin-f)', { noremap = true })
map('n', 's', '<Plug>(easymotion-overwin-f2)', { noremap = true })

-- Ranger
map('n', '<leader>r', ':Ranger<CR>')
