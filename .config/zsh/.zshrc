# sys disable systemd-networkd-wait-online.service
# load modules
autoload -Uz compinit add-zsh-hook

export ZSH="$HOME/.config/zsh/.oh-my-zsh" # ohmyzsh
export PATH="$HOME/.local/bin:$PATH" # local script files and python packages
export PATH="/usr/local/cuda-12.5/bin:$PATH" # cuda
export LD_LIBRARY_PATH="/usr/local/cuda-12.5/lib64:$LD_LIBRARY_PATH" # cuda
export CC=/usr/bin/gcc-12 # to use gcc 12 for nvcc and tf comppatibility
export CXX=/usr/bin/g++-12

ZSH_THEME="aguile"
source $ZSH/oh-my-zsh.sh

plugins=(
    git
    command-not-found
    colored-man-pages
)

# alias and plugins
source "$HOME/.config/shell/alias"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# completion setup
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
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

# main opts
setopt append_history inc_append_history share_history
setopt auto_menu menu_complete
setopt auto_param_slash
setopt dot_glob
setopt extended_glob
unsetopt prompt_sp

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
