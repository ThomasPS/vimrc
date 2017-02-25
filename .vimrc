set nocompatible
filetype off    " required for vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Tree view
Plugin 'scrooloose/nerdtree'

" Git commands from within vim
Plugin 'tpope/vim-fugitive'

" Status bar plugin
Plugin 'vim-airline/vim-airline'

call vundle#end()

" Enable filetype detection, and filetype specific scripts and indentation
filetype plugin indent on

syntax on             " syntax highlighting on
" set background=dark
set number            " show line numbers
set autoread          " automatically read changes to files
set showmatch         " show the matching part of the pair for [] {} and ()
set title             " show info about the file being edited
set showcmd           " display incomplete commands
set incsearch         " do incremental searching
set laststatus=2      " always display the status line
set diffopt+=vertical " always use vertical diffs
set fileformat=unix
set encoding=utf-8

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Use space as prefix for further key mappings
let mapleader = " "

" Make backspace behave in a sane manner
set backspace=indent,eol,start

" Use jj to switch from insert mode back to normal mode
inoremap jj <Esc>

" More intuitive split-pane behaviour
set splitbelow
set splitright

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" Tab and indent size set to 4 spaces, and tabs are expanded to spaces
set tabstop=4 shiftwidth=4 expandtab

" Don't expand tabs for make files
autocmd FileType make setlocal noexpandtab

" PEP8 indentation when working with Python files
au FileType python setl tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent ff=unix

" Tab completion menu
set wildmenu
set wildmode=longest:full,full

" Show invisible chars
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" Enable recursive file search
set path+=**

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Use system clipboard on Mac OS
set clipboard=unnamed

" Map shift+h and shift+l for switching tabs
nnoremap H gT
nnoremap L gt

" Open NERDTree when vim starts up
autocmd vimenter * NERDTree

" Use ctrl+n to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
