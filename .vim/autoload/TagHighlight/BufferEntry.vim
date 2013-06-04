" Tag Highlighter:
"   Author:  A. S. Budden <abudden _at_ gmail _dot_ com>
" Copyright: Copyright (C) 2013 A. S. Budden
"            Permission is hereby granted to use and distribute this code,
"            with or without modifications, provided that this copyright
"            notice is copied with it. Like anything else that's free,
"            the TagHighlight plugin is provided *as is* and comes with no
"            warranty of any kind, either expressed or implied. By using
"            this plugin, you agree that in no event will the copyright
"            holder be liable for any damages resulting from the use
"            of this software.

" ---------------------------------------------------------------------

try
	if &cp || v:version < 700 || (exists('g:loaded_TagHLBufferEntry') && (g:plugin_development_mode != 1))
		throw "Already loaded"
	endif
catch
	finish
endtry
let g:loaded_TagHLBufferEntry = 1

function! TagHighlight#BufferEntry#BufEnter(filename)
	if ! exists('b:TagHighlightPrivate')
		let b:TagHighlightPrivate = {}
	endif

	if TagHighlight#Option#GetOption('EnableCscope')
		call TagHighlight#Cscope#BufEnter()
	endif

	let b:TagHighlightPrivate['BufEnterInitialised'] = 1
endfunction

function! TagHighlight#BufferEntry#BufLeave(filename)
	if ! exists('b:TagHighlightPrivate')
		let b:TagHighlightPrivate = {}
	endif

	if TagHighlight#Option#GetOption('EnableCscope')
		call TagHighlight#Cscope#BufLeave()
	endif

	let b:TagHighlightPrivate['BufLeaveInitialised'] = 1
endfunction