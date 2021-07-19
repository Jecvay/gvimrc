let g:plug_url_format = 'git://github.com/%s.git'
call plug#begin('~/.vim/bundle')
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set encoding=utf-8

let mapleader="-"
set mouse=a
if has("mouse_sgr")
        set ttymouse=sgr
else
        set ttymouse=xterm2
end

" test coc.nvim
nmap <silent> <C-]> <Plug>(coc-definition)
let g:coc_global_extensions = ['coc-lpc', 'coc-ccls']

" https://zhuanlan.zhihu.com/p/47801331
if $TMUX != ''
	set ttimeoutlen=20
elseif &ttimeoutlen > 60 || &ttimeoutlen <= 0
	set ttimeoutlen=60
endif

" 相对行号
set relativenumber

" 显示行首tab吗？
" set list
set list
set listchars=tab:>-,trail:-

" set autochdir
color itg_flat
set background=dark
if &diff
	color darkburn
	set readonly
endif

set nu
set nowrap
set cursorline
set hlsearch
set incsearch

highlight fzf1 ctermfg=251 ctermbg=0

" See `man fzf-tmux` for available options
" if exists('$TMUX')
"   let g:fzf_layout = { 'tmux': '-p90%,60%' }
" else
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" endif

"  \   'rg -tc -tcpp -tpy -g "!.svn/**" -g "!ca/**" -g "!log/**" --column --line-number --no-heading --vimgrep --smart-case -- '.shellescape(<q-args>), 1,
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
	\ 'rg -tc -tcpp -tpy -g "!conf_data/**" -g "!.svn/**" -g "!ca/**" -g "!log/**" --column --line-number --no-heading --color=auto --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Rgall
  \ call fzf#vim#grep(
  \   'rg -g "!.svn/**" --column --line-number --no-heading --color=auto --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

set ai
" INDENT [https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim]
" filetype plugin indent on
" show existing tab with 4 spaces width
" set tabstop=4
set tabstop=2
" when indenting with '>', use 4 spaces width
" set shiftwidth=4
set shiftwidth=0
" On pressing tab, insert 4 spaces
" set expandtab
set noexpandtab

set backspace=2         " Powerful backspace
set ignorecase
set smartcase
syntax on
set nobackup
setlocal noswapfile
filetype on
" filetype plugin on
filetype indent on
set showmatch
set matchtime=1
set scrolloff=10
set laststatus=2
set history=1000

set foldenable
set foldmethod=indent
set foldlevel=100
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>

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

" cocos2dx shader
au BufNewFile,BufRead *.fsh set filetype=c

"""""""""""""""""""""""""""""""""
"    " gutentags
"    
"    " let g:gutentags_modules = ['ctags', 'gtags_cscope']
"    let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
"    let g:gutentags_ctags_tagfile = '.tags'
"    
"    " generate datebases in my cache directory, prevent gtags files polluting my
"    " project
"    let s:vim_tags = expand('~/.cache/tags')
"    let g:gutentags_cache_dir = s:vim_tags
"    
"    " change focus to quickfix window after search (optional).
"    let g:gutentags_plus_switch = 1
"    
"    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
"    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
"    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
"    
"    let g:gutentags_auto_add_gtags_cscope = 0
"    
"    " debug
"    let g:gutentags_define_advanced_commands = 1
"    """""""""""""""""""""""""""""""""
"    " Debug highlight <F10>
"    map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
"                            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
"                            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
"    
""""""""""""""""""""""""""""""""
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

" for FreeBSD csh->zsh jump
" https://stackoverflow.com/questions/9092347/how-to-make-vim-use-the-same-environment-as-my-login-shell-when-running-commands
set shell=bash

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <c-h> :Rg <C-R><C-W><Cr>
nnoremap <silent> <CR>	:BTags<Cr>

map <Leader>f :Rg 
map <Leader>l :set filetype=lpc<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $GTAGSLABEL = 'native-pygments'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:python_recommended_style = 0

