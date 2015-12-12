#!/usr/bin/env bash

if [ -d .config ]; then
  rm -r .config
fi

ln -s $NETHOME/$USER nethome
for dir in bin include .config .fonts dotfiles lib etc .emacsd; do
  ln -s $NETHOME/$USER/$dir $dir
done
cd $HOME/dotfiles
./mksymlink.sh
cd -
