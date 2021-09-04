local M = {}

M.setup = function()
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_header = {
   '        ▄▄▄▄▄███████████████████▄▄▄▄▄     ',
   '      ▄██████████▀▀▀▀▀▀▀▀▀▀██████▀████▄   ',
   '     █▀████████▄             ▀▀████ ▀██▄  ',
   '    █▄▄██████████████████▄▄▄         ▄██▀ ',
   '     ▀█████████████████████████▄    ▄██▀  ',
   '       ▀████▀▀▀▀▀▀▀▀▀▀▀▀█████████▄▄██▀    ',
   '         ▀███▄              ▀██████▀      ',
   '           ▀██████▄        ▄████▀         ',
   '              ▀█████▄▄▄▄▄▄▄███▀           ',
   '                ▀████▀▀▀████▀             ',
   '                  ▀███▄███▀                ',
   '                     ▀█▀                   ',
}
vim.g.dashboard_custom_section = {
    a = {description = {'  Find Files         '}, command = "lua require('telescope.builtin').find_files({ find_command = { 'rg', '--files', '--hidden', '--no-ignore-vcs', '-g', '!{node_modules,.git,vendor}' } })"},
    b = {description = {'  Recently Used Files'}, command = 'Telescope oldfiles'},
    c = {description = {'  Projects           '}, command = 'Telescope projects'},
    -- d = {description = {'  Settings           '}, command = ':e ~/.config/nvim/init.lua'}
}
-- vim.g.dashboard_custom_footer = {'leewanvu'}
end

return M
