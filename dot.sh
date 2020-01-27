#!/bin/sh

#move working directory in case this is run from somewhere else
cd -P "`dirname "$0"`"

for file in (ls)
do
    [ -e ../$file ] && rm ../$file
    [ -L ../$file ] && rm ../$file
    ln -s $file ../$file
done

#vim
curl -sfLo ../.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

exit 0
