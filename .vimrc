"Vundle plugin manager
set nocompatible              
filetype off                  
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'morhetz/gruvbox'
call vundle#end()
filetype plugin indent on 

if has('mouse')
      set mouse=a
  endif

set clipboard=unnamedplus

"Colors
syntax enable

"GUI config
set showcmd
set lazyredraw
set showmatch
set background=dark
colorscheme gruvbox 

"Spaces & Tabs
set tabstop=4
set softtabstop=4
set expandtab
set cindent
set shiftwidth=4
set autoindent

"Misc
set number
set relativenumber
set noundofile

"Auto close brackets
function! s:CloseBracket()
    let line = getline('.')
    if line =~# '^\s*\(struct\|class\|enum\) '
        return "{\<Enter>};\<Esc>O"
    elseif searchpair('(', '', ')', 'bmn', '', line('.'))
        " Probably inside a function call. Close it off.
        return "{\<Enter>});\<Esc>O"
    else
        return "{\<Enter>}\<Esc>O"
    endif
endfunction
inoremap <expr> {<Enter> <SID>CloseBracket()
