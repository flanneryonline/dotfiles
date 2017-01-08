#!/bin/sh

#move working directory in case this is run from somewhere else
cd -P "`dirname "$0"`"

for file in ../.cshrc ../.login_conf ../.login_conf.db ../.profile ../.shrc ../.vimrc ../.zshrc ../.tmux.conf
do
    [ -e $file ] && rm $file
    [ -L $file ] && rm $file
done

#vim
curl -sfLo ../.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s dotfiles/dot.vimrc ../.vimrc

#zsh
ln -s dotfiles/dot.zshrc ../.zshrc

#tmux
ln -s dotfiles/dot.tmux.conf ../.tmux.conf

#freebsd stuff
ln -s dotfiles/dot.cshrc ../.cshrc
ln -s dotfiles/dot.login_conf ../.login_conf
ln -s dotfiles/dot.login_conf.db ../.login_conf.db
ln -s dotfiles/dot.profile ../.profile
ln -s dotfiles/dot.shrc ../.shrc

exit 0
