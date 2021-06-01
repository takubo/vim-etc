set encoding=utf-8
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0 expandtab:
" (この行に関しては:help modelineを参照)


function Unified_Tab(m)
  if &diff
    if a:m > 0
      " Next Hunk
      normal! ]c
    else
      " Previouse Hunk
      normal! [c
    endif
    normal! ^

  "elseif win_getid()->getwininfo()[0].loclist == 1
  elseif IsLocationlistWindowOpen()
    "例外をキャッチしないと、最初と最後の要素の次に移動しようとして例外で落ちる。
    try
      if a:m > 0
        lnext
      else
        lprev
      endif
    catch /:E553/
      echo a:m > 0 ?  'Last location list.' : '1st location list.'
    endtry

  else
    "例外をキャッチしないと、最初と最後の要素の次に移動しようとして例外で落ちる。
    try
      if a:m > 0
        cnext
      else
        cprev
      endif
    catch /:E553/
      echo a:m > 0 ?  'Last error list.' : '1st error list.'
    endtry
  endif

  FuncNameStl
  return
endfunction


function! GetLocationlistWinid()
  return getloclist(winnr(), {'winid' : 0}).winid
endfunction

function! IsLocationlistWindowOpen()
  return GetLocationlistWinid() != 0
endfunction


nnoremap <silent>       t :<C-u>call Unified_Tab( 1)<CR>
nnoremap <silent>       T :<C-u>call Unified_Tab(-1)<CR>
nnoremap <silent>       m :<C-u>call Unified_Tab( 1)<CR>
nnoremap <silent>       M :<C-u>call Unified_Tab(-1)<CR>
nnoremap <silent>   <Tab> :<C-u>call Unified_Tab( 1)<CR>
nnoremap <silent> <S-Tab> :<C-u>call Unified_Tab(-1)<CR>
"nnoremap <silent>       t ^
"nnoremap <silent>       T $
"
"nnoremap <silent>       m J





"---------------------------------------------------------------------------------------------
com! IIG InsertIncludeGurd
com! InsertIncludeGurd call s:InsertIncludeGurd()


function! s:InsertIncludeGurd()
  let fn = expand('%')
  let fn = toupper(fn)
  let fn = substitute(fn, '\W', '_', 'g')
  let fn = (exists('g:IncludeGuardPrefix') ? g:IncludeGuardPrefix : '') . fn
  let fn0 = "#ifndef\t" . fn
  let fn1 = "#define\t" . fn
  let fn2 = "#endif\t/* " . fn . " */"
  call append(0, fn0)
  call append(1, fn1)
  call append(line('$'), fn2)
  echo fn
endfunction
"---------------------------------------------------------------------------------------------


" com! -nargs=? -complete=customlist,s:CompletionTabline Tabline call <SID>ToggleTabline(<args>)

function! s:ToggleTabline(arg)
  if (a:arg . '') == ''
    echo s:TablineStatus
  elseif (a:arg . '') == '+'
    let s:TablineStatus = ( s:TablineStatus + 1 ) % s:TablineStatusNum
  elseif (a:arg . '') == '-'
    let s:TablineStatus = ( s:TablineStatus - 1 ) % s:TablineStatusNum
  elseif a:arg < s:TablineStatusNum
    let s:TablineStatus = a:arg
  else
    echoerr 'Tabline:Invalid argument.'
    return
  endif

  let &showtabline = ( s:TablineStatus == 0 ? 0 : 2 )

  call UpdateTabline(0)
endfunction

let s:TablineStatusNum = 8

function! s:CompletionTabline(ArgLead, CmdLine, CusorPos)
  return map(range(0, s:TablineStatusNum), 'v:val . ""') + ['+', '-']
endfunction
