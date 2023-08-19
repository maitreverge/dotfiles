# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode auto      # update automatically
plugins=(git)
ZSH_THEME=jonathan
source $ZSH/oh-my-zsh.sh

# MOVE ALIASES
alias godev="~/Documents/DEV"
alias go42="~/Documents/DEV/42"

# COMPILATION ALIASES
alias gF="gcc -Wall -Wextra -Werror"
alias cF="cc -Wall -Wextra -Werror"
alias gFmem="gcc -Wall -Wextra -Werror -fsanitize=address"
alias cFmem="cc -Wall -Wextra -Werror -fsanitize=address"

# NORMINETTE ALIASES
alias nc="norminette -R CheckForbiddenSourceHeader"
alias nd="norminette -R CheckDefine"

# GIT ALIASES
alias gs="git status"
alias gp='git push'
alias gl='GIT_PAGER= git log --pretty=format:"%h %s"'
alias gcheck='git ls-tree -r --name-only origin/master'

# DIVERSES ALIASES
alias lookfor='find . -name'
alias rmF='rm -Rf'
alias gozshrc='vim ~/.zshrc'

# CUSTOM FUNCTIONS
function shellpassword() {
	eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_ed25519
}
alias shellpassword="shellpassword"

function gcam() {
    git add -A && git add . && git commit -m "$1"
}
alias gcam='gcam'