vim.g.bufferline = {
  animation = false,
  auto_hide = false,
  closable = true,
  clickable = true,
  icons = true, -- numbers, both
  icon_custom_colors = false,
  -- icon_separator_active = '▎',
  icon_separator_active = '',
  icon_separator_inactive = '',
  icon_close_tab = '窱',
  icon_close_tab_modified = '',
  maximum_padding = 1,
  semantic_letters = true
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<Tab>', ':BufferNext<CR>', opts)
map('n', '<S-Tab>', ':BufferPrevious<CR>', opts)
-- map('n', '<Leader>q', ':BufferClose<CR>', opts)
