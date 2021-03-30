local gl = require('galaxyline')
local nord_colors = {
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
}
local condition = require('galaxyline.condition')
local gls = gl.section

gl.short_line_list = {'NvimTree', 'packer'}

gls.left[1] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            local mode_color = {
                n = nord_colors.nord8,
                i = nord_colors.nord14,
                v = nord_colors.nord15,
                [''] = nord_colors.nord15,
                V = nord_colors.nord15,
                c = nord_colors.nord13,
                no = nord_colors.nord8,
                s = nord_colors.nord12,
                S = nord_colors.nord12,
                [''] = nord_colors.nord12,
                ic = nord_colors.nord13,
                R = nord_colors.nord11,
                Rv = nord_colors.nord11,
                cv = nord_colors.nord8,
                ce = nord_colors.nord8,
                r = nord_colors.nord7,
                rm = nord_colors.nord7,
                ['r?'] = nord_colors.nord7,
                ['!'] = nord_colors.nord8,
                t = nord_colors.nord8
            }
            vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()])
            return '▊ '
        end,
        highlight = {nord_colors.nord14, nord_colors.nord3}
    }
}
vim.fn.getbufvar(0, 'ts')

gls.left[2] = {
    GitIcon = {
        provider = function()
            return ' '
        end,
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', nord_colors.nord3},
        highlight = {nord_colors.nord14, nord_colors.nord3}
    }
}

gls.left[3] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', nord_colors.nord3},
        highlight = {nord_colors.nord14, nord_colors.nord3}
    }
}

gls.left[4] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {nord_colors.nord14, nord_colors.nord3}
    }
}
gls.left[5] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = ' 柳',
        highlight = {nord_colors.nord13, nord_colors.nord3}
    }
}
gls.left[6] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {nord_colors.nord11, nord_colors.nord3}
    }
}

gls.right[1] = {
    DiagnosticError = {provider = 'DiagnosticError', icon = '  ', highlight = {nord_colors.nord11, nord_colors.nord3}}
}
gls.right[2] = {DiagnosticWarn = {provider = 'DiagnosticWarn', icon = '  ', highlight = {nord_colors.nord12, nord_colors.nord3}}}

gls.right[3] = {
    DiagnosticHint = {provider = 'DiagnosticHint', icon = '  ', highlight = {nord_colors.nord10, nord_colors.nord3}}
}

gls.right[4] = {DiagnosticInfo = {provider = 'DiagnosticInfo', icon = '  ', highlight = {nord_colors.nord13, nord_colors.nord3}}}

gls.right[5] = {
    ShowLspClient = {
        provider = 'GetLspClient',
        condition = function()
            local tbl = {['dashboard'] = true, [' '] = true}
            if tbl[vim.bo.filetype] then return false end
            return true
        end,
        icon = ' ',
        highlight = {nord_colors.nord6, nord_colors.nord3}
    }
}

gls.right[6] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = '  ',
        separator_highlight = {'NONE', nord_colors.nord3},
        highlight = {nord_colors.nord6, nord_colors.nord3}
    }
}

gls.right[7] = {
    PerCent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = {'NONE', nord_colors.nord3},
        highlight = {nord_colors.nord6, nord_colors.nord3}
    }
}

gls.right[8] = {
    Tabstop = {
        provider = function()
            return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " "
        end,
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', nord_colors.nord3},
        highlight = {nord_colors.nord6, nord_colors.nord3}
    }
}

gls.right[9] = {
    BufferType = {
        provider = 'FileTypeName',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', nord_colors.nord3},
        highlight = {nord_colors.nord6, nord_colors.nord3}
    }
}

gls.right[10] = {
    FileEncode = {
        provider = 'FileEncode',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', nord_colors.nord3},
        highlight = {nord_colors.nord6, nord_colors.nord3}
    }
}

gls.right[11] = {
    Space = {
        provider = function()
            return ' '
        end,
        separator = ' ',
        separator_highlight = {'NONE', nord_colors.nord3},
        highlight = {nord_colors.nord12, nord_colors.nord3}
    }
}

gls.short_line_left[1] = {
    BufferType = {
        provider = 'FileTypeName',
        separator = ' ',
        separator_highlight = {'NONE', nord_colors.nord3},
        highlight = {nord_colors.nord6, nord_colors.nord3}
    }
}

gls.short_line_left[2] = {
    SFileName = {provider = 'SFileName', condition = condition.buffer_not_empty, highlight = {nord_colors.nord6, nord_colors.nord3}}
}

gls.short_line_right[1] = {BufferIcon = {provider = 'BufferIcon', highlight = {nord_colors.nord6, nord_colors.nord3}}}
