if status is-interactive
    # Commands to run in interactive sessions can go here
end

#set PATH ~/bin ~/bin/neovim/bin ~/go/bin $PATH
set PATH ~/bin ~/go/bin $PATH

set --universal nvm_default_version v18.16.0

starship init fish | source

kubectl completion fish | source

direnv hook fish | source

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set --export PATH "$HOME/.local/opt/go/bin" $PATH

set --export GOPATH "$HOME/go"
set --export PATH "$GOPATH/bin" $PATH

# theme
fish_config theme choose "Rosé Pine Dawn"

test -e /Users/vule/.iterm2_shell_integration.fish; and source /Users/vule/.iterm2_shell_integration.fish; or true

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
