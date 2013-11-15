#!/bin/bash

NEWFOLDER=dotfiles
OLDFOLDER=dotfiles_old

if [[ $1 == maclabs ]]; then
    CONFIGDIR=$HOME/Desktop/Network-Home
    echo $1
else
    CONFIGDIR=$HOME
fi

mkdir -p $CONFIGDIR/$OLDFOLDER

FILE_LIST="bashrc profile vimrc vim gvimrc bash_aliases bash_functions"
cd $HOME
for file in $FILE_LIST; do
    mv .$file $CONFIGDIR/$OLDFOLDER
    ln -s $CONFIGDIR/$NEWFOLDER/$file .$file
done
