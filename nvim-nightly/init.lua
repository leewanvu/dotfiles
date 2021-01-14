-- Set leader is <Space>
vim.g.mapleader = ' '

require('v-plugins')
require('v-options')
require('v-mappings')

-- Auto commands
-- Remove trailing whitespace on save
-- vim.cmd "autocmd BufWritePre * %s/\\s\\+$//e"
