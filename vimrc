call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on

set number		" Line numbers
set nocompatible
set laststatus=2
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ (%{&ff}){%Y}\ [%l,%v][%p%%]
set showmode
set showcmd

set autoindent 
set smartindent
set smarttab
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8
set shiftround " Rounds indents to multiples of shiftwidth
set copyindent " Use existing indent when pasting
set preserveindent " Preserve indent structure

set wildmenu
set wildmode=list:longest,full

set incsearch " Incremental search
set nohlsearch " Highlight search results
set showmatch " Matching brackets
set ignorecase " Ignore case
set smartcase " Case sensitive if string has caps
set backspace=indent,eol,start " Normal backspace
set textwidth=80

nnoremap ; :
nnoremap : ;

set shell=bash

if has("autocmd")
	filetype on
	filetype indent on
	filetype plugin on
	filetype plugin indent on
endif

" Automatic header guards
function! s:insert_include_guard()
	let gatename = substitute(toupper(expand("%:t")),"\\.","_","g")
	execute "normal! i#ifndef " . gatename
	execute "normal! o#define " . gatename . " "
"	execute "normal! o// Copyright Scott Wales (2010)"
	normal! G3o
	execute "normal! Go#endif /* " . gatename . " */"
	normal! Go
	normal! 3k
endfunction
