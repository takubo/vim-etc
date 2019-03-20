let s:mode = 1

function! WWW(c, k)

  if s:mode
    let cnt = ''
    let c = getchar()
    let k = nr2char(c)
  else
    let c = a:c
    let k = a:k
    let cnt = v:prevcount
  endif

  while 1
    if k =~ '\d'
      let cnt .= k
      echo cnt
      let c = getchar()
      let k = nr2char(c)
      continue
    elseif k == 'h'
      3wincmd <
    elseif k == 'j'
      wincmd +
    elseif k == 'k'
      wincmd -
    elseif k == 'l'
      3wincmd >
    elseif k == "\<Space>"
      let cmd = cnt . 'wincmd w'
      exe cmd
    elseif c == "\<S-Space>"
      let cmd = cnt . 'wincmd W'
      exe cmd
    elseif k == '='
      wincmd =
    else
      if k != 'g'
	"call feedkeys(k, 'm')
      endif
      break
    endif
    let cnt = ''
    redraw
    let c = getchar()
    let k = nr2char(c)
  endwhile
endfunction

if s:mode
  ReVimrc
  nnoremap gh <Esc>:<C-u>call WWW(0, 'h')<CR>
else
  nnoremap gh <Esc>:<C-u>call WWW(0, 'h')<CR>
  nnoremap gj <Esc>:<C-u>call WWW(0, 'j')<CR>
  nnoremap gk <Esc>:<C-u>call WWW(0, 'k')<CR>
  nnoremap gl <Esc>:<C-u>call WWW(0, 'l')<CR>

  nnoremap <silent><expr> gH &l:wrap ? ':setl nowrap<CR>' : ':setl wrap<CR>'

  nnoremap <silent> g<Space>   :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0)     )<CR>
  nnoremap <silent> g<S-Space> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -1)<CR>

  nnoremap <silent> <C-j> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0)     )<CR>
  nnoremap <silent> <C-k> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -1)<CR>
endif



cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-h> <S-Tab>
cnoremap <C-l> <Tab>
