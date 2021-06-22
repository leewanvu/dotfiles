local true_zen = require("true-zen")

true_zen.setup({
  true_false_commands = false,
  cursor_by_mode = false,
  ataraxis = {
    ideal_writing_area_width = 0,
    just_do_it_for_me = false,
    left_padding = 30,
    right_padding = 30,
    top_padding = 0,
    bottom_padding = 0,
    custome_bg = "",
    disable_bg_configuration = false,
    disable_fillchars_configuration = false,
    keep_default_fold_fillchars = false,
    force_when_plus_one_window = false,
    force_hide_statusline = true,
    quit_untoggles_ataraxis = true,
    affected_higroups = {NonText = {}, FoldColumn = {}, ColorColumn = {}, VertSplit = {}, StatusLine = {}, StatusLineNC = {}, SignColumn = {}}
  },
  focus = {
    margin_of_error = 5,
    focus_method = "native"
  },
  minimalist = {
    store_and_restore_settings = true,
    show_vals_to_read = {}
  },
  events = {
    before_minimalist_mode_shown = false,
    before_minimalist_mode_hidden = false,
    after_minimalist_mode_shown = false,
    after_minimalist_mode_hidden = false,
    before_focus_mode_focuses = false,
    before_focus_mode_unfocuses = false,
    after_focus_mode_focuses = false,
    after_focus_mode_unfocuses = false
  },
  integrations = {
    integration_galaxyline = true,
    integration_vim_airline = false,
    integration_vim_powerline = false,
    integration_tmux = false,
    integration_express_line = false,
    integration_gitgutter = false,
    integration_vim_signify = false,
    integration_limelight = false,
    integration_tzfocus_tzataraxis = false,
    integration_gitsigns = false
  }
})
