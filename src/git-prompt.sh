# git prompt
# bash/zsh support
#
# examples:
#
#   source /path/to/git-prompt.sh
#
#   bash:
#     PS1="\u@\h \w \$(git_prompt)\$ "
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
  # NOTE
  # https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh#250
  # square brackets \[ and \] both are needed ?
  if [ -z "$ZSH_VERSION" ]; then
    # bash 16 using colors
    head_color="\e[0m" # or \e[0;33m\] ?
    clear_color="\e[0m"
    if [ -n "$change" ]; then
      branch_color="\e[0;32m"
    else
      branch_color="\e[0;31m"
    fi
  else
    # zsh 256 using colors
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
