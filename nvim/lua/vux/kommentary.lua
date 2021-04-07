local config = require('kommentary.config')

config.configure_language('default', {
  use_consistent_indentation = true,
  ignore_whitespace = true
})

config.configure_language("php", {
  single_line_comment_string = "//",
  multi_line_comment_strings = {"/*", "*/"},
})
