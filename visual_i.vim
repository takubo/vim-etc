scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:
" (この行に関しては:help modelineを参照)



if 0
vnoremap <nowait> <expr> i ( mode() == "\<C-v>" && line("'<") != line("'>") ) ? 'I' : 'i'
endif


if 0

vnoremap <nowait> i <Esc>:call feedkeys('gv' . ( line("'<") != line("'>") ? 'I' : 'i'), 'nt')<CR>

endif


if 1

vnoremap <silent> <Plug>(Visual-I) <Esc>:call feedkeys('gv' . ( line("'<") != line("'>") ? 'I' : 'i'), 'nt')<CR>
vnoremap <Plug>(Visual-i) i
vmap <expr> <nowait> i mode() == "\<C-v>" ? "<Plug>(Visual-I)" : "<Plug>(Visual-i)"

endif


if 0

"vnoremap <nowait> i <Esc>:exe 'normal!' 'gv' ( mode() == "\<C-v>" && line("'<") != line("'>") ) ? 'I' : 'i'
"vnoremap <nowait> i <Esc>:exe 'normal!' 'gv' ( line("'<") != line("'>") ) ? 'I' : 'i'<CR>




"vnoremap <nowait> i <Esc>:call feedkeys('gv' . ( line("'<") != line("'>") ? 'I' : 'i'), 'nt')<CR>

vnoremap <silent> <Plug>(Visual-I) <Esc>:call feedkeys('gv' . ( line("'<") != line("'>") ? 'I' : 'i'), 'nt')<CR>
vnoremap <Plug>(Visual-i) i
vmap <expr> <nowait> i mode() == "\<C-v>" ? "<Plug>(Visual-I)" : "<Plug>(Visual-i)"


function! s:Visual_I()
  let last_v_mode = mode()
endfunction

endif

if 0

vnoremap <nowait> <expr> i <SID>Visual_I()

function! s:Visual_I()
  let now_line = line("'<")
  "let now_col = col("'<")
  let oth_line = line("'>")
  "let oth_col = col("'>")
  "echo now_line  now_col  oth_line  oth_col
  echo now_line  oth_line  
  if mode() == "\<C-v>" && now_line != oth_line
    "echo "()"
    "call feedkeys('I', 'nt')
    return 'I'
  endif
  " echo "SS"
  return 'i'
  "call feedkeys('i', 'nt')
  "return ''
endfunction

endif

if 0

function! s:Visual_I()
  let now_line = line("'<")
  let now_col = col("'<")
  "normal! o
  "normal! <Esc>
  let oth_line = line("'>")
  let oth_col = col("'>")
  "normal! o
  echo now_line  now_col  oth_line  oth_col
  return ''
endfunction

function! PrintRange() range
    echo "firstline: " . a:firstline
    echo "lastline: " . a:lastline
endfunction
command! -range PrintRange <line1>,<line2>call PrintRange()

endif


nnoremap v <C-v>
