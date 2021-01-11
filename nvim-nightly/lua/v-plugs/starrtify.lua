local M = {}

function M.setup()
  vim.g.startify_custom_header = 'startify#pad(startify#fortune#cowsay())'
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

  local faRepos = '~/FireApps/'
  -- Ubuntu worspace
  if (os.getenv('HOME') == '/home/vux') then
    faRepos = '~/Workspace/Repos/'
  end
  vim.g.startify_bookmarks = {
    { i= '~/.config/nvim/init.lua' },
    { aa= '~/.config/alacritty/alacritty.yml' },
    { z= '~/.zshrc' },
    { t= '~/.tmux.conf' },
    { s= faRepos .. 'sms-be/.env' },
    { u= faRepos .. 'unlimited-be/.env' },
    { d= faRepos .. 's5y-docker/.env' },
    { al= faRepos .. 'ar/alireviews/.env' },
    { ar= faRepos .. 'ar/alireviews-report/.env' },
    { ab= faRepos .. 'ar/alireviews-box/.env' },
  }
end

return M
