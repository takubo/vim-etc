scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)


function! s:init_win()
  let w:BrowserJumpList = []
  let w:BrowserJumpNowIndex = -1
  let w:BrowserTop = v:false
endfunction


function! BrowserJump_Back()
  if s:update_jumplist() || w:BrowserTop
    exe 'normal! ' . line('.') . 'G'
    call s:update_jumplist()
    let w:BrowserTop = v:false
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

function! s:jump(i)
  let cell = split(w:BrowserJumpList[a:i])
  let bn = bufnr(join(cell[3:]))
  " jumspで取得できる桁はなぜか、1小さいので+1する。
  call setpos('.', [ bn >= 0 ? bn : 0, cell[1], cell[2] + 1, 0 ])
endfunction

function! s:update_jumplist()
  let new_jump_list = CmdOutLine('jumps')[1:-2]
  silent clearjumps
  "echo len(new_jump_list) new_jump_list
  if new_jump_list != []
    if w:BrowserJumpNowIndex < (len(w:BrowserJumpList) - 1)
      call remove(w:BrowserJumpList, w:BrowserJumpNowIndex + 1, -1)
    endif
    " TODO newはバッファ名へ変える。いや全てバッファ番号に代える。
    " TODO バッファが変わると、cell[3:]が効かない
    let w:BrowserJumpList += new_jump_list
    " TODO uniqで重複削除
    let w:BrowserJumpNowIndex = len(w:BrowserJumpList) - 1
    return v:true
  endif
  return v:false
endfunction


function! BrowserJump_Disp()
  let top = s:update_jumplist()
  let w:BrowserTop = (w:BrowserTop || top)
  for i in range(0, len(w:BrowserJumpList) - 1)
    echo printf('%3d ', i) (w:BrowserJumpNowIndex == i ? top ? '?' : '>' : ' ') w:BrowserJumpList[i]
  endfor
  echo ' ' w:BrowserJumpNowIndex
endfunction


augroup BrowserJump
  au!
  au WinNew * call s:init_win()
augroup end
call PushPos_All() | exe 'tabdo windo call s:init_win()' | call PopPos_All()


nnoremap <silent> H :<C-u>call BrowserJump_Back()<CR>
nnoremap <silent> L :<C-u>call BrowserJump_Foward()<CR>
nnoremap <silent> <Leader>H :<C-u>call BrowserJump_Disp()<CR>
