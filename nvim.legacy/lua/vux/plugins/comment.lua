return {
    -- comment
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    'numToStr/Comment.nvim',
    keys = { { "gc", mode = { "n", "v" }, desc = "Comment - line" }, { "gb", mode = { "n", "v" }, desc = "Comment - block" } },
    event = "User FileOpened",
    config = function()
      require('Comment').setup({
        pre_hook = function(...)
          local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
          if loaded and ts_comment then
            return ts_comment.create_pre_hook()(...)
          end
        end,
      })
    end,
  }
}
