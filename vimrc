" An example for a vimrc file.
"
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"         for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"       for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup      " do not keep a backup file, use versions instead
else
  set backup        " keep a backup file
endif
set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set incsearch       " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
" original repos on github
Bundle 'Lokaltog/vim-easymotion'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'bling/vim-airline'
Bundle 'ervandew/supertab'
Bundle 'flazz/vim-colorschemes'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'kien/ctrlp.vim'
Bundle 'jimenezrick/vimerl'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'tomtom/tcomment_vim'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'mattn/gist-vim'
Bundle 'jcordry/vim-latex'
Bundle 'tristen/vim-sparkup.git'
Bundle 'vim-scripts/taglist'
Bundle 'tpope/vim-unimpaired'
Bundle 'jcordry/c.vim'
" Bundle 'vim-scripts/Conque-Shell' ?

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
              \ | wincmd p | diffthis
endif

" Pathogen
execute pathogen#infect()

" set omni completion
set omnifunc=syntaxcomplete#Complete

" set tabs to 4 chars
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Unless we are using LaTeX/TeX,HTML or CSS, in which case we could just
" use 2 spaces as tab
if (has("autocmd"))
    " TeX/LaTeX turn on spell automatically + smaller tab + wrap around
    autocmd FileType tex setlocal spell spelllang=en_gb tabstop=2 shiftwidth=2 softtabstop=2 fo+=t
    autocmd FileType plaintex setlocal spell spelllang=en_gb tabstop=2 shiftwidth=2 softtabstop=2 fo+=t

    " Text turn on spell automatically + smaller tab + wrap around
    autocmd FileType text setlocal spell spelllang=en_gb tabstop=2 shiftwidth=2 softtabstop=2 fo+=t

    " Markdown turn on spell automatically + smaller tab + wrap around
    autocmd FileType markdown setlocal spell spelllang=en_gb tabstop=2 shiftwidth=2 softtabstop=2 fo+=t

    " HTML turn on spell automatically + smaller tab + wrap around
    autocmd FileType html setlocal spell spelllang=en_gb tabstop=2 shiftwidth=2 softtabstop=2 fo+=t
    autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2 fo+=t
endif

" mapleader
let mapleader=","

" unmap the arrow keys
no <down> <Nop>
no <up> <Nop>
no <left> <Nop>
no <right> <Nop>
ino <down> <Nop>
ino <up> <Nop>
ino <left> <Nop>
ino <right> <Nop>
vno <down> <Nop>
vno <up> <Nop>
vno <left> <Nop>
vno <right> <Nop>

" Powerline
" let g:Powerline_symbols = 'fancy'
set number
set laststatus=2
set t_Co=256
set term=screen-256color

" Vimerl
let g:erlangCheckFile="~/.vim/bundle/vimerl/compiler/erlang_check_file.erl"
let g:erlangHighlightErrors=1
if $VIMERL_COMPLETIONGREP
    let g:erlangCompletionGrep='zgrep'
    let g:erlangManSuffix='erl\.gz'
endif
if $VIMERL_HASMANPATH
    let g:erlangManPath=$VIMERL_MANPATH
    " let g:erlangManPath="~/lib/erlang/man/"
endif

" mouse mac! Not sure if necessary
" if has("mouse")
"     map <ScrollWheelUp> <C-Y>
"     map <ScrollWheelDown> <C-E>
" endif

" Allow W to be used as w (Q as q)
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))

" wraparound when writing some text
" not entirely necessary. Just in some cases
set textwidth=80

" Airline fonts?
let g:airline_powerline_fonts = 1

" no automatic backup
set nobackup
set nowritebackup

" ConqueShell <C-w> works!
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_InsertOnEnter = 1

" Have nice looking "invisible characters"
set listchars=tab:▸\ ,eol:¬,trail:-

" colorscheme
colorscheme molokai

" colourscheme modes
" this sould be for the colourscheme file; this is
" for the colors of the eol/blank characters
" highlight NonText guifg=#4a4a59
" highlight SpecialKey guifg=#4a4a59

set showcmd     " display incomplete commands

" Reload the vimrc
:nmap <Leader>s :source $MYVIMRC<CR>

" Bubble up and down selected text
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" LaTeX
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
