
##############################################
# my settings
#
# add to .bashrc and run . ~/.bashrc to enable these settings
#if [-f ~/.xbashrc ] then
#    . ~/.xbashrc
#fi
#############################################
alias rm='rm -v'
alias cp='cp -v'
alias v='vim'
alias vv='vim -O'
alias vd='vimdiff'
alias gvim="gvim -f 2>/dev/null"
alias g='gvim'
alias vrc='vim ~/.vimrc'
alias vbrc='vim ~/.bashrc'
alias vbal='vim ~/.bash_aliases'
alias sbrc='source ~/.bashrc'
alias hi='history | tail -20'
alias dus='du -s *|sort -n'
alias dusm='du -sm *|sort -n'
alias dusk='du -sk *|sort -n'
alias findjava='find . -name "*.java"'
alias findh='find . -name "*.h"'
alias findc='find . -name "*.c"'
alias findcpp='find . -name "*.cpp"'
alias findmk='find . -name "*.mk" -o -name "Makefile" -o -name "makefile"'
alias findx='find . -type f -name "Makefile" -o -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.java" -o -name "*.rc" -o -name "*.mk"'
alias findko='find . -name "*.ko"'
alias findso='find . -name "*.so"'
alias findnf='find . -mmin -10'
alias findnfx='find . -mmin '
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias e='vim'
alias egrep='grep -E'
alias fgrep='grep -F'
alias ping='ping -vc1'
alias dh='df -h'
alias less='/bin/less -r'

#smart find (find with excluede .git .svn)
alias sfind='find . -type d \( -name .git -o -name .svn -o -name .repo \) -prune -o -print'

# git config
alias gst='git status'
alias gls='git ls-tree -r HEAD'
alias glogd="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gitdiff-1="git log --reverse|grep commit|cut -d ' ' -f2|tail -n 2|head -n 2|xargs echo|sed -e 's/\s/../'|xargs -n 1 git diff"
alias gitdiff-2="git log --reverse|grep commit|cut -d ' ' -f2|tail -n 3|head -n 2|xargs echo|sed -e 's/\s/../'|xargs -n 1 git diff"
alias gitdiff-3="git log --reverse|grep commit|cut -d ' ' -f2|tail -n 4|head -n 2|xargs echo|sed -e 's/\s/../'|xargs -n 1 git diff"
alias gitlog-1="git log --reverse|grep commit|cut -d ' ' -f2|tail -n 2|head -n 2|xargs echo|sed -e 's/\s/../'|xargs -n 1 git log --summary"
alias gitlog-2="git log --reverse|grep commit|cut -d ' ' -f2|tail -n 3|head -n 2|xargs echo|sed -e 's/\s/../'|xargs -n 1 git log --summary"
alias gitlog-3="git log --reverse|grep commit|cut -d ' ' -f2|tail -n 4|head -n 2|xargs echo|sed -e 's/\s/../'|xargs -n 1 git log --summary"
alias gitshowall='git show --pretty=fuller --oneline HEAD^^..HEAD'
alias gsa='git show --pretty=fuller --oneline HEAD^^..HEAD'

# history management
export HISTSIZE=100000
export HISTFILESIZE=100000000
