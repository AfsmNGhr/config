# System
alias Info='alsi -n arch -t -u ~/.config/alsi/alsi.conf'
alias fail='systemctl --failed'
alias update='yaourt -Syua'
alias remove='sudo pacman -Rnsc $(pacman -Qtdq)'
alias firewall=iptl
alias ping='ping -c 100 -s.2'
alias lsps='ps -el | grep'
alias backlight='xbacklight -set 0'

# Startup
alias Stime='sudo systemd-analyze'
alias Btime='Stime blame'
alias Ctime='Stime critical-chain'

# Music
alias Playlist='~/.bin/app/playlist'
alias Flac='~/.bin/app/flac'

# Wifi
alias Wifi='~/.bin/app/wifi'

# Exit
alias Exit='~/.bin/app/exit'

# Sphinx
alias Sphinx='~/.bin/app/sphinx'

# Docker
Docker () {
status=$(systemctl status docker | awk '/Active:/{printf $2}')
if [ "$status" == 'active' ]
then
sudo systemctl stop docker
else
sudo systemctl start docker
fi }

# Volume
alias volume='amixer | grep -o "[0-9]*" | sed "5 ! d"'
alias 30='amixer set Master 30%'

# Record
alias record='ffmpeg -f alsa -i pulse -f x11grab -r 25 -s 1600x900 -i :0.0 -q:v 1 -q:a 1 -pix_fmt yuv420p -y output.mkv'

# Android
alias android='sudo jmtpfs -o allow_other /mnt'
alias undroid='sudo umount /mnt'

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
alias ls='ls --time-style=+"%d.%m.%Y %H:%M" \
--color=auto -F'
alias ll='ls -l --time-style=+"%d.%m.%Y %H:%M" \
--color=auto -F'
alias la='ls -la --time-style=+"%d.%m.%Y %H:%M" \
--color=auto -F'
alias l.='ls -d .* --color=auto'

# Grep
alias grep='grep --color=tty -d skip'
alias hs='history | grep '

# Etc
alias df='df -h'
alias du='du -ch'
alias free='free -m'

# Safely actions
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias cp='cp -i'

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

alias vga='
xrandr --newmode "1680x1050_60.00"  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync
xrandr --addmode VGA1 1680x1050_60.00
xrandr --output VGA1 --mode 1680x1050_60.00
xrandr --output LVDS1 --mode 1600x900 --fb 1600x900 --panning 1600x900
xrandr --output LVDS1 --mode 1600x900 --fb 1680x1050_60.00 --panning 1680x1050_60.00
'

alias dockemacs='
docker run -it --rm --net=host \
     --env-file $HOME/.dockemacs \
     --entrypoint initialize "$@" \
     -v $HOME:/mnt/workspace \
     -v emacs_data:/home/emacser/.emacs.d \
     -v /etc/localtime:/etc/localtime:ro \
     afsmnghr/dockemacs:1.8.0 startup
'
