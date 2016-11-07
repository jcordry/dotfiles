""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
" An example for a vimrc file.                                                 "
"                                                                              "
" Maintainer:   Bram Moolenaar <Bram@vim.org>                                  "
" Last change:  2011 Apr 15                                                    "
"                                                                              "
" To use it, copy it to                                                        "
"     for Unix and OS/2:  ~/.vimrc                                             "
"         for Amiga:  s:.vimrc                                                 "
"  for MS-DOS and Win32:  $VIM\_vimrc                                          "
"       for OpenVMS:  sys$login:.vimrc                                         "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" set wrap       " no need to do that: should be set by default
set linebreak    " wrap won't break words
set showbreak=>\ " wraps with '> ' on the next line
set scrolloff=2  " default 2 lines scrolloff
set wildmenu     " helpmenu when pressing tab in commands
set cursorline   " show active line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup      " don't keep a backup file
set nowritebackup
" endif
set history=50    " keep 50 lines of command line history
set ruler         " show the cursor position all the time
set incsearch     " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't use Ex mode, use Q for formatting
map Q gq

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
" original repos on github
Bundle 'Lokaltog/vim-easymotion'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'bling/vim-airline'
Bundle 'edkolev/tmuxline.vim'
Bundle 'edkolev/promptline.vim'
Bundle 'ervandew/supertab'
Bundle 'flazz/vim-colorschemes'
Bundle 'garbas/vim-snipmate'
Bundle 'godlygeek/tabular'
Bundle 'honza/vim-snippets'
Bundle 'jcordry/c.vim'
Bundle 'jcordry/vim-latex'
Bundle 'jimenezrick/vimerl'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/gist-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tomtom/tcomment_vim'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tristen/vim-sparkup.git'
Bundle 'vim-scripts/taglist'
Bundle 'majutsushi/tagbar'
" Bundle 'vim-scripts/Conque-Shell' ?


set textwidth=78
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
              \ | wincmd p | diffthis
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen
execute pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
    autocmd FileType tex setlocal spell spelllang=en_gb tabstop=2 shiftwidth=2 softtabstop=2 formatoptions+=t
    autocmd FileType plaintex setlocal spell spelllang=en_gb tabstop=2 shiftwidth=2 softtabstop=2 formatoptions+=t

    " mail though mutt
    autocmd FileType mail setlocal spell spelllang=en_gb tabstop=2 shiftwidth=2 softtabstop=2 formatoptions+=taw

    " Text turn on spell automatically + smaller tab + wrap around
    autocmd FileType text setlocal spell spelllang=en_gb tabstop=2 shiftwidth=2 softtabstop=2 formatoptions+=t
    autocmd filetype text call AutoCorrect()

    " Markdown turn on spell automatically + smaller tab + wrap around
    autocmd FileType markdown setlocal spell spelllang=en_gb tabstop=4 shiftwidth=4 softtabstop=4 formatoptions+=t

    " HTML turn on spell automatically + smaller tab + wrap around
    autocmd FileType html setlocal spell spelllang=en_gb tabstop=2 shiftwidth=2 softtabstop=2 formatoptions+=t
    autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2 formatoptions+=t

    " Ocaml turn off wrap around textwidth
    autocmd FileType ocaml setlocal formatoptions-=t
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mapleader
let mapleader="\<Space>"

" " move over wraped lines
" noremap j gj
" noremap k gk

" New shortcuts
nnoremap <Leader>w :w<CR> " Save

" unmap the arrow keys
noremap <down> <Nop>
noremap <up> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>
inoremap <down> <Nop>
inoremap <up> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
vnoremap <down> <Nop>
vnoremap <up> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline
set number
set laststatus=2
set t_Co=256
set term=screen-256color

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Vimerl
" let g:erlangCheckFile="~/.vim/bundle/vimerl/compiler/erlang_check_file.erl"
" let g:erlangHighlightErrors=1
" if $VIMERL_COMPLETIONGREP
"     let g:erlangCompletionGrep='zgrep'
"     let g:erlangManSuffix='erl\.gz'
" endif
" if $VIMERL_HASMANPATH
"     let g:erlangManPath=$VIMERL_MANPATH
"     " let g:erlangManPath="~/lib/erlang/man/"
" endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Erlang modules
set runtimepath^=~/.vim/bundle/vim-erlang-runtime/
set runtimepath^=~/.vim/bundle/vim-erlang-tags/



" mouse mac! Not sure if necessary
" if has("mouse")
"     map <ScrollWheelUp> <C-Y>
"     map <ScrollWheelDown> <C-E>
" endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow W to be used as w (Q as q)
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline fonts?
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = '>'
" let g:airline#extensions#tabline#left_alt_sep = '>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ConqueShell <C-w> works!
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_InsertOnEnter = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Have nice looking "invisible characters"
" set listchars=tab:▸\ ,eol:¬,trail:-

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme
" colorscheme molokai
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

" colourscheme modes
" this sould be for the colourscheme file; this is
" for the colors of the eol/blank characters
" highlight NonText guifg=#4a4a59
" highlight SpecialKey guifg=#4a4a59

set showcmd     " display incomplete commands

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Reload the vimrc
:noremap <Leader>s :source $MYVIMRC<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bubble up and down selected text
" Bubble single lines
noremap <C-k> [e
noremap <C-j> ]e
" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" Visually select the text that was last edited/pasted
noremap gV `[v`]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LaTeX
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Adjustments to the promptline
" \'y'    : [ promptline#slices#vcs_branch(), promptline#slices#git_status() ],
let g:promptline_preset = {
        \'a'    : [ promptline#slices#host() ],
        \'c'    : [ promptline#slices#cwd() ],
        \'y'    : [ promptline#slices#vcs_branch() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}
let g:promptline_theme = 'airline'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar shortcut
nnoremap <silent> <Leader>b :TagbarToggle<CR>
nnoremap <leader>. :CtrlPTag<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree shortcut
nnoremap <leader>n :NERDTreeToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive shortcut
nnoremap <leader>g :Gstatus<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Push shortcut
nnoremap <leader>p :Git push<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bash support - does not seem to work :(
let g:BASH_AuthorName = 'Julien Cordry'
let g:BASH_Email      = 'j.cordry@tees.ac.uk'
let g:BASH_Company    = 'Teesside University'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set hightlight off on searches by default
set nohlsearch
set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic now supports c++11
let g:syntastic_cpp_compiler_options = ' -std=c++11'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easier window navigation
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy line to buffer
" nmap <C-c> "*yy
" format paragraph
" nmap <leader>r gqip

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer shortcuts:
" Go to next buffer
nnoremap <silent> [b :bp<cr>
nnoremap <silent> [B :bfirst<cr>
nnoremap <silent> ]b :bn<cr>
nnoremap <silent> ]B :blast<cr>
" Drop current buffer

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut for spelling in French/English
nnoremap <leader>f :set spelllang=fr spell<cr>
nnoremap <leader>d :set spelllang=en_gb spell<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Merlin for Ocaml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
execute "set rtp+=" . g:opamshare . "/merlin/vimbufsync"
let g:syntastic_ocaml_checkers = ['merlin']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move in and out of toggle with a shortcut
set pastetoggle=<f2>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut to remove trailing empty spaces
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Needs a hex editor
" Look up vim.wikia.com/wiki/Improved_hex_editing
" In the meantime, use :%!xxd and :%!xxd -r
