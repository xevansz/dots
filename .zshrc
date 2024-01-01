
# my path
export PATH=$HOME/.local/bin:$PATH

# oh my zsh and plugins
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="alanpeabody"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# My alias
alias zshconf="nvim ~/.zshrc"
alias logout="shopt -q login_shell && logout || qdbus org.kde.ksmserver /KSMServer logout 0 0 1"
alias shutdown="shopt -q login_shell && logout || qdbus org.kde.ksmserver /KSMServer logout 1 2 1"
alias restartplasma="kquitapp5 plasmashell && kstart5 plasmashell"
alias pacman="sudo pacman"

# plugins
source ~/.zsh/zsh-autosuggestions.zsh
source ~/.zsh/zsh-history-substring-search.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-syntax-highlighting/catppuccin_mocha-zsh-syntax-highlighting.zsh

