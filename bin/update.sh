#!/usr/bin/env bash

lectures=$HOME/lectures

# svnarchives= #"$lectures/mgp $lectures/ncp $lectures/mob"
# gitarchives="$lectures/enp $HOME/dotfiles"
gitarchives="$HOME/dotfiles $lectures/ncp.git $lectures/msg.git $lectures/mgd.git $lectures/ocaml"

for arch in $svnarchives; do
    svn up $arch
done

for arch in $gitarchives; do
    pushd $arch
    git pull origin master
    popd
done
