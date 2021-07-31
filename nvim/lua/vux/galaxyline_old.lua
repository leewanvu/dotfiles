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
-- local lspclient = require('galaxyline.provider_lsp')

local function get_colors()
  local colorscheme = vim.g.colors_name

  if colorscheme == 'everforest' then
    -- everforest - dark & hard
    return {
      short_line_left = "#7fbbb3",
      branch_name = "#d699b6",
      diff_add = "#a7c080",
      diff_modified = "#7fbbb3",
      diff_remove = "#e67e80",
      diagnostic_error = "#e67e80",
      diagnostic_hint = "#83c092",
      diagnostic_info = "#7fbbb3",
      diagnostic_warn = "#dbbc7f",
      file_name = "#d3c6aa",
      file_size = "#d3c6aa",
      position_info = "#7fbbb3",
      percent_info = "#e69875",
      bg = "#3a454a",
      bg_transparent = "#3a454a",
      none = "NONE",
      normal_mode = "#7fbbb3",
      insert_mode = "#a7c080",
      visual_mode = "#d699b6",
      termial_mode = "#e69875",
      other_mode = "#7fbbb3",
    }
  end

  -- nord
  return {
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
    bg_transparent = "#434C5E", -- nord2
    none = "NONE",
    normal_mode = "#88C0D0", -- nord8
    insert_mode = "#A3BE8C", -- nord14
    visual_mode = "#D08770", -- nord12
    termial_mode = "#BF616A", -- nord11
    other_mode = "#88C0D0", -- nord8
  }
end

local colors = get_colors()

-- whether or not transparent
if vim.g.vux.os == "linux" and vim.g.vux.is_bg_transparent then
  colors.bg = colors.bg_transparent
end

-- {label, fg}
local mode_map = {
  ['n'] = {'N', colors.normal_mode},
  ['i'] = {'I', colors.insert_mode},
  ['R'] = {'R', colors.other_mode},
  ['v'] = {'V', colors.visual_mode},
  ['V'] = {'V', colors.visual_mode},
  ['c'] = {'C', colors.other_mode},
  ['s'] = {'S', colors.other_mode},
  ['S'] = {'S', colors.other_mode},
  ['t'] = {'T', colors.termial_mode},
  [''] = {'V', colors.visual_mode},
  [''] = {'S', colors.other_mode},
  ['Rv'] = {'VIR'},
  ['rm'] = {'--MORE'},
}

-- local sep = {
--   right_filled = '', -- e0b2
--   left_filled = '', -- e0b0
--   right = '', -- e0b3
--   left = '', -- e0b1

--   --[[ left_filled = '',
--   left = '',
--   right_filled = '',
--   right = '', ]]
-- }

local icons = {
  -- error = '',
  error = "",
  -- warning = '',
  warning = "",
  -- info = '',
  info = "",
  -- hint = '',
  hint = "",
  git_branch = '',
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
        local label, fg = unpack(mode_hl())
        highlight('GalaxyViMode', fg, colors.bg, "bold")
        if vim.bo.filetype == 'help' then
          return '   Help'
        end
        return string.format('   %s  ', icons.mode)
      end,
    }
  },
  {
    GitBranch = {
      provider = function ()
        local branch = vcs.get_git_branch()
        if branch == nil then return '' end
        if wide_enough(85) then
          highlight('GalaxyGitBranch', colors.branch_name, colors.bg)
          return string.format(' %s %s ', icons.git_branch, branch)
        end
        return ''
      end,
      condition = condition.check_git_workspace,
      highlight = {colors.branch_name, colors.bg},
    }
  },
  {
    DiffAdd = {
      provider = function ()
        if wide_enough(95) then
          highlight('GalaxyDiffAdd', colors.diff_add, colors.bg)
          return vcs.diff_add()
        end
        return ''
      end,
      condition = condition.check_git_workspace,
      icon = ' +',
      highlight = {colors.diff_add, colors.bg},
    }
  },
  {
    DiffModified = {
      provider = function ()
        if wide_enough(95) then
          highlight('GalaxyDiffModified', colors.diff_modified, colors.bg)
          return vcs.diff_modified()
        end
        return ''
      end,
      condition = condition.check_git_workspace,
      icon = ' ~',
      highlight = {colors.diff_modified, colors.bg},
    }
  },
  {
    DiffRemove = {
      provider = function ()
        if wide_enough(95) then
          highlight('GalaxyDiffRemove', colors.diff_remove, colors.bg)
          return vcs.diff_remove()
        end
        return ''
      end,
      condition = condition.check_git_workspace,
      icon = ' -',
      highlight = {colors.diff_remove, colors.bg},
    }
  },
}

gls.right = {
  {
    DiagnosticError = {
      provider = function()
        local n = diagnostic.get_diagnostic_error()
        if n == '' or n == nil then return '' end
        highlight('GalaxyDiagnosticError', colors.diagnostic_error, colors.bg)
        return string.format(' %s %s', icons.error, n)
      end,
      highlight = {colors.diagnostic_error, colors.bg},
    }
  },
  {
    DiagnosticWarn = {
      provider = function()
        local n = diagnostic.get_diagnostic_warn()
        if n == '' or n == nil then return '' end
        highlight('GalaxyDiagnosticWarn', colors.diagnostic_warn, colors.bg)
        return string.format(' %s %s', icons.warning, n)
      end,
      highlight = {colors.diagnostic_warn, colors.bg},
    }
  },
  {
    DiagnosticHint = {
      provider = function()
        local n = diagnostic.get_diagnostic_hint()
        if n == '' or n == nil then return '' end
        highlight('GalaxyDiagnosticHint', colors.diagnostic_hint, colors.bg)
        return string.format(' %s %s', icons.hint, n)
      end,
      highlight = {colors.diagnostic_hint, colors.bg},
    }
  },
  {
    DiagnosticInfo = {
      provider = function()
        local n = diagnostic.get_diagnostic_info()
        if n == '' or n == nil then return '' end
        highlight('GalaxyDiagnosticInfo', colors.diagnostic_info, colors.bg)
        return string.format(' %s %s', icons.info, n)
      end,
      highlight = {colors.diagnostic_info, colors.bg},
    }
  },
  {
    FileIcon = {
      provider = function()
        if is_toggleterm() then return '' end
        local icon = fileinfo.get_file_icon()
        local fg = fileinfo.get_file_icon_color()
        highlight('GalaxyFileIcon', fg, colors.bg)

        return '  ' .. icon
      end,
      condition = buffer_not_empty,
    }
  },
  {
    FileName = {
      provider = function()
        if not buffer_not_empty() then return '' end
        if is_toggleterm() then return get_toggle_number() end
        local fname
        if wide_enough(120) then
          highlight('GalaxyFileName', colors.file_name, colors.bg)
          fname = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.')
        else
          fname = vim.fn.expand '%:t'
        end
        if #fname == 0 then return '' end
        return ' ' .. fname .. ''
      end,
      condition = buffer_not_empty,
      highlight = {colors.file_name, colors.bg},
    }
  },
  {
    FileSize = {
      provider = function()
        if not buffer_not_empty() then return '' end
        local filesize = fileinfo.get_file_size()
        highlight('GalaxyFileSize', colors.file_size, colors.bg)
        return ',' .. filesize
      end,
      condition = buffer_not_empty,
      highlight = {colors.file_size, colors.bg},
    }
  },
  {
    PositionInfo = {
      provider = function()
        if not buffer_not_empty() or is_toggleterm() or not wide_enough(60) then return '' end
        highlight('GalaxyPositionInfo', colors.position_info, colors.bg)
        return string.format(' %s,%s ', vim.fn.line('.'), vim.fn.col('.'))
      end,
      highlight = {colors.position_info, colors.bg}
    }
  },
  {
    PercentInfo = {
      provider = function ()
        if not buffer_not_empty() or is_toggleterm() or not wide_enough(65) then return '' end
        local percent = math.floor(100 * vim.fn.line('.') / vim.fn.line('$'))
        highlight('GalaxyPercentInfo', colors.percent_info, colors.bg)
        return string.format(' %s%s', percent, '% ')
      end,
      highlight = {colors.percent_info, colors.bg}
    }
  }
}

gl.short_line_list = {'NvimTree', 'startify', 'packer', 'ctrlsf', 'dashboard', 'toggleterm'}

local short_map = {
  ['startify'] = 'Starfity',
  ['NvimTree'] = 'NvimTree',
  ['packer'] = 'Packer',
  -- ['help'] = 'Help',
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
        highlight('GalaxyShortLeftBufferType', colors.short_line_left, colors.bg)
        return string.format('   %s ', name)
      end,
      highlight = {colors.short_line_left, colors.bg, 'bold'},
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
        highlight('GalaxyShortRightFileName', colors.file_name, colors.bg)
        return ' ' .. fname .. ' '
      end,
      condition = buffer_not_empty,
      highlight = {colors.file_name, colors.bg},
    }
  },
}
