local colors = {}

colors.default = {
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

colors.nord = {
  bg = "#3B4252",
  fg = "#ECEFF4",
  fg_alt = "#D8DEE9",
  yellow = "#EBCB8B",
  cyan = "#88C0D0",
  green = "#A3BE8C",
  orange = "#D08770",
  magenta = "#B48EAD",
  blue = "#5E81AC",
  red = "#BF616A",
}

colors.tokyonight = {
  -- bg = "#1f2335",
  bg = "#292e42",
  fg = "#c0caf5",
  fg_alt = "#a9b1d6",
  yellow = "#e0af68",
  cyan = "#7dcfff",
  green = "#9ece6a",
  orange = "#ff9e64",
  magenta = "#bb9af7",
  blue = "#7aa2f7",
  red = "#f7768e",
}

colors.get_color = function(color)
  return function()
    for theme_name, _ in pairs(colors) do
      if vim.g.colors_name and vim.g.colors_name:find(theme_name, 1, true) then
        return colors[theme_name][color]
      end
    end

    return colors.default[color]
  end
end

return colors
