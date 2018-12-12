let g:plug_url_format = "git://github.com/%s.git"
" call plug#begin('~/.vim/bundle')
"     Plug('git://github.com/ctrlpvim/ctrlp.vim.git')
"     Plug('git://github.com/ludovicchabant/vim-gutentags.git')
" call plug#end()

" ����consle�������
" language messages zh_CN.utf-8

" More encoding
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set termencoding=utf-8

" ctags
set tags=./.tags;,.tags

" ��ʾ�հ��ַ�
set list
set listchars=tab:>-,trail:-

" set autochdir
color itg_flat

if has("gui_running") 
	" ����˵����Ҽ��˵�����
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
set expandtab

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

" �ո񿪹��۵�
set foldenable
set foldmethod=indent
set foldlevel=100
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>

" ������ݼ�
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

" ��� cocos2dx shader �ļ������﷨����
au BufNewFile,BufRead *.fsh set filetype=c

"""""""""""""""""""""""""""""""""
" gutentags ��������Ŀ¼�ı�־��������Щ�ļ�/Ŀ¼����ֹͣ����һ��Ŀ¼�ݹ�
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
 
" �����ɵ������ļ�������
let g:gutentags_ctags_tagfile = '.tags'
 
" ���Զ����ɵ� tags �ļ�ȫ������ ~/.cache/tags Ŀ¼�У�������Ⱦ����Ŀ¼
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
 
" ���� ctags �Ĳ���
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
"""""""""""""""""""""""""""""""""

"""" CTRLP
let g:ctrlp_working_path_mode = 0


