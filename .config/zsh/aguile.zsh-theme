# Git branch
function git_branch {
    git_branch=$(command git rev-parse --abbrev-ref HEAD 2>/dev/null)
    [[ -n "$git_branch" ]] && echo "<${git_branch}>"
}

# --- Minimal Style ---
export PS1=$'[%n@%m \e[0;36m%~\e[0m$(git_branch)]\nζ '

return

# aguile.zsh-theme
# A clean, colorful ZSH theme for Oh My Zsh
# Author: Evans <minithbmatthew@gmail.com>
# License: MIT
# Inspired by crow and simplicity

# user colors
local highlight_bg=$bg[red]
local magenta_bold=$fg_bold[magenta]
local white_bold=$fg_bold[white]
local yellow_bold=$fg_bold[yellow]
local blue=$fg[blue]
local blue_bold=$fg_bold[blue]
local cyan_bold=$fg_bold[cyan]
local green_bold=$fg_bold[green]

local zen='ζ ➤'
#local zen='λ'
#local zen='ζ'

function get_usr_name {
    local name="%n"
    if [[ "$USER" == 'root' ]]; then
        echo "%{$highlight_bg%}%{$white_bold%}$name%{$reset_color%}"
    else
      echo "%{$green_bold%}$name%{$reset_color%}"
    fi
}

# box name
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
}

# Directory info.
function get_current_dir {
    echo "${PWD/#$HOME/~}"
}

# return status
local ret_status="%{$magenta_bold%}$zen %{$reset_color%}"

# prompt format: \n USER MACHINE DIRECTORY \n STATUS
function print_prompt_head {
    local prompt="[%{$green_bold%}$(get_usr_name)\
%{$blue%}@\
%{$cyan_bold%}$(box_name)\
%{$blue_bold%} \
%{$yellow_bold%}$(get_current_dir)%{$reset_color%} \
$(git_branch)]"
    print -rP "$prompt"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd print_prompt_head
setopt prompt_subst

PROMPT='${ret_status}'
