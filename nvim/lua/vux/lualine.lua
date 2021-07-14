require'lualine'.setup {
  options = {
    icons_enabled = false,
    theme = 'nord',
    section_separators = {'', ''},
    component_separators = {'', ''},
    disabled_filetypes = {'dashboard', 'packer', 'ctrlsf'},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
        color = 'Number',
      },
    },
    lualine_c = {
      'diff',
      -- {
      --   'branch',
      --   -- color = 'Number',
      -- },
    },
    lualine_x = {
      -- 'diff',
      {
        'diagnostics',
        -- table of diagnostic sources, available sources:
        -- nvim_lsp, coc, ale, vim_lsp
        sources = {'nvim_lsp'},
        -- displays diagnostics from defined severity
        sections = {'error', 'warn', 'info', 'hint'},
        -- all colors are in format #rrggbb
        color_error = nil, -- changes diagnostic's error foreground color
        color_warn = nil, -- changes diagnostic's warn foreground color
        color_info = nil, -- Changes diagnostic's info foreground color
        color_hint = nil, -- Changes diagnostic's hint foreground color
        -- symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}
        symbols = {error = 'E:', warn = 'W:', info = 'I:', hint = 'H:'}
      },
      'encoding',
      -- 'fileformat',
      'filetype',
    },
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
  extensions = {'nvim-tree'}
}
