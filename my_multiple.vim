if exists('loaded_my_multiple')
    "finish
endif
let loaded_my_multiple = v:true

if !has("gui_running")
    echoerr 'my_multiple suppote GUI only.'
    "finish
endif

let g:my_multiple = v:true

" 1つ目は、hi Search の代替色
let s:BgColorSequence = [ "red",   "blue",  "yellow", "magenta", "green", "cyan",  "#ee8822", "#22ee88", "#8822ee", "#ee2288", "#2288ee" ]
let s:FgColorSequence = [ "white", "white", "black",  "white",   "black", "black", "black",   "black",   "black",   "black",   "black"   ]


" g:new_search
"    0:初期値、multipleは未実施。または、/や*で再検索されリセットされた状態。
"    1:multipleによるハイライト中
"    2:EscEscでハイライトが中断された状態


" ---------------
" MultipleSearchInit:
" ---------------
function! s:MultipleSearchInit()
    " Set Highlight
    for i in range(len(s:BgColorSequence))
        execute 'highlight MultipleSearch' . i . ' guifg=' . s:FgColorSequence[i] . ' guibg=' . s:BgColorSequence[i]
    endfor

    " Init Vars
    let g:new_search = 0
    let g:Search_Str = []

    " Reset Highlight
    "call DoReset(v:true)

    call PushPos_All()
    silent tabdo windo call clearmatches()
    call PopPos_All()

    call <SID>unset_au_winnew()
endfunction

" ---------------
" Mymy_Search: 
" ---------------
function! s:Mymy_Search(word)
    if !g:my_multiple | return '' | endif

    if a:word == '' | return '' | endif

    if len(g:Search_Str) >= len(s:BgColorSequence) | return '\|' . a:word | endif

    call PushPos_All()

    if g:new_search != 1
	let g:new_search = 1
	let g:Search_Str = []

	let n = len(g:Search_Str)
	silent tabdo windo call matchadd('MultipleSearch' . n, @/, 2, 4 + n)
	call add(g:Search_Str, @/)

	call <SID>set_au_winnew()
    endif

    let n = len(g:Search_Str)
    silent tabdo windo call matchadd('MultipleSearch' . n, a:word, 1, 4 + n)
    call add(g:Search_Str, a:word)

    call PopPos_All()

    "call <SID>set_au_winnew()

    return '\|' . a:word
endfunction

" ---
" DoReset: Clear the highlighting
" ---
function! DoReset(next_mode, force)
    if g:new_search != 1 && !a:force | return | endif
    let g:new_search = a:next_mode

    call PushPos_All()
    silent tabdo windo for i in range(len(g:Search_Str)) | call matchdelete(4 + i) | endfor
    call PopPos_All()

    call <SID>unset_au_winnew()

    return
endfunction

" ---
" Mymy_ReDo:
" ---
function! Mymy_ReDo(force)
    if !g:my_multiple | return '' | endif
    if g:new_search != 2 && !a:force | return | endif

    let g:new_search = 1

    call PushPos_All()
    silent tabdo windo for i in range(len(g:Search_Str)) | call matchadd('MultipleSearch' . i, g:Search_Str[i], 1, 4 + i) | endfor
    call PopPos_All()

    call <SID>set_au_winnew()

    return ''
endfunction

" 新規Windowを開いたときに、auで色を付けないといけない。
function! s:set_au_winnew()
  augroup my_multiple
    "au!
    au WinNew * for i in range(len(g:Search_Str)) | call matchadd('MultipleSearch' . i, g:Search_Str[i], 1, 4 + i) | endfor
  augroup end
endfunction

function! s:unset_au_winnew()
  augroup my_multiple
    au!
  augroup end
endfunction


call <SID>MultipleSearchInit()

call EscEsc_Add('call DoReset(2, 0)')


"so $vim/func_name.vim


nnoremap <silent> * <Esc>:call DoReset(0, 0)<CR>*
nnoremap <silent> # <Esc>:call DoReset(0, 0)<CR>g*

cnoremap <expr><silent> <CR> ( match('/?', getcmdtype()) != -1 ) ? ( '<CR>:call DoReset(0, 0)<CR>:FF2<CR>' ) : ( '<CR>' )

nnoremap <silent> ! :<C-u>call <SID>Mymy_Search('\<' . "<C-r><C-w>" . '\>')<CR>/<C-p>\\|\<<C-r><C-w>\><CR>

nnoremap & /<C-p>\\|
"nnoremap & /<C-p>\\|\<<C-r><C-w>\><C-r>=<SID>Mymy_Search("<C-r><C-w>")<CR><CR><CR>
"nnoremap & :<Esc>:call <SID>Mymy_Search("<C-r><C-w>")<CR>

nnoremap <expr> <silent> n g:new_search == 2 ? ':<C-u>call Mymy_ReDo(v:false)<CR>' : '' . 'n:FF2<CR>'
nnoremap <expr> <silent> N g:new_search == 2 ? ':<C-u>call Mymy_ReDo(v:false)<CR>' : '' . 'N:FF2<CR>'


"===================================================================================================

highlight HiCurWord guifg=NONE guibg=#444444
let g:HiCurWord = v:true
let g:HiCurWord = v:false
augroup HiCurWord
	au!
	au CursorMoved *.{c,h} exe g:HiCurWord && match(expand("<cword>"), '\k\+') != -1 ? 'match HiCurWord /\<' . expand("<cword>") . '\>/' : 'match'
augroup end
nnoremap <Leader>@ :<C-u>let g:HiCurWord = !g:HiCurWord<CR>:match<CR>

"===================================================================================================


" デバッグ
command! ReDo echo Mymy_ReDo(v:true)

