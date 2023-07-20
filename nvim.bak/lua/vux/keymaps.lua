local toggleterm_ui = require("toggleterm.ui")
local keymap = vim.keymap
local options = {noremap = true, silent = true}

-- Editor
keymap.set('n', '<leader>w', ':w<CR>', options)

-- Close buffer
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.vux_close_buffer = function()
  if toggleterm_ui.find_open_windows() then
    return t ":ToggleTerm<CR>"
  end

  return t ":bd!<CR>"
end

keymap.set("n", "<leader>q", "v:lua.vux_close_buffer()", {expr = true})
-- keymap.set("n", "<leader>bd", "v:lua.vux_close_buffer()", {expr = true})

keymap.set('n', ']b', ':bnext<CR>', options)
keymap.set('n', '[b', ':bprevious<CR>', options)

-- keymap.set('n', '<leader>n', ':nohlsearch<CR>')
keymap.set('n', '<C-c>', '<Esc>', options)

keymap.set('n', '<C-j>', '<C-w>j', options)
keymap.set('n', '<C-k>', '<C-w>k', options)
keymap.set('n', '<C-l>', '<C-w>l', options)
keymap.set('n', '<C-h>', '<C-w>h', options)

-- Window Resizing (M = Alt | Option)
keymap.set('n', '<M-Up>', ':resize -2<CR>', options)
keymap.set('n', '<M-Down>', ':resize +2<CR>', options)
keymap.set('n', '<M-Left>', ':vertical resize -2<CR>', options)
keymap.set('n', '<M-Right>', ':vertical resize +2<CR>', options)

-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

keymap.set('i', '<C-j>', '<C-w>j', options)
keymap.set('i', '<C-k>', '<C-w>k', options)
keymap.set('i', '<C-l>', '<C-w>l', options)
keymap.set('i', '<C-h>', '<C-w>h', options)

-- Better nav for omnicomplete
keymap.set('i', '<c-j>', '("\\<C-n>")', {expr = true})
keymap.set('i', '<c-k>', '("\\<C-p>")', {expr = true})

keymap.set('v', '<', '<gv', options)
keymap.set('v', '>', '>gv', options)

keymap.set('x', 'K', ':move \'<-2<CR>gv-gv', options)
keymap.set('x', 'J', ':move \'>+1<CR>gv-gv', options)

-- Terminal window navigation
keymap.set('t', '<C-h>', '<C-\\><C-N><C-w>h', options)
keymap.set('t', '<C-j>', '<C-\\><C-N><C-w>j', options)
keymap.set('t', '<C-k>', '<C-\\><C-N><C-w>k', options)
keymap.set('t', '<C-l>', '<C-\\><C-N><C-w>l', options)
keymap.set('t', '<Esc>', '<C-\\><C-n>', options)
