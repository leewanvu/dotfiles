local M = {}

M.setup = function()
  require("barbecue").setup({
    ---whether to create winbar updater autocmd
    ---@type boolean
    create_autocmd = true,

    ---buftypes to enable winbar in
    ---@type string[]
    include_buftypes = { "" },

    ---filetypes not to enable winbar in
    ---@type string[]
    exclude_filetypes = { "toggleterm" },

    ---returns a string to be shown at the end of winbar
    ---@type fun(bufnr: number): number|string
    custom_section = function()
      return ""
    end,

    modifiers = {
      ---filename modifiers applied to dirname
      ---@type string
      dirname = ":~:.",

      ---filename modifiers applied to basename
      ---@type string
      basename = "",
    },

    ---icons used by barbecue
    ---@type table<string, string>
    symbols = {
      ---entry separator
      ---@type string
      separator = "",

      ---modification indicator
      ---`false` to disable
      ---@type false|string
      modified = false,

      ---context placeholder for the root node
      ---`false` to disable
      ---@type false|string
      default_context = "…",
    },

    ---icons for different context entry kinds
    ---@type table<string, string>
    kinds = {
      File = "",
      Package = "",
      Module = "",
      Namespace = "",
      Macro = "",
      Class = "",
      Constructor = "",
      Field = "",
      Property = "",
      Method = "",
      Struct = "",
      Event = "",
      Interface = "ﰮ",
      Enum = "練",
      EnumMember = "",
      Constant = "ﲀ",
      Function = "",
      TypeParameter = "",
      Variable = "",
      Operator = "",
      Null = "",
      Boolean = "",
      Number = "",
      String = "",
      Key = "",
      Array = "",
      Object = "ﴯ",
    },
  })
end

return M
