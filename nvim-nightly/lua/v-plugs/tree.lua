local M = {}

function M.setup()
  vim.g.nvim_tree_width = 40
  vim.g.nvim_tree_ignore = { '.git', 'node_modules', 'vendor' }
  -- vim.g.nvim_tree_auto_open = 1
  vim.g.nvim_tree_quit_on_open = 1
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 0,
    files = 0
  }

  vim.g.nvim_tree_icons = {
    default = '',
    git= {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★"
    },
    folder = {
      default = "",
      open = ""
    }
  }

  vim.g.nvim_tree_bindings = {
    preview = { '<Tab>' }
  }

  vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {
    noremap = true,
    silent = true
  })
  -- vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', {
  --   noremap = true,
  --   silent = true
  -- })
end

return M
