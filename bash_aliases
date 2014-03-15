#bash_aliases

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
# alias df='df -h'
# alias du='du -h'

# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

# LS
if [[ `uname` != Darwin ]]; then
    alias ls='ls -hF --color=tty'                 # classify files in colour
else
    alias ls='ls -hFG'
fi
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #
alias l1='ls -1'

if [[ `hostname` == SCM-88053 ]]; then
    alias unrar='/cygdrive/D/Program\ Files\ \(x86\)/Unrar/UnRAR.exe'
    alias xterm='xterm -fg white -bg black'
fi

if [[ `hostname` == SCM-88364.local ]]; then
    alias vlc='open -a VLC'
    alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
fi

if [[ `hostname` == scm-88587.local ]]; then
    alias vlc='open -a VLC'
fi

if [[ `uname` = Linux ]]; then
    alias open=xdg-open
fi

if [[ `uname` == Darwin ]]; then
    alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update --system; sudo gem update'
    alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
    alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
    alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
    alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
    alias spotoff="sudo mdutil -a -i off"
    alias spoton="sudo mdutil -a -i on"
    alias chrome='open -a google\ chrome'
    alias chromium='open -a chromium'
    alias dashcode='open -a dashcode'
    alias em='open -a emacs'
    alias fh='open -a Finder .'
    alias filemerge='open -a '\''/Developer/Applications/Utilities/FileMerge.app'\'''
    alias firefox='open -a firefox'
    # alias fireworks='open -a '\''/Applications/Adobe Fireworks CS3/Adobe Fireworks CS3.app'\'''
    alias hex='open -a "Hex Fiend"'
    # alias photoshop='open -a '\''/Applications/Adobe Photoshop CS3/Adobe Photoshop.app'\'''
    alias preview='open -a '\'''\'''
    alias safari='open -a safari'
    alias textedit='open -a TextEdit'
    alias xcode='open -a '\''/Developer/Applications/Xcode.app'\'''
    alias flush='dscacheutil -flushcache'
    alias dsclean='find . -type f -name .DS_Store -print0 | xargs -0 rm'
    alias whotunes='lsof -r 2 -n -P -F n -c iTunes -a -i TCP@`hostname`:3689'
    # Brew
    alias bdr='brew doctor'
    alias bin='brew install'
    alias binf='brew info'
    alias bls='brew list'
    alias bout='brew outdated'
    alias brm='brew uninstall'
    alias bsr='brew search'
    alias bup='brew update && brew upgrade'
fi

if [[ `hostname` == vlad ]]; then
    alias xterm="xterm -fn -misc-fixed-medium-r-normal-*-15-*-*-*-*-*-iso8859-1"
else
    alias xterm="xterm -fg white -bg black"
fi

# Mercurial
alias hcm='hg commit -m'
alias hs='hg status'
alias hsum='hg summary'

# Git
alias g='git'
alias ga='git add'
alias gall='git add .'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gci='git commit --interactive'
alias gcl='git clone'
alias gco='git checkout'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gd='git diff | /usr/bin/vim'
alias gdel='git branch -D'
alias gdv='git diff -w "$@" | vim -R -'
alias get='git'
alias gexport='git archive --format zip --output'
alias gg='git log --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset'\'' --abbrev-commit --date=relative'
alias ggs='gg --stat'
alias gl='git pull'
alias gll='git log --graph --pretty=oneline --abbrev-commit'
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias gp='git push'
alias gpo='git push origin'
alias gpp='git pull && git push'
alias gpr='git pull --rebase'
alias grnot='growlnotify -s -t Terminal -m "Done"'
alias gs='git status'
alias gsc='git svn dcommit'
alias gsi='git svn info'
alias gsl='git shortlog -sn'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'
alias gup='git fetch && git rebase'
alias gw='git whatchanged'

# FASD
alias a='fasd -a'
alias d='fasd -d'
alias f='fasd -f'
alias s='fasd -si'
alias sd='fasd -sid'
alias sf='fasd -sif'
alias z='fasd_cd -d'
alias zz='fasd_cd -d -i' # cd with interactive selection
alias v='f -e vim'

# Misc
alias -- -="cd -"
alias ....='cd ../../..'
alias ...='cd ../..'
alias ..='cd ..'
alias 1='pushd'
alias 2='pushd +2'
alias 3='pushd +3'
alias 4='pushd +4'
alias 5='pushd +5'
alias 6='pushd +6'
alias 7='pushd +7'
alias 8='pushd +8'
alias 9='pushd +9'
alias L='cat ~/.dirs'
alias U='source ~/.dirs'
alias _='sudo'
alias __git_find_subcommand='__git_find_on_cmdline'
alias week='date +%V' # Get week number
alias c='clear'
alias cd='cd_func'
alias cls='clear'
alias edit='/usr/bin/vim'
alias h='history'
alias http='python -m SimpleHTTPServer'
alias k='clear'
alias md='mkdir -p'
alias pager=''
alias pc='pushd `pwd`'
alias po='popd'
alias pu='pushd'
alias q='exit'
alias rb='ruby'
alias rd='rmdir'
alias reload='source ~/.bash_profile'
alias sl='ls'
alias tmux='TERM=xterm-256color tmux'
alias tree='find . -print | sed -e '\''s;[^/]*/;|____;g;s;____|; |;g'\'''

# alias piano='pianobar'
# alias irc='irssi'
## Maven
# alias mci='mvn clean install'
# alias mcisk='mci -Dmaven.test.skip=true'
# alias mdep='mvn dependency:tree'
# alias mi='mvn install'
# alias mpom='mvn help:effective-pom'
# alias mrperf='mvn release:perform'
# alias mrprep='mvn release:prepare'
# alias mrrb='mvn release:rollback'
