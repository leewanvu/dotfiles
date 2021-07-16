local status_ok, gl = pcall(require, "galaxyline")
if not status_ok then
  return
end

local condition = require('galaxyline.condition')
local gls = gl.section

gl.short_line_list = {'NvimTree', 'startify', 'packer', 'ctrlsf', 'dashboard', 'toggleterm'}

local colors = {
  short_line_left = "#88C0D0", -- nord8
  branch_name = "#B48EAD", -- nord15
  diff_add = "#A3BE8C", -- nord14
  diff_modified = "#EBCB8B", -- nord13
  diff_remove = "#BF616A", -- nord11
  diagnostic_error = "#BF616A", -- nord11
  diagnostic_hint = "#5E81AC", -- nord10
  diagnostic_info = "#88C0D0", -- nord8
  diagnostic_warn = "#EBCB8B", -- nord13
  file_name = "#E5E9F0", -- nord5
  file_size = "#ECEFF4", -- nord6
  position_info = "#88C0D0", -- nord8
  percent_info = "#EBCB8B", -- nord13
  bg = "#3B4252", -- nord1
  -- bg = "#4C566A", -- nord3
  bg_transparent = "#434C5E", -- nord2
  none = "NONE",
  normal_mode = "#88C0D0", -- nord8
  insert_mode = "#A3BE8C", -- nord14
  visual_mode = "#D08770", -- nord12
  termial_mode = "#BF616A", -- nord11
  other_mode = "#88C0D0", -- nord8
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
      return string.format("[%s]", mode)
    end,
    separator = ' ',
    highlight = {colors.normal_mode, colors.bg, 'bold'},
    separator_highlight = {colors.none, colors.bg}
  },
})

-- filename
table.insert(gls.left, {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.branch_name, colors.bg},
  }
})

-- diff add
table.insert(gls.left, {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.check_git_workspace,
    icon = '+',
    highlight = {colors.diff_add,colors.bg},
  }
})

-- diff modified
table.insert(gls.left, {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.check_git_workspace,
    icon = '~',
    highlight = {colors.diff_modified,colors.bg},
  }
})

-- diff remove
table.insert(gls.left, {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.check_git_workspace,
    icon = '-',
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

-- line column
table.insert(gls.right, {
  LineColumn = {
    -- provider = 'LineColumn',
    provider = function()
      local line = vim.fn.line('.')
      local column = vim.fn.col('.')
      return string.format("%s : %s ", line, column)
      -- return string.format("Ln %s, Col %s ", line, column)
    end,
    separator = ' ',
    highlight = {colors.file_name, colors.bg},
    separator_highlight = {colors.file_name, colors.bg},
  }
})

-- line percent
-- table.insert(gls.right, {
--   LinePercent = {
--     provider = 'LinePercent',
--   }
-- })

-- Tab
table.insert(gls.right, {
  Tabstop = {
    provider = function()
      return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end,
    condition = condition.hide_in_width,
    separator = ' ',
    highlight = {colors.file_name, colors.bg},
    separator_highlight = {colors.file_name, colors.bg},
  },
})

-- file encode
table.insert(gls.right, {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    separator = ' ',
    highlight = {colors.file_name, colors.bg},
    separator_highlight = {colors.file_name, colors.bg},
  }
})

-- file type name
table.insert(gls.right, {
  FileTypeName = {
    provider = 'FileTypeName',
    condition = condition.buffer_not_empty,
    separator = ' ',
    highlight = {colors.file_name, colors.bg},
    separator_highlight = {colors.file_name, colors.bg},
  }
})

-- short line left
table.insert(gls.short_line_left, {
  BufferType = {
    provider = function()
      local short_list = gl.short_line_list
      for _,v in ipairs(short_list) do
        if v == vim.bo.filetype then
          return vim.bo.filetype:upper()
        end
      end
      return ''
    end,
    separator = " ",
    highlight = {colors.normal_mode, colors.bg, 'bold'},
    separator_highlight = {colors.file_name, colors.bg},
  },
})

table.insert(gls.short_line_left, {
  SFileName = {
    provider = 'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.file_name, colors.bg}
  },
})
