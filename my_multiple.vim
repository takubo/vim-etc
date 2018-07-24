if exists('loaded_my_multiple')
    "finish
endif
let loaded_my_multiple = v:true

if !has("gui_running")
    echoerr 'my_multiple suppote GUI only.'
    finish
endif

let g:my_multiple = v:true

" ---------------
" Mymy_PushPos: 
" ---------------
function! Mymy_PushPos()
    let s:now_win = winnr()
    let s:now_tab = tabpagenr()
    "PushPos
endfunction

" ---------------
" Mymy_PopPos: 
" ---------------
function! Mymy_PopPos()
    silent exe 'tabnext ' . s:now_tab
    silent exe s:now_win . 'wincmd w'
    "PopPos
endfunction

" ---------------
" MultipleSearchInit:
" ---------------
function! s:MultipleSearchInit()
    let BgColorSequence = [ "blue",  "green", "magenta", "cyan",  "yellow", "#ee8822", "#22ee88", "#8822ee", "#ee2288", "#2288ee" ]
    let FgColorSequence = [ "white", "black", "white",   "black", "black",  "black",   "black",   "black",   "black",   "black"   ]

    let s:MaxColors = len(BgColorSequence)

    " hi Search の代替色
    hi MultipleSearchOrg guifg=white guibg=red gui=NONE

    " Set Highlight
    for i in range(s:MaxColors)
        execute 'highlight MultipleSearch' . i . ' guifg=' . FgColorSequence[i] . ' guibg=' . BgColorSequence[i]
    endfor

    " Init Vars
    let s:colorToUse = 0
    let g:new_search = 0
    let s:Search_num = 0

    let g:Search_Str = []

    " Reset Highlight
    call DoReset(10)
endfunction

" ---------------
" Mymy_Search: 
" ---------------
function! s:Mymy_Search(word)
    if !g:my_multiple | return '' | endif

    if a:word == '' | return '' | endif

    call Mymy_PushPos()

    if g:new_search == 0
	let g:new_search = 1
	let s:Search_num = 0
	let g:Search_Str = []

	silent tabdo windo call matchadd('MultipleSearchOrg', @/, 2, 4 + s:Search_num)

	call add(g:Search_Str, @/)

	let s:colorToUse = 0
	let s:Search_num += 1
    endif

    silent tabdo windo call matchadd('MultipleSearch' . s:colorToUse, a:word, 1, 4 + s:Search_num)

    call add(g:Search_Str, a:word)

    let s:colorToUse = (s:colorToUse + 1) % s:MaxColors
    let s:Search_num += 1

    call Mymy_PopPos()

    return '\|' . a:word
endfunction

nnoremap <silent> ! :<Esc>:call <SID>Mymy_Search('\<' . "<C-r><C-w>" . '\>')<CR>/<C-p>\\|\<<C-r><C-w>\><CR>

" ---
" DoReset: Clear the highlighting
" ---
function! DoReset(force)
    if g:new_search == 0 && !a:force | return | endif

    call Mymy_PushPos()
    silent tabdo windo for i in range(s:Search_num) | call matchdelete(4 + i) | endfor
    call Mymy_PopPos()

    let s:colorToUse = 0
    let g:new_search = 0
endfunction

function! ReDo()
    if !g:my_multiple | return '' | endif

    let g:new_search = 1

    call Mymy_PushPos()
    silent tabdo windo call matchadd('MultipleSearchOrg', g:Search_Str[0], 2, 4 + 0)
    "-1と+1はOrgの分
    silent tabdo windo for i in range(s:Search_num - 1) | call matchadd('MultipleSearch' . (i % s:MaxColors), g:Search_Str[i + 1], 1, 4 + i + 1) | endfor
    call Mymy_PopPos()

    return ''
endfunction
command! Redo echo ReDo()

call <SID>MultipleSearchInit()

nnoremap <silent> * <Esc>:call DoReset(0)<CR>*
nnoremap <silent> # <Esc>:call DoReset(0)<CR>g*
nnoremap <silent> <Esc><Esc> <Esc>:noh<CR>:call clever_f#reset()<CR>:call DoReset(0)<CR>

nnoremap & /<C-p>\\|
"nnoremap & /<C-p>\\|\<<C-r><C-w>\><C-r>=<SID>Mymy_Search("<C-r><C-w>")<CR><CR><CR>
"nnoremap & :<Esc>:call <SID>Mymy_Search("<C-r><C-w>")<CR>


" TODO
" 新規Windowを開いたときに、auで色を付けないといけない。
"


"===================================================================================================



function! C_Func_Name()
	let fname = ""

	PushPos

	normal! [[
	let p1 = line('.')
	let curline = getline('.')
	if curline =~ '^{'
		"echo "yes1"
		"normal! k^
		normal! k^f(b
		echo " " . expand("<cword>") . " ()"
		let fname = expand("<cword>")
		"echo getline('.')
	endif
	"echo p1

	ApplyPos
	normal! []
	let p2 = line('.')
	"echo p2

	ApplyPos
	normal! ]]
	let p3 = line('.')
	"echo p3

	ApplyPos
	normal! []
	let p4 = line('.')
	"echo p4

	PopPos

	return fname
endfunction

com! FF call C_Func_Name()

nnoremap \F :FF<CR>

augroup C_Func_Name
	au!
	au BufEnter *.{c,h} call C_Func_Name()
	au WinEnter *.{c,h} call C_Func_Name()
augroup end
nnoremap <silent> n n:FF<CR>
nnoremap <silent> N N:FF<CR>

nnoremap <expr> <C-w><CR> (&ft != 'qf') ? ('<C-w><C-]>z<CR>' . (winheight(0)/4) . '<C-y>') : ('<CR>:FF<CR>')
nnoremap <expr> <C-w><CR> (&ft != 'qf') ? ('<C-w><C-]>z<CR>' . (winheight(0)/4) . '<C-y>') : ('<CR>:call feedkeys("FF\<CR>")

cnoremap <C-r><C-f> <C-R>=C_Func_Name()<CR>
cnoremap <C-r>f <C-r><C-f>
