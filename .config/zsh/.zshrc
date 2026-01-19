# sys disable systemd-networkd-wait-online.service
# load modules
autoload -Uz add-zsh-hook

export ZSH="$HOME/.config/zsh/.oh-my-zsh" # ohmyzsh
export PATH="$HOME/.local/bin:$PATH" # local script files and python packages
export PATH="/opt/cuda/bin:$PATH" # cuda
export LD_LIBRARY_PATH="/opt/cuda/lib64:$LD_LIBRARY_PATH" # cuda
export CC=/usr/bin/gcc # to use gcc 12 for nvcc and tf comppatibility
export CXX=/usr/bin/g++ # replace gcc with gcc-12, same for g++ -> g++-12

zstyle ':omz:update' mode disabled

ZSH_THEME="aguile"

plugins=(
#    git  - I am not using omz alias anymore
    command-not-found
    colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# alias and plugins
source "$HOME/.config/shell/alias"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# completion setup
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# auto rehash
zshcache_time="$(date +%s%N)"
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

# history settings
export HISTFILE="$HOME/.local/state/zsh/history"
HISTSIZE=5000
SAVEHIST=5000
mkdir -p "$(dirname "$HISTFILE")"

# main opts
setopt append_history inc_append_history share_history extended_history
setopt auto_menu menu_complete
setopt auto_param_slash
setopt dot_glob
setopt extended_glob
unsetopt prompt_sp
