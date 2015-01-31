# System
alias info='inxi -Fxz'
alias battery='acpi -b'
alias fail='systemctl list-units -a | grep failed'
alias update='sudo yaourt -Syu --aur'
alias remove='sudo pacman -Rns $(pacman -Qtdq)'
alias firewall=iptl
alias ping='ping -c 100 -s.2'
alias lsps='ps -el | grep'
alias backlight='xbacklight -set 0'
alias volume='amixer | grep -o "[0-9]*" | sed "5 ! d"'

# Emacs
alias re='systemctl restart emacs --user'
alias de='emacs -nw --debug-init'

# Kvm
alias toggle-kvm='toggle-kvm'

function toggle-kvm () {
status=$(systemctl status libvirtd.service | awk '/Active:/{printf $2}')
if [ "$status" == 'active' ]
then
sudo systemctl stop libvirtd.service
else
sudo systemctl start libvirtd.service
fi
}

# Android
alias android='go-mtpfs ~/Android'
alias undroid='sudo umount ~/Android'

# Game
alias solar='cd "/home/afsmnghr/.wine/drive_c/Program Files (x86)/Sins of a Solar Empire Rebellion/" && wine "Sins of a Solar Empire Rebellion.exe"'

# Git
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gbd='git branch -D'
alias gau='git add --update'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcob='gcob'
alias gcot='git checkout -t'
alias gcotb='git checkout --track -b'
alias glog='git log'
alias glogp='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gbc="git branch | grep -v '*' | grep -v 'master' | grep -v 'develop' | xargs git branch -D"

function gcob () {
BRANCH="$1"
git checkout master
git checkout -b "$BRANCH"
}

# Ls
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias l.='ls -d .* --color=auto'

# Grep
alias grep='grep --color=tty -d skip'
alias hs='history | grep '

# Etc
alias df='df -h'                          # human-readable sizes
alias du='du -ch'
alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'

# Safely actions
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias cp='cp -i'                          # confirm before overwriting something
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

# Darknet
alias tor='ssh -f -N -L 9050:localhost:9050 Xsrv'

# Mail
alias gmail='gmail'

function gmail() {
cd ~/.bin/festival/data/
if test -f ".gmail.yml";
then rm .gmail.yml
fi
ruby gmail.rb
}