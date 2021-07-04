# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions zsh-completions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# nvim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# list
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# docker
alias dkpsa='docker ps -a'
alias dcp='docker-compose'

alias s5y='~/Work/s5y'
alias gsms='~/Work/s5y gsms'
alias gun='~/Work/s5y gun'
alias gngrok='~/Work/s5y ngrok'

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
alias gpl='git pull origin "$(git_current_branch)"'
alias gp='git push origin "$(git_current_branch)"'

# k8s
alias k='kubectl'
alias kgp='kubectl get po'
alias kl='kubectl logs -f'
alias kls='kubectl logs -f -n sms'
alias kgps='kubectl get po -n sms'
alias kes='kubectl exec -n sms -it'
alias kprod='kubectl config use-context arn:aws:eks:ap-southeast-1:655894223594:cluster/fa-prod-eks'
alias kstag='kubectl config use-context arn:aws:eks:ap-southeast-1:655894223594:cluster/fa-staging-eks'

alias klarp='kubectl logs -f -n ar6'
alias kgparp='kubectl get po -n ar6'
alias kearp='kubectl exec -n ar6 -it'

alias kgpars='kubectl get po -n alireviews'
alias klars='kubectl logs -f -n alireviews'
alias kears='kubectl exec -n alireviews -it'

# Alireviews
alias ar="cd ~/Work/ar/"
alias arm="make -f ~/Work/ar/bin/Makefile"
alias ard="arm docker"
alias arup="arm up"
alias ardown="arm down"
alias arngrok="arm -s ar-ngrok"
alias arredis="arm redis"
alias arreset="arm reset"

alias arreport="arm report"
alias arreportr="arm report u=root"
alias arreportl="arm report-log"

alias arwebc="cd ~/Work/ar/alireviews"
alias arweb="arm web"
alias arwebr="arm web u=root"
alias arwebl="arm web-log"
alias arwebrs="arm web-reset"

alias arboxc="cd ~/Work/ar/alireviews-box"
alias arbox="arm box"
alias arboxr="arm box u=root"
alias arboxl="arm box-log"
alias arboxrs="arm box-reset"

alias aremail="arm email"

alias arreportrs="arm report-reset"

alias arrs="arwebrs && arboxrs && arreportrs"

alias vdot="cd ~/Work/dotfiles && v nvim/init.lua"
alias r="ranger"

alias chrome="open -a Google\ Chrome"

alias ovpn="sudo openvpn --config ~/.ssh/vulq.ovpn"

# Check the weather
alias weather="curl wttr.in"

# lazygit
alias lg="lazygit"

# tmux
alias t="tmux"
alias tn="tmux new -s vux"
alias tl="tmux ls"
alias ta="tmux attach"
alias td="tmux detach"
alias tk="tmux kill-session"

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Flutter
export FLUTTER_HOME=$HOME/Projects/flutter
export PATH=$PATH:$FLUTTER_HOME/flutter/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore-vcs -g "!{node_modules,.git,vendor}"'

export VISUAL=nvim
export PATH=$PATH:$HOME/bin
