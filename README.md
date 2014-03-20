# My Dotfiles

This is an attempt at creating a repository for my dotfiles. I intend to use it
to store and maintain my vimrc, vim (pluggins), bashrc, profile, bash_aliases,
bash_functions and perhaps a few others at a later stage (emacs, zsh, tmux,
mutt, input).

##To install:

    $ git clone https://github.com/jcordry/dotfiles.git ~/dotfiles
    $ cd ~/dotfiles
    $ ./extract.sh
    $ ./mksyslink.sh

##To try Mathias Bynens gitless install:

    $ cd; curl -#L https://github.com/jcordry/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh}
