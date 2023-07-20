local M = {}

M.setup = function ()
  local actions = require('telescope.actions')

  require('telescope').setup {
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case"
      },
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      layout_config = {
        -- horizontal = {
        --   height = 0.9,
        --   preview_cutoff = 40,
        --   prompt_position = "top",
        --   width = 0.5
        -- },
        -- vertical = {
        --   height = 0.9,
        --   preview_cutoff = 40,
        --   prompt_position = "bottom",
        --   width = 0.8
        -- },
      },
      -- file_sorter = require'telescope.sorters'.get_fuzzy_file,
      file_sorter = require("telescope.sorters").get_fzy_sorter,
      -- generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
      generic_sorter = require("telescope.sorters").get_fzy_sorter,
      file_ignore_patterns = {
        "^node_modules/*",
        -- "^vendor/*",
        "^.idea/*",
        "^.git/*",
        "%.png",
        "%.jpg",
        "%.svg",
        "%.ico"
      },
      path_display = function(opts, path)
        local tail = require("telescope.utils").path_tail(path)
        return string.format("%s (%s)", tail, path)
      end,
      winblend = 0,
      border = true,
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
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,
          ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
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
          ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
          -- ["<C-i>"] = my_cool_custom_action,
        }
      }
    },
    pickers = {
      oldfiles = {
        theme = "dropdown",
        previewer = false,
      },
      buffers = {
        theme = "dropdown",
        previewer = false,
      },
      current_buffer_fuzzy_find = {
        previewer = false,
      },
      colorscheme = {
        theme = "dropdown",
        previewer = false,
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      }
    }
  }

  require('telescope').load_extension('fzf')
end

M.find_files = function()
  local opts = require'telescope.themes'.get_dropdown()

  opts.find_command = {
    'rg', '--files', '--hidden', '--no-ignore-vcs', '-g', '!{node_modules,.git,vendor}'
  }
  opts.previewer = false
  opts.prompt_title = false

  opts.path_display = function(opts, path)
    local tail = require("telescope.utils").path_tail(path)
    return string.format("%s (%s)", tail, path)
  end

  require('telescope.builtin').find_files(opts)
end

return M
