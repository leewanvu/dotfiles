local status_ok, gl = pcall(require, "galaxyline")
if not status_ok then
  return
end

local condition = require('galaxyline.condition')
local gls = gl.section
local get_color = require("vux.colors").get_color

gl.short_line_list = {'NvimTree', 'startify', 'packer', 'ctrlsf', 'dashboard'} -- toggleterm

local function wide_enough(width)
  local squeeze_width = vim.fn.winwidth(0)
  if squeeze_width > width then return true end
  return false
end

-- left section --

-- mode
-- table.insert(gls.left, {
--   ViMode = {
--     provider = function()
--       local mode_map = {
--         ['n']    = 'NORMAL',
--         ['no']   = 'O-PENDING',
--         ['nov']  = 'O-PENDING',
--         ['noV']  = 'O-PENDING',
--         ['niI']  = 'NORMAL',
--         ['niR']  = 'NORMAL',
--         ['niV']  = 'NORMAL',
--         ['v']    = 'VISUAL',
--         ['V']    = 'V-LINE',
--         ['']     = 'V-BLOCK',
--         ['s']    = 'SELECT',
--         ['S']    = 'S-LINE',
--         ['i']    = 'INSERT',
--         ['ic']   = 'INSERT',
--         ['ix']   = 'INSERT',
--         ['R']    = 'REPLACE',
--         ['Rc']   = 'REPLACE',
--         ['Rv']   = 'V-REPLACE',
--         ['Rx']   = 'REPLACE',
--         ['c']    = 'COMMAND',
--         ['cv']   = 'EX',
--         ['ce']   = 'EX',
--         ['r']    = 'REPLACE',
--         ['rm']   = 'MORE',
--         ['r?']   = 'CONFIRM',
--         ['!']    = 'SHELL',
--         ['t']    = 'TERMINAL',
--       }

--       -- return mode_map[vim.fn.mode()]
--       local mode = mode_map[vim.fn.mode()]
--       if mode == nil then
--         mode = 'V-BLOCK'
--       end
--       return string.format("  %s ", mode)
--     end,
--     -- separator = ' ',
--     highlight = {get_color("bg"), get_color("cyan"), 'bold'},
--     -- separator_highlight = {get_color("fg"), get_color("bg")}
--   },
-- })

-- filename
table.insert(gls.left, {
  FileName = {
    -- provider = 'FileName',
    provider = function()
      local file
      if wide_enough(120) then
        file = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.')
      else
        file = vim.fn.expand('%:t')
      end
      if vim.fn.empty(file) == 1 then return '' end
      return string.format("  %s ", file)
    end,
    condition = condition.buffer_not_empty,
    -- separator = ' ',
    highlight = {get_color("cyan"), get_color("bg"), "bold"},
    -- separator_highlight = {get_color("fg"), get_color("bg")}
  }
})

-- diff add
table.insert(gls.left, {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.check_git_workspace,
    icon = '+',
    highlight = {get_color("green"), get_color("bg")},
  }
})

-- diff modified
table.insert(gls.left, {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.check_git_workspace,
    icon = '~',
    highlight = {get_color("yellow"), get_color("bg")},
  }
})

-- diff remove
table.insert(gls.left, {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.check_git_workspace,
    icon = '-',
    highlight = {get_color("red"),get_color("bg")},
  }
})

-- whitespace
table.insert(gls.left, {
  WhiteSpace = {
    provider = 'WhiteSpace',
    condition = condition.buffer_not_empty,
    highlight = {get_color("fg"), get_color("bg")},
  }
})

table.insert(gls.left, {
  Filler = {
    provider = function()
      return " "
    end,
    highlight = {get_color("fg"), get_color("bg")},
  },
})

-- end left section --

-- right section --

-- diagnostic error
table.insert(gls.right, {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = 'E:',
    highlight = {get_color("red"),get_color("bg")},
  }
})

-- diagnostic warn
table.insert(gls.right, {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = 'W:',
    highlight = {get_color("yellow"),get_color("bg")},
  }
})

-- diagnostic hint
table.insert(gls.right, {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = 'H:',
    highlight = {get_color("blue"),get_color("bg")},
  }
})

-- diagnostic info
table.insert(gls.right, {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = 'I:',
    highlight = {get_color("fg"),get_color("bg")},
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
    highlight = {get_color("fg"), get_color("bg")},
    separator_highlight = {get_color("fg"), get_color("bg")},
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
    highlight = {get_color("fg"), get_color("bg")},
    separator_highlight = {get_color("fg"), get_color("bg")},
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
    highlight = {get_color("fg"), get_color("bg")},
    separator_highlight = {get_color("fg"), get_color("bg")},
  }
})

-- line percent
table.insert(gls.right, {
  LinePercent = {
    provider = 'LinePercent',
    condition = condition.buffer_not_empty,
    separator = '  ',
    highlight = {get_color("fg"), get_color("bg")},
    separator_highlight = {get_color("fg"), get_color("bg")},
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
    highlight = {get_color("fg"), get_color("bg")},
    separator_highlight = {get_color("fg"), get_color("bg")},
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
          return string.format("  %s ", vim.bo.filetype:lower())
        end
      end
      return ''
    end,
    separator = ' ',
    highlight = {get_color("cyan"), get_color("bg"), 'bold'},
    separator_highlight = {get_color("fg"), get_color("bg")},
  },
})

table.insert(gls.short_line_left, {
  SFileName = {
    provider = 'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {get_color("fg"), get_color("bg")}
  },
})
