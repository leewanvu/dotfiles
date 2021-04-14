require'bufferline'.setup{
  options = {
    view = 'default',
    buffer_close_icon= '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is deduplicated
    tab_size = 18,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    separator_style = 'thin'
  }
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<Tab>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)
