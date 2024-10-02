export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="jonathan"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# COMMANDES CD
alias go42="~/Documents/42_pedago"
alias gosgoinfre="~/sgoinfre/"
alias gogoinfre="~/goinfre/"
alias goperso="~/Documents/personal_repos/"
alias godotfiles="~/Documents/personal_repos/dotfiles"
alias gocorrection="~/Documents/corrections"
alias gotest="~/Documents/test"
alias gosujet="xdg-open ~/Documents/sujets/"

# COMMANDES PEDAGO

alias golibft="~/Documents/42_pedago/FINISHED_PROJECTS/libft"
alias gognl="~/Documents/42_pedago/FINISHED_PROJECTS/get_next_line"
alias gofinished="~/Documents/42_pedago/FINISHED_PROJECTS"

# ALIAS DE COMPILATEUR
alias gF="gcc -Wall -Wextra -Werror"
alias cF="cc -Wall -Wextra -Werror"

# ALIAS DE COMPILATEUR AVEC VALGRIND FLAG -G
alias gFmem="gcc -Wall -Wextra -Werror -g"
alias cFmem="cc -Wall -Wextra -Werror -g"

# ALIAS VALGRIND
alias valgrind_full="valgrind --leak-check=full --show-leak-kinds=all"
alias valgrind_mute_child="valgrind --child-silent-after-fork=yes"
alias valgrind_pipex="valgrind --trace-children=yes --leak-check=full --show-leak-kinds=all --track-fds=yes"

# ALIAS DE NORMINETTE
alias nc="norminette -R CheckForbiddenSourceHeader"
alias nd="norminette -R CheckDefine"

# ALIAS GIT
alias gs="git status"
alias gcheck='git ls-tree -r --name-only origin/master'
alias gp='git push'
alias gpll='git pull'
alias gl='GIT_PAGER= git log --pretty=format:"%h %s"'


# SCRIPT FULL ADD + FULL COMMIT
function gcam() {
    git add -A && git add . && git commit -m "$1"
}
alias gcam='gcam'

function ff(){
	make && ./fractol
}

alias ff='ff'

function PF() {
	make re && gcc my_tester.c libftprintf.a
}
alias PF='PF'

# RUN SCRIPT GRADEME42
alias rungrademe='bash -c "$(curl https://grademe.fr)"'

# LIST FD
listfd() {
	if [ -z "$1" ]; then
		echo "Usage : listfd <PID>"
	else
		ls -la "/proc/$1/fd"
	fi
}

# ALIAS DIVERS
alias lookfor='find . -name'
alias rmF='rm -Rf'
alias open="xdg-open ."
alias gozshrc="vim ~/.zshrc"
alias seezshrc="cat ~/.zshrc"


# ALIAS FRANCINETTE
alias francinette=/nfs/homes/flverge/francinette/tester.sh
alias paco=/nfs/homes/flverge/francinette/tester.sh

alias vscode="~/./code-stable-x64-1696981541/VSCode-linux-x64/bin/code"
