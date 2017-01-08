#!/usr/bin/env sh

#move working directory in case this is run from somewhere else
get_local="`dirname "$0"`"
cd "`cd -P "$get_local" && pwd `"

#vim
curl -fLo ../.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s dot.vimrc ../.vimrc

#zsh
ln -s dot.zshrc ../.zshrc

#tmux
ln -s dot.tmux.conf ../.tmux.conf

#freebsd stuff
rm ../.cshrc ../.login_conf ../.login_conf.db ../.profile ../.shrc
ln -s dot.cshrc ../.cshrc
ln -s dot.login_conf ../.login.conf
ln -s dot.login_conf.db ../.login_conf.db
ln -s dot.profile ../.profile
ln -s dot.shrc ../.shrc

exit 0
