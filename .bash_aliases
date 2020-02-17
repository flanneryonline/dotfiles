# if user is not root, pass all commands via sudo #
use_sudo=
if [ $UID -ne 0 ]; then
    use_sudo="sudo"
fi

alias upgrade="$use_sudo apt update && $use_sudo apt upgrade"

function install () {
    $use_sudo apt update
    $use_sudo apt install $1
}

function remove () {
    $use_sudo apt remove $1
    $use_sudo apt autoremove
}

alias vi="vim"

alias shutdown="$use_sudo shutdown -h now"

alias rm='rm -I --preserve-root'

#docker
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

#systemctl
alias sc='$use_sudo systemctl'
alias sreload='sc daemon-reload'
alias sstop='sc stop'
alias sstart='sc start'
alias srestart='sc restart'

function sdstart () {
    sstart docker@$1
}

function sdstop () {
    sstop docker@$1
}

function sdrestart () {
    srestart docker@$1
}

function dupdate () {
    sdrestart $1
}