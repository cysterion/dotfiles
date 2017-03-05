" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Brandon Roehl <BrandonRoehl@gmail.com>
" Last Change:	2017 Mar 5

" hi clear
set background=dark
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "XColors"

hi CursorLine	term=bold cterm=bold	ctermbg=235
hi CursorLineNr	term=bold cterm=bold	ctermbg=235	ctermfg=226
hi LineNr		term=none cterm=none	ctermbg=235	ctermfg=250
hi SignColumn	term=none cterm=none	ctermbg=235

hi MatchParen	term=bold cterm=bold	ctermbg=094	ctermfg=220
hi ModeMsg		term=bold cterm=bold	ctermbg=220	ctermfg=235

hi Pmenu		term=none cterm=none	ctermbg=240	ctermfg=254
hi PmenuSel		term=none cterm=none	ctermbg=039	ctermfg=234
hi PmenuSbar	ctermbg=245
hi PmenuThumb	ctermbg=235

hi ColorColumn	ctermbg=235
hi EndOfBuffer	ctermfg=250

hi Visual	term=none	cterm=none	ctermbg=195	ctermfg=232
hi link IncSearch		Visual

hi Search	cterm=underline	ctermbg=NONE ctermfg=none

hi Special		term=none	cterm=bold	ctermfg=201
hi link Tag				Special
hi link SpecialChar		Special
hi link Delimiter		Special
hi link SpecialComment	Special
hi link Debug			Special

hi Constant		term=underline		cterm=none	ctermfg=039
hi link Character		Constant
hi link Boolean			Constant
hi link Number			Constant
hi link Float			Number

hi Type			term=none	cterm=none	ctermfg=199
hi link Conditional		Type
hi link Repeat			Type
hi link Label			Type
hi link Keyword			Type
hi link Exception		Type
hi Statement	term=none			cterm=none	ctermfg=208

hi Operator		term=none	cterm=none	ctermfg=160 ctermbg=none

hi PreProc		term=underline		cterm=none	ctermfg=093
hi link Include			PreProc
hi link Define			PreProc
hi PreCondit	term=bold	cterm=bold	ctermfg=208

hi Identifier	term=underline		cterm=none	ctermfg=045
hi link Function		Identifier

hi StorageClass	term=none	cterm=bold	ctermfg=039
hi Typedef		term=none	cterm=bold	ctermfg=039
hi Structure	term=none	cterm=none	ctermfg=040

hi String		cterm=none	ctermfg=160
hi Comment		term=none			cterm=none	ctermfg=240

hi StatusLine	cterm=bold	ctermfg=045	ctermbg=235
hi StatusLineNC	cterm=bold	ctermfg=214	ctermbg=235

hi Error		term=standout		ctermbg=235 ctermfg=196
hi Todo			term=standout 		cterm=reverse,bold ctermfg=226	ctermbg=232

hi ErrorMsg		term=standout		cterm=none	ctermfg=255	ctermbg=160

hi Underlined	term=underline		cterm=underline

hi NonText		term=bold		cterm=bold	ctermfg=245 ctermbg=none
hi Title		term=bold		cterm=bold	ctermfg=green	ctermbg=none
hi Directory	term=bold		cterm=bold	ctermfg=blue	ctermbg=none
hi Macro		term=bold		cterm=bold	ctermfg=cyan
hi ModeMsg		term=bold		cterm=bold	ctermfg=045	ctermbg=none
hi MoreMsg		term=none		cterm=none	ctermfg=255	ctermbg=040
hi WarningMsg	term=none		cterm=none	ctermfg=255	ctermbg=202
hi SpellBad		term=underline	cterm=underline	ctermfg=160	ctermbg=none

" " This is where I am
" hi SpecialKey	term=bold			cterm=bold	ctermfg=lightgreen	ctermbg=lightcyan
" hi Question		term=standout		cterm=bold	ctermfg=lightgreen	ctermbg=lightcyan
" hi TabLine		term=bold,reverse	cterm=bold	ctermfg=lightgreen	ctermbg=lightcyan
" hi TabLineFill	term=bold,reverse	cterm=bold	ctermfg=lightgreen	ctermbg=lightcyan
" hi TabLineSel	term=reverse					ctermfg=lightgreen	ctermbg=lightcyan
" hi Ignore										ctermfg=lightgreen	ctermbg=lightcyan

" Gitgutter coloring
highlight GitGutterAdd    cterm=none ctermbg=235 ctermfg=119
highlight GitGutterDelete cterm=none ctermbg=235 ctermfg=167
highlight GitGutterChange cterm=none ctermbg=235 ctermfg=220
highlight link GitGutterChangeDelete GitGutterChange
