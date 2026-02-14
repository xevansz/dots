# Aguile ZSH theme
# Copyright: Evans, 2024
# Inspired by crow and skylerlee

autoload -Uz add-zsh-hook colors
colors

setopt prompt_subst

# colors
local red=$fg[red]
local blue=$fg[blue]
local green=$fg[green]
local yellow=$fg[yellow]
local magenta=$fg[magenta]
local cyan=$fg[cyan]
local white=$fg[white]

local red_bold=$fg_bold[red]
local blue_bold=$fg_bold[blue]
local green_bold=$fg_bold[green]
local yellow_bold=$fg_bold[yellow]
local magenta_bold=$fg_bold[magenta]
local cyan_bold=$fg_bold[cyan]
local white_bold=$fg_bold[white]

local highlight_bg=$bg[red]

#local zen='ζ ➤➤'
local zen='ζ >>'

# box name
box_name() {
  echo $HOST
}

# user name
get_usr_name() {
  local name="%n"
  if [[ $EUID -eq 0 ]]; then
    name="%{$highlight_bg%}%{$white_bold%}$name%{$reset_color%}"
  fi
  echo $name
}

# git
git_branch() {
  local branch
  branch=$(command git symbolic-ref --quiet --short HEAD 2>/dev/null) || return
  print -r "<$branch>"
}

# pwd
get_current_dir() {
  print -r -- "${PWD/#$HOME/~}"
}

# prompt: USER@MACHINE:DIRECTORY<GIT_BRANCH>
print_prompt_head() {
  print -rP "\
%{$green_bold%}$(get_usr_name)\
%{$red_bold%}@\
%{$cyan_bold%}$(box_name): \
%{$yellow_bold%}$(get_current_dir)%{$reset_color%} \
$(git_branch)"
}

add-zsh-hook precmd print_prompt_head

PROMPT="%{$magenta_bold%}$zen %{$reset_color%}"
