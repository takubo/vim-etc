scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:


function! s:init_win()
  let w:BrowserJumpList = []
  let w:BrowserJumpNowIndex = -1
  let w:BrowserJumpTop = v:false
endfunction


function! BrowserJump_Back()
  if s:update_jumplist() || w:BrowserJumpTop
    exe 'normal! ' . line('.') . 'G'
    call s:update_jumplist()
    let w:BrowserJumpTop = v:false
  endif

  if w:BrowserJumpNowIndex > 0
    let w:BrowserJumpNowIndex -= 1
    call s:jump(w:BrowserJumpNowIndex)
  endif
endfunction


function! BrowserJump_Foward()
  if w:BrowserJumpNowIndex < (len(w:BrowserJumpList) - 1)
    let w:BrowserJumpNowIndex += 1
    call s:jump(w:BrowserJumpNowIndex)
  endif
endfunction


function! s:jump(n)
  let cell = split(w:BrowserJumpList[a:n]['org'])
  silent exe 'buffer ' . w:BrowserJumpList[a:n]['buf_nr']
  " jumspで取得できる桁はなぜか、1小さいので+1する。
  call setpos('.', [0, cell[1], cell[2] + 1, 0])
  clearjumps
endfunction


function! s:update_jumplist()
  let new_jump_list = CmdOutLine('jumps')[1:-2]
  silent clearjumps
  "echo len(new_jump_list) new_jump_list

  if new_jump_list != []
    if w:BrowserJumpNowIndex < (len(w:BrowserJumpList) - 1)
      call remove(w:BrowserJumpList, w:BrowserJumpNowIndex + 1, -1)
    endif

    for li in new_jump_list
      " バッファ番号も覚えておく。
      let cell = split(li)
      let bname = join(cell[3:])
      let bn = bufnr(bname)
      let bn = bn >= 0 ? bn : bufnr('%')
      let w:BrowserJumpList += [{ 'org' : li, 'buf_nr' : bn }]
    endfor

    " TODO uniqで重複削除

    let w:BrowserJumpNowIndex = len(w:BrowserJumpList) - 1
    return v:true
  endif
  return v:false
endfunction


function! BrowserJump_Disp()
  let w:BrowserJumpTop = (w:BrowserJumpTop || s:update_jumplist())
  for i in range(0, len(w:BrowserJumpList) - 1)
    echo printf('%3d ', i) (w:BrowserJumpNowIndex == i ? w:BrowserJumpTop ? '?' : '>' : ' ') w:BrowserJumpList[i]['org'] w:BrowserJumpList[i]['buf_nr']
  endfor
  echo ' ' ((w:BrowserJumpNowIndex < 0 || len(w:BrowserJumpList) <= w:BrowserJumpNowIndex) ? w:BrowserJumpNowIndex : '')
endfunction


augroup BrowserJump
  au!
  au WinNew * call s:init_win()
augroup end
call PushPos_All() | exe 'tabdo windo call s:init_win()' | call PopPos_All()


nnoremap <silent> H :<C-u>call BrowserJump_Back()<CR>
nnoremap <silent> L :<C-u>call BrowserJump_Foward()<CR>
nnoremap <silent> <Leader>H :<C-u>call BrowserJump_Disp()<CR>

" TODO
" keymap Plug化
" H、Lするごとに、カーソル位置を更新
" JumpToDefine Helpなども対応
