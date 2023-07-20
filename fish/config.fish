if status is-interactive
    # Commands to run in interactive sessions can go here
end

set PATH ~/bin ~/bin/neovim/bin $PATH

set --universal nvm_default_version v16.19.0

starship init fish | source
