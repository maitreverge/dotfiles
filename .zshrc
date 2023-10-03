export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="jonathan"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# COMMANDES CD
alias go42="~/Documents/42_pedago"
alias godotfiles="~/Documents/personal_repos/dotfiles"
alias golibft="~/Documents/42_pedago/libft"
alias gocorrection="~/Documents/corrections"
alias gotest="~/Documents/test"
alias gosujet="xdg-open ~/Documents/sujets/"


# ALIAS DE COMPILATEUR
alias gF="gcc -Wall -Wextra -Werror"
alias cF="cc -Wall -Wextra -Werror"

# ALIAS DE COMPILATEUR AVEC VALGRIND FLAG -G
alias gFV="gcc -Wall -Wextra -Werror -g"
alias cFV="cc -Wall -Wextra -Werror -g"

# ALIAS DE NORMINETTE
alias nc="norminette -R CheckForbiddenSourceHeader"
alias nd="norminette -R CheckDefine"

# ALIAS GIT
alias gs="git status"
alias gcheck='git ls-tree -r --name-only origin/master'
alias gp='git push'
alias gl='GIT_PAGER= git log --pretty=format:"%h %s"'


# SCRIPT FULL ADD + FULL COMMIT
function gcam() {
    git add -A && git add . && git commit -m "$1"
}
alias gcam='gcam'

# ALIAS DIVERS
alias lookfor='find . -name'
alias rmF='rm -Rf'
alias open="xdg-open ."
alias gozshrc="vim ~/.zshrc"
alias seezshrc="cat ~/.zshrc"

# ALIAS FRANCINETTE
alias francinette=/nfs/homes/flverge/francinette/tester.sh
alias paco=/nfs/homes/flverge/francinette/tester.sh
