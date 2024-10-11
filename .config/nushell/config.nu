$env.config = {
  show_banner: false,
}

# alias
alias vi = nvim
alias vim = nvim
alias ll = ls -l

alias t = tmux
alias ta = tmux a -t
alias tn = tmux new -s
alias tls = tmux ls

alias y = yazi
alias lg = lazygit

use ~/.cache/starship/init.nu
use ./completions/git.nu *
