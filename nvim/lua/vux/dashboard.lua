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
    -- a = {description = {'  Find File          '}, command = 'Telescope find_files find_command=rg,--ignore,--hidden,--files,--no-ignore-vcs,-g,!node_modules,-g,!.git,-g,!vendor'},
    a = {description = {'  Find File          '}, command = "lua require('telescope.builtin').find_files({ find_command = { 'rg', '--files', '--hidden', '--no-ignore-vcs', '-g', '!{node_modules,.git,vendor}' } })"},
    b = {description = {'  Recently Used Files'}, command = 'Telescope oldfiles'},
    c = {description = {'  Diff File          '}, command = 'Telescope git_status'},
    d = {description = {'  Find Word          '}, command = 'Telescope live_grep'},
    -- d = {description = {'  Settings           '}, command = ':e ~/.config/nvim/init.lua'}
}
-- vim.g.dashboard_custom_footer = {'leewanvu'}
end

return M
