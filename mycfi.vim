scriptencoding utf-8
" vim: set ts=8 sw=2 sts=2 :

function! Func_Name_Stl(alt_stl_time)
  if 0
    let stl='\ \ \ %m\ \ \ %#hl_func_name_stl#\ \ \ ' . cfi#format("%s ()", "- ()") . '\ \ \ %##'
    exe 'setl stl=' . stl
    let g:alt_stl_time = a:alt_stl_time
  else
    let stl="   %m   %#hl_func_name_stl#   " . cfi#format("%s ()", "- ()") . "   %##"
    call SetAltStatusline(stl, 'l', a:alt_stl_time * 1000)
  endif
endfunction

augroup mycfi
  au!
  au WinLeave * setl stl=
augroup end


com! FuncNameStl call Func_Name_Stl(5)
com! FN echo cfi#format("%s ()", "- ()")
"com! FN echohl hl_func_name_stl <Bar> echo cfi#format("%s", "[-]") <Bar> echohl None
nnoremap <silent> , :<C-u>FuncNameStl<CR>:FN<CR>


nnoremap <silent> <Plug>(FFn) :<C-u>FuncNameStl<CR>
"nmap  n n<Plug>(FFn)
"nmap  N N<Plug>(FFn)
"nmap <expr> *  ( (match(expand("<cword>"), '_') == 0) ? ('/\<_\?' . substitute(expand("<cword>"), '^_', '', '') . '\><CR>') : ('/\<_\?<C-r><C-w>\><CR>') ) . '<Plug>(FFn)'
"nmap <expr> #  ( (match(expand("<cword>"), '_') == 0) ? ('/_\?' . substitute(expand("<cword>"), '^_', '', '') . '<CR>') : ('/_\?<C-r><C-w><CR>') ) . '<Plug>(FFn)'
"cnoremap <expr><silent> <CR> ( match('/?', getcmdtype()) != -1 ) ? ( '<CR>:FuncNameStl<CR>' ) : ( '<CR>' )

nnoremap <silent> ][ ][:FuncNameStl<CR>
nnoremap <silent> [] []:FuncNameStl<CR>

nnoremap <expr> <C-w><CR> (&ft != 'qf') ? ('<C-w><C-]>z<CR>' . (winheight(0)/4) . '<C-y>') : ('<CR>:FF<CR>')
nnoremap <expr> <C-w><CR> (&ft != 'qf') ? ('<C-w><C-]>z<CR>' . (winheight(0)/4) . '<C-y>') : ('<CR>:call feedkeys("FF\<CR>"')

cnoremap <C-r><C-f> <C-R>=C_Func_Name(0, v:true)<CR>
cnoremap <C-r>f <C-r><C-f>

"nnoremap <silent> <Ins> [c^:FuncNameStl<CR>
"nnoremap <silent> <Del> ]c^:FuncNameStl<CR>



"let g:anzu_status_format = '/%/ ( %i / %l )'
"let g:anzu_search_limit = 999

" mapping
"nmap n <Plug>(anzu-n-with-echo)<Plug>(FFn)
"nmap N <Plug>(anzu-N-with-echo)<Plug>(FFn)
"nmap * <Plug>(anzu-star-with-echo)<Plug>(FFn)
"nmap # <Plug>(anzu-sharp-with-echo)<Plug>(FFn)
" clear status
"nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
" statusline
"set statusline=%{anzu#search_status()}


"cnoremap <expr><silent> <CR> ( match('/?', getcmdtype()) != -1 ) ? ( '<CR>:FuncNameStl<CR>:AnzuUpdateSearchStatusOutput<CR>' ) : ( '<CR>' )