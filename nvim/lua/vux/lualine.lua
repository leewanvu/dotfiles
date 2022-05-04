local M = {}

M.setup = function()
  require'lualine'.setup {
    options = {
      icons_enabled = false,
      theme = 'auto',
      component_separators = '',
      section_separators = '',
      disabled_filetypes = {},
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff'},
      lualine_c = {
        {
          'filename',
          file_status = true,  -- displays file status (readonly status, modified status)
          path = 1,             -- 0 = just filename, 1 = relative path, 2 = absolute path
          shorting_target = 40  -- Shortens path to leave 40 space in the window
                                -- for other components. Terrible name any suggestions?
        }
      },
      -- lualine_x = {'encoding', 'filesize', 'filetype'},
      lualine_x = {'diagnostics', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {'nvim-tree', 'toggleterm', 'symbols-outline', 'fugitive'}
  }
end

return M
