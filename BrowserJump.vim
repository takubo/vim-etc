scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)


augroup BrowserJump
  au!
  au WinNew * call s:init_win()
augroup end
call PushPos_All() | exe 'tabdo call s:init_win()' | call PopPos_All()

function! s:init_win()
  let w:BrowserJumpNowIndex = -1
  let w:BrowserJumpList = []
endfunction


function! s:jump(i)
  let cell = split(w:BrowserJumpList[a:i])
  let bn = bufnr(join(cell[3:]))
  call setpos('.', [ bn >= 0 ? bn : 0, cell[1], cell[2], 0 ])
endfunction

function! s:add_jumplist()
  let new_jump_list = CmdOutLine('jumps')[1:-2]
  silent clearjumps
  if new_jump_list != []
    let w:BrowserJumpList += new_jump_list
    return v:true
  endif
  return v:false
endfunction

function! BrowserJump_Back()
  if s:add_jumplist()
    let w:BrowserJumpNowIndex = len(w:BrowserJumpList) - 1
  elseif w:BrowserJumpNowIndex > 0
    let w:BrowserJumpNowIndex -= 1
  else
    return
  endif
  call s:jump(w:BrowserJumpNowIndex)
endfunction

function! BrowserJump_Foward()
  if w:BrowserJumpNowIndex < (len(w:BrowserJumpList) - 1)
    let w:BrowserJumpNowIndex += 1
    call s:jump(w:BrowserJumpNowIndex)
  endif
endfunction


function! BrowserJump_Disp()
  call s:add_jumplist()
  for i in w:BrowserJumpList
    echo w:BrowserJumpNowIndex i
  endfor
endfunction


nnoremap H :<C-u>call BrowserJump_Back()<CR>
nnoremap L :<C-u>call BrowserJump_Foward()<CR>
nnoremap <Leader>H :<C-u>call BrowserJump_Disp()<CR>
