function! AltStatusline(stl, time)
  " 旧タイマの削除
  if exists('TimerUsl') | call timer_stop(TimerUsl) | unlet TimerUsl | endif

  set statusline=%!a:stl

  let TimerUsl = timer_start(UpdateStatuslineInterval, 'UpdateStatusline', {'repeat': -1})
endfunction

function! UpdateStatusline(dummy)
  set statusline=%!g:stl
endfunction

function! SetDefaultStatusline(arg)
  let g:stl = ''
  call UpdateStatusline(dummy)
endfunction
