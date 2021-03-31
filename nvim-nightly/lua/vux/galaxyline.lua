local gl = require('galaxyline')
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
local condition = require('galaxyline.condition')
local gls = gl.section

gl.short_line_list = {'NvimTree', 'packer'}

local mode_map = {
    ['n'] = {'NORMAL', colors.nord8},
    ['i'] = {'INSERT', colors.nord14},
    ['R'] = {'REPLACE', colors.nord12},
    ['v'] = {'VISUAL', colors.nord7},
    ['V'] = {'V-LINE', colors.nord7},
    ['c'] = {'COMMAND', colors.nord7},
    ['s'] = {'SELECT', colors.nord13},
    ['S'] = {'S-LINE', colors.nord13},
    ['t'] = {'TERMINAL', colors.nord8},
    [''] = {'V-BLOCK', colors.nord7},
    [''] = {'S-BLOCK', colors.nord13},
    ['Rv'] = {'VIRTUAL'},
    ['rm'] = {'--MORE'},
}
-- Convert UTF-8 hex code to character
local u = function(code)
    if type(code) == 'string' then code = tonumber('0x' .. code) end
    local c = string.char
    if code <= 0x7f then return c(code) end
    local t = {}
    if code <= 0x07ff then
        t[1] = c(bit.bor(0xc0, bit.rshift(code, 6)))
        t[2] = c(bit.bor(0x80, bit.band(code, 0x3f)))
    elseif code <= 0xffff then
        t[1] = c(bit.bor(0xe0, bit.rshift(code, 12)))
        t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
        t[3] = c(bit.bor(0x80, bit.band(code, 0x3f)))
    else
        t[1] = c(bit.bor(0xf0, bit.rshift(code, 18)))
        t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 12), 0x3f)))
        t[3] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
        t[4] = c(bit.bor(0x80, bit.band(code, 0x3f)))
    end
    return table.concat(t)
end

local sep = {
    right_filled = u '2590',
    left_filled = u '258c',
    -- right_filled = u 'e0b2',
    -- left_filled = u 'e0b0',
    right = u '2503',
    left = u '2503',
    -- right = u 'e0b3',
    -- left = u 'e0b1',
}

local icons = {
    locker = u 'f023',
    unsaved = u 'f693',
    dos = u 'e70f',
    unix = u 'f17c',
    mac = u 'f179',
    lsp_warn = u 'f071',
    lsp_error = u 'f46e',
}

local function mode_label() return mode_map[vim.fn.mode()][1] or 'N/A' end
local function mode_hl() return mode_map[vim.fn.mode()][2] or colors.none end

local function highlight(group, fg, bg, gui)
    local cmd = string.format('highlight %s guifg=%s guibg=%s', group, fg, bg)
    if gui ~= nil then cmd = cmd .. ' gui=' .. gui end
    vim.cmd(cmd)
end

gls.left[1] = {
  ViMode = {
      provider = function()
          local modehl = mode_hl()
          highlight('GalaxyViMode', colors.nord1, modehl, 'bold')
          highlight('GalaxyViModeInv', modehl, colors.nord1, 'bold')
          return string.format('  %s ', mode_label())
      end,
      separator = sep.left_filled,
      separator_highlight = 'GalaxyViModeInv',
  }
}

-- gls.left[1] = {
--   FirstElement = {
--     -- provider = function() return '▊ ' end,
--     provider = function()
--       return "  "
--     end,
--     highlight = {colors.nord8, colors.none}
--   }
-- }

-- gls.left[2] = {
--   ViMode = {
--     provider = function()
--       -- auto change color according the vim mode
--       local mode_color = {
--         n = colors.nord7,
--         i = colors.nord14,
--         v = colors.nord15,
--         [""] = colors.nord15,
--         V = colors.nord15,
--         c = colors.nord13,
--         no = colors.nord15,
--         s = colors.nord12,
--         S = colors.nord12,
--         [""] = colors.nord12,
--         ic = colors.nord13,
--         R = colors.nord11,
--         Rv = colors.nord11,
--         cv = colors.nord11,
--         ce = colors.nord11,
--         r = colors.nord8,
--         rm = colors.nord8,
--         ["r?"] = colors.nord8,
--         ["!"] = colors.nord11,
--         t = colors.nord11
--       }
--       vim.cmd("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()])
--       return "     "
--     end,
--     highlight = {colors.nord11, colors.none, "bold"}
--   }
-- }

-- gls.left[3] = {
--   FileIcon = {
--     provider = "FileIcon",
--     condition = buffer_not_empty,
--     highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.none}
--   }
-- }

-- gls.left[4] = {
--   FileName = {
--     -- provider = "FileName",
--     provider = function()
--       return vim.fn.expand("%:F")
--     end,
--     condition = buffer_not_empty,
--     separator = " ",
--     separator_highlight = {colors.nord6, colors.none},
--     highlight = {colors.nord6, colors.none}
--   }
-- }

-- gls.left[3] = {
--   GitIcon = {
--     provider = function()
--       return " "
--     end,
--     condition = require("galaxyline.provider_vcs").check_git_workspace,
--     highlight = {colors.nord13, colors.none}
--   }
-- }

-- gls.left[4] = {
--   GitBranch = {
--     provider = "GitBranch",
--     condition = require("galaxyline.provider_vcs").check_git_workspace,
--     separator = "",
--     separator_highlight = {colors.nord13, colors.none},
--     highlight = {colors.nord13, colors.none, "bold"}
--   }
-- }

-- gls.left[3] = {
--         provider = "FileIcon",
--         condition = condition.buffer_not_empty,
--         highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.nord1}
--     }
-- }

-- gls.left[4] = {
--     FileName = {
--         provider = {"FileName", "FileSize"},
--         condition = condition.buffer_not_empty,
--         highlight = {colors.nord6, colors.nord1}
--     }
-- }

-- gls.left[1] = {
--     ViMode = {
--         provider = function()
--             -- auto change color according the vim mode
--             local mode_color = {
--                 n = colors.nord8,
--                 i = colors.nord14,
--                 v = colors.nord15,
--                 [''] = colors.nord15,
--                 V = colors.nord15,
--                 c = colors.nord13,
--                 no = colors.nord8,
--                 s = colors.nord12,
--                 S = colors.nord12,
--                 [''] = colors.nord12,
--                 ic = colors.nord13,
--                 R = colors.nord11,
--                 Rv = colors.nord11,
--                 cv = colors.nord8,
--                 ce = colors.nord8,
--                 r = colors.nord7,
--                 rm = colors.nord7,
--                 ['r?'] = colors.nord7,
--                 ['!'] = colors.nord8,
--                 t = colors.nord8
--             }
--             vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()])
--             return '▊ '
--         end,
--         highlight = {colors.nord14, colors.nord3}
--     }
-- }
-- vim.fn.getbufvar(0, 'ts')

-- gls.left[2] = {
--     GitIcon = {
--         provider = function()
--             return ' '
--         end,
--         condition = condition.check_git_workspace,
--         separator = ' ',
--         separator_highlight = {'NONE', colors.nord3},
--         highlight = {colors.nord14, colors.nord3}
--     }
-- }

-- gls.left[3] = {
--     GitBranch = {
--         provider = 'GitBranch',
--         condition = condition.check_git_workspace,
--         separator = ' ',
--         separator_highlight = {'NONE', colors.nord3},
--         highlight = {colors.nord14, colors.nord3}
--     }
-- }

-- gls.left[4] = {
--     DiffAdd = {
--         provider = 'DiffAdd',
--         condition = condition.hide_in_width,
--         icon = '  ',
--         highlight = {colors.nord14, colors.nord3}
--     }
-- }
-- gls.left[5] = {
--     DiffModified = {
--         provider = 'DiffModified',
--         condition = condition.hide_in_width,
--         icon = ' 柳',
--         highlight = {colors.nord13, colors.nord3}
--     }
-- }
-- gls.left[6] = {
--     DiffRemove = {
--         provider = 'DiffRemove',
--         condition = condition.hide_in_width,
--         icon = '  ',
--         highlight = {colors.nord11, colors.nord3}
--     }
-- }

-- gls.right[1] = {
--     DiagnosticError = {provider = 'DiagnosticError', icon = '  ', highlight = {colors.nord11, colors.nord3}}
-- }
-- gls.right[2] = {DiagnosticWarn = {provider = 'DiagnosticWarn', icon = '  ', highlight = {colors.nord12, colors.nord3}}}

-- gls.right[3] = {
--     DiagnosticHint = {provider = 'DiagnosticHint', icon = '  ', highlight = {colors.nord10, colors.nord3}}
-- }

-- gls.right[4] = {DiagnosticInfo = {provider = 'DiagnosticInfo', icon = '  ', highlight = {colors.nord13, colors.nord3}}}

-- gls.right[5] = {
--     ShowLspClient = {
--         provider = 'GetLspClient',
--         condition = function()
--             local tbl = {['dashboard'] = true, [' '] = true}
--             if tbl[vim.bo.filetype] then return false end
--             return true
--         end,
--         icon = ' ',
--         highlight = {colors.nord6, colors.nord3}
--     }
-- }

-- gls.right[6] = {
--     LineInfo = {
--         provider = 'LineColumn',
--         separator = '  ',
--         separator_highlight = {'NONE', colors.nord3},
--         highlight = {colors.nord6, colors.nord3}
--     }
-- }

-- gls.right[7] = {
--     PerCent = {
--         provider = 'LinePercent',
--         separator = ' ',
--         separator_highlight = {'NONE', colors.nord3},
--         highlight = {colors.nord6, colors.nord3}
--     }
-- }

-- gls.right[8] = {
--     Tabstop = {
--         provider = function()
--             return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " "
--         end,
--         condition = condition.hide_in_width,
--         separator = ' ',
--         separator_highlight = {'NONE', colors.nord3},
--         highlight = {colors.nord6, colors.nord3}
--     }
-- }

-- gls.right[9] = {
--     BufferType = {
--         provider = 'FileTypeName',
--         condition = condition.hide_in_width,
--         separator = ' ',
--         separator_highlight = {'NONE', colors.nord3},
--         highlight = {colors.nord6, colors.nord3}
--     }
-- }

-- gls.right[10] = {
--     FileEncode = {
--         provider = 'FileEncode',
--         condition = condition.hide_in_width,
--         separator = ' ',
--         separator_highlight = {'NONE', colors.nord3},
--         highlight = {colors.nord6, colors.nord3}
--     }
-- }

-- gls.right[11] = {
--     Space = {
--         provider = function()
--             return ' '
--         end,
--         separator = ' ',
--         separator_highlight = {'NONE', colors.nord3},
--         highlight = {colors.nord12, colors.nord3}
--     }
-- }

-- gls.short_line_left[1] = {
--     BufferType = {
--         provider = 'FileTypeName',
--         separator = ' ',
--         separator_highlight = {'NONE', colors.nord3},
--         highlight = {colors.nord6, colors.nord3}
--     }
-- }

-- gls.short_line_left[2] = {
--     SFileName = {provider = 'SFileName', condition = condition.buffer_not_empty, highlight = {colors.nord6, colors.nord3}}
-- }

-- gls.short_line_right[1] = {BufferIcon = {provider = 'BufferIcon', highlight = {colors.nord6, colors.nord3}}}
