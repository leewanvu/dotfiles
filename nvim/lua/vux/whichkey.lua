require("which-key").setup {
  plugins = {
    marks = false, -- shows a list of your marks on ' and `
    registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = ">>", -- symbol used in the command line area that shows your active key combo
    separator = "-", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 5, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "center"
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  -- triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    -- i = { "j", "k" },
    -- v = { "j", "k" },
  -- }
}

-- CtrlSF keymaps
vim.api.nvim_exec([[
  nmap     <leader>sf <Plug>CtrlSFPrompt
  vmap     <leader>sf <Plug>CtrlSFVwordPath
  vmap     <leader>ss <Plug>CtrlSFVwordExec
  nmap     <leader>ss <Plug>CtrlSFCwordPath
  nmap     <leader>sp <Plug>CtrlSFPwordPath
  nnoremap <leader>so :CtrlSFOpen<CR>
  nnoremap <leader>st :CtrlSFToggle<CR>
  nnoremap <leader>su :CtrlSFUpdate<CR>
]], '')

-- register keymaps
local wk = require("which-key")

-- normal mode, has leader
wk.register({
  ["w"] = "Write buffer",
  ["q"] = "Delete buffer",
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["n"] = { "<cmd>nohlsearch<cr>", "No highlight" },
  ["d"] = "Doc generator",
  ["h"] = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Show TS highlight" },
  ["="] = "LSP - Format",
  g = {
    name = "+Git",
    g = { "<cmd>lua require('telescope.builtin').git_status()<cr>", "Git status" },
    p = { '<cmd>lua require"gitsigns".preview_hunk()<CR>', "Preview hunk" },
    j = { '<cmd>lua require"gitsigns".next_hunk()<CR>', "Next hunk" },
    k = { '<cmd>lua require"gitsigns".prev_hunk()<CR>', "Prev hunk" },
    b = { '<cmd>lua require"gitsigns".blame_line()<CR>', "Blame line" },
    r = { '<cmd>lua require"gitsigns".reset_hunk()<CR>', "Reset hunk" },
    R = { '<cmd>lua require"gitsigns".reset_buffer()<CR>', "Reset buffer" },
    s = { '<cmd>lua require"gitsigns".stage_hunk()<CR>', "Stage hunk" },
    S = { '<cmd>lua require"gitsigns".stage_buffer()<CR>', "Stage buffer" },
    u = { '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', "Undo stage hunk" },
    d = { '<cmd>lua require"gitsigns".diffthis()<CR>', "Diff this" },
    h = { '<cmd>lua require"gitsigns".toggle_linehl()<CR>', "Highlight" },
  },
  s = {
    name = "+Search (CtrlSF)",
    o = "Open",
    t = "Toggle",
    u = "Update",
    f = "Search [arguments] {pattern} [path]",
    s = "Words under the cursor",
    p = "Last search pattern"
  },
  l = {
    name = "+LSP",
    s = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", "Document symbols" },
    -- w = { "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", "Workspace symbols" },
    S = { "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", "Dynamic workspace symbols" },
    d = { "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>", "Document diagnostics" },
    D = { "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>", "Workspace diagnostics" },
  },
  f = {
    name = "+Telescope",
    f = { "<cmd>lua require('telescope.builtin').find_files({ find_command = { 'rg', '--files', '--hidden', '--no-ignore-vcs', '-g', '!{node_modules,.git,vendor}' } })<cr>", "Find files" },
    z = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Find text in open buffer" },
    o = { "<cmd>Telescope oldfiles<cr>", "Find oldfiles" },
    t = { "<cmd>Telescope treesitter<cr>", "Treesitter" },
    m = { "<cmd>Telescope man_pages<cr>", "Man pages" },
    h = { "<cmd>Telescope help_tags<cr>", "Help tags" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    g = { "<cmd>Telescope git_files<cr>", "Git files" },
    s = { "<cmd>Telescope grep_string<cr>", "Grep string" },
    b = { "<cmd>Telescope file_browser<cr>", "File browser" },
  },
  b = {
    name = "+Buffers",
    b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Find buffers" },
    n = { "<cmd>bnext<cr>", "Next buffer" },
    p = { "<cmd>bprevious<cr>", "Prev buffer" },
    w = { "<cmd>w<cr>", "Write buffer" },
    d = { "Delete buffer" }, -- set mapping in /vux/keymappings.lua
    r = { "<cmd>set wrap!<cr>", "Toogle word wrap" },
    i = { "<cmd>IndentBlanklineToggle<cr>", "Toggle indent line" },
  }
}, { prefix = "<leader>" })

-- normal mode, no <leader>
wk.register({
  ["gc"] = {
    name = "+Komentary",
    c = "Comments"
  },
  g = {
    d = "LSP - Definition",
    D = "LSP - Declaration",
    r = "LSP - References",
    n = "LSP - Rename",
    s = "LSP - Signature help",
    a = "LSP - Code action",
  },
  ["["] = {
    b = "Prev buffer",
    d = "LSP - Prev diagnostics"
    -- c = "Prev hunk"
  },
  ["]"] = {
    b = "Next buffer",
    d = "LSP - Next diagnostics"
    -- c = "Next hunk"
  }
})

-- visual mode, has <leader>
wk.register({
  s = {
    name = "+Search (CtrlSF)",
    f = "Words in the current visual selected",
    s = "Like f, but excecute",
  },
}, {
  mode = "v",
  prefix = "<leader>"
})

-- visual mode, no <leader>
wk.register({
  ["gc"] = "Comments",
  ["ga"] = "LSP - Range code action"
}, {
  mode = "v"
})
