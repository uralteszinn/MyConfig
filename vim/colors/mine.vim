set background=dark

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="mine"


hi Normal	          guibg=grey10      guifg=white
hi Cursor	          guibg=fg          guifg=bg
hi IncSearch	      guibg=black       guifg=yellow
hi LineNr		        guibg=grey20      guifg=grey50
hi NonText	        guibg=black       guifg=grey50
hi Visual	          guibg=#6666ff     guifg=black

hi Comment	                          guifg=grey30

hi myPlaceHolder    guibg=red         guifg=yellow

"hi VertSplit	guibg=#c2bfa5 guifg=grey50 gui=none
"hi Folded	guibg=grey30 guifg=gold 
"hi FoldColumn	guibg=grey30 guifg=tan
"hi ModeMsg	guifg=goldenrod
"hi MoreMsg	guifg=SeaGreen
"hi Question	guifg=springgreen
"hi Search	guibg=peru guifg=wheat
"hi SpecialKey	guifg=yellowgreen
"hi StatusLine	guibg=#c2bfa5 guifg=black gui=none
"hi StatusLineNC	guibg=#c2bfa5 guifg=grey50 gui=none
hi Title	guifg=indianred
"hi WarningMsg	guifg=salmon

"hi Constant	 guifg=#ffa0a0
"hi Identifier	 guifg=palegreen
"hi Statement	 guifg=khaki
"hi PreProc	 guifg=indianred
"hi Type		 guifg=darkkhaki
"hi Special	 guifg=navajowhite
"hi Ignore 	 guifg=grey40
"hi Todo		 guifg=orangered guibg=yellow2

"" color terminal definitions
"hi SpecialKey    ctermfg=darkgreen
"hi NonText       cterm=bold ctermfg=darkblue
"hi Directory     ctermfg=darkcyan
"hi ErrorMsg      cterm=bold ctermfg=7 ctermbg=1
"hi IncSearch     cterm=NONE ctermfg=yellow ctermbg=green
"hi Search        cterm=NONE ctermfg=grey ctermbg=blue
"hi MoreMsg       ctermfg=darkgreen
"hi ModeMsg       cterm=NONE ctermfg=brown
"hi LineNr        ctermfg=3
"hi Question      ctermfg=green
"hi StatusLine    cterm=bold,reverse
"hi StatusLineNC  cterm=reverse
"hi VertSplit     cterm=reverse
"hi Title         ctermfg=5
"hi Visual        cterm=reverse
"hi VisualNOS     cterm=bold,underline
"hi WarningMsg    ctermfg=1
"hi WildMenu      ctermfg=0 ctermbg=3
"hi Folded        ctermfg=darkgrey ctermbg=NONE
"hi FoldColumn    ctermfg=darkgrey ctermbg=NONE
"hi DiffAdd       ctermbg=4
"hi DiffChange    ctermbg=5
"hi DiffDelete    cterm=bold ctermfg=4 ctermbg=6
"hi DiffText      cterm=bold ctermbg=1
"hi Comment       ctermfg=darkcyan
"hi Constant      ctermfg=brown
"hi Special       ctermfg=5
"hi Identifier    ctermfg=6
"hi Statement     ctermfg=3
"hi PreProc       ctermfg=5
"hi Type          ctermfg=2
"hi Underlined    cterm=underline ctermfg=5
"hi Ignore        ctermfg=darkgrey
"hi Error         cterm=bold ctermfg=7 ctermbg=1


""vim: sw=4
