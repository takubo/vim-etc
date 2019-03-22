scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0 expandtab: (この行に関しては:help modelineを参照)

if exists('loaded_MySearch')
  "finish
  call MultiHighLight_Reset()
else
  call EscEsc_Add('call MultiHighLight_Suspend()')
  call EscEsc_Add('let g:MultiHighLightState = 2')
endif
let loaded_MySearch = v:true

let g:anzu_status_format = '/%p ( %i / %l )'
let g:anzu_search_limit = 999

let g:MySearchProcTopUnderScore = v:false
let g:MySearchMultiHighLight = v:true


let g:MultiHighLightState = 0
"    0:初期値、multipleは未実施。または、/や*で再検索されリセットされた状態。
"    1:multipleによるハイライト中
"    2:EscEscでハイライトが中断された状態


function! s:ProcTopUnderScore(word)
  if a:word[0] == '_'
    return '_\?' . a:word[1:]
  elseif a:word[0] =~ '\a'
    return '_\?' . a:word
  endif
  return a:word
endfunction


function! s:SearchSlashCR()
  if g:MySearchMultiHighLight
    "call MultiHighLight_Suspend()
    call MultiHighLight_Reset()
    let g:MultiHighLightState = 0
  endif
  call <SID>SearchPost()
endfunction


function! s:SearchN()
  if g:MySearchMultiHighLight
    if g:MultiHighLightState == 2
      call MultiHighLight_Resume()
    endif
    let g:MultiHighLightState = 1
  endif
  call <SID>SearchPost()
endfunction


function! s:SearchCWord(add, proc_top_underscore, aword, keep_pos)
  let search_str = expand('<cword>')

  if a:proc_top_underscore
    let search_str = s:ProcTopUnderScore(search_str)
  endif

  if a:aword
    let search_str = '\<' . search_str . '\>'
  endif

  if g:MySearchMultiHighLight
    if a:add && g:MultiHighLightState == 0
      call MultiHighLight_Add(@/)
    elseif a:add && g:MultiHighLightState == 2
      call MultiHighLight_Resume()
    elseif !a:add
      call MultiHighLight_Reset()
    endif
    call MultiHighLight_Add(search_str)
    let g:MultiHighLightState = 1
  endif

  if a:add
    let @/ .= '\|' . search_str
  else
    let @/ = search_str
  endif

  "検索履歴に残すための処理
  call histadd('/', @/)

  if a:keep_pos
    let cursor_on_word = CursorOnWord()
  endif

  try
    normal! n
  catch
  endtry

  if a:keep_pos && cursor_on_word
    try
      normal! N
    catch
    endtry
  endif

  call s:SearchPost()
endfunction


function! s:SearchPost()
  normal! zv
  AnzuUpdateSearchStatusOutput
  FuncNameStl
  call AddAltStatusline('      <%#hl_func_name_stl#  %{anzu#search_status()} %##', 'l', 0)
endfunction


" CONST
"
unlockvar s:SearchNew s:SearchAdd s:MatchWord s:MatchPart

let s:SearchNew = v:false
let s:SearchAdd = v:true

let s:MatchWord = v:true
let s:MatchPart = v:false

let s:CursorKeep = v:true
let s:CursorMove = v:false

lockvar s:SearchNew s:SearchAdd s:MatchWord s:MatchPart

com! MySearchCWordNewWordMove call <SID>SearchCWord(s:SearchNew, g:MySearchProcTopUnderScore, s:MatchWord, s:CursorMove) | set hlsearch
com! MySearchCWordNewPartMove call <SID>SearchCWord(s:SearchNew, g:MySearchProcTopUnderScore, s:MatchPart, s:CursorMove) | set hlsearch
com! MySearchCWordAddWordMove call <SID>SearchCWord(s:SearchAdd, g:MySearchProcTopUnderScore, s:MatchWord, s:CursorMove) | set hlsearch
com! MySearchCWordAddPartMove call <SID>SearchCWord(s:SearchAdd, g:MySearchProcTopUnderScore, s:MatchPart, s:CursorMove) | set hlsearch

com! MySearchCWordNewWordKeep call <SID>SearchCWord(s:SearchNew, g:MySearchProcTopUnderScore, s:MatchWord, s:CursorKeep) | set hlsearch
com! MySearchCWordNewPartKeep call <SID>SearchCWord(s:SearchNew, g:MySearchProcTopUnderScore, s:MatchPart, s:CursorKeep) | set hlsearch
com! MySearchCWordAddWordKeep call <SID>SearchCWord(s:SearchAdd, g:MySearchProcTopUnderScore, s:MatchWord, s:CursorKeep) | set hlsearch
com! MySearchCWordAddPartKeep call <SID>SearchCWord(s:SearchAdd, g:MySearchProcTopUnderScore, s:MatchPart, s:CursorKeep) | set hlsearch




" Plug Mapping

nnoremap <silent> <Plug>(MySearch-CWord-New-Word-Move) :<C-u>MySearchCWordNewWordMove<CR>
nnoremap <silent> <Plug>(MySearch-CWord-New-Part-Move) :<C-u>MySearchCWordNewPartMove<CR>
nnoremap <silent> <Plug>(MySearch-CWord-Add-Word-Move) :<C-u>MySearchCWordAddWordMove<CR>
nnoremap <silent> <Plug>(MySearch-CWord-Add-Part-Move) :<C-u>MySearchCWordAddPartMove<CR>

nnoremap <silent> <Plug>(MySearch-CWord-New-Word-Keep) :<C-u>MySearchCWordNewWordKeep<CR>
nnoremap <silent> <Plug>(MySearch-CWord-New-Part-Keep) :<C-u>MySearchCWordNewPartKeep<CR>
nnoremap <silent> <Plug>(MySearch-CWord-Add-Word-Keep) :<C-u>MySearchCWordAddWordKeep<CR>
nnoremap <silent> <Plug>(MySearch-CWord-Add-Part-Keep) :<C-u>MySearchCWordAddPartKeep<CR>

nnoremap <silent> <Plug>(MySearch-n) n:call <SID>SearchN()<CR>
nnoremap <silent> <Plug>(MySearch-N) N:call <SID>SearchN()<CR>

cnoremap <silent> <Plug>(MySearch-SlashCR) <CR>:call <SID>SearchSlashCR()<CR>


" Test
com! TestProcTopUnderScore echo s:ProcTopUnderScore('word') | echo s:ProcTopUnderScore('_word') | echo s:ProcTopUnderScore('0word')



" Mapping

cmap <expr> <CR> ( getcmdtype() == '/' ) ?
               \ ( '<Plug>(MySearch-SlashCR)' ) :
               \ ( '<CR>' )

nmap *  <Plug>(MySearch-CWord-New-Word-Move)
nmap #  <Plug>(MySearch-CWord-New-Part-Move)
nmap !  <Plug>(MySearch-CWord-Add-Word-Move)
nmap &  <Plug>(MySearch-CWord-Add-Part-Move)

nmap g8 <Plug>(MySearch-CWord-New-Word-Keep)
nmap g3 <Plug>(MySearch-CWord-New-Part-Keep)
nmap g1 <Plug>(MySearch-CWord-Add-Word-Keep)
nmap g7 <Plug>(MySearch-CWord-Add-Part-Keep)

nmap g* g8
nmap g# g3
nmap g! g1
nmap g& g7

nmap n  <Plug>(MySearch-n)
nmap N  <Plug>(MySearch-N)

nmap <Leader>n ggnN
nmap <Leader>N  GNn

" clear status
"nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
