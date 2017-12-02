# .sh.d

Personal shared shell scripts for shells.


## Repository

https://gitlab.com/grauwoelfchen/DotShD


## Setup

The branch and repo status will be displayed in the prompt, only if
you are currently in a git repo.

Just `source git-prompt.sh`, then use `git_prompt`

### Bash `.bashrc`

```bash
source /path/to/git-prompt.sh
PS1='\u@\h \w $(git_prompt)\$ '
```

### Zsh `.zshrc`

```zsh
source /path/to/git-prompt.sh
setopt prompt_subst
PROMPT='...$(git_prompt) '
```

### Examples

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

### Link

Git has already a script for prompt like this one.  
You may want to use it.

* https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh


## License

Copyright (c) 2014-2017 Yasuhiro Asaka

This is free software:  
You can redistribute it and/or modify it under the terms of
the GUN General Public License as published by the
Free Software Foundation.

See [LICENSE](LICENSE). (`GPL-2.0`)
