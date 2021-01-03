local M = {}

function M.setup()
  vim.g.blamer_enabled = 0
  vim.g.blamer_delay = 300
  vim.g.blamer_show_in_visual_modes = 1
  vim.g.blamer_show_in_insert_modes = 1
  vim.g.blamer_prefix = ' '
  -- Available options: <author>, <author-mail>, <author-time>,
  -- <committer>, <committer-mail>, <committer-time>, <summary>, <commit-short>, <commit-long>
  vim.g.blamer_template = '<committer>, <committer-time> • <summary>'
  vim.g.blamer_date_format = '%d/%m/%y %H:%M'
  vim.g.blamer_relative_time = 0
end

return M
