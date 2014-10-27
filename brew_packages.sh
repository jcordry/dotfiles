#!/usr/bin/env bash
#===============================================================================
#
#          FILE: brew_packages.sh
#
#         USAGE: ./brew_packages.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (),
#  ORGANIZATION:
#       CREATED: 27/10/2014 14:01
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

brew install bash bash-completion vim git tmux fasd wget w3m lftp
brew install cask svn erlang rebar colordiff coreutils ack unrar htop mutt
