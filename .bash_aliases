function upgrade () {
    apt update
    apt upgrade
}

function install () {
    apt update
    apt install $1
}

function remove () {
    apt remove $1
    apt autoremove
}

alias vi="vim"
alias shutdown="shutdown -h now"
alias rm='rm -I --preserve-root'

#systemctl
alias sc='systemctl'
alias sreload='sc daemon-reload'
alias sstop='sc stop'
alias sstart='sc start'
alias srestart='sc restart'
alias sstatus='sc status'

#docker
alias dstats='docker stats'

function sdstats()
{
    docker stats $(docker ps -q --filter label=com.docker.compose.project=$1)
}
