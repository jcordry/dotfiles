#.alias

# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

# Some shortcuts for different directory listings
if [[ `uname` != Darwin ]]
then
  alias ls='ls -hF --color=tty'                 # classify files in colour
else
  alias ls='ls -hFG'
fi
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #

if [[ `hostname` == SCM-88053 ]]; then
    alias unrar='/cygdrive/D/Program\ Files\ \(x86\)/Unrar/UnRAR.exe'
    alias xterm='xterm -fg white -bg black'
fi

if [[ `hostname` == Administrators-iMac-2.local ]]; then
    alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
    alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
fi

if [[ `hostname` == vlad ]]; then
    alias xterm="xterm -fn -misc-fixed-medium-r-normal-*-15-*-*-*-*-*-iso8859-1"
else
    alias xterm="xterm -fg white -bg black"
fi

