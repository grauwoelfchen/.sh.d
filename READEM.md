# .sh.d

Shared shell scripts for bash/zsh


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

### output

```bash
yasuhiro ~ $ cd /path/to/git/repo
yasuhiro ~ /path/to/git/repo master 3baf7507 $
```

### link

`git` has already a script for prompt.

* https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
