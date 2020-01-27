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


