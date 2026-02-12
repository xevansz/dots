# sys disable systemd-networkd-wait-online.service
autoload -Uz add-zsh-hook compinit
compinit

# alias
source "$HOME/.config/shell/alias"

# completion style
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu no # select
zstyle ':completion::complete:*' gain-privileges 1

# history config
export HISTFILE="$HOME/.local/state/zsh/history"
HISTSIZE=5000
SAVEHIST=5000
mkdir -p "$(dirname "$HISTFILE")"

setopt append_history inc_append_history share_history extended_history hist_expire_dups_first hist_verify
setopt auto_menu menu_complete auto_cd
setopt auto_param_slash dot_glob extended_glob # correct
unsetopt prompt_sp

# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/fzf-tab-source/fzf-tab.plugin.zsh

# fzf integration
eval "$(fzf --zsh)"

# auto rehash hook
if [[ -a /var/cache/zsh/pacman ]]; then
  zshcache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
else
  zshcache_time=0
fi
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

# theme
source ~/.config/zsh/aguile.zsh
