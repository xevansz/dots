# oh my zsh and plugins
export ZSH="$HOME/.config/zsh/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"
figlet Supriya
ZSH_THEME="aguile"

plugins=(
    git
    command-not-found
    colored-man-pages
)

source $ZSH/oh-my-zsh.sh
source "$HOME/.config/shell/alias"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# autocomplete
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# auto rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd
