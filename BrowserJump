scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)

" Capture {{{
command!
      \ -nargs=+ -bang
      \ -complete=command
      \ Capture
      \ call s:cmd_capture([<f-args>], <bang>0)

function! C(cmd)
  redir => result
  silent execute a:cmd
  redir END
  return result
endfunction

function! s:cmd_capture(args, banged) "{{{
  new
  silent put =C(join(a:args))
  1,2delete _
endfunction "}}}

function! s:cmd_capture_var(args) "{{{
  return C(join(a:args))
endfunction "}}}
" }}}


augroup Browse
  au!
  au WinNew * let w:Now_Index = -1
  au WinNew * let w:Hists = []
augroup end
tabdo windo let w:Now_Index = -1 
tabdo windo let w:Hists = []
"tabdo PushPosAll | windo let w:Now_Index = -1 | PopPosAll
"tabdo PushPosAll | windo let w:Hists = [] | PopPosAll

function! s:cmd_capture_var_line(args) "{{{
  return split(C(a:args), '\n')
endfunction "}}}
" }}}

function! HHH()
  let new = s:cmd_capture_var_line('jumps')[1:-2]
  "echo new
  silent clearjumps
  if new == []
    if w:Now_Index > 0
      " TODO 現在位置を入れ替え
      let w:Now_Index -= 1
      call JUMP(w:Now_Index)
    endif
  else
    let w:Hists += new
    " TODO 現在位置を追加
    let w:Now_Index = len(w:Hists) - 1
    call JUMP(w:Now_Index)
  endif
  "echo w:Now_Index w:Hists
endfunction

function! JUMP(i)
  let c = split(w:Hists[a:i])
  let b = bufnr(join(c[3:]))
  call setpos('.', [ b >= 0 ? b : 0, c[1], c[2], 0 ])
endfunction

function! LLL()
  if w:Now_Index < (len(w:Hists) - 1)
    " TODO 現在位置を入れ替え
    let w:Now_Index += 1
    call JUMP(w:Now_Index)
  endif
endfunction

nnoremap H :<C-u>call HHH()<CR>
nnoremap L :<C-u>call LLL()<CR>
