set nocompatible

syntax on             " syntax highlighting on
set background=dark
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

" Enable filetype detection, and filetype specific scripts and indentation
filetype plugin indent on

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" For further key mappings
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

" Toggle netrw tree menu with ctrl+n
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-N> :call ToggleVExplorer()<CR>

" Netrw settings for behaviour similar to NERDtree
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_altv = 1
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
" Change directory to the current buffer when opening files.
set autochdir

" Status line
hi StatusLine ctermbg=white ctermfg=blue
set statusline =
set statusline +=[%n]                                    " buffer number
set statusline +=\ %F\                                   " Full path to file
set statusline +=[%{strlen(&fenc)?&fenc:'none'},         " file encoding
set statusline +=%{&ff}]                                 " file format
set statusline +=%y                                      " filetype
set statusline +=\ %1*%m%0*                              " modified flag
set statusline +=\ %h                                    " [help]
set statusline +=%r                                      " read only flag
set statusline +=%w                                      " preview window flag
set statusline +=%=%-14.(%l,%c%V%)                       " Line, column-virtual column"
set statusline +=%=lines:\ %-5L                          " Lines in the buffer
