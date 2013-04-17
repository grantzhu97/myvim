

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

#smart find (find with excluede .git .svn)
alias sfind='find . -type d \( -name .git -o -name .svn -o -name .repo \) -prune -o -print'

# git config
alias gls='git ls-tree -r HEAD'
alias glogd="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# history management
export HISTSIZE=100000
export HISTFILESIZE=100000000
