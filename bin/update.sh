#!/usr/bin/env bash

LECTURES=$HOME/lectures

SVNARCHIVES= #"$LECTURES/mgp $LECTURES/ncp $LECTURES/mob"
# GITARCHIVES="$LECTURES/enp $HOME/dotfiles"
GITARCHIVES=$HOME/dotfiles

for ARCH in $SVNARCHIVES; do
    svn up $ARCH
done

for ARCH in $GITARCHIVES; do
    pushd $ARCH
    git pull origin master
    popd
done
