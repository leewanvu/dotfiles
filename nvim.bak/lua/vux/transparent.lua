local M = {}

M.setup = function()
  require("transparent").setup({
    enable = false, -- boolean: enable transparent
    extra_groups = { -- table/string: additional groups that should be clear
      -- In particular, when you set it to 'all', that means all avaliable groups
      'VertSplit',
    },
    exclude = {}, -- table: groups you don't want to clear
  })
end

return M
