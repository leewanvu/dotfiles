local M = {}

M.setup = function()
  require("which-key").setup {
    plugins = {
      marks = false, -- shows a list of your marks on ' and `
      registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      presets = {
        operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = false, -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
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

  -- register keymaps
  local wk = require("which-key")

  local nmappings = {
    ["w"] = "Write buffer",
    ["q"] = "Delete buffer",
    -- ["q"] = { [[<cmd>lua require('close_buffers').delete({type = 'this', force = true})<cr>]], "Delete buffer"},
    ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    ["n"] = { "<cmd>nohlsearch<cr>", "No highlight" },
    ["d"] = "Doc generator",
    ["h"] = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Show TS highlight" },
    ["="] = "LSP - Format",
    ["z"] = { "<cmd>ZenMode<cr>", "Zen Mode" },
    -- ["z"] = { "<cmd>TZFocus<cr>", "Zen Mode" },
    -- ["t"] = { "<cmd>TransparentToggle<cr>", "Transparent toggle" },
    -- ["f"] = { "<cmd>lua require('vux.telescope').find_files()<cr>", "Find files" },
    -- ["r"] = { "<cmd>Telescope oldfiles<cr>", "Find recent files" },
    -- ["p"] = { "<cmd>Telescope projects<cr>", "Projects" },
    g = {
      name = "+Git",
      g = { "<cmd>lua require('telescope.builtin').git_status()<cr>", "Git status" },
      p = { '<cmd>Gitsigns preview_hunk<CR>', "Preview hunk" },
      j = { '<cmd>Gitsigns next_hunk<CR>', "Next hunk" },
      k = { '<cmd>Gitsigns prev_hunk<CR>', "Prev hunk" },
      b = { '<cmd>Gitsigns toggle_current_line_blame<CR>', "Toggle Blame" },
      r = { '<cmd>Gitsigns reset_hunk<CR>', "Reset hunk" },
      R = { '<cmd>Gitsigns reset_buffer<CR>', "Reset buffer" },
      s = { '<cmd>Gitsigns stage_hunk<CR>', "Stage hunk" },
      S = { '<cmd>Gitsigns stage_buffer<CR>', "Stage buffer" },
      u = { '<cmd>Gitsigns undo_stage_hunk<CR>', "Undo stage hunk" },
      h = { '<cmd>Gitsigns toggle_linehl<CR>', "Highlight" },
      d = { '<cmd>Gitsigns diffthis<CR>', "Diff this" },
      z = { "<cmd>lua require('vux.nvim-toggleterm').lazygit()<CR>", "Lazy git" },
    },
    s = {
      name = "+Search",
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
      i = { "<cmd>LspInfo<CR>", "Info" },
      o = { "<cmd>SymbolsOutline<CR>", "Symbols outline" },
    },
    f = {
      name = "+Find",
      f = { "<cmd>lua require('vux.telescope').find_files()<cr>", "Find files" },
      o = { "<cmd>Telescope oldfiles<cr>", "Old files" },
      t = { "<cmd>Telescope treesitter<cr>", "Treesitter" },
      c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      s = { "<cmd>Telescope grep_string<cr>", "Grep string" },
      p = { "<cmd>Telescope projects<cr>", "Projects" },
    },
    b = {
      name = "+Buffer",
      b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Find buffers" },
      n = { "<cmd>bnext<cr>", "Next buffer" },
      p = { "<cmd>bprevious<cr>", "Prev buffer" },
      w = { "<cmd>w<cr>", "Write buffer" },
      d = { [[<cmd>lua require('close_buffers').delete({type = 'this', force = true})<cr>]], "Delete this buffer" }, -- set mapping in /vux/keymappings.lua
      D = { [[<cmd>lua require('close_buffers').delete({type = 'other', force = true})<cr>]], "Delete other buffers" }, -- set mapping in /vux/keymappings.lua
      r = { "<cmd>set wrap!<cr>", "Toogle word wrap" },
      i = { "<cmd>IndentBlanklineToggle<cr>", "Toggle indent line" },
      f = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Fuzzy find text" },
      s = { "Next swap" },
      S = { "Previous swap"},
    },
    --[[ p = {
      name = "+Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    }, ]]
    -- o = {
    --   name = "+Org",
    --   a = "Agenda",
    --   c = "Capture",
    -- },
    -- t = {
    --   name = "+TrueZen",
    --   t = { "<cmd>TZFocus<cr>", "Focus mode" },
    --   a = { "<cmd>TZAtaraxis<cr>", "Ataraxis mode" },
    --   m = { "<cmd>TZMinimalist<cr>", "Minimalist mode" },
    -- }
  }

  -- normal mode, has leader
  wk.register(nmappings, { prefix = "<leader>" })

  -- normal mode, no <leader>
  wk.register({
    ["gc"] = {
      name = "+Comments - Line",
      c = "Toggle",
      A = "Add comment at the end of line",
      o = "Add comment on the line below",
      O = "Add comment on the line above",
    },
    ["gb"] = {
      name = "+Comments - Block",
      c = "Toggle"
    },
    g = {
      d = "LSP - Definition",
      D = "LSP - Declaration",
      r = "LSP - References",
      n = "LSP - Rename",
      s = "LSP - Signature help",
      a = "LSP - Code action",
      t = "LSP - Type definition",
      i = "LSP - Implementation",
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
  },
  {
    mode = "v",
    prefix = "<leader>"
  })

  -- visual mode, no <leader>
  wk.register({
    ["gc"] = "Comments - Line",
    ["gb"] = "Comments - Block",
    ["ga"] = "LSP - Range code action"
  },
  {
    mode = "v"
  })
end

return M
