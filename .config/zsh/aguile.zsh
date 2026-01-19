# aguile.zsh
# A clean, colorful ZSH theme
# Author: Evans
# License: MIT
# Inspired by crow and simplicity

autoload -Uz add-zsh-hook colors vcs_info
colors

setopt prompt_subst

# colors
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

# git
zstyle ':vcs_info:git:*' formats '<%b>'
zstyle ':vcs_info:*' enable git

add-zsh-hook precmd vcs_info

# helpers
get_usr_name() {
  local name="%n"
  if [[ $EUID -eq 0 ]]; then
    echo "%{$highlight_bg%}%{$white_bold%}$name%{$reset_color%}"
  else
    echo "%{$green_bold%}$name%{$reset_color%}"
  fi
}

box_name() {
  [[ -f ~/.box-name ]] && <~/.box-name || print -r -- "$HOST"
}

get_current_dir() {
  print -r -- "${PWD/#$HOME/~}"
}

# prompt
print_prompt_head() {
  print -rP "[\
%{$green_bold%}$(get_usr_name)\
%{$blue%}@\
%{$cyan_bold%}$(box_name)\
%{$blue_bold%} \
%{$yellow_bold%}$(get_current_dir)%{$reset_color%} \
${vcs_info_msg_0_}]"
}

add-zsh-hook precmd print_prompt_head

PROMPT="%{$magenta_bold%}$zen %{$reset_color%}"
