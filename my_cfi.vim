scriptencoding utf-8
" vim: set ts=8 sw=2 sts=2 :

function! Func_Name_Stl(alt_stl_time)
  let stl="   %m   %#hl_func_name_stl#   " . cfi#format("%s ()", "... ()") . "   %##"
  call SetAltStatusline(stl, 'l', a:alt_stl_time)
endfunction

com! FuncNameStl       call Func_Name_Stl(5000)
com! FuncNameEcho      echo cfi#format("%s ()", "... ()")
com! FuncNameEchoColor echohl hl_func_name_stl <Bar> echo cfi#format("%s", "... ()") <Bar> echohl None
com! FuncName          exe 'FuncNameStl' | exe 'FuncNameEcho'


nnoremap <silent> <Plug>(FuncName) :<C-u>FuncNameStl<CR>


nnoremap <silent> ][ ][:FuncNameStl<CR>
nnoremap <silent> [] []:FuncNameStl<CR>

nnoremap <expr> <C-w><CR> (&ft != 'qf') ? ('<C-w><C-]>z<CR>' . (winheight(0)/4) . '<C-y>') : ('<CR>:call feedkeys(":FuncName\<CR>"')
nnoremap <expr> <C-w><CR> (&ft != 'qf') ? ('<C-w><C-]>z<CR>' . (winheight(0)/4) . '<C-y>') : ('<CR>:FuncName<CR>')

cnoremap <C-r><C-f> <C-R>=cfi#format('%s', '')<CR>
cmap     <C-r>f <C-r><C-f>

nnoremap <silent> , :<C-u>FuncName<CR>
