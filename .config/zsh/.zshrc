# sys disable systemd-networkd-wait-online.service
autoload -Uz add-zsh-hook compinit
compinit

# path && tools
export ZSH="$HOME/.config/zsh/.oh-my-zsh" # ohmyzsh
export PATH="$HOME/.local/bin:$PATH" # local script files and python packages
export PATH="/opt/cuda/bin:$PATH" # cuda
export LD_LIBRARY_PATH="/opt/cuda/lib64:$LD_LIBRARY_PATH" # cuda
export CC=/usr/bin/gcc # to use gcc 12 for nvcc and tf comppatibility
export CXX=/usr/bin/g++ # replace gcc with gcc-12, same for g++ -> g++-12

# alias
source "$HOME/.config/shell/alias"

# completion setup
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no # select
zstyle ':completion::complete:*' gain-privileges 1

# history settings
export HISTFILE="$HOME/.local/state/zsh/history"
HISTSIZE=5000
SAVEHIST=5000
mkdir -p "$(dirname "$HISTFILE")"

setopt append_history inc_append_history share_history extended_history hist_expire_dups_first hist_verify
setopt auto_menu menu_complete auto_cd correct
setopt auto_param_slash dot_glob extended_glob
unsetopt prompt_sp

# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/fzf-tab-source/fzf-tab.plugin.zsh

# shell integration
eval "$(fzf --zsh)"

# auto rehash
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
