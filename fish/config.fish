if status is-interactive
    # Commands to run in interactive sessions can go here
end

# default node version
set --universal nvm_default_version v23.11.0

starship init fish | source

kubectl completion fish | source

direnv hook fish | source

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish

# bun
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path "$BUN_INSTALL/bin"

# go
set -gx GOPATH "$HOME/go"
set -gx GOPRIVATE "go.kudosi.dev/*,go.alireviews.dev/*,github.com/kdsmini/*"
fish_add_path "$GOPATH/bin"
fish_add_path "$HOME/.local/opt/go/bin"

# theme
# fish_config theme choose "Rosé Pine Dawn"

test -e /Users/vule/.iterm2_shell_integration.fish; and source /Users/vule/.iterm2_shell_integration.fish; or true

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# Added by Antigravity
fish_add_path /Users/vule/.antigravity/antigravity/bin

# opencode
fish_add_path /Users/vule/.opencode/bin
