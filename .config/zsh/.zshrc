# oh my zsh and plugins
export ZSH="$HOME/.config/zsh/.oh-my-zsh"
ZSH_THEME="zeta"

plugins=(
    git
    command-not-found
    colored-man-pages
)

source $ZSH/oh-my-zsh.sh
source "$HOME/.config/shell/alias"
source ~/.config/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
