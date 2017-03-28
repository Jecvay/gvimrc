call plug#begin('~/vimfiles/bundle')
Plug('ctrlpvim/ctrlp.vim')
call plug#end()

" 处理菜单及右键菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" 处理consle输出乱码
language messages zh_CN.utf-8

" More encoding
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set termencoding=utf-8

color itg_flat

if has("gui_running")
	set guifont=Monaco:h10
	set guioptions-=m
	set guioptions-=T
	set guioptions-=L
	set guioptions-=r
endif

set nu
set autoindent
set cursorline
set hlsearch
set incsearch
set ts=4
set sw=4
set backspace=2		" Powerful backspace
set ignorecase
set smartcase

