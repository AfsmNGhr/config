# Bash completion
if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
fi

# Git completion
if [ -x /usr/bin/git ]; then
    source /usr/share/git/completion/git-completion.bash
fi

# Bash aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo
set -o emacs

shopt -s autocd
shopt -s cdspell
shopt -s globstar
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

export HISTTIMEFORMAT='%F %T '
export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:ls:[bf]g:exit:[ ]*:ssh:history"
export TERM=xterm-256color
export EDITOR='emacsclient -t'

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

case "$TERM" in
	"dumb")
	    PS1="> "
	    ;;
	xterm*|rxvt*|eterm*|screen*)
  	  PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] \[\033[1;31m\]& \[\033[0;36m\]\h \[\033[1;34m\]\w\[\033[0;32m\]\n\[\033[0;32m\]└─> \[\033[1;31m\]$(parse_git_branch) \[\033[0m\033[0;32m\]\$\[\033[0m\033[1;38m\] '
	    ;;
	linux*)
	    PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] \[\033[1;31m\]& \[\033[0;36m\]\h \[\033[1;34m\]\w\[\033[0;32m\]\n\[\033[0;32m\]└─> \[\033[1;31m\]$(parse_git_branch) \[\033[0m\033[0;32m\]\$\[\033[0m\033[1;38m\] '
	    ;;
	*)
	    PS1="> "
	    ;;
esac
