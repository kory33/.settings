"--------- Begin configuration ---------
scriptencoding utf-8

"--------- Begin dein settings ---------
augroup MyAutoCmd
  autocmd!
augroup END

let s:cache_home = expand('~/.cache')
let s:dein_dir = s:cache_home . '/dein.vim'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

let s:dein_toml_dir = expand('~/.dein.vim')

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#add(s:dein_dir)

  "--------- essential plugins ----------
  call dein#load_toml(s:dein_toml_dir . "/basic.toml")
  if has("python3")
    call dein#load_toml(s:dein_toml_dir . "/basic_python3.toml")
  endif

  "--------- additional plugins ----------
  call dein#load_toml(s:dein_toml_dir . "/lang/cpp.toml")
  call dein#load_toml(s:dein_toml_dir . "/lang/elm.toml")
  call dein#load_toml(s:dein_toml_dir . "/lang/haskell.toml")
  call dein#load_toml(s:dein_toml_dir . "/lang/perl.toml")
  call dein#load_toml(s:dein_toml_dir . "/lang/python.toml")

  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif
"--------- End dein settings ---------

filetype plugin indent on

" open NERDTREE when started without arguments
let file_name = expand('%')
if has('vim_starting') && file_name == ''
  autocmd VimEnter * NERDTree ./
endif

if &compatible
  set nocompatible
endif

syntax on

set nopaste
set clipboard=unnamed

set number

set list
set listchars=trail:_,tab:>\ ,eol:~
set showtabline=2
set hlsearch

set smarttab
set expandtab
set virtualedit=block
set tabstop=4
set softtabstop=4
set shiftwidth=4

set t_Co=256

set ignorecase
set smartcase
set incsearch
set wrapscan

hi NonText ctermfg=3 guifg=gray

set ambiwidth=double
set laststatus=2

set clipboard=unnamed
set backspace=eol,indent,start

set fileformats=unix
set fileencodings=utf-8,cp932
set fileencoding=utf-8

" mapping related to tab manipulations

map <silent> <C-n> :tabnew<CR>
imap <silent> <C-n> <ESC>:tabnew<CR>

map <silent> <C-Tab> gt
map <silent> <C-S-Tab> gT

map <silent> <F4> :quit <CR>
imap <silent> <F4> <ESC> :quit <CR>
