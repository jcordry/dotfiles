#!/usr/bin/env bash

export NETHOME=/nethome1/scm-staff

if [ -d .config ]; then
  rm -r .config
fi

ln -s $NETHOME/$USER nethome
for dir in .ssh bin include .config .fonts dotfiles lib lib64 Documents etc .emacs.d; do
  ln -s $NETHOME/$USER/$dir $dir
done
cd $HOME/dotfiles
./mksymlink.sh
cd -
