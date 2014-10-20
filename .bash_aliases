# System
alias info="inxi -Fxz"
alias fail="systemctl list-units -a | grep failed"
alias update="sudo yaourt -Syu --aur"
alias remove="sudo pacman -Rns $(pacman -Qtdq)"
alias firewall=iptl 
alias lsps='ps -elf | grep'
alias ping='ping -c 100 -s.2'

# Emacs
alias re="systemctl restart emacs --user" 
alias de="emacs -nw --debug-init"

# Rails Job
alias d="ssh Dealer"
alias dfs="sshfs Dealer:/home/afsmnghr ~/Dealer"
alias dufs="fusermount -u ~/Dealer"
alias rails="sh ~/.rails.sh"
alias rsense="cd $RSENSE_HOME/bin && ruby rsense server &"  

# Git
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff | mate'
alias gau='git add --update'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcot='git checkout -t'
alias gcotb='git checkout --track -b'
alias glog='git log'
alias glogp='git log --pretty=format:"%h %s" --graph'

# Ls
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias l.='ls -d .* --color=auto'

# Grep
alias grep='grep --color=tty -d skip'

# 
alias df='df -h'                          # human-readable sizes
alias du='du -ch'
alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'

# Safely
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias cp="cp -i"                          # confirm before overwriting something
alias rm='rm -I --preserve-root'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root' 

# Cd
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# Jobs
alias h='history'
alias j='jobs -l'
alias c='clear'

# Network
alias ipt='sudo iptables'
alias iptl='sudo iptables -L -n -v --line-numbers'
alias iptlin='sudo iptables -L INPUT -n -v --line-numbers'
alias iptlout='sudo iptables -L OUTPUT -n -v --line-numbers'
alias iptlfw='sudo iptables -L FORWARD -n -v --line-numbers'