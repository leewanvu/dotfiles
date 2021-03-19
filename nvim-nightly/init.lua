-- Set leader is <Space>
vim.g.mapleader = ' '

require('vplugins')

-- TODO update options
require('voptions')

require('vplugins.airline')
require('vplugins.tree')
require('vplugins.starrtify')
require('vplugins.ctrlsf')
require('vplugins.indentline')
require('vplugins.easymotion')
require('vplugins.whitespace')
require('vplugins.floatterm')

require('vplugins.ts')
require('vplugins.telescope')
require('vplugins.lsp')
require('vplugins.completion')

require('vmappings')
