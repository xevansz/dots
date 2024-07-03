
# oh my zsh and plugins
export ZSH="$HOME/.config/zsh/oh-my-zsh"
ZSH_THEME="alanpeabody"

plugins=(
    git
    zsh-history-substring-search
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source "$XDG_CONFIG_HOME/.config/shell/alias"

# plugins
# source ~/.config/zsh/.zsh/zsh-autosuggestions.zsh
# source ~/.config/zsh/.zsh/zsh-history-substring-search.zsh
source ~/.config/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/.config/zsh/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
