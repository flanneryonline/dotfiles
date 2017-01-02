#!/usr/bin/env sh

#vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/dotfiles/dot.vimrc ~/.vimrc

#zsh
ln -s ~/dotfiles/dot.zshrc ~/.zshrc

#tmux
ln -s ~/dotfiles/dot.tmux.conf ~/.tmux.conf

#freebsd base stuff
ln -s ~/dotfiles/dot.shrc ~/.shrc
ln -s ~/dotfiles/dot.cshrc ~/.cshrc
ln -s ~/dotfiles/dot.login.conf ~/.login.conf
ln -s ~/dotfiles/dot.login.conf.db ~/.login.conf.db
ln -s ~/dotfiles/dot.profile ~/.profile

