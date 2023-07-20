local M = {}

function M.find_files()
  return function()
    local opts = {}

    opts.find_command = {
      "rg",
      "--files",
      "--hidden",
      "--no-ignore-vcs",
      "-g",
      "!{node_modules,.git,vendor}",
    }

    require("telescope.builtin").find_files(opts)
  end
end

function M.find_buffers()
  return function()
    local opts = require("telescope.themes").get_dropdown()

    opts.find_command = {
      "rg",
      "--files",
      "--hidden",
      "--no-ignore-vcs",
      "-g",
      "!{node_modules,.git,vendor}",
    }
    opts.previewer = false
    opts.prompt_title = false

    opts.path_display = function(opts, path)
      local tail = require("telescope.utils").path_tail(path)
      return string.format("%s (%s)", tail, path)
    end

    require("telescope.builtin").buffers(opts)
  end
end

return M
