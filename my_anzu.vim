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



function! Search_CWord(new, aword)
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

  AnzuUpdateSearchStatusOutput
  FuncNameStl
endfunction

" CONST
"
unlockvar g:MySearch_Word_New g:MySearch_Word_Add g:MySearch_Word_MatchFull g:MySearch_Word_MatchPart

let g:MySearch_Word_New = v:true
let g:MySearch_Word_Add = v:false

let g:MySearch_Word_MatchFull = v:true
let g:MySearch_Word_MatchPart = v:false

lockvar g:MySearch_Word_New g:MySearch_Word_Add g:MySearch_Word_MatchFull g:MySearch_Word_MatchPart

com! MySearchCWordNewFull call Search_CWord(g:MySearch_Word_New, g:MySearch_Word_MatchFull) | set hlsearch
com! MySearchCWordNewPart call Search_CWord(g:MySearch_Word_New, g:MySearch_Word_MatchPart) | set hlsearch
com! MySearchCWordAddFull call Search_CWord(g:MySearch_Word_Add, g:MySearch_Word_MatchFull) | set hlsearch
com! MySearchCWordAddPart call Search_CWord(g:MySearch_Word_Add, g:MySearch_Word_MatchPart) | set hlsearch

com! MySearchShowStatus call AddAltStatusline('      %#hl_func_name_stl#  %{anzu#search_status()} %##', 'l', 0)



" Plug Mapping

nnoremap <silent> <Plug>(MySearch-CWordNewFull) :<C-u>MySearchCWordNewFull<CR>
nnoremap <silent> <Plug>(MySearch-CWordNewPart) :<C-u>MySearchCWordNewPart<CR>
nnoremap <silent> <Plug>(MySearch-CWordAddFull) :<C-u>MySearchCWordAddFull<CR>
nnoremap <silent> <Plug>(MySearch-CWordAddPart) :<C-u>MySearchCWordAddPart<CR>

nnoremap <silent> <Plug>(MySearch-ShowStatus) :<C-u>MySearchShowStatus<CR>



" Mapping

cnoremap <expr><silent> <CR> ( match('/?', getcmdtype()) != -1 ) ? ( '<CR>:FuncNameStl<CR>:MySearchShowStatus<CR>:AnzuUpdateSearchStatusOutput<CR>' ) : ( '<CR>' )

nmap <silent> * <Plug>(MySearch-CWordNewFull)<Plug>(FuncName)<Plug>(MySearch-ShowStatus)
nmap <silent> # <Plug>(MySearch-CWordNewPart)<Plug>(FuncName)<Plug>(MySearch-ShowStatus)
nmap <silent> ! <Plug>(MySearch-CWordAddFull)<Plug>(FuncName)<Plug>(MySearch-ShowStatus)
nmap <silent> & <Plug>(MySearch-CWordAddPart)<Plug>(FuncName)<Plug>(MySearch-ShowStatus)

nmap <silent> n <Plug>(anzu-n-with-echo)<Plug>(FuncName)<Plug>(MySearch-ShowStatus)
nmap <silent> N <Plug>(anzu-N-with-echo)<Plug>(FuncName)<Plug>(MySearch-ShowStatus)

nmap <Leader>n ggnN
nmap <Leader>N  GNn


" clear status
"nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
" statusline
"set statusline=%{anzu#search_status()}

