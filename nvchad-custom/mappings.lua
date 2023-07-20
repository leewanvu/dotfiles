---@type MappingsTable
local M = {}
local Utils = require("custom.utils")

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    -- general
    ["<leader>n"] = "",
    ["<leader>rn"] = "",
    ["<leader>b"] = "",
    ["<leader>ch"] = "",
    ["<leader>fm"] = "",

    -- comment
    ["<leader>/"] = "",

    -- nvimtree
    ["<C-n>"] = "",

    -- lsp
    ["<leader>ls"] = "",
    ["<leader>D"] = "",
    ["<leader>ra"] = "",
    ["<leader>f"] = "",
    ["<leader>q"] = "",
    -- ["<leader>wa"] = "",
    -- ["<leader>wr"] = "",
    -- ["<leader>wl"] = "",

    -- telescope
    ["<leader>cm"] = "",
    ["<leader>gt"] = "",
    ["<leader>pt"] = "",
    ["<leader>th"] = "",
    ["<leader>ma"] = "",

    -- nvterm
    ["<leader>h"] = "",
    ["<leader>v"] = "",

    -- whichkey
    ["<leader>wk"] = "",
    ["<leader>wK"] = "",

    -- blankline
    ["<leader>cc"] = "",

    -- gitsigns
    ["<leader>rh"] = "",
    ["<leader>ph"] = "",
    ["<leader>td"] = "",
  },

  v = {
    -- comment
    ["<leader>/"] = "",
  },
}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>l"] = { "<cmd> Lazy <CR>", "Lazy" },
  },
}

M.nvimtree = {
  plugin = true,
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.telescope = {
  plugin = true,
  n = {
    ["<leader>ff"] = {
      Utils.find_files(),
      "Find files",
    },
    ["<leader>fb"] = { Utils.find_buffers(), "Find buffers" },

    ["<leader>bb"] = { Utils.find_buffers(), "Find buffers" },

    ["<leader>ss"] = { "<cmd> Telescope lsp_document_symbols <CR>", "Goto Symbol" },
    ["<leader>sS"] = { "<cmd> Telescope lsp_workspace_symbols <CR>", "Goto Symbol (Workspace)" },

    ["<leader>gg"] = { "<cmd> Telescope git_status <CR>", "Git status" },
  },
}

-- git
-- terminal

return M
