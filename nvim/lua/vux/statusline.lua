local gl = require 'galaxyline'
local gls = gl.section
local diagnostic = require('galaxyline.provider_diagnostic')
local vcs = require('galaxyline.provider_vcs')
local fileinfo = require('galaxyline.provider_fileinfo')
local condition = require('galaxyline.condition')
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
  ['n'] = {'N', colors.nord8, colors.nord0},
  ['i'] = {'I', colors.nord14, colors.nord0},
  ['R'] = {'R', colors.nord7, colors.nord0},
  ['v'] = {'V', colors.nord12, colors.nord0},
  ['V'] = {'V', colors.nord12, colors.nord0},
  ['c'] = {'C', colors.nord11, colors.nord0},
  ['s'] = {'S', colors.nord11, colors.nord0},
  ['S'] = {'S', colors.nord11, colors.nord0},
  ['t'] = {'T', colors.nord11, colors.nord0},
  [''] = {'V', colors.nord12, colors.nord0},
  [''] = {'S', colors.nord11, colors.nord0},
  ['Rv'] = {'VIR'},
  ['rm'] = {'--MORE'},
}

local sep = {
  right_filled = '', -- e0b2
  left_filled = '', -- e0b0
  right = '', -- e0b3
  left = '', -- e0b1

  --[[ left_filled = '',
  left = '',
  right_filled = '',
  right = '', ]]
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
  -- error = '',
  -- warning = '𥉉',
  -- info = '',
  error = '',
  warning = '',
  info = '',
  hint = '',
  git_branch = '',
  -- git_branch = '',
  terminal = 'ﲵ',
  mode = '', -- 
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

local function is_toggleterm()
  if vim.bo.filetype == 'toggleterm' then return true end
  return false
end

local function get_toggle_number()
  if is_toggleterm() then return icons.terminal .. ' term:' .. vim.b.toggle_number .. ' ' end
  return ''
end

gls.left = {
  {
    ViMode = {
      provider = function()
        local label, fg, nested_fg = unpack(mode_hl())
        highlight('GalaxyViMode', fg, colors.nord1, "bold")
        return string.format('   %s  ', icons.mode)
      end,
      -- highlight = {colors.nord13,colors.nord1},
    }
  },
  {
    GitIcon = {
      provider = function ()
        if wide_enough(85) then
          return ' ' .. icons.git_branch .. ' '
        end
        return ''
      end,
      condition = condition.check_git_workspace,
      highlight = {colors.nord15, colors.nord1},
    }
  },
  {
    GitBranch = {
      provider = function ()
        if wide_enough(85) then
          -- return ' ' .. icons.git_branch .. ' ' .. vcs.get_git_branch() .. ' '
          return vcs.get_git_branch() .. ' '
        end
        return ''
      end,
      condition = condition.check_git_workspace,
      highlight = {colors.nord15, colors.nord1},
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
      condition = condition.check_git_workspace,
      icon = ' +',
      highlight = {colors.nord14, colors.nord1},
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
      condition = condition.check_git_workspace,
      icon = ' ~',
      highlight = {colors.nord13, colors.nord1},
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
      condition = condition.check_git_workspace,
      icon = ' -',
      highlight = {colors.nord11, colors.nord1},
    }
  },
  --[[ {
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
      highlight = {colors.nord8, colors.nord1,'italic'},
    }
  }, ]]
}

gls.right = {
  {
    DiagnosticError = {
      provider = function()
        local n = diagnostic.get_diagnostic_error()
        if n == '' or n == nil then return '' end
        return string.format(' %s %s', icons.error, n)
      end,
      highlight = {colors.nord11, colors.nord1},
    }
  },
  {
    DiagnosticWarn = {
      provider = function()
        local n = diagnostic.get_diagnostic_warn()
        if n == '' or n == nil then return '' end
        return string.format(' %s %s', icons.warning, n)
      end,
      highlight = {colors.nord13, colors.nord1},
    }
  },
  {
    DiagnosticHint = {
      provider = function()
        local n = diagnostic.get_diagnostic_hint()
        if n == '' or n == nil then return '' end
        return string.format(' %s %s', icons.hint, n)
      end,
      highlight = {colors.nord10, colors.nord1},
    }
  },
  {
    FileIcon = {
      provider = function()
        if is_toggleterm() then return '' end
        local icon = fileinfo.get_file_icon()
        local fg = fileinfo.get_file_icon_color()
        highlight('GalaxyFileIcon', fg, colors.nord1)

        return '  ' .. icon
      end,
      condition = buffer_not_empty,
      -- highlight = {colors.nord15, colors.nord1},
    }
  },
  {
    FileName = {
      provider = function()
        if not buffer_not_empty() then return '' end
        if is_toggleterm() then return get_toggle_number() end
        local fname
        if wide_enough(120) then
          fname = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.')
        else
          fname = vim.fn.expand '%:t'
        end
        if #fname == 0 then return '' end
        return ' ' .. fname .. ' '
      end,
      condition = buffer_not_empty,
      highlight = {colors.nord5, colors.nord1},
    }
  },
  {
    FileSize = {
      provider = 'FileSize',
      condition = buffer_not_empty,
      highlight = {colors.nord6, colors.nord1},
    }
  },
  {
    PositionInfo = {
      provider = function()
        if not buffer_not_empty() or is_toggleterm() or not wide_enough(60) then return '' end
        return string.format(' %s,%s ', vim.fn.line('.'), vim.fn.col('.'))
      end,
      highlight = {colors.nord8, colors.nord1}
    }
  },
  {
    PercentInfo = {
      provider = function ()
        if not buffer_not_empty() or is_toggleterm() or not wide_enough(65) then return '' end
        local percent = math.floor(100 * vim.fn.line('.') / vim.fn.line('$'))
        return string.format(' %s%s', percent, '% ')
      end,
      highlight = {colors.nord13, colors.nord1}
    }
  }
}

gl.short_line_list = {'NvimTree', 'startify', 'packer', 'help', 'ctrlsf', 'dashboard', 'toggleterm'}

local short_map = {
  ['startify'] = 'Starfity',
  ['NvimTree'] = 'NvimTree',
  ['packer'] = 'Packer',
  ['help'] = 'Help',
  ['ctrlsf'] = 'CtrlSF',
  ['dashboard'] = 'Dashboard',
  -- ['toggleterm'] = 'ToggleTerm',
}

function has_file_type()
    local f_type = vim.bo.filetype
    if not f_type or f_type == '' then
        return false
    end
    return true
end

gls.short_line_left = {
  {
    ShortLeftBufferType = {
      provider = function ()
        local name = short_map[vim.bo.filetype] or icons.mode
        return string.format('  %s ', name)
      end,
      highlight = {colors.nord8,colors.nord1,'bold'},
      condition = has_file_type,
    }
  }
}
gls.short_line_right = {
  {
    ShortRightFileName = {
      provider = function()
        if not buffer_not_empty() then return '' end
        if is_toggleterm() then return get_toggle_number() end
        if short_map[vim.bo.filetype] then return '' end
        local fname
        if wide_enough(120) then
          fname = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.')
        else
          fname = vim.fn.expand '%:t'
        end
        if #fname == 0 then return '' end
        return ' ' .. fname .. ' '
      end,
      condition = buffer_not_empty,
      highlight = {colors.nord5, colors.nord1},
    }
  },
}
