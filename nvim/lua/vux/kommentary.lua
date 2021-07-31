local M = {}

M.setup = function()
  local config = require('kommentary.config')

  config.configure_language('default', {
    use_consistent_indentation = true,
    ignore_whitespace = true,
    prefer_single_line_comments = true,
  })

  config.configure_language("php", {
    single_line_comment_string = "//",
    multi_line_comment_strings = {"/*", "*/"},
  })
end

return M
