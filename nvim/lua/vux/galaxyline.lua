local gl = require 'galaxyline'
local gls = gl.section
-- local devicons = require 'nvim-web-devicons'
local diagnostic = require('galaxyline.provider_diagnostic')
local vcs = require('galaxyline.provider_vcs')
local fileinfo = require('galaxyline.provider_fileinfo')
-- local extension = require('galaxyline.provider_extensions')
-- local colors = require('galaxyline.colors')
-- local buffer = require('galaxyline.provider_buffer')
-- local whitespace = require('galaxyline.provider_whitespace')
local lspclient = require('galaxyline.provider_lsp')
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

-- {label, fg, nested_fg}
local mode_map = {
  ['n'] = {'NORMAL', colors.nord8, colors.nord3},
  ['i'] = {'INSERT', colors.nord14, colors.nord3},
  ['R'] = {'REPLACE', colors.nord7, colors.nord3},
  ['v'] = {'VISUAL', colors.nord13, colors.nord3},
  ['V'] = {'V-LINE', colors.nord13, colors.nord3},
  ['c'] = {'COMMAND', colors.nord7, colors.nord3},
  ['s'] = {'SELECT', colors.nord7, colors.nord3},
  ['S'] = {'S-LINE', colors.nord7, colors.nord3},
  ['t'] = {'TERMINAL', colors.nord12, colors.nord3},
  [''] = {'V-BLOCK', colors.nord13, colors.nord3},
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
  page = '', -- 2630
  line_number = '', -- e0a1
  connected = '',
  disconnected = '',
  error = '',
  warning = '𥉉',
  info = '',
  git_branch = '',
}

-- {label, fg, nested_fg}
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

local function wide_enough(width)
  local squeeze_width = vim.fn.winwidth(0)
  if squeeze_width > width then return true end
  return false
end

gls.left = {
  {
    ViMode = {
      provider = function()
        local label, fg, nested_fg = unpack(mode_hl())
        highlight('GalaxyViMode', colors.nord0, fg, "bold")
        highlight('GalaxyViModeInv', fg, colors.nord0)
        highlight('GalaxyViModeNested', colors.nord6, nested_fg)
        highlight('GalaxyGitNested', colors.nord15, nested_fg)
        highlight('GalaxyViModeInvNested', nested_fg, colors.nord0)
        highlight('GalaxyBreakLeft', colors.nord0, nested_fg)
        highlight('GalaxyBreakRight', colors.nord0, nested_fg)
        highlight('DiffAdd', colors.nord14, colors.nord0)
        highlight('DiffChange', colors.nord13, colors.nord0)
        highlight('DiffDelete', colors.nord11, colors.nord0)
        return string.format('  %s ', label)
      end,
      separator = sep.left_filled,
      separator_highlight = 'GalaxyViModeInv',
    }
  },
  {
    LeftSep1 = {
      provider = function() return sep.left_filled .. ' ' end,
      highlight = 'GalaxyBreakLeft',
    }
  },
  {
    GitIcon = {
      provider = function ()
        if wide_enough(85) then
          return icons.git_branch .. ' '
        end
        return ''
      end,
      condition = vcs.check_git_workspace,
      highlight = 'GalaxyGitNested',
    }
  },
  {
    GitBranch = {
      provider = function ()
        if wide_enough(85) then
          return vcs.get_git_branch() .. ' '
        end
        return ''
      end,
      condition = vcs.check_git_workspace,
      highlight = 'GalaxyGitNested',
      separator = sep.left_filled,
      separator_highlight = {colors.nord3,colors.nord0},
    }
  },
  {
    DiffAdd = {
      provider = function ()
        if wide_enough(95) then
          return vcs.diff_add()
        end
        return ''
      end,
      condition = vcs.check_git_workspace,
      icon = ' +',
      highlight = {colors.nord14, colors.nord0},
    }
  },
  {
    DiffModified = {
      provider = function ()
        if wide_enough(95) then
          return vcs.diff_modified()
        end
        return ''
      end,
      condition = vcs.check_git_workspace,
      icon = ' ~',
      highlight = {colors.nord13, colors.nord0},
    }
  },
  {
    DiffRemove = {
      provider = function ()
        if wide_enough(95) then
          return vcs.diff_remove()
        end
        return ''
      end,
      condition = vcs.check_git_workspace,
      icon = ' -',
      highlight = {colors.nord11, colors.nord0},
    }
  }
}

gls.right = {
  {
    LspClient = {
      provider = function()
        local lsp = lspclient.get_lsp_client('')
        local lsp_icon = icons.connected
        if lsp == '' then
          lsp_icon = icons.disconnected
          lsp = 'no lsp'
        end
        if wide_enough(90) then
          return string.format(' %s  %s ', lsp_icon, lsp)
        end
        return string.format(' %s  ', lsp_icon)
      end,
      highlight = {colors.nord8, colors.nord3},
      separator = sep.right_filled,
      separator_highlight = {colors.nord3,colors.nord0},
    }
  },
  {
    LspRightSepInv = {
      provider = function() return sep.right_filled end,
      highlight = {colors.nord0,colors.nord3},
    }
  },
  {
    DiagnosticError = {
      provider = function()
        local n = diagnostic.get_diagnostic_error()
        if n == '' or n == nil then return '' end
        return string.format('  %s %s', icons.error, n)
      end,
      highlight = {colors.nord11, colors.nord0},
    }
  },
  {
    DiagnosticWarn = {
      provider = function()
        local n = diagnostic.get_diagnostic_warn()
        if n == '' or n == nil then return '' end
        return string.format('  %s %s', icons.warning, n)
      end,
      highlight = {colors.nord13, colors.nord0},
    }
  },
  {
    DiagnosticHint = {
      provider = function()
        local n = diagnostic.get_diagnostic_hint()
        if n == '' or n == nil then return '' end
        return string.format('  %s %s', icons.info, n)
      end,
      highlight = {colors.nord8, colors.nord0},
    }
  },
  {
    LspRightSep = {
      provider = function() return sep.right_filled end,
      highlight = {colors.nord3,colors.nord0},
    }
  },
  {
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
  },
  {
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
        -- if not vim.bo.modifiable then fname = fname .. ' ' .. icons.not_modifiable end
        -- if vim.bo.modified then fname = fname .. ' ' .. icons.pencil end
        return ' ' .. fname .. ' '
      end,
      highlight = 'GalaxyViModeNested',
      condition = buffer_not_empty,
    }
  },
  {
    RightBreak1 = {
      provider = function() return sep.right_filled end,
      highlight = 'GalaxyBreakRight',
    }
  },
  {
    PositionInfo = {
      provider = function()
        if not buffer_not_empty() or not wide_enough(60) then return '' end
        return string.format(' %s %s:%s ', icons.line_number, vim.fn.line('.'), vim.fn.col('.'))
      end,
      highlight = 'GalaxyViMode',
      separator = sep.right_filled,
      separator_highlight = 'GalaxyViModeInv'
    }
  },
  {
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
}

gl.short_line_list = {'NvimTree', 'startify', 'packer'}

local short_map = {
  ['startify'] = 'Starfity',
  ['NvimTree'] = 'NvimTree',
  ['packer'] = 'Packer',
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
      highlight('GalaxyViMode', colors.nord0, fg)
      highlight('GalaxyViModeInv', fg, nested_fg)
      highlight('GalaxyViModeInvNested', nested_fg, colors.nord0)
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
