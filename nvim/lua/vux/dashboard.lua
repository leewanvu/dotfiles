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
    a = {description = {'  Recently Used Files'}, command = 'Telescope oldfiles'},
    b = {description = {'  Find File          '}, command = 'Telescope find_files find_command=rg,--ignore,--hidden,--files,--no-ignore-vcs,-g,!node_modules,-g,!.git,-g,!vendor'},
    c = {description = {'  Load Last Session  '}, command = 'SessionLoad'},
    d = {description = {'  Find Word          '}, command = 'Telescope live_grep'},
    e = {description = {'  Marks              '}, command = 'Telescope marks'}
}
-- vim.g.dashboard_custom_footer = {'leewanvu'}
