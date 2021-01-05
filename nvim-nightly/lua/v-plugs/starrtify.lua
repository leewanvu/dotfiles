local M = {}

function M.setup()
  vim.g.startify_custom_header = 'startify#pad(startify#fortune#boxed())'
  vim.g.startify_session_dir = '~/.config/nvim/session'
  vim.g.startify_session_autoload = 1
  vim.g.startify_session_delete_buffers = 1
  vim.g.startify_change_to_vcs_root = 1
  vim.g.startify_fortune_use_unicode = 1
  vim.g.startify_session_persistence = 1
  vim.g.webdevicons_enable_startify = 0
  vim.g.startify_lists = {
    { type = 'files', header = {'   Files'} },
    { type = 'dir', header = {'   Current Directory '.. vim.api.nvim_eval("getcwd()")} },
    { type = 'sessions', header = {'   Sessions'} },
    { type = 'bookmarks', header = {'   Bookmarks'} },
  }
  vim.g.startify_enable_special = 0
  vim.g.startify_bookmarks = {
    { i= '~/.config/nvim/init.lua' },
    { a= '~/.config/alacritty/alacritty.yml' },
    { z= '~/.zshrc' },
    { t= '~/.tmux.conf' },
    { s= '~/FireApps/sms-be/.env' },
    { u= '~/FireApps/unlimited-be/.env' },
    { d= '~/FireApps/s5y-docker/.env' },
    { al= '~/FireApps/ar/alireviews/.env' },
    { ar= '~/FireApps/ar/alireviews-report/.env' },
    { ab= '~/FireApps/ar/alireviews-box/.env' },
  }
end

return M
