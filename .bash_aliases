# System
alias battery='acpi -b'
alias fail='systemctl --failed'
alias update='sudo yaourt -Syu --aur'
alias remove='sudo pacman -Rns $(pacman -Qtdq)'
alias firewall=iptl
alias ping='ping -c 100 -s.2'
alias lsps='ps -el | grep'
alias backlight='xbacklight -set 0'

# Startup
alias Stime='sudo systemd-analyze'
alias Btime='Stime blame'
alias Ctime='Stime critical-chain'

# Weather
alias weather='~/.bin/festival/weather'

# Volume
alias volume='amixer | grep -o "[0-9]*" | sed "5 ! d"'
alias 30='amixer set Master 30%'

# Record
alias record='ffmpeg -f alsa -i pulse -f x11grab -r 25 -s 1600x900 \
-i :0.0 -q:v 1 -q:a 1 -pix_fmt yuv420p -y output.mkv'

# Emacs
alias e='emacsclient -t'
alias re='systemctl restart emacs --user'
alias ref="kill -16 $(ps -el | awk '/emacsclient/{printf $4}')
systemctl restart emacs --user"
alias de='emacs -nw --debug-init'

# Kvm
alias toggle-kvm='toggle-kvm'
toggle-kvm () {
status=$(systemctl status libvirtd.service | awk '/Active:/{printf $2}')
if [ "$status" == 'active' ]
then
sudo systemctl stop libvirtd.service
else
sudo systemctl start libvirtd.service
fi }

# Android
alias android='go-mtpfs ~/Android'
alias undroid='sudo umount ~/Android'

# Wine
alias stamina='wine "/home/afsmnghr/.wine/drive_c/Program Files (x86)/\
Stamina/Stamina.exe"'

# Git
alias gdf='git diff'
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
alias gcot='git checkout -t'
alias gcotb='git checkout --track -b'
alias glog='git log'
alias glogp='git log --graph --full-history --all --color \
--pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gbc="git branch | grep -v '*' | grep -v 'master' | \
grep -v 'develop' | xargs git branch -D"

alias gcob='
BRANCH="$1"
git checkout master
git checkout -b "$BRANCH"'

# Ls
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" \
--color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" \
--color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" \
--color=auto -F'
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
alias gmail="
rm .gmail.yml if test -f ".gmail.yml"
~/.bin/festival/data/gmail"

# Development
alias Fest='cd ~/Documents/Work/fest'
alias Fest-scripts='cd ~/.bin/festival'
alias Work='cd ~/Documents/Work'
alias Jekyll='cd ~/Documents/Work/jekyll'