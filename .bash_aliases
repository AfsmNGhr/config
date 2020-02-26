# System
alias fail='systemctl --failed'
alias update='yaourt -Syua'
alias remove='sudo pacman -Rnsc $(pacman -Qtdq)'

# Startup
alias Stime='sudo systemd-analyze'
alias Btime='Stime blame'
alias Ctime='Stime critical-chain'

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
alias record='ffmpeg -f alsa -i pulse -f x11grab -r 25 -s 1920x1080 -i :0.0 -q:v 1 -q:a 1 -pix_fmt yuv420p -y output.mkv'

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

# Cd
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# Utils
alias h='history'
alias hd='
nl ~/.bash_history | sort -k 2  -k 1,1nr| uniq -f 1 | sort -n | cut -f 2 > unduped_history
mv unduped_history ~/.bash_history
'
alias j='jobs -l'
alias c='clear'

alias dockemacs='
docker run -it --rm --net=host \
     --cpuset-cpus 0 \
     --env-file $HOME/.dockemacs \
     --entrypoint initialize "$@" \
     -v $HOME:/mnt/workspace \
     -v emacs_data:/home/emacser/.emacs.d \
     -v /etc/localtime:/etc/localtime:ro \
     afsmnghr/dockemacs:1.12.0 startup
'
