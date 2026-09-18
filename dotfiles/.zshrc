# Set up autocompletion
autoload -Uz compinit
compinit

source <(kubectl completion zsh)
source <(fzf --zsh)

# Increase the stupidly low file descriptor limit in mac
ulimit -n 65536

# Starship
eval "$(starship init zsh)"

# Functions
ssh() {
    TERM=xterm-256color command ssh "$@"
}
