# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH
export PATH=/sbin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
ZSH_THEME="alanpeabody"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias zshconf="nvim ~/.zshrc"
alias logout="shopt -q login_shell && logout || qdbus org.kde.ksmserver /KSMServer logout 0 0 1"
alias logout="shopt -q login_shell && logout || qdbus org.kde.ksmserver /KSMServer logout 1 2 1"
alias restartplasma="kquitapp5 plasmashell && kstart5 plasmashell"
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias sys="systemctl"
alias pacman="sudo pacman"
alias q="exit"
alias py="python"
alias su="sudo"
alias commit.="git add . && git commit -m"
alias yt="yt-dlp"

# source pluggins
source ~/.zsh/zsh-autosuggestions.zsh
source ~/.zsh/zsh-history-substring-search.zsh
source /home/zen/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-syntax-highlighting/catppuccin_mocha-zsh-syntax-highlighting.zsh

