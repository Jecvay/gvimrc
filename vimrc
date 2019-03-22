let g:plug_url_format = 'git://github.com/%s.git'
call plug#begin('~/.vim/bundle')
    Plug('ludovicchabant/vim-gutentags')
    Plug('Yggdroot/LeaderF')
	Plug('mileszs/ack.vim')
call plug#end()

" 处理consle输出乱码
" language messages zh_CN.utf-8

" More encoding
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set termencoding=utf-8

set mouse=a


" ctags
set tags=./.tags;,.tags

" 显示空白字符
set list
set listchars=tab:>-,trail:-

" set autochdir
color itg_flat

if has("gui_running") 
	" 处理菜单及右键菜单乱码
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
	color itg_flat

	set guifont=Yahei\ Mono:h10
	" set guifont=Menlo:h8
	" set guifont=Inconsolata:h9
	" set guifont=Monaco:h8
	" set guifont=ProFontWindows:h12
	" set guifont=Inziu\ Iosevka\ Slab\ CL:h9
	" set guifont=ProggyTinyTTSZ:h12
	set guioptions-=m
	set guioptions-=T
	set guioptions-=L
	set guioptions-=r

	set guicursor=i:block-cursor
	set guicursor+=a:blinkon0
	set guioptions=icpM
    if has('win32') || has('win64')
    "     if (v:version == 704 && has("patch393")) || v:version > 704
    "         set renderoptions=type:directx,level:0.75,gamma:1.8,contrast:0.5,
    "                     \geom:1,renmode:5,taamode:1
	" 	endif
		set rop=type:directx
	endif
endif

set nu
set nowrap
set cursorline
set hlsearch
set incsearch

set ai
" INDENT [https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim]
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
" set expandtab
set noexpandtab

set backspace=2		" Powerful backspace
set ignorecase
set smartcase
syntax on
set nobackup
setlocal noswapfile
filetype on
filetype plugin on
filetype indent on
set showmatch
set matchtime=1
set scrolloff=3
set laststatus=2
set history=1000

" 空格开关折叠
set foldenable
set foldmethod=indent
set foldlevel=100
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>

" 搜索快捷键
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" 添加 cocos2dx shader 文件类型语法高亮
au BufNewFile,BufRead *.fsh set filetype=c

"""""""""""""""""""""""""""""""""
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
 
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
 
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
 
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
"""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""
" LeaderF
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <c-m> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_WorkingDirectory = getcwd()		" using this when disable auto-change-vim-path
" let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
" let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_DefaultMode = 'NameOnly'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
let g:Lf_WildIgnore = {
	\ 'dir': [],
	\ 'file': ['*.o', '*.xls', '*.py[co]']
	\}

""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""
" Debug highlight <F10>
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

""""""""""""""""""""""""""""""""
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ack - Ag
if executable('ag')
  let g:ackprg = 'ag --workers 1 --noaffinity --nommap --vimgrep'
  set grepprg=ag\ --workers\ 1\ --noaffinity\ --nommap\ --vimgrep\ --cc\ --python\ --cpp
endif

" for FreeBSD csh->zsh jump
set shell=/usr/local/bin/bash

" fix the conflict with LeaderF
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" for lpc to search specified file type
function! LpcSearch(key)
	let saved_shellpipe = &shellpipe
	let &shellpipe = '>'
	try
		execute 'Ack! --cpp --cc --python '.a:key
		" execute 'Ack! '.a:key.' *\.c'
		" execute 'AckAdd! '.a:key.' *\.h'
		" execute 'AckAdd! '.a:key.' *\.cpp'
		" execute 'AckAdd! '.a:key.' *\.hpp'
		" execute 'AckAdd! '.a:key.' *\.py'
	finally
		let &shellpipe = saved_shellpipe
	endtry
endfunction
command! -nargs=1 Lpc :call LpcSearch(<q-args>)
command! -nargs=0 Lpc :call LpcSearch(expand('<cword>'))
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""











