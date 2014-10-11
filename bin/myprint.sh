#!/usr/bin/env bash

MYPRINTHOST=linux7.scm.tees.ac.uk

if [[ ! $# -eq 1 ]]; then
    echo "Usage $0 file_to_print"
    exit 0
fi

if [[ ! -f $1 ]]; then
    echo "File ``$1'' not found; expected a ZIP or PDF."
    exit 0
fi

file=$1

scp $file $MYPRINTHOST:

ssh -t -X $MYPRINTHOST <<EOF

case $file in
    *.zip)
        DIR=~/tmp/${file%.zip}
        mv $file $DIR
        cd $DIR
        unzip $file
        for i in *.pdf; do
            evince $i
        done
        cd
        \rm -R $DIR;;
    *.pdf)
        evince $file
        \rm -R $file;;
esac
exit
EOF
