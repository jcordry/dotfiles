# base-files version 4.0-4
# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benificial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
[[ -f /etc/bash_completion ]] && . /etc/bash_completion

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well

# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Aliases
#
# Some people use a different file for aliases
if [ -f "${HOME}/.bash_aliases" ]; then
  source "${HOME}/.bash_aliases"
fi

# Umask
#
#/etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
if [ -f "${HOME}/.bash_functions" ]; then
  source "${HOME}/.bash_functions"
fi

if [[ `uname` == Darwin ]]; then
    export PS1="\e[0;37m\u@\h:\w>\e[m "
else
    export PS1="\e[m\u@\h:\w>\e[m "
fi

# Path
#
# Some people use a different file for path
if [ -f "${HOME}/.bash_path" ]; then
  source "${HOME}/.bash_path"
fi

export EDITOR=/usr/bin/vim

# We need variables for vimerl!
if [[ $HOSTNAME == julien-SATELLITE-PRO-C850-14D ]]; then
    export VIMERL_COMPLETIONGREP=1
fi
if [[ $HOSTNAME == outcast.scm.tees.ac.uk ]]; then
    export VIMERL_HASMANPATH=1
    export VIMERL_MANPATH=$HOME/lib/erlang/man
elif [[ $HOSTNAME == scm-88587.local ]]; then
    export VIMERL_HASMANPATH=1
    export VIMERL_MANPATH=/usr/local/lib/erlang/man
elif [[ $HOSTNAME == julien-SATELLITE-PRO-C850-14D ]]; then
    export VIMERL_HASMANPATH=1
    export VIMERL_MANPATH=/usr/lib/erlang/man
elif [[ $HOSTNAME == SCM-88364.local ]]; then # TODO CHANGE THIS FOR THE OFFICE MAC!
    export VIMERL_HASMANPATH=1
    export VIMERL_MANPATH=/usr/local/lib/erlang/man
fi

export LD_LIBRARY_PATH=/usr/gnat/lib:/lib:/usr/lib:/home/scm-staff/u0026939/lib/:~/lib/
