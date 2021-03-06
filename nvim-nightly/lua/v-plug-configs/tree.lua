vim.g.nvim_tree_width = 40
vim.g.nvim_tree_ignore = { '.git', 'node_modules', 'vendor' }
-- vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_width_allow_resize = 1
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_auto_ignore_ft = {'startify'}
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

-- vim.g.nvim_tree_bindings = {
--   ["<CR>"]           = get_lua_cb("edit"),
--   ["o"]              = get_lua_cb("edit"),
--   ["<2-LeftMouse>"]  = get_lua_cb("edit"),
--   ["<2-RightMouse>"] = get_lua_cb("cd"),
--   ["<C-]>"]          = get_lua_cb("cd"),
--   ["<C-v>"]          = get_lua_cb("vsplit"),
--   ["<C-x>"]          = get_lua_cb("split"),
--   ["<C-t>"]          = get_lua_cb("tabnew"),
--   ["<BS>"]           = get_lua_cb("close_node"),
--   ["<S-CR>"]         = get_lua_cb("close_node"),
--   ["<Tab>"]          = get_lua_cb("preview"),
--   ["I"]              = get_lua_cb("toggle_ignored"),
--   ["H"]              = get_lua_cb("toggle_dotfiles"),
--   ["R"]              = get_lua_cb("refresh"),
--   ["a"]              = get_lua_cb("create"),
--   ["d"]              = get_lua_cb("remove"),
--   ["r"]              = get_lua_cb("rename"),
--   ["<C-r>"]          = get_lua_cb("full_rename"),
--   ["x"]              = get_lua_cb("cut"),
--   ["c"]              = get_lua_cb("copy"),
--   ["p"]              = get_lua_cb("paste"),
--   ["[c"]             = get_lua_cb("prev_git_item"),
--   ["]c"]             = get_lua_cb("next_git_item"),
--   ["-"]              = get_lua_cb("dir_up"),
--   ["q"]              = get_lua_cb("close"),
-- }

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {
  noremap = true,
  silent = true
})
-- vim.api.nvim_set_keymap('n', '<C-m>', ':NvimTreeFindFile<CR>', {
--   noremap = true,
--   silent = true
-- })
