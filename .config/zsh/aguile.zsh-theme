# aguile theme for oh-my-zsh
# I did not test on any other machines except mine
# Copyright: evans, 2024 (need go get it. I don't know how)

# user colors
local highlight_bg=$bg[red]
local magenta_bold=$fg_bold[magenta]
local white_bold=$fg_bold[white]
local yellow_bold=$fg_bold[yellow]
local blue=$fg[blue]
local cyan_bold=$fg_bold[cyan]
local green_bold=$fg_bold[green]

local zen='ζ ➤'

function get_usr_name {
    local name="suppi"  #"%n"
    if [[ "$USER" == 'root' ]]; then
        name="%{$highlight_bg%}%{$white_bold%}$name%{$reset_color%}"
    fi
    echo $name
}

# box name
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
}

# Directory info.
function get_current_dir {
    echo "${PWD/#$HOME/~}"
}

# Git branch
function git_branch {
    git_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$git_branch" ]; then
        echo "<${git_branch}>"
    fi
}


# return status
local ret_status="%{$magenta_bold%}$zen %{$reset_color%}"

# prompt format: \n USER MACHINE DIRECTORY \n STATUS
function print_prompt_head {
    local prompt="%{$green_bold%}$(get_usr_name)\
%{$blue%}@\
%{$cyan_bold%}$(box_name) \
%{$yellow_bold%}$(get_current_dir)%{$reset_color%} \
$(git_branch)"
    print -rP "$prompt"
}

autoload -U add-zsh-hook
add-zsh-hook precmd print_prompt_head
setopt prompt_subst

PROMPT='${ret_status}'
