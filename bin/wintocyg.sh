#!/usr/bin/env bash
#===============================================================================
#
#          FILE: wintocyg.sh
# 
#         USAGE: ./wintocyg.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 16/04/2014 13:02
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

path=`echo $1 | tr '\' '/'`

echo "$path"

letter=`echo $path | sed -e 's/:\/.*//g'` # Should be the first letter!

echo letter $letter

if [[ "$letter" != "" ]]; then
    path=`echo $path | sed -e 's/^.:\///'`
    path="/cygdrive/`echo $letter | tr '[:upper:]' '[:lower:]'`/$path"
fi

echo "$path"
