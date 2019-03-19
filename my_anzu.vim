scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)

so $VIMRUNTIME/pack/takubo/start/tmp/plugin/my_cfi.vim


let g:anzu_status_format = '/%p ( %i / %l )'
let g:anzu_search_limit = 999


function! TBD(word)
  if a:word[0] == '_'
    return '_\?' . a:word[1:]
  elseif a:word[0] =~ '\a'
    return '_\?' . a:word
  else
    return a:word
  endif
endfunction

com! TestTBD echo TBD('word') | echo TBD('_word') | echo TBD('0word')

let g:TBD3 = v:false
function! TBD2()
  return g:TBD3 ? TBD(expand('<cword>')) : expand('<cword>')
endfunction
com! TestTBD2 echo TBD2()

let s:TBD4 = 0
com! TBD5 let <SID>:TBD4 = 1

function! Search_Word(str, new, aword)
  let search_srt = TBD2(a:str)

  if aword
    let search_srt = '\<' . search_srt . '\>'
  endif

  if a:new
    let @/ = search_srt
  else
    let @/ .= '\|' . search_srt
  endif
endfunction


com! TestWord call Search_Word(expand('<cword>'), v:true, v:true)



function! Search_CWord(new, aword, pos_keep)
  if a:pos_keep
    PushPos
  endif

  " 最後のヒットだったときにエラーになる。
  "try
  "  normal! *
  "catch
  "endtry

  let search_srt = TBD2()

  if a:aword
    let search_srt = '\<' . search_srt . '\>'
  endif

  if a:new
    let @/ = search_srt
  else
    let @/ .= '\|' . search_srt
  endif

  "call MultiHighLight(search_srt)

  "検索履歴に残すための処理
  call histadd('/', @/)

  "call feedkeys(":set hlsearch\<CR>", 'n')
  try
    normal n
  catch
  endtry

  if a:pos_keep
    PopPos
  endif

  FuncNameStl
  AnzuUpdateSearchStatusOutput
  MySearchShowStatus
endfunction

" CONST
"
unlockvar g:MySearch_Word_New g:MySearch_Word_Add g:MySearch_Word_MatchFull g:MySearch_Word_MatchPart

let g:MySearch_Word_New = v:true
let g:MySearch_Word_Add = v:false

let g:MySearch_Word_MatchFull = v:true
let g:MySearch_Word_MatchPart = v:false

let g:MySearch_Word_PosKeep = v:true
let g:MySearch_Word_PosMove = v:false

lockvar g:MySearch_Word_New g:MySearch_Word_Add g:MySearch_Word_MatchFull g:MySearch_Word_MatchPart

com! MySearchCWordNewFullMove call Search_CWord(g:MySearch_Word_New, g:MySearch_Word_MatchFull, g:MySearch_Word_PosMove) | set hlsearch
com! MySearchCWordNewPartMove call Search_CWord(g:MySearch_Word_New, g:MySearch_Word_MatchPart, g:MySearch_Word_PosMove) | set hlsearch
com! MySearchCWordAddFullMove call Search_CWord(g:MySearch_Word_Add, g:MySearch_Word_MatchFull, g:MySearch_Word_PosMove) | set hlsearch
com! MySearchCWordAddPartMove call Search_CWord(g:MySearch_Word_Add, g:MySearch_Word_MatchPart, g:MySearch_Word_PosMove) | set hlsearch

com! MySearchCWordNewFullKeep call Search_CWord(g:MySearch_Word_New, g:MySearch_Word_MatchFull, g:MySearch_Word_PosKeep) | set hlsearch
com! MySearchCWordNewPartKeep call Search_CWord(g:MySearch_Word_New, g:MySearch_Word_MatchPart, g:MySearch_Word_PosKeep) | set hlsearch
com! MySearchCWordAddFullKeep call Search_CWord(g:MySearch_Word_Add, g:MySearch_Word_MatchFull, g:MySearch_Word_PosKeep) | set hlsearch
com! MySearchCWordAddPartKeep call Search_CWord(g:MySearch_Word_Add, g:MySearch_Word_MatchPart, g:MySearch_Word_PosKeep) | set hlsearch

com! MySearchShowStatus call AddAltStatusline('      %#hl_func_name_stl#  %{anzu#search_status()} %##', 'l', 0)



" Plug Mapping

nnoremap <silent> <Plug>(MySearch-CWordNewFullMove) :<C-u>MySearchCWordNewFullMove<CR>
nnoremap <silent> <Plug>(MySearch-CWordNewPartMove) :<C-u>MySearchCWordNewPartMove<CR>
nnoremap <silent> <Plug>(MySearch-CWordAddFullMove) :<C-u>MySearchCWordAddFullMove<CR>
nnoremap <silent> <Plug>(MySearch-CWordAddPartMove) :<C-u>MySearchCWordAddPartMove<CR>

nnoremap <silent> <Plug>(MySearch-CWordNewFullKeep) :<C-u>MySearchCWordNewFullKeep<CR>
nnoremap <silent> <Plug>(MySearch-CWordNewPartKeep) :<C-u>MySearchCWordNewPartKeep<CR>
nnoremap <silent> <Plug>(MySearch-CWordAddFullKeep) :<C-u>MySearchCWordAddFullKeep<CR>
nnoremap <silent> <Plug>(MySearch-CWordAddPartKeep) :<C-u>MySearchCWordAddPartKeep<CR>

nnoremap <silent> <Plug>(MySearch-ShowStatus) :<C-u>MySearchShowStatus<CR>



" Mapping

cnoremap <expr><silent> <CR> ( match('/?', getcmdtype()) != -1 ) ? ( '<CR>:FuncNameStl<CR>:MySearchShowStatus<CR>:AnzuUpdateSearchStatusOutput<CR>' ) : ( '<CR>' )

nmap <silent> *  <Plug>(MySearch-CWordNewFullMove)
nmap <silent> #  <Plug>(MySearch-CWordNewPartMove)
nmap <silent> !  <Plug>(MySearch-CWordAddFullMove)
nmap <silent> &  <Plug>(MySearch-CWordAddPartMove)

nmap <silent> g* <Plug>(MySearch-CWordNewFullKeep)
nmap <silent> g# <Plug>(MySearch-CWordNewPartKeep)
nmap <silent> g! <Plug>(MySearch-CWordAddFullKeep)
nmap <silent> g& <Plug>(MySearch-CWordAddPartKeep)

nmap <silent> n <Plug>(anzu-n-with-echo)<Plug>(FuncName-Stl)<Plug>(MySearch-ShowStatus)
nmap <silent> N <Plug>(anzu-N-with-echo)<Plug>(FuncName-Stl)<Plug>(MySearch-ShowStatus)

nmap <Leader>n ggnN
nmap <Leader>N  GNn


" clear status
"nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
" statusline
"set statusline=%{anzu#search_status()}

