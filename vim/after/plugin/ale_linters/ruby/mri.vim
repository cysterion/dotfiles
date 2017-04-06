" Author: Brandon Roehl - https://github.com/BrandonRoehl
" Description: Ruby MRI for Ruby files

function! ale_linters#ruby#mri#Handle(buffer, lines) abort
	" Matches patterns line the following:
	"
	" test.rb:3: warning: parentheses after method name is interpreted as an argument list, not a decomposed argument
	" test.rb:8: syntax error, unexpected keyword_end, expecting end-of-input
	let l:pattern = '\v^' . bufname(a:buffer) . ':(\d+):( warning:)?(.+)$'

	let l:output = []

	for l:line in a:lines
		let l:match = matchlist(l:line, l:pattern)

		if len(l:match) == 0
			continue
		endif

		if l:match[2]
			let l:type = 'W'
		else
			let l:type = 'E'
		endif

		call add(l:output, {
					\   'bufnr': a:buffer,
					\   'lnum': l:match[1] + 0,
					\   'text': l:match[3],
					\   'type': l:type,
					\})
	endfor

	return l:output
endfunction

function! ale_linters#ruby#mri#GetCommand(buffer) abort
	return 'ruby -w -c -T1 ' . bufname(a:buffer)
endfunction

call ale#linter#Define('ruby', {
			\   'name': 'ruby',
			\   'executable': 'ruby',
			\   'command_callback': 'ale_linters#ruby#mri#GetCommand',
			\   'callback': 'ale_linters#ruby#mri#Handle',
			\})
