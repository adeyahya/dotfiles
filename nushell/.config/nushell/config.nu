$env.config = {
  buffer_editor: "nvim"
  show_banner: false
}

alias vim = nvim
alias v = nvim
alias lg = lazygit
alias finder = /usr/bin/open
alias y = yazi

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

source $"($nu.cache-dir)/carapace.nu"
source $"($nu.home-path)/.cargo/env.nu"
