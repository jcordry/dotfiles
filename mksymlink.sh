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

FILE_LIST="bashrc profile vimrc vim gvimrc bash_aliases bash_functions inputrc
bash_profile bash_path wgetrc tmux.conf tmux_snap.conf gitconfig gitignore
Xresources startxwinrc mutt"
cd $HOME
for file in $FILE_LIST; do
    diff $CONFIGDIR/$NEWFOLDER/$file .$file > /dev/null 2>&1
    isdiff=$?
    if [[ $isdiff -ge 1 ]]; then
        mv .$file $CONFIGDIR/$OLDFOLDER
        ln -s $CONFIGDIR/$NEWFOLDER/$file .$file
    fi
done
cd -

mymkdir() {
    if [[ ! -d $1 ]]; then
        mkdir -p $1
    fi
}

mklink() {
    if [[ ! -f $2 ]]; then
        ln -s $1 $2
    fi
}

mymkdir $HOME/bin

mymkdir $HOME/man/man1

for file in $CONFIGDIR/$NEWFOLDER/bin/*; do
    linkfile=`basename $file`
    mklink $file $HOME/bin/$linkfile
done

for DIR in $HOME/man/*; do
    cd $DIR
    for file in $CONFIGDIR/$NEWFOLDER/man/`basename $DIR`/*; do
        linkfile=`basename $file`
        mklink $file $linkfile
    done
    cd -
done
