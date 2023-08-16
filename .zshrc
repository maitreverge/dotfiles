export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' frequency 1
ZSH_THEME=jonathan

source $ZSH/oh-my-zsh.sh

#alias godev=""
#alias go42=""
alias gF="gcc -Wall -Wextra -Werror"

#alias gFmem="gcc -Wall -Wextra -Werror -fsanitize=address"
alias normicheck="norminette -R CheckForbiddenSourceHeader"
alias normidefine="norminette -R CheckDefine"
alias gs="git status"

function gcam() {
    git add -A && git add . && git commit -m "$1"
}
alias gcam='gcam'

alias gp='git push'
alias lookfor='find . -name'

