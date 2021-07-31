local M = {}

M.setup = function()
  require 'colorizer'.setup {
    'lua', 'vim';
  }
end

return M
