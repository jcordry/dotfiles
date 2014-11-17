# To run:
# brew tap homebrew/boneyard
# brew bundle Brewfile

# Make sure we’re using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils
# Install some other useful utilities like `sponge`
install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
install findutils
# Install Bash 4
install bash

# Install wget with IRI support
install wget --enable-iri

# Install RingoJS and Narwhal
# Note that the order in which these are installed is important; see http://git.io/brew-narwhal-ringo.
# install ringojs
# install narwhal

# Install more recent versions of some OS X tools
install vim --override-system-vi
install homebrew/dupes/grep
# install josegonzalez/homebrew-php/php55

# This formula didn’t work well last time I tried it:
#install homebrew/dupes/screen

# Install other useful binaries
install ack
install pv
#install exiv2
install git
install imagemagick --with-webp
# install lynx
install node
install pigz
install rename
# install rhino
install tree
# install webkit2png
install zopfli
install p7zip

# install homebrew/versions/lua52

install cask
install tmux
install bash-completion
install lftp
install wget
install w3m
install unrar
install mutt
install the_silver_searcher
install colordiff
install erlang
install rebar
install ghostscript
install a2ps
install ocaml
install opam
install source-highlight
install fasd
install htop

# Remove outdated versions from the cellar
cleanup
