local M = {}

function M.setup()
  vim.g.fzf_layout = { window = { width = 0.8, height = 0.6 } }
  vim.g.fzf_history_dir = '~/.local/share/fzf-history' 
  vim.g.fzf_colors = {
    fg = { 'fg', 'Normal' },
    bg = { 'bg', 'Normal' },
    hl = { 'fg', 'Comment' },
    ['fg+'] = { 'fg', 'CursorLine', 'CursorColumn', 'Normal' },
    ['bg+'] = { 'bg', 'CursorLine', 'CursorColumn' },
    ['hl+'] = { 'fg', 'Statement' },
    info = { 'fg', 'PreProc' },
    border = { 'fg', 'Ignore' },
    prompt = { 'fg', 'Conditional' },
    pointer = { 'fg', 'Exception' },
    marker = { 'fg', 'Keyword' },
    spinner = { 'fg', 'Label' },
    header = { 'fg', 'Comment' },
  }
  vim.api.nvim_exec([[
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --no-ignore-vcs -g "!{node_modules,.git,vendor}"'
  ]], '')
end

return M
