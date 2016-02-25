# .sh.d

Shared shell scripts for shell.


## git-prompt.sh

The branch and repo status will be displayed in prompt only if
you are currently in a git repo.

### usage

Just `source`, then use `git_prompt`

#### `.bashrc`

```bash
source /path/to/git-prompt.sh
PS1="\u@\h \w \$(git_prompt)\$ "
```

#### `.zshrc`

```zsh
source /path/to/git-prompt.sh
setopt prompt_subst
PROMPT='...$(git_prompt)'
```

### output examples

use `git_prompt` as you like:

```bash
# e.g. bash
username@hostname ~ $ cd ~/.sh.d
username@hostname ~/.sh.d master 3baf7507 $
```

```zsh
# e.g. zsh
% cd ~/.sh.d
hostname ~/.sh.d master 6a740dab 0.04, 0.05, 0.12
%
```

### link

`git` has already a script for prompt.

* https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh


## license

Copyright (C) 2014 - 2016 Yasuhiro Asaka \<grauwoelfchen@gmail.com\>  
Distributed under the GNU General Public License, version [2.0](http://www.gnu.org/licenses/gpl-2.0.txt).
