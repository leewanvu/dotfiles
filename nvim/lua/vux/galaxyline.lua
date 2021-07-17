local status_ok, gl = pcall(require, "galaxyline")
if not status_ok then
  return
end

local condition = require('galaxyline.condition')
local gls = gl.section

gl.short_line_list = {'NvimTree', 'startify', 'packer', 'ctrlsf', 'dashboard', 'toggleterm'}

local nord_colors = {
  nord0 = "#2E3440",
  nord1 = "#3B4252",
  nord2 = "#434C5E",
  nord3 = "#4C566A",
  nord4 = "#D8DEE9",
  nord5 = "#E5E9F0",
  nord6 = "#ECEFF4",
  nord7 = "#8FBCBB",
  nord8 = "#88C0D0",
  nord9 = "#81A1C1",
  nord10 = "#5E81AC",
  nord11 = "#BF616A",
  nord12 = "#D08770",
  nord13 = "#EBCB8B",
  nord14 = "#A3BE8C",
  nord15 = "#B48EAD",
}

local colors = {
  fg = nord_colors.nord6,
  bg = nord_colors.nord3,
  darker_bg = nord_colors.nord1,
  bg_transparent = nord_colors.nord2,
  short_line_left = nord_colors.nord8,
  branch_name = nord_colors.nord15,
  diff_add = nord_colors.nord14,
  diff_modified = nord_colors.nord13,
  diff_remove = nord_colors.nord11,
  diagnostic_error = nord_colors.nord11,
  diagnostic_hint = nord_colors.nord10,
  diagnostic_info = nord_colors.nord8,
  diagnostic_warn = nord_colors.nord13,
  file_name = nord_colors.nord5,
  file_size = nord_colors.nord6,
  position_info = nord_colors.nord8,
  percent_info = nord_colors.nord13,
  normal_mode = nord_colors.nord8,
  insert_mode = nord_colors.nord6,
  visual_mode = nord_colors.nord7,
  termial_mode = nord_colors.nord11,
  other_mode = nord_colors.nord8,
  none = "NONE",
}

-- left section --

-- mode
table.insert(gls.left, {
  ViMode = {
    provider = function()
      local mode_map = {
        ['n']    = 'NORMAL',
        ['no']   = 'O-PENDING',
        ['nov']  = 'O-PENDING',
        ['noV']  = 'O-PENDING',
        ['no'] = 'O-PENDING',
        ['niI']  = 'NORMAL',
        ['niR']  = 'NORMAL',
        ['niV']  = 'NORMAL',
        ['v']    = 'VISUAL',
        ['V']    = 'V-LINE',
        ['']   = 'V-BLOCK',
        ['s']    = 'SELECT',
        ['S']    = 'S-LINE',
        ['']   = 'S-BLOCK',
        ['i']    = 'INSERT',
        ['ic']   = 'INSERT',
        ['ix']   = 'INSERT',
        ['R']    = 'REPLACE',
        ['Rc']   = 'REPLACE',
        ['Rv']   = 'V-REPLACE',
        ['Rx']   = 'REPLACE',
        ['c']    = 'COMMAND',
        ['cv']   = 'EX',
        ['ce']   = 'EX',
        ['r']    = 'REPLACE',
        ['rm']   = 'MORE',
        ['r?']   = 'CONFIRM',
        ['!']    = 'SHELL',
        ['t']    = 'TERMINAL',
      }

      -- return mode_map[vim.fn.mode()]
      local mode = mode_map[vim.fn.mode()]
      return string.format("  %s ", mode)
    end,
    separator = ' ',
    highlight = {colors.darker_bg, colors.normal_mode, 'bold'},
    separator_highlight = {colors.none, colors.darker_bg}
  },
})

-- filename
table.insert(gls.left, {
  FileName = {
    -- provider = 'FileName',
    provider = function()
      local file = vim.fn.expand('%:t')
      if vim.fn.empty(file) == 1 then return '' end
      return string.format("%s", file)
    end,
    condition = condition.buffer_not_empty,
    separator = ' ',
    highlight = {colors.file_name, colors.darker_bg},
    separator_highlight = {colors.none, colors.darker_bg}
  }
})

-- diff add
table.insert(gls.left, {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.check_git_workspace,
    icon = ' +',
    highlight = {colors.diff_add,colors.bg},
  }
})

-- diff modified
table.insert(gls.left, {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.check_git_workspace,
    icon = ' ~',
    highlight = {colors.diff_modified,colors.bg},
  }
})

-- diff remove
table.insert(gls.left, {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.check_git_workspace,
    icon = ' -',
    highlight = {colors.diff_remove,colors.bg},
  }
})

table.insert(gls.left, {
  Filler = {
    provider = function()
      return " "
    end,
    highlight = {colors.none, colors.bg},
  },
})

-- end left section --

-- right section --

-- diagnostic error
table.insert(gls.right, {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = 'E:',
    highlight = {colors.diagnostic_error,colors.bg},
  }
})

-- diagnostic warn
table.insert(gls.right, {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = 'W:',
    highlight = {colors.diagnostic_warn,colors.bg},
  }
})
-- diagnostic hint
table.insert(gls.right, {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = 'H:',
    highlight = {colors.diagnostic_hint,colors.bg},
  }
})
-- diagnostic warn
table.insert(gls.right, {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = 'I:',
    highlight = {colors.diagnostic_info,colors.bg},
  }
})

-- Tab
table.insert(gls.right, {
  Tabstop = {
    provider = function()
      return "spaces:" .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end,
    condition = condition.hide_in_width,
    separator = ' ',
    highlight = {colors.fg, colors.bg},
    separator_highlight = {colors.fg, colors.bg},
  },
})

-- file encode
table.insert(gls.right, {
  FileEncode = {
    -- provider = 'FileEncode',
    provider = function()
      local encode = vim.bo.fenc ~= '' and vim.bo.fenc or vim.o.enc
      return ' ' .. encode
    end,
    condition = condition.hide_in_width,
    separator = ' ',
    highlight = {colors.fg, colors.bg},
    separator_highlight = {colors.fg, colors.bg},
  }
})

-- file type name
table.insert(gls.right, {
  FileTypeName = {
    -- provider = 'FileTypeName',
    provider = function()
      return vim.bo.filetype
    end,
    condition = condition.buffer_not_empty,
    separator = '  ',
    highlight = {colors.fg, colors.bg},
    separator_highlight = {colors.fg, colors.bg},
  }
})

-- line percent
table.insert(gls.right, {
  LinePercent = {
    provider = 'LinePercent',
    condition = condition.buffer_not_empty,
    separator = '  ',
    highlight = {colors.fg, colors.darker_bg},
    separator_highlight = {colors.fg, colors.bg},
  }
})

-- line column
table.insert(gls.right, {
  LineColumn = {
    -- provider = 'LineColumn',
    provider = function()
      local line = vim.fn.line('.')
      local column = vim.fn.col('.')
      return string.format("%s:%s ", line, column)
      -- return string.format("Ln %s, Col %s ", line, column)
    end,
    condition = condition.buffer_not_empty,
    separator = ' ',
    highlight = {colors.fg, colors.darker_bg},
    separator_highlight = {colors.fg, colors.darker_bg},
  }
})

-- end right section

-- short line left
table.insert(gls.short_line_left, {
  BufferType = {
    provider = function()
      local short_list = gl.short_line_list
      for _,v in ipairs(short_list) do
        if v == vim.bo.filetype then
          return string.format("  %s ", vim.bo.filetype:upper())
        end
      end
      return ''
    end,
    separator = ' ',
    highlight = {colors.bg, colors.normal_mode, 'bold'},
    separator_highlight = {colors.none, colors.darker_bg},
  },
})

table.insert(gls.short_line_left, {
  SFileName = {
    provider = 'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg, colors.darker_bg}
  },
})
