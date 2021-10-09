local M = {}

M.setup = function()
  vim.g.nvim_tree_width = 40
  vim.g.nvim_tree_ignore = { '.git', '.idea', 'node_modules', 'vendor' }
  vim.g.nvim_tree_quit_on_open = 1
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_width_allow_resize = 1
  vim.g.nvim_tree_auto_ignore_ft = {'startify', 'dashboard'}
  vim.g.nvim_tree_git_hl = 1
  vim.g.nvim_tree_highlight_opened_files = 2
  vim.g.nvim_tree_respect_buf_cwd = 1
  vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1
  }

  vim.g.nvim_tree_icons = {
    default = "",
    symlink = '',
    git = {
      unstaged = "",
      staged = "S",
      unmerged = "",
      renamed = "➜",
      untracked = "U",
      deleted = "",
      ignored = "◌",
    },
    folder = {
      arrow_open = "",
      arrow_closed = "",
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = ""
    }
  }

  require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    auto_close          = false,
    open_on_tab         = false,
    hijack_cursor       = true,
    update_cwd          = true,
    update_focused_file = {
      enable      = true,
      update_cwd  = true,
      ignore_list = {}
    },
    system_open = {
      cmd  = nil,
      args = {}
    },
  }

end

return M
