vim.g.bufferline = {
  animation = false,
  auto_hide = false,
  closable = true,
  clickable = true,
  icons = true, -- numbers, both
  icon_custom_colors = false,
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  maximum_padding = 4,
  semantic_letters = true
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<Tab>', ':BufferNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferPrevious<CR>', opts)
