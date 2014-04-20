# My Dotfiles

This is an attempt at creating a repository for my dotfiles. I intend to use it
to store and maintain my vimrc, Vim (pluggins), bashrc, profile, bash_aliases,
bash_functions and perhaps a few others at a later stage (Emacs, zsh, tmux,
mutt, input). This now includes:

- A vimrc/vim with vim plugins as submodules using Pathogen/Vundle.
- A suite of bash configuration files.
- Tmux config files.
- Inputrc.
- Brew config files for OSX.
- OSX config files from Mathias Bynens.
- Git config files.
- Some configuration files for CygwinX.
- Some mutt files

I have tried to emulate some functions from bash-it for completion, aliases...

I should have fasd as part of the bin folder really!

##To install:

    $ git clone https://github.com/jcordry/dotfiles.git ~/dotfiles
    $ cd ~/dotfiles
    $ ./extract.sh
    $ ./mksyslink.sh

##To try Mathias Bynens git-less install:

    $ cd; curl -#L https://github.com/jcordry/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md}


