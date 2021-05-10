require'nvim-treesitter.configs'.setup {
  -- ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
    'php', 'vue', 'lua', 'html',
    'javascript', 'typescript', 'bash',
    'json', 'comment', 'css', 'go', 
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { 'php' }
  },
}
