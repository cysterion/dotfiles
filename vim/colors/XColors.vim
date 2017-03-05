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

hi Search	cterm=underline	ctermbg=NONE

hi Special		term=none	cterm=none	ctermfg=201
hi link Tag				Special
hi link SpecialChar		Special
hi link Delimiter		Special
hi link SpecialComment	Special
hi link Debug			Special

hi Constant		term=underline		cterm=none	ctermfg=063
hi link Character		Constant
hi link Boolean			Constant
hi link Number			Constant
hi link Float			Number

hi Statement	term=none			cterm=none	ctermfg=162
hi link Conditional		Statement
hi link Repeat			Statement
hi link Label			Statement
hi link Operator		Statement
hi link Keyword			Statement
hi link Exception		Statement

hi PreProc		term=underline		cterm=none	ctermfg=208
hi link Include			PreProc
hi link Define			PreProc
hi link Macro			PreProc
hi link PreCondit		PreProc

hi Identifier	term=underline		cterm=bold	ctermfg=045
hi link Function		Identifier

hi Type			term=none			cterm=none	ctermfg=039
hi link StorageClass	Type
hi link Structure		Type
hi link Typedef			Type

hi String		cterm=none	ctermfg=160
hi Comment		term=none			cterm=none	ctermfg=034

hi StatusLine	cterm=bold	ctermfg=045	ctermbg=235
hi StatusLineNC	cterm=bold	ctermfg=214	ctermbg=235

hi Error		term=standout		ctermbg=235 ctermfg=196
hi Todo			term=standout 		cterm=reverse,bold ctermfg=226	ctermbg=232

hi ErrorMsg		term=standout		cterm=none	ctermfg=255	ctermbg=160
" This is where I am

hi SpecialKey	term=bold			cterm=bold	ctermfg=darkred
hi NonText		term=bold			cterm=bold	ctermfg=darkred
hi Directory	term=bold			cterm=bold	ctermfg=brown
hi MoreMsg		term=bold			cterm=bold	ctermfg=darkgreen
hi ModeMsg		term=bold			cterm=bold
hi Underlined	term=underline		cterm=underline
hi Question		term=standout		cterm=bold	ctermfg=darkgreen
" hi Title		term=bold			cterm=bold	ctermfg=darkmagenta
hi WarningMsg	term=standout		cterm=bold	ctermfg=darkred
hi MatchParen	term=reverse		ctermfg=blue
hi TabLine		term=bold,reverse	cterm=bold	ctermfg=lightblue ctermbg=white
hi TabLineFill	term=bold,reverse	cterm=bold	ctermfg=lightblue ctermbg=white
hi TabLineSel	term=reverse		ctermfg=white	ctermbg=lightblue
hi Ignore							ctermfg=black	ctermbg=black


