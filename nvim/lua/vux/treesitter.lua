local M = {}

M.setup = function ()
  require'nvim-treesitter.configs'.setup {
    -- ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = {
      'php', 'vue', 'lua', 'html',
      'javascript', 'typescript', 'bash',
      'json', 'comment', 'css', 'go', 'query',
    },
    highlight = {
      enable = true,
      disable = { 'html', 'css', 'vue', }
    },
    indent = {
      enable = true,
      -- disable = { 'php' }
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?',
      },
    },
    textobjects = {
      select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>bs"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>bS"] = "@parameter.inner",
        },
      },
    },
  }
end

return M
