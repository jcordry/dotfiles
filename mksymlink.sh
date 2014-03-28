#!/usr/bin/env bash

NEWFOLDER=dotfiles
OLDFOLDER=dotfiles_old

if [[ $1 == maclabs ]]; then
    CONFIGDIR=$HOME/Desktop/Network-Home
    echo $1
else
    CONFIGDIR=$HOME
fi

mkdir -p $CONFIGDIR/$OLDFOLDER

FILE_LIST="bashrc profile vimrc vim gvimrc bash_aliases bash_functions inputrc
bash_profile bash_path wgetrc tmux.conf tmux_snap.conf gitconfig gitignore
Xresources startxwinrc"
for file in $FILE_LIST; do
    diff $CONFIGDIR/$NEWFOLDER/$file $HOME/.$file > /dev/null 2>&1
    isdiff=$?
    if [[ $isdiff -ge 1 ]]; then
        mv $HOME/.$file $CONFIGDIR/$OLDFOLDER/$file
        ln -s $CONFIGDIR/$NEWFOLDER/$file $HOME/.$file
    fi
done

if [[ ! -d $HOME/bin ]]; then
    mkdir $HOME/bin
    chmod 755 $HOME/bin
fi

for file in $CONFIGDIR/$NEWFOLDER/bin/*; do
    linkfile=`basename $file`
    if [[ ! -f $linkfile ]]; then
        ln -s $file $HOME/bin/$linkfile
    fi
done
