local present, whichkey = pcall(require, "which-key")

if not present then
  return
end

local keymaps = {
  mode = { "n", "v" },
  ["g"] = { name = "+goto" },
  ["gz"] = { name = "+surround" },
  ["]"] = { name = "+next" },
  ["["] = { name = "+prev" },
  ["<leader>b"] = { name = "+buffer" },
  ["<leader>c"] = { name = "+code" },
  ["<leader>f"] = { name = "+file/find" },
  ["<leader>g"] = { name = "+git" },
  ["<leader>s"] = { name = "+search" },
  ["<leader>u"] = { name = "+ui" },
  ["<leader>x"] = { name = "+diagnostics/quickfix" },
}
whichkey.register(keymaps)
