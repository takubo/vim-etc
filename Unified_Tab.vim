set encoding=utf-8
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0 expandtab:
" (この行に関しては:help modelineを参照)


function Unified_Tab(m)
  if &diff
    "echo "UT1"
    if a:m > 0
      " Next Hunk
      normal! ]c
    else
      " Previouse Hunk
      normal! [c
    endif
    normal! ^

  elseif win_getid()->getwininfo()[0].loclist == 1
    "例外をキャッチしないと、最初と最後の要素の次に移動しようとして例外で落ちる。
    try
      "echo "UT2"
      if a:m > 0
        lnext
      else
        lprev
      endif
    catch /:E553/
    endtry

  else
    "例外をキャッチしないと、最初と最後の要素の次に移動しようとして例外で落ちる。
    try
      "echo "UT3"
      if a:m > 0
        "echo "UT3 + 1"
        cnext
      else
        "echo "UT3 - 1"
        cprev
      endif
    catch /:E553/
    endtry
  endif

  FuncNameStl
  return
endfunction


nnoremap <silent>   <Tab> :<C-u>call Unified_Tab( 1)<CR>
nnoremap <silent> <S-Tab> :<C-u>call Unified_Tab(-1)<CR>
