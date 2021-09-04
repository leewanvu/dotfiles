local status, cmp = pcall(require, "cmp")
local l_status, luasnip = pcall(require, "luasnip")
if not (status or l_status) then
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

local kinds = {
  Text = "   (Text) ",
  Method = "   (Method)",
  Function = "   (Function)",
  Constructor = "   (Constructor)",
  Field = " ﴲ  (Field)",
  Variable = "[] (Variable)",
  Class = "   (Class)",
  Interface ="   (Interface)",
  Module = "   (Module)",
  Property = " 襁 (Property)",
  Unit = "   (Unit)",
  Value = "   (Value)",
  Enum = " 練 (Enum)",
  Keyword = "   (Keyword)",
  Snippet = "   (Snippet)",
  Color = "   (Color)",
  File = "   (File)",
  Reference = "   (Reference)",
  Folder = "   (Folder)",
  EnumMember = "   (EnumMember)",
  Constant = " ﲀ  (Constant)",
  Struct = " פּ  (Struct)",
  Event = "   (Event)",
  Operator = "   (Operator)",
  TypeParameter = "   (TypeParameter)"
}

M.setup = function()
  cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
        -- vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if vim.fn.pumvisible() == 1 then
          vim.fn.feedkeys(t("<C-n>"), "n")
        elseif luasnip.expand_or_jumpable() then
          vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
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
        if vim.fn.pumvisible() == 1 then
          vim.fn.feedkeys(t("<C-p>"), "n")
        elseif luasnip.jumpable(-1) then
          vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      --[[ ['<Tab>'] = function(fallback)
        if vim.fn.pumvisible() == 1 then
          vim.fn.feedkeys(t('<C-n>'), 'n')
        elseif vim.fn['vsnip#available']() == 1 then
          vim.fn.feedkeys(t('<Plug>(vsnip-expand-or-jump)'), '')
        elseif check_back_space() then
          vim.fn.feedkeys(t('<Tab>'), 'n')
        else
          fallback()
        end
      end, ]]
      --[[ ['<S-Tab>'] = function(fallback)
        if vim.fn.pumvisible() == 1 then
          vim.fn.feedkeys(t('<C-p>'), 'n')
        elseif vim.fn['vsnip#available']() == 1 then
          vim.fn.feedkeys(t('<Plug>(vsnip-jump-prev)'), '')
        elseif check_back_space() then
          vim.fn.feedkeys(t('<S-Tab>'), 'n')
        else
          fallback()
        end
      end, ]]
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      })
    },
    formatting = {
      deprecated = true,
      format = function(entry, vim_item)
        vim_item.kind = kinds[vim_item.kind]
        vim_item.menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          path = "[Path]",
          orgmode = "[Org]",
          luasnip = "[LuaSnip]",
          -- vsnip = "[Snippet]",
        })[entry.source.name]
        return vim_item
      end
    },
    sources = {
      {
        name = 'buffer',
        opts = {
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
      { name = 'orgmode' },
      { name = 'luasnip' },
      -- { name = 'vsnip' },
    }
  })
end

return M
