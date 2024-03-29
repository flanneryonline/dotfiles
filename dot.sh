#!/bin/sh

#move working directory in case this is run from somewhere else
cd -P "`dirname "$0"`"

for file in $(ls -ld .* | grep -v '^d' | awk '{print $9}')
do
    [ -e ../$file ] && mv ../$file ../$file.bak
    [ -L ../$file ] && rm ../$file
    ln -s dotfiles/$file ../$file
done

#vim
[ ! -e ../.vim/autoload/plug.vim ] && curl -sfLo ../.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

exit 0
