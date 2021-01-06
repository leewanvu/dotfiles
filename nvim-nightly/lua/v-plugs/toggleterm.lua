local M = {}

function M.setup()
  require"toggleterm".setup{
    size = 20,
    open_mapping = [[<c-t>]],
    shade_filetypes = {},
    shade_terminals = false,
    persist_size = false,
    direction = 'horizontal' -- 'vertical'
  }
end

return M
