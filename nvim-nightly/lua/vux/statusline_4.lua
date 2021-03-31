local gl = require 'galaxyline'
local gls = gl.section
-- local devicons = require 'nvim-web-devicons'
local diagnostic = require('galaxyline.provider_diagnostic')
local vcs = require('galaxyline.provider_vcs')
local fileinfo = require('galaxyline.provider_fileinfo')
local extension = require('galaxyline.provider_extensions')
-- local colors = require('galaxyline.colors')
local buffer = require('galaxyline.provider_buffer')
local whitespace = require('galaxyline.provider_whitespace')
local lspclient = require('galaxyline.provider_lsp')

gl.short_line_list = {'NvimTree', 'startify'}

-- nord
local colors = {
  nord0 = "#2E3440",
  nord1 = "#3B4252",
  nord2 = "#434C5E",
  nord3 = "#4C566A",
  nord3_bright = "#616E88",
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
  none = "NONE",
}

local mode_map = {
  ['n'] = {'NORMAL', colors.nord8, colors.nord3},
  ['i'] = {'INSERT', colors.nord14, colors.nord3},
  ['R'] = {'REPLACE', colors.bright_red, colors.nord3},
  ['v'] = {'VISUAL', colors.nord15, colors.nord3},
  ['V'] = {'V-LINE', colors.nord15, colors.nord3},
  ['c'] = {'COMMAND', colors.nord8, colors.nord3},
  ['s'] = {'SELECT', colors.nord8, colors.nord3},
  ['S'] = {'S-LINE', colors.nord8, colors.nord3},
  ['t'] = {'TERMINAL', colors.nord8, colors.nord3},
  [''] = {'V-BLOCK', colors.nord15, colors.nord3},
  [''] = {'S-BLOCK', colors.nord7, colors.nord3},
  ['Rv'] = {'VIRTUAL'},
  ['rm'] = {'--MORE'},
}

local sep = {
  right_filled = '', -- e0b2
  left_filled = '', -- e0b0
  right = '', -- e0b3
  left = '', -- e0b1
}

local icons = {
  locker = '', -- f023
  not_modifiable = '', -- f05e
  unsaved = '', -- f0c7
  pencil = '', -- f040
  dos = '', -- e70f
  unix = '', -- f17c
  mac = '', -- f179
  page = '☰', -- 2630
  line_number = '', -- e0a1
  connected = '', -- f817
  disconnected = '', -- f818
  error = '', -- f658
  warning = '', -- f06a
  info = '', -- f05a
}

local function mode_hl()
  local mode = mode_map[vim.fn.mode()]
  if mode == nil then
    mode = mode_map['v']
    return {'V-BLOCK', mode[2], mode[3]}
  end
  return mode
end

local function highlight(group, fg, bg, gui)
  local cmd = string.format('highlight %s guifg=%s guibg=%s', group, fg, bg)
  if gui ~= nil then cmd = cmd .. ' gui=' .. gui end
  vim.cmd(cmd)
end

local function buffer_not_empty()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then return true end
  return false
end

local function diagnostic_exists()
  return not vim.tbl_isempty(vim.lsp.buf_get_clients(0))
end

local function wide_enough(width)
  local squeeze_width = vim.fn.winwidth(0)
  if squeeze_width > width then return true end
  return false
end

gls.left[1] = {
  ViMode = {
    provider = function()
      local label, fg, nested_fg = unpack(mode_hl())
      highlight('GalaxyViMode', colors.nord1, fg, "bold")
      highlight('GalaxyViModeInv', fg, nested_fg)
      highlight('GalaxyViModeNested', colors.nord6, nested_fg)
      highlight('GalaxyViModeInvNested', nested_fg, colors.nord1)
      highlight('DiffAdd', colors.nord14, colors.nord1)
      highlight('DiffChange', colors.nord13, colors.nord1)
      highlight('DiffDelete', colors.nord11, colors.nord1)
      return string.format('  %s ', label)
    end,
    separator = sep.left_filled,
    separator_highlight = 'GalaxyViModeInv',
  }
}
gls.left[2] = {
  GitIcon = {
    provider = function ()
      if wide_enough(85) then
        return '  '
      end
      return ''
    end,
    condition = vcs.check_git_workspace,
    highlight = {colors.nord15, mode_hl()[3]},
  }
}
gls.left[3] = {
  GitBranch = {
    provider = function ()
      if wide_enough(85) then
        return vcs.get_git_branch()
      end
      return ''
    end,
    condition = vcs.check_git_workspace,
    highlight = {colors.nord15, mode_hl()[3]},
  }
}
gls.left[4] = {
  LeftSep = {
    provider = function() return sep.left_filled .. ' ' end,
    highlight = 'GalaxyViModeInvNested',
  }
}
gls.left[5] = {
  DiffAdd = {
    provider = function ()
      if wide_enough(95) then
        return vcs.diff_add()
      end
      return ''
    end,
    condition = vcs.check_git_workspace,
    icon = '+',
    highlight = {colors.nord14, colors.nord1},
  }
}
gls.left[6] = {
  DiffModified = {
    provider = function ()
      if wide_enough(95) then
        return vcs.diff_modified()
      end
      return ''
    end,
    condition = vcs.check_git_workspace,
    icon = '~',
    highlight = {colors.nord13, colors.nord1},
  }
}
gls.left[7] = {
  DiffRemove = {
    provider = function ()
      if wide_enough(95) then
        return vcs.diff_remove()
      end
      return ''
    end,
    condition = vcs.check_git_workspace,
    icon = '-',
    highlight = {colors.nord11, colors.nord1},
  }
}
gls.left[8] = {
  DiagnosticWarn = {
    provider = function()
      local n = vim.lsp.diagnostic.get_count(0, 'Warning')
      if n == 0 then return '' end
      return string.format(' %s %d ', icons.warning, n)
    end,
    highlight = {colors.nord13, colors.nord1},
  }
}
gls.left[9] = {
  DiagnosticError = {
    provider = function()
      local n = vim.lsp.diagnostic.get_count(0, 'Error')
      if n == 0 then return '' end
      return string.format(' %s %d ', icons.error, n)
    end,
    highlight = {colors.nord11, colors.nord1},
  }
}

-- gls.right[1] = {
--   CocStatus = {
--     provider = function ()
--       if not buffer_not_empty() or not wide_enough(110) then return '' end
--       return '  ' .. vim.fn['coc#status']()
--     end,
--     highlight = {colors.nord15, colors.nord1},
--   }
-- }

gls.right[1] = {
  LspStatus = {
    provider = function()
      local connected = diagnostic_exists()
      if connected then
        return '  ' .. icons.connected .. '  '
      else
        return ''
      end
    end,
    highlight = {colors.nord8, colors.nord1},
  }
}
gls.right[2] = {
  RightSepNested = {
    provider = function() return sep.right_filled end,
    highlight = 'GalaxyViModeInvNested',
  }
}
gls.right[3] = {
  FileIcon = {
    provider = function()
      local icon = fileinfo.get_file_icon()
      local fg = fileinfo.get_file_icon_color()
      local _, _, bg = unpack(mode_hl())
      highlight('GalaxyFileIcon', fg, bg)

      return '  ' .. icon
    end,
    condition = buffer_not_empty,
  }
  -- FileIcon = {
  --   provider = "FileIcon",
  --   condition = buffer_not_empty,
  --   highlight = {fileinfo.get_file_icon_color, colors.nord1}
  -- }
}
gls.right[4] = {
  FileName = {
    provider = function()
      if not buffer_not_empty() then return '' end
      local fname
      if wide_enough(120) then
        fname = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.')
      else
        fname = vim.fn.expand '%:t'
      end
      if #fname == 0 then return '' end
      if vim.bo.readonly then fname = fname .. ' ' .. icons.locker end
      if not vim.bo.modifiable then fname = fname .. ' ' .. icons.not_modifiable end
      if vim.bo.modified then fname = fname .. ' ' .. icons.pencil end
      return ' ' .. fname .. ' '
    end,
    highlight = 'GalaxyViModeNested',
    -- highlight = {colors.nord6, colors.nord1},
    condition = buffer_not_empty,
  }
}
-- gls.right[5] = {
--   FileFormat = {
--     provider = function()
--       if not buffer_not_empty() or not wide_enough(70) then return '' end
--       local icon = icons[vim.bo.fileformat] or ''
--       return string.format('  %s %s ', icon, vim.bo.fileencoding)
--     end,
--     highlight = 'GalaxyViModeNested',
--   }
-- }
gls.right[6] = {
  RightSep = {
    provider = function() return sep.right_filled end,
    highlight = 'GalaxyViModeInv',
  }
}
gls.right[7] = {
  PositionInfo = {
    provider = function()
      if not buffer_not_empty() or not wide_enough(60) then return '' end
      return string.format('  %s %s:%s ', icons.line_number, vim.fn.line('.'), vim.fn.col('.'))
    end,
    highlight = 'GalaxyViMode',
  }
}
gls.right[8] = {
  PercentInfo = {
    provider = function ()
      if not buffer_not_empty() or not wide_enough(65) then return '' end
      local percent = math.floor(100 * vim.fn.line('.') / vim.fn.line('$'))
      return string.format(' %s %s%s', icons.page, percent, '% ')
    end,
    highlight = 'GalaxyViMode',
    separator = sep.right,
    separator_highlight = 'GalaxyViMode',
  }
}

local short_map = {
  ['startify'] = 'Starfity',
  ['NvimTree'] = 'NvimTree',
}

function has_file_type()
    local f_type = vim.bo.filetype
    if not f_type or f_type == '' then
        return false
    end
    return true
end

gls.short_line_left[1] = {
  BufferType = {
    provider = function ()
      local label, fg, nested_fg = unpack(mode_hl())
      highlight('GalaxyViMode', colors.nord1, fg)
      highlight('GalaxyViModeInv', fg, nested_fg)
      highlight('GalaxyViModeInvNested', nested_fg, colors.nord1)
      local name = short_map[vim.bo.filetype] or 'Editor'
      return string.format('  %s ', name)
    end,
    highlight = 'GalaxyViMode',
    condition = has_file_type,
    separator = sep.left_filled,
    separator_highlight = 'GalaxyViModeInv',
  }
}
gls.short_line_left[2] = {
  ShortLeftSepNested = {
    provider = function() return sep.left_filled end,
    highlight = 'GalaxyViModeInvNested',
  }
}
gls.short_line_right[1] = {
  ShortRightSepNested = {
    provider = function() return sep.right_filled end,
    highlight = 'GalaxyViModeInvNested',
  }
}
gls.short_line_right[2] = {
  ShortRightSep = {
    provider = function() return sep.right_filled end,
    highlight = 'GalaxyViModeInv',
  }
}
