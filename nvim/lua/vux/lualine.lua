require('lualine').setup{
  options = {
    theme = 'nord',
    -- section_separators = {'', ''},
    section_separators = {'', ''},
    component_separators = {'', ''},
    -- component_separators = {'', ''},
    --[[ section_separators = {'', ''},
    component_separators = {'', ''}, ]]
    icons_enabled = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename', 'diff'},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    -- lualine_y = {'filename', 'filetype'},
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
  extensions = { 'fzf', 'nvim-tree', 'fugitive' }
}
