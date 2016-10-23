" Doesn't need to be Vi compatible the improved part of Vim
set nocompatible

" Enable everything
execute pathogen#infect()
filetype plugin indent on

" Syntax coloring
syntax enable
" Always show the statusline
set laststatus=2
" Show line numbers
set number
" show position in the document reg statusline
set ruler
" give support for 256bit coloring
set t_Co=256
set background=light

" Vim popup for autocomplete 
set omnifunc=syntaxcomplete#Complete
set completeopt=noinsert,menuone,preview
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
" let g:rubycomplete_rails = 1

" Keys that trigger completeopt
for key in split("a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z")
    execute "inoremap <silent><expr> " . key . " OpenAutocomp('" . key . "')"
endfor
func OpenAutocomp(key)
    return pumvisible() ? a:key : a:key . "\<c-x>\<c-o>"
endfunc
inoremap <silent><expr> . ".\<c-x>\<c-o>"
inoremap <silent><expr> <tab> pumvisible() ? "\<c-n>" : "<tab>"

" Remove splash
" set shortmess=I

" This is for the CursorShape changin in modes in iTerm
" This also has the workaround for runnning in a tmux session
" if exists('$TMUX')
" These are if it is in a tmux session
" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<ESC>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<ESC>\\"
" else
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif

" Spacing
set backspace=2
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4

" Enable mouse suppourt
set mouse=a
" Mouse fix for tmux
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
endif
" Smooth scroll
nnoremap <ScrollWheelUp> <C-Y>
nnoremap <ScrollWheelDown> <C-E>

" Arrow don't skip lines
nnoremap <Up> gk
nnoremap <Down> gj

" Use system clipboard
if !exists('$TMUX')
    set clipboard=unnamed "unnamedplus
endif

" highlighting
set cursorline
set scrolloff=2
set colorcolumn=81
set hlsearch
set incsearch
highlight CursorLine   cterm=bold ctermbg=234
highlight CursorLineNr cterm=bold ctermbg=234 ctermfg=226
highlight LineNr       cterm=none ctermbg=234 ctermfg=245
highlight SignColumn   cterm=none ctermbg=234
highlight MatchParen   cterm=bold ctermbg=094 ctermfg=220
highlight ModeMsg      cterm=bold ctermbg=220 ctermfg=235
highlight Pmenu        cterm=none ctermbg=240 ctermfg=250
highlight PmenuSel     cterm=none ctermbg=039 ctermfg=234
highlight PmenuSbar    ctermbg=245
highlight PmenuThumb   ctermbg=235
highlight ColorColumn  ctermbg=234
highlight EndOfBuffer  ctermfg=245
highlight Search cterm=underline ctermbg=NONE

" Signify gutter coloring
highlight SignifySignAdd    cterm=none ctermbg=234 ctermfg=119
highlight SignifySignDelete cterm=none ctermbg=234 ctermfg=167
highlight SignifySignChange cterm=none ctermbg=234 ctermfg=220
set fillchars+=vert:\ 

" Maps nerd tree for easy access
inoremap <silent> <C-\> <C-o>:NERDTreeToggle<cr>
noremap <silent> <C-\> :NERDTreeToggle<cr>
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_open_on_console_startup=1

noremap <silent> // :call NERDComment(0,"toggle")<cr>
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" Synastic java fix
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['java'] }
" Syntastic Basic setup removing the list
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

" AirLine configuration
set noshowmode
let g:airline_theme='dark'
" setup custom symbols
let g:airline_symbols = {}
" compatible without powerline fonts
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␤' " Original symbol
"let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" Signify signs and colors
let g:signify_sign_add = '+'
let g:signify_sign_delete = '-'
let g:signify_sign_change = '~'
let g:signify_sign_delete_first_line = g:signify_sign_delete
let g:signify_sign_changedelete = g:signify_sign_change

