if status is-interactive
    # Commands to run in interactive sessions can go here
end

# mac pro 2019
#set PATH ~/bin ~/bin/neovim/bin ~/go/bin $PATH
set -Ux fish_user_paths ~/bin ~/bin/neovim/bin ~/go/bin $fish_user_paths

# mac air m2
# set PATH /opt/homebrew/bin /opt/homebrew/bin/nvim $PATH
set -Ux fish_user_paths /opt/homebrew/bin /opt/homebrew/bin/nvim $fish_user_paths

set --universal nvm_default_version v23.11.0

starship init fish | source

kubectl completion fish | source

direnv hook fish | source

# Generated for envman. Do not edit.
# test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set --export PATH "$HOME/.local/opt/go/bin" $PATH

# go
set --export GOPATH "$HOME/go"
set --export PATH "$GOPATH/bin" $PATH
set -Ux GOPRIVATE "go.kudosi.dev/*,go.alireviews.dev/*"

# theme
fish_config theme choose "Rosé Pine Dawn"

# test -e /Users/vule/.iterm2_shell_integration.fish ; and source /Users/vule/.iterm2_shell_integration.fish ; or true

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
