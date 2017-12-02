# git prompt
# bash/zsh support
#
# examples:
#
#   source /path/to/git-prompt.sh
#
#   bash:
#     PS1="\u@\h \w $(git_prompt)\$ "
#
#   zsh:
#     setopt prompt_subst
#     PROMPT='...$(git_prompt)'
function git_prompt() {
  local branch head change branch_color head_color clear_color
  branch=`git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3`
  if [ -z "$branch" ]; then
    return
  fi
  head=`git rev-parse --verify -q HEAD 2>/dev/null | cut -c 1-8`
  change=`git status | grep "^nothing to"`
  if [ -z "$ZSH_VERSION" ]; then
    # bash using 16 colors
    head_color="\033[00;33m"  # \e[00;33m\]
    clear_color="\033[00m"  # \e[00m\]
    if [ -n "$change" ]; then
      branch_color="\033[00;32m"  # \e[00;32m\]
    else
      branch_color="\033[00;31m"  # \e[00;31m\]
    fi
  else
    # zsh using 256 colors
    head_color="%F{229}"
    clear_color="%f"
    if [ -n "$change" ]; then
      branch_color="%F{028}"
    else
      branch_color="%F{160}"
    fi
  fi
  echo -e "$branch_color$branch$clear_color $head_color$head$clear_color "
}
