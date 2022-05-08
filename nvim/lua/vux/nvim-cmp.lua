local status_cmp_ok, cmp = pcall(require, "cmp")
if not status_cmp_ok then
  return
end
local status_luasnip_ok, luasnip = pcall(require, "luasnip")
if not status_luasnip_ok then
  return
end

local M = {}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
end

-- local kind_icons = {
--   Text = "   (Text) ",
--   Method = "   (Method)",
--   Function = "   (Function)",
--   Constructor = "   (Constructor)",
--   Field = " ﴲ  (Field)",
--   Variable = "[] (Variable)",
--   Class = "   (Class)",
--   Interface ="   (Interface)",
--   Module = "   (Module)",
--   Property = " 襁 (Property)",
--   Unit = "   (Unit)",
--   Value = "   (Value)",
--   Enum = " 練 (Enum)",
--   Keyword = "   (Keyword)",
--   Snippet = "   (Snippet)",
--   Color = "   (Color)",
--   File = "   (File)",
--   Reference = "   (Reference)",
--   Folder = "   (Folder)",
--   EnumMember = "   (EnumMember)",
--   Constant = " ﲀ  (Constant)",
--   Struct = " פּ  (Struct)",
--   Event = "   (Event)",
--   Operator = "   (Operator)",
--   TypeParameter = "   (TypeParameter)"
-- }

local kind_icons = {
  Class = " ",
  Color = " ",
  Constant = "ﲀ ",
  Constructor = " ",
  Enum = "練",
  EnumMember = " ",
  Event = " ",
  Field = " ",
  File = "",
  Folder = " ",
  Function = " ",
  Interface = "ﰮ ",
  Keyword = " ",
  Method = " ",
  Module = " ",
  Operator = "",
  Property = " ",
  Reference = " ",
  Snippet = " ",
  Struct = " ",
  Text = " ",
  TypeParameter = " ",
  Unit = "塞",
  Value = " ",
  Variable = " ",
}

M.setup = function()
  cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
        -- elseif neogen.jumpable() then
        --   vim.fn.feedkeys(t("<cmd>lua require('neogen').jump_next()<CR>"), "")
        elseif check_back_space() then
          vim.fn.feedkeys(t("<Tab>"), "n")
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      })
    }),
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        vim_item.kind = kind_icons[vim_item.kind]
        vim_item.menu = ({
          buffer = "(Buffer)",
          nvim_lsp = "(LSP)",
          path = "(Path)",
          luasnip = "(LuaSnip)",
        })[entry.source.name]
        return vim_item
      end
    },
    sources = {
      {
        name = 'buffer',
        option = {
          get_bufnrs = function()
            -- all buffers
            return vim.api.nvim_list_bufs()

            -- visible buffers
            --[[ local bufs = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              bufs[vim.api.nvim_win_get_buf(win)] = true
            end
            return vim.tbl_keys(bufs) ]]
          end,
        },
      },
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'luasnip' },
    },
    experimental = {
      ghost_text = true,
      native_menu = false,
    },
  })

  -- If you want insert `(` after select function or method item
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' }}))
end

return M
