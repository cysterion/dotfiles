" Doesn't need to be Vi compatible the improved part of Vim
set nocompatible
filetype plugin indent on

" Syntax coloring
syntax enable
" Faster redraw
set ttyfast
" Quick redraw
set lazyredraw
" Always show the statusline
set laststatus=2
" Load a file if edited by an external source
set autoread
" Allow the backspace to delete anything
set backspace=2
" Show line numbers
set number
" Soft wrap
set wrap
" show position in the document reg statusline
set ruler
" Always report changed lines
set report=0
" Autocomplete commands menu
set wildmenu
" give support for 256bit coloring
set t_Co=256
set background=light

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

" Spacing
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set autoindent

" Use system clipboard
if !exists('$TMUX')
	set clipboard=unnamed "unnamedplus
endif

set display+=lastline

autocmd BufWritePre * :%s/\s\+$//e

" Remove splash
" set shortmess=I

" highlighting
set cursorline
set scrolloff=2
set colorcolumn=81
set hlsearch
set incsearch

colorscheme OneDarcula
let &fillchars=''
let &showbreak='↳ '
let &listchars='tab:│ '
" let &listchars='tab:│ ,eol:¬,nbsp:␣,trail:•,extends:⟩,precedes:⟨'
set list

" Spellcheck
set spell spelllang=en
set spellfile=~/.vim/spell/en.utf-8.add

"---------- OmniComplete on keypress ----------"
set omnifunc=syntaxcomplete#Complete
set completeopt=noinsert,menuone
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_rails=1
let g:loaded_sql_completion=0
let g:omni_sql_no_default_maps=1

" Keys that trigger completeopt
for key in split("a b c d e f g h i j k l m n o p q r s t u v w x y z " .
			\ "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z")
	execute "inoremap <silent><expr> ".key." \"".key."\" . OpenAutocomp()"
endfor
func! OpenAutocomp()
	return pumvisible() ? "" : "\<C-X>\<C-O>"
endfunc

inoremap <silent><expr> . ".\<C-X>\<C-O>"
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-N>" : "\<Tab>"

"---------- Statusline ----------"
let g:mode_map = {
			\ '__' : '------',
			\ 'n'  : 'NORMAL',
			\ 'i'  : 'INSERT',
			\ 'R'  : 'REPLACE',
			\ 'v'  : 'VISUAL',
			\ 'V'  : 'V-LINE',
			\ 'c'  : 'COMMAND',
			\ '' : 'V-BLOCK',
			\ 's'  : 'SELECT',
			\ 'S'  : 'S-LINE',
			\ '' : 'S-BLOCK',
			\ 't'  : 'TERMINAL',
			\ }

" Automatically change the statusline color depending on mode
hi User1 term=bold cterm=bold ctermbg=235 ctermfg=207
func! ChangeStatuslineColor()
	if (mode() =~# '\v(n|no)')
		exe 'hi! User1 ctermfg=207'
	elseif (mode() =~# '\v(v|V|)')
		exe 'hi! User1 ctermfg=082'
	elseif (mode() ==# 'i')
		exe 'hi! User1 ctermfg=220'
	else
		exe 'hi! User1 ctermfg=045'
	endif
	return ''
endfunc
hi User2 term=none cterm=none ctermbg=235 ctermfg=254
hi User3 term=bold cterm=bold ctermbg=235 ctermfg=082
hi User4 term=bold cterm=bold ctermbg=235 ctermfg=196

set noshowmode
set statusline=%{ChangeStatuslineColor()}%1* " Changing the statusline color
set statusline+=\ %{g:mode_map[mode()]}%m\ %< " Current mode and modified flag
set statusline+=%4*%h%r "help file flag and read only flag
" set statusline+=\ %2*%n\  " buffernr
set statusline+=%2*%y\ %0*%F " Language and file path
set statusline+=\ %= " Left and right divide
set statusline+=%2*%{strlen(&fenc)?&fenc:'none'}[%{&ff}]\  "file encoding
set statusline+=%3*%P\ ␤\ %l/%L☰\ :\ %3v\  " end

"------   Plugin Setup   ------"
" Enable vim-plug
execute plug#begin()
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':
			\ [ 'NERDTreeToggle', 'NERDTree', 'NERDTreeFind' ] }
Plug 'sjl/gundo.vim', { 'on':
			\ ['GundoHide', 'GundoRenderGraph', 'GundoShow', 'GundoToggle'] }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-syntastic/syntastic'
Plug 'sheerun/vim-polyglot'
execute plug#end()

"------   Plugin Settings   ------"
" Maps nerd tree for easy access
inoremap <silent> <C-\> <C-o>:NERDTreeToggle<cr>
noremap <silent> <C-\> :NERDTreeToggle<cr>
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_open_on_console_startup=1

noremap <silent> // :call NERDComment(0,"toggle")<cr>
let g:NERDSpaceDelims=1
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1

" Syntastic Setup
set statusline+=%4*%{SyntasticStatuslineFlag()}\ %*
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['java'] }
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_aggregate_errors=1
let g:syntastic_cpp_compiler='clang++'
let g:syntastic_cpp_compiler_options=' -std=c++11 -stdlib=libc++'

" Gitgutter signs
let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='﹍'
let g:gitgutter_sign_removed_first_line='﹉'
let g:gitgutter_sign_modified_removed='┃'
