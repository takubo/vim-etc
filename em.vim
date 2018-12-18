let c99 = v:true

let s:b2h = { '0000' : '0', '0001' : '1', '0010' : '2', '0011' : '3', '0100' : '4', '0101' : '5', '0110' : '6', '0111' : '7',
            \ '1000' : '8', '1001' : '9', '1010' : 'a', '1011' : 'b', '1100' : 'c', '1101' : 'd', '1110' : 'e', '1111' : 'f' }

let s:h2b = { '0' : 'oooo', '1' : 'oooI', '2' : 'ooIo', '3' : 'ooII', '4' : 'oIoo', '5' : 'oIoI', '6' : 'oIIo', '7' : 'oIII',
            \ '8' : 'Iooo', '9' : 'IooI', 'a' : 'IoIo', 'b' : 'IoII', 'c' : 'IIoo', 'd' : 'IIoI', 'e' : 'IIIo', 'f' : 'IIII' }

let s:now_disp = 0

function! s:ana_numstr(word, expand)
  let rawstr = a:word
  let numstr = ''
  let base = 0

  if rawstr =~? '^0x\x\+[lLuU]\{,3\}$'	" long long型リテラルは、0x56LLのようにLが2つ付く
    let base = 16
    let numstr = substitute(strpart(rawstr, 2), '[ulUL]\+', '', '')
  elseif rawstr =~? '^\([1-9]\d*\|0\+\)[lLuU]\{,3\}$'	" 0のみから構成される数は、Cの仕様上、厳密には8進であるが、便宜上10進として扱う。
    let base = 10
    let numstr = substitute(rawstr, '[ulUL]\+', '', '')
  elseif rawstr =~? '^0\o\+$'
    let base = 8
    let numstr = rawstr
  elseif rawstr =~? '^0b[01]\+$'	" 2進リテラル C99
    let base = 2
    let numstr = strpart(rawstr, 2)
  endif

  if a:expand && base == 0
    " Cの接頭辞がない16進数
    if rawstr =~? '^\x\+$'
      let base = 16
      let numstr = rawstr
    " 桁区切りにアンダースコアを使う2進数
    elseif rawstr =~? '^\(0b\)\?[_01]\{3,\}$'
      let base = 2
      let numstr = substitute(rawstr, '^0b\|_', '', 'g')
    " 桁区切りにカンマを使う10進数
    elseif rawstr =~? '^\([0-9,]\+\)$'
      let base = 10
      let numstr = substitute(rawstr, '^0\+\|,', '', 'g')
    endif
  endif

  let ret = {'rawstr':rawstr, 'numstr':numstr, 'base':base}
  return ret
endfunc

command! AnaNum :echo s:ana_numstr(expand("<cword>"), v:true)

function! s:bin2hex(bin)
  let hex = ''
  let bin = a:bin

  while len(bin) > 0
    let l = len(bin)
    let tmp = matchstr('000' . strpart(bin, l - 4), '....$')
    let hex = s:b2h[tmp] . hex
    let bin = substitute(bin, '[01]\{0,4\}$', '', '')
  endwhile

  return hex
endfunc

function! s:hex2bin(hex)
  let bin = ''

  for i in split(a:hex, '\zs')
    let bin = bin . s:h2b[tolower(i)] . ' '
  endfor

  return bin
endfunc

function! s:EmDisp(word)
  let r = s:ana_numstr(a:word, v:false)

  if r.base == 16
    echo '[Dec]' printf("%10u", r.rawstr) '    [Bin]' s:hex2bin(r.numstr) (winwidth(0) > 100 ? '    ' : "\n") '[Byt]' len(r.numstr) / 2 '    [bit]' len(r.numstr) * 4 '    [dig]' len(r.numstr)
    let s:now_disp = 1
  elseif r.base == 10
    let hex = printf("%08x", r.numstr)
    echo '[Hex] 0x' . hex '    [Bin]' s:hex2bin(hex) '    [byt]' float2nr(ceil(len(hex) / 2.0)) '    [bit]' len(hex) * 4 '    [dig]' len(r.numstr)
    let s:now_disp = 1
  elseif r.base == 2
    let hex = s:bin2hex(r.numstr)
    echo '[Hex] 0x' . hex '    [Dec] ' printf("%d", '0x' . hex) '    [byt]' float2nr(ceil(len(r.numstr) / 8.0)) '    [bit]' len(hex) * 4 '    [dig]' len(r.numstr)
    let s:now_disp = 1
  elseif s:now_disp
    echo ""
    let s:now_disp = 0
  endif
endfun

command! EmDisp :call <SID>EmDisp(expand("<cword>"))

augroup Em
  au!

  au CursorMoved * EmDisp
  au VimResized  * EmDisp

  au CmdwinEnter * let <SID>now_disp = 0
augroup end

" Test
" 0xaf45 0xf0 0b011100 0716 1234 65535 0xfdb97531 0xfdb97531ff 256 0b111111110000000011010000  0101111
" 0xaf45UL 0xf0ll 0b011100 0716 1234 65535 0xfdb97531 256a 0b111111110000000011010000  0101111
" 98,67878,2345 0b11111111000000001101_0000
