#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load custom aliases
[ -f ~/.config/shell/alias ] && source ~/.config/shell/alias

export CLICOLOR=1
export PS1='\u@\h:\[\e[33m\]$(p=$(pwd | sed "s|$HOME|~|"); [[ "$p" == "~" ]] && echo "~" || echo "$p" | awk -F/ "{print \$(NF-1)\"/\"\$NF}")\[\e[0m\]λ '
export BASH_SILENCE_DEPRECATION_WARNING=1
export NVM_DIR="$HOME/.nvm"
