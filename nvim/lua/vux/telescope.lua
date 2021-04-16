local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
      vimgrep_arguments = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
      prompt_position = "bottom",
      prompt_prefix = "   ",
      selection_caret = " ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      layout_defaults = {horizontal = {mirror = false}, vertical = {mirror = false}},
      file_sorter = require'telescope.sorters'.get_fuzzy_file,
      file_ignore_patterns = {},
      generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
      shorten_path = true,
      winblend = 0,
      width = 0.75,
      preview_cutoff = 120,
      results_height = 1,
      results_width = 0.8,
      border = {},
      borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
      color_devicons = true,
      use_less = true,
      set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
      file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          -- ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
          -- To disable a keymap, put [map] = false
          -- So, to not map "<C-n>", just put
          -- ["<c-x>"] = false,
          -- ["<esc>"] = actions.close,

          -- Otherwise, just set the mapping to the function that you want it to be.
          -- ["<C-i>"] = actions.select_horizontal,

          -- Add up multiple actions
          -- ["<CR>"] = actions.select_default + actions.center

          -- You can perform as many actions in a row as you like
          -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
        },
        n = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          -- ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
          -- ["<C-i>"] = my_cool_custom_action,
        }
    }
  }
}

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>p', "<cmd>lua require('telescope.builtin').find_files({ find_command = { 'rg', '--files', '--hidden', '--no-ignore-vcs', '-g', '!{node_modules,.git,vendor}' } })<cr>", opts)
vim.api.nvim_set_keymap('n', '<leader>g', "<cmd>lua require('telescope.builtin').git_status()<cr>", opts)
vim.api.nvim_set_keymap('n', '<leader>b', "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
vim.api.nvim_set_keymap('n', '<leader>/', "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", opts)
