export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:~/.local/bin
ZSH_THEME="jonathan"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# COMMANDES CD
alias go42="~/Documents/42_pedago"
alias gowebserv="~/Documents/42_pedago/webserv"
alias gosgoinfre="~/sgoinfre/"
alias gogoinfre="~/goinfre/"
alias goperso="~/Documents/personal_repos/"
alias godotfiles="~/Documents/personal_repos/dotfiles"
alias gocorrection="~/Documents/corrections"
alias gotest="~/Documents/test"
alias gosujet="xdg-open ~/Documents/sujets/"

# COMMANDES PEDAGO

# ALIAS DE COMPILATEUR
alias gF="gcc -Wall -Wextra -Werror"
alias cF="cc -Wall -Wextra -Werror"
alias c98="c++ -Wall -Wextra -std=c++98"
alias g98="g++ -Wall -Wextra -std=c++98"
alias cr="cargo run"

# ALIAS DE COMPILATEUR AVEC VALGRIND FLAG -G
alias gFmem="gcc -Wall -Wextra -Werror -g"
alias cFmem="cc -Wall -Wextra -Werror -g"

# ALIAS VALGRIND
alias valgrind_full="valgrind --leak-check=full --show-leak-kinds=all"
alias valgrind_mute_child="valgrind --child-silent-after-fork=yes"
alias datarace="valgrind --tool=helgrind"

# ALIAS DE NORMINETTE
#alias nc="norminette -R CheckForbiddenSourceHeader"
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

# RUN SCRIPT GRADEME42
alias rungrademe='bash -c "$(curl https://grademe.fr)"'

# ALIAS DIVERS
alias lookfor='find . -name'
alias rmF='rm -Rf'
alias open="xdg-open ."
alias gozshrc="vim ~/.zshrc"
alias seezshrc="cat ~/.zshrc"
alias lock="ft_lock"
alias l="clear"
alias md="make debug"
alias mmd="make && md"
alias killcache="bash ~/cleanCache.sh"

alias postman="~/postman-linux-x64/Postman/ && ./Postman"
alias chrome="setsid flatpak run com.google.Chrome > /dev/null 2>1 &"

# ALIAS FRANCINETTE
alias francinette=/nfs/homes/flverge/francinette/tester.sh
alias paco=/nfs/homes/flverge/francinette/tester.sh

# Kill 42 cache at each new zsh instance
killcache
