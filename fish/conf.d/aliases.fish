alias v="nvim"

# tmux
alias t="tmux"
alias tn="tmux new -s vux"
alias tl="tmux ls"
alias ta="tmux attach"
alias td="tmux detach"
alias tk="tmux kill-session"

alias lg="lazygit"

# git
alias g='git'
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gl='git log --oneline'

function current_branch
  set ref (git symbolic-ref HEAD 2> /dev/null); or \
  set ref (git rev-parse --short HEAD 2> /dev/null); or return
  echo $ref | sed -e 's|^refs/heads/||'
end

alias gpl="git pull origin (current_branch)"
alias gp="git push origin (current_branch)"

alias ar="make -f ~/Work/ar/docker/bin/Makefile"

alias blt="blueutil -p"
