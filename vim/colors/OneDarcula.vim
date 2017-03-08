" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Brandon Roehl <BrandonRoehl@gmail.com>
" Last Change:	2017 Mar 7

" hi clear
set t_Co=256
set background=dark
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "OneDarcula"

hi CursorLine	term=bold cterm=bold	ctermbg=235 ctermfg=none
hi CursorLineNr	term=bold cterm=bold	ctermbg=235	ctermfg=226
hi LineNr		term=none cterm=none	ctermbg=235	ctermfg=250
hi SignColumn	term=none cterm=none	ctermbg=235 ctermfg=250

hi MatchParen	term=bold cterm=bold	ctermbg=094	ctermfg=220
hi ModeMsg		term=bold cterm=bold	ctermbg=220	ctermfg=235

hi Pmenu		term=none cterm=none	ctermbg=240	ctermfg=254
hi PmenuSel		term=none cterm=none	ctermbg=039	ctermfg=234
hi PmenuSbar	ctermbg=245
hi PmenuThumb	ctermbg=235

hi ColorColumn	ctermbg=235
hi EndOfBuffer	ctermfg=250

hi Visual	term=none	cterm=none	ctermbg=255	ctermfg=232

hi Search	cterm=reverse	ctermbg=none ctermfg=none
hi link IncSearch	Search
hi Todo		term=standout 	cterm=reverse ctermfg=226	ctermbg=232

hi Title		term=bold		cterm=bold	ctermfg=green	ctermbg=none
hi Directory	term=bold		cterm=bold	ctermfg=blue	ctermbg=none
hi Macro		term=bold		cterm=bold	ctermfg=cyan

" Other stuff
hi Comment		term=none			cterm=none	ctermfg=243

hi Special		term=none	cterm=none	ctermfg=212
hi link Tag				Special
hi link SpecialChar		Special
hi link Delimiter		Special
hi link SpecialComment	Special
hi link Debug			Special

hi String		cterm=none	ctermfg=203

hi Constant		term=underline		cterm=none	ctermfg=215
hi link Boolean			Constant
hi link Character		Constant
hi link Number			Constant
hi link Float			Number

hi Statement	term=none	cterm=none	ctermfg=177
hi link Conditional		Statement
hi link Repeat			Statement
hi link Label			Statement
hi link Keyword			Statement
hi link Exception		Statement
hi link Define			Statement

hi Structure	term=none	cterm=none	ctermfg=084
hi link StorageClass	Structure
hi link Typedef		Structure

hi Type			term=none		cterm=none	ctermfg=045
hi PreProc		term=underline	cterm=none	ctermfg=050
hi Include		term=underline	cterm=none	ctermfg=227

hi Operator		term=none	cterm=none	ctermfg=227

hi PreCondit	term=bold	cterm=bold	ctermfg=045

hi Identifier	term=underline	cterm=none	ctermfg=084
hi Function		term=underline	cterm=none	ctermfg=051


hi StatusLine	cterm=bold	ctermfg=045	ctermbg=235
hi StatusLineNC	cterm=bold	ctermfg=214	ctermbg=235

hi Error		term=standout		ctermbg=235 ctermfg=196
hi Warning		term=standout		ctermbg=235 ctermfg=214

hi ErrorMsg		term=standout		cterm=none	ctermfg=255	ctermbg=160

hi Underlined	term=underline		cterm=underline

hi NonText		term=bold		cterm=bold	ctermfg=245 ctermbg=none
hi ModeMsg		term=bold		cterm=bold	ctermfg=045	ctermbg=none
hi MoreMsg		term=none		cterm=none	ctermfg=232	ctermbg=083
hi WarningMsg	term=none		cterm=none	ctermfg=232	ctermbg=216
hi SpellBad		term=underline	cterm=underline,bold	ctermfg=none	ctermbg=none
hi SpellCap	term=underline	cterm=underline	ctermfg=none	ctermbg=none
hi link SpellRare	SpellCap
hi SpellLocal	term=none	cterm=none	ctermfg=none	ctermbg=none

" hi SpecialKey	term=bold			cterm=bold	ctermfg=lightgreen	ctermbg=lightcyan
" hi Question		term=standout		cterm=bold	ctermfg=lightgreen	ctermbg=lightcyan
" hi TabLine		term=bold,reverse	cterm=bold	ctermfg=lightgreen	ctermbg=lightcyan
" hi TabLineFill	term=bold,reverse	cterm=bold	ctermfg=lightgreen	ctermbg=lightcyan
" hi TabLineSel	term=reverse					ctermfg=lightgreen	ctermbg=lightcyan
" hi Ignore										ctermfg=lightgreen	ctermbg=lightcyan

" Syntastic Coloring
hi SyntasticError	term=underline	cterm=underline,bold	ctermfg=196	ctermbg=none
hi SyntasticWarning	term=underline	cterm=underline,bold	ctermfg=214	ctermbg=none

" Gitgutter coloring
hi GitGutterAdd    cterm=none ctermbg=235 ctermfg=084
hi GitGutterDelete cterm=none ctermbg=235 ctermfg=203
hi GitGutterChange cterm=none ctermbg=235 ctermfg=227
hi link GitGutterChangeDelete GitGutterChange
