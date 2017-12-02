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
    # NOTE:
    # This breaks history showing or line break in some situation
    # (e.g. long line)...
    # Prompt configuration might be also related to this issue. See
    # `.bashrc`. Until fixing the issue, disable color in bash :'(
    #
    # ```
    # PS1='\[\033[01;32m\]\u@\h\[\033[0m\] \[\033[01;34m\]\w\[\033[0m\] $(git_prompt)\$ '
    # ```
    #
    ## bash using 16 colors
    #head_color="\033[0;33m"
    #clear_color="\033[0m"
    #if [ -n "$change" ]; then
    #  branch_color="\033[0;32m"
    #else
    #  branch_color="\033[0;31m"
    #fi
    # no color :'(h
    head_color=""
    clear_color=""
    if [ -n "$change" ]; then
      branch_color=""
    else
      branch_color=""
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
