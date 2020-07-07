" itg_flat for VIM
" Port of the theme-itg-flat Sublime Text theme with some minor tweaks. Credit for the original theme goes to @itsthatguy (https://github.com/itsthatguy/theme-itg-flat)
" Green/Blue - #92e4c0, LightGray - #606A74, Yellow - #DDC96D, Red - #D1605E, LightGreen #B5DC64, White - #e0e0e0, BG - #282A31

set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif
set t_Co=256
let colors_name = "itg_flat"

hi Comment	    	guifg=#606a74    ctermfg=242    gui=none   		cterm=none
hi Constant	    	guifg=#92e4c0    ctermfg=115    gui=none    	cterm=none
hi Cursor	   	 	guibg=#00E4FF    ctermbg=255    guifg=#014850   ctermfg=242    	gui=none    cterm=none
hi CursorLine					   	 ctermfg=none   guibg=#404040   ctermbg=237    	gui=none    cterm=none
hi ColorColumn      guifg=#e4e4e4    ctermfg=254    guibg=#606a74 ctermbg=240 gui=none    cterm=none
hi Directory	    guifg=#008b8b    ctermfg=33    	gui=none    	cterm=none
hi Folded	    	guibg=#262626    ctermbg=235    guifg=#8a8a8a   ctermfg=245    	gui=none    cterm=none
hi Function	    	guifg=#92e4c0    ctermfg=115    gui=none    	cterm=none
hi Identifier	    guifg=#e0e0e0    ctermfg=254    gui=none    	cterm=none
hi LineNr	    	guifg=#606a74    ctermfg=240    gui=none    	cterm=none
hi MatchParen	    guifg=#ccffcc    ctermfg=252    guibg=#008b8b   ctermbg=33    	gui=none    cterm=none
hi Normal	    	guifg=#e4e4e4    ctermfg=254    guibg=#282a31   ctermbg=0      gui=none    cterm=none
hi NonText	    	guibg=#2D2F36    ctermbg=0 guifg=#d1605e   ctermfg=167    	gui=none    cterm=none
hi Number	    	guifg=#92e4c0    ctermfg=115    gui=none    	cterm=none
hi PreProc	    	guifg=#d1605e    ctermfg=167    gui=none    	cterm=none
hi Search			guibg=#b0b2d2	 ctermbg=187	guifg=#000000	ctermfg=0
hi Statement	    guifg=#d1605e    ctermfg=167    gui=none    	cterm=none
hi Special	    	guifg=#e0e0e0    ctermfg=254    gui=none    	cterm=none
hi SpecialKey	    guifg=#9acd32    ctermfg=0      gui=none    	cterm=none
hi StatusLine	    guibg=#30323b    ctermbg=237    guifg=#e0e0e0   ctermfg=254    	gui=none    cterm=none
hi StatusLineNC	    guibg=#30323b    ctermbg=237    guifg=#e0e0e0   ctermfg=254    	gui=none    cterm=none
hi String	    	guifg=#ddc96d    ctermfg=185    gui=none    	cterm=none
hi StorageClass	    guifg=#bdb76b    ctermfg=250    gui=none    	cterm=none
hi Title	    	guifg=#e0e0e0    ctermfg=254    gui=none    	cterm=none
hi Todo	    		guibg=#00fefc    ctermfg=26    guifg=#000000	cterm=none
hi Type	    		guifg=#92e4c0    ctermfg=115    gui=none    	cterm=none
hi Underlined	    guifg=#80a0ff    ctermfg=89    	gui=underline   cterm=underline
hi VertSplit	    guibg=#2D2F36    ctermbg=236    guifg=#585858   ctermfg=240    	gui=none    cterm=none
hi Visual	    	guifg=#00E4FF	 ctermfg=255    guibg=#014C54	ctermbg=242    	gui=none    cterm=none
hi MatchParen 		guibg=#30323b    ctermbg=236    guifg=#00afff   ctermfg=39
hi Pmenu			guibg=#30323b	 ctermbg=237	guifg=#e0e0e0	ctermfg=254		gui=none	cterm=none
hi TabLine guibg=#2D2F36    ctermbg=0 guifg=#2D2F36   ctermfg=0 gui=none    cterm=none
hi TabLineFill guibg=#2D2F36    ctermbg=0 guifg=#2D2F36   ctermfg=0 gui=none    cterm=none
hi TabLineSel guibg=#2D2F36    ctermbg=0 guifg=#2D2F36   ctermfg=0 gui=none    cterm=none
