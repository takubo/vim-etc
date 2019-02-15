scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:


" netrwは常にtree view
let g:netrw_liststyle = 3

" ファイルのプレビューを垂直分割で開く。
let g:netrw_preview   = 1

let g:netrw_sort_by='name'
let g:netrw_sort_sequence='[\/]$,\.sw\a$'
let g:netrw_special_syntax=v:true
let g:netrw_browse_split=0
let g:netrw_browse_split=4

let s:root_file = ".git"


set autochdir

function! s:exist_NetrwTree_win(root)
  let root = substitute(a:root, '\\', '/', 'g')
  for i in range(1, winnr('$'))
    let name = bufname(winbufnr(i))
    if match(name, 'NetrwTreeListing\( \d\+\)\?$') != -1
      if root == substitute(getcwd(i), '\\', '/', 'g')
        return i
      endif
    endif
  endfor
  return 0
endfunction

function! MyExplore()
  let g:filename = expand('%')
  let g:pwd = getcwd(win_getid())

  let root = ''
  for i in range(6)
    if filereadable(s:root_file) || isdirectory(s:root_file)
      let root = getcwd()
      break
    endif
    cd ..
  endfor

  exe 'cd ' . g:pwd

  let exist_win = <SID>exist_NetrwTree_win(root)
  if exist_win
    exe exist_win . 'wincmd w'
    return
  endif

  call <SID>wipeout_old_NetrwTree_buf()

  Vexplore
  wincmd H
  exe 'cd ' . root

  call <SID>set_cursor_on_org_file(root == '' ? 0 : i)
endfunction

function! s:wipeout_old_NetrwTree_buf()
  for i in range(1, bufnr('$'))
    let name = bufname(i)
    if match(name, 'NetrwTreeListing\( \d\+\)\?$') != -1
      try
	exe 'bwipeout ' i
      catch
      endtry
    endif
  endfor
endfunction

function! s:set_cursor_on_org_file(n)
  if a:n > 0
    " Netrwバッファのマッピングに展開する必要があるので、!は付けない。
    exe 'silent normal ' . repeat("-", a:n)
  endif

  call search('\%(' . repeat('│ ', a:n) . '\)\@<=' . g:filename . '$', 'cw')
endfunction


com! MyExplore call MyExplore()

nnoremap <silent> <leader>t :<C-u>MyExplore<CR>
