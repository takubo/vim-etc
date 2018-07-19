if exists('loaded_my_multiple')
    "finish
endif
let loaded_my_multiple = 1

let g:my_multiple = v:true

"-----------------------------------------------------------------------------------------------------------

" -----
" Min: Returns the minimum of the given parameters.
" -----
function! s:Min(...)
    let min = a:1
    let index = 2
    while index <= a:0
        execute "if min > a:" . index . " | let min = a:" . index . " | endif"
        let index = index + 1
    endwhile
    return min
endfunction

" -----
" Max: Returns the maximum of the given parameters.
" -----
function! s:Max(...)
    let max = a:1
    let index = 2
    while index <= a:0
        execute "if max < a:" . index . " | let max = a:" . index . " | endif"
        let index = index + 1
    endwhile
    return max
endfunction

" -----
" ItemCount: Returns the number of items in the given string.
" -----
function! s:ItemCount(string)
    let itemCount = 0
    let newstring = a:string
    let pos = stridx(newstring, ',')
    while pos > -1
        let itemCount = itemCount + 1
        let newstring = strpart(newstring, pos + 1)
        let pos = stridx(newstring, ',')
    endwhile
    return itemCount
endfunction

" -----
" Strntok: Utility function to implement C-like strntok() by Michael Geddes
" and Benji Fisher at http://groups.yahoo.com/group/vimdev/message/26788
" -----
function! s:Strntok( s, tok, n)
    return matchstr( a:s.a:tok[0], '\v(\zs([^'.a:tok.']*)\ze['.a:tok.']){'.a:n.'}')
endfun

"-----------------------------------------------------------------------------------------------------------

function! s:MultipleSearchInit()
    "let s:ColorSequence = "red,yellow,blue,green,magenta,cyan,gray,brown"
    "let s:TextColorSequence = "white,black,white,black,white,black,black,white"
    let ColorSequence =     "blue,yellow,green,magenta,cyan,#ee8822,#22ee88,#8822ee,#ee2288,#2288ee"
    let TextColorSequence = "white,black,black,white,black,black,black,black,black,black"

    " Start off with the first color
    let s:colorToUse = 0
    "let s:colorsInUse = 0

    "let s:MaxColors = s:Min(s:MaxColors, s:ItemCount(ColorSequence . ','), s:ItemCount(TextColorSequence . ','))
    let s:MaxColors = s:Min(s:ItemCount(ColorSequence . ','), s:ItemCount(TextColorSequence . ','))

    " hi Search	と同じにしておく
    hi MultipleSearchOrg	guifg=#ffffff guibg=#ff0000 gui=NONE

    let loopCount = 0
    while loopCount < s:MaxColors
        " Define the colors to use
	let bgColor = s:Strntok(ColorSequence, ',', loopCount + 1)
	let fgColor = s:Strntok(TextColorSequence, ',', loopCount + 1)
        execute 'highlight MultipleSearch' . loopCount
           \ . ' guibg=' . bgColor
           \ . ' guifg=' . fgColor
           "\ . ' ctermbg=' . bgColor . ' guibg=' . bgColor
           "\ . ' ctermfg=' . fgColor . ' guifg=' . fgColor
        let loopCount = loopCount + 1
    endwhile
endfunction

" -----
" GetNextSequenceNumber: Determine the next Search color to use.
" -----
function! s:GetNextSequenceNumber()
    let retval = s:colorToUse

    let s:colorToUse = s:colorToUse + 1
    let s:colorToUse = s:colorToUse % s:MaxColors

    return retval
endfunction

function! s:Mymy(word)
    if !g:my_multiple | return '' | endif

    let org_search = @/
    "let @/ = @/ . '\|\<' . a:word . '\>'
    "statusline let

    call PushPos()

    let now_buf = bufnr("")

    if g:mymy == 0
	let s:colorToUse = 0
	"let g:synstr_org = 'bufdo syntax match MultipleSearchOrg "' . @/ . '" containedin=ALL'
	let g:synstr_org = 'syntax match MultipleSearchOrg "' . org_search . '" containedin=ALL'
	while 1
	    execute g:synstr_org
	    hi Search	guifg=NONE guibg=NONE gui=NONE
	    "echo "##" . bufnr("") now_buf
	    keepjumps bnext
	    if now_buf == bufnr("") | break | endif
	endwhile
	"execute 'syntax match MultipleSearchOrg "' . @/ . '" containedin=ALL'
	"bufdo hi Search	guifg=NONE guibg=NONE gui=NONE
	"exe "b " . now_buf
    endif
    "exe "b " . now_buf

    let g:mymy = 1
    "echo a:word
    let n = <SID>GetNextSequenceNumber()
    let useSearch = "MultipleSearch" . n

    "bufdo execute 'silent syntax clear ' . useSearch
    "execute 'syntax match ' . a:useSearch . ' "' . a:forwhat . '" containedin=ALL'
    "let g:synstr[n] = 'bufdo syntax match ' . useSearch . ' "\<' . a:word . '\>" containedin=ALL'
    let g:synstr[n] = 'syntax keyword ' . useSearch . ' ' . a:word . ''
    "bufdo execute g:synstr[n]
    while 1
	execute 'silent syntax clear ' . useSearch
	execute g:synstr[n]
	"echo "$$" . bufnr("") now_buf
	keepjumps bnext
	if now_buf == bufnr("") | break | endif
    endwhile
    "bufdo call ReDo()
    "execute 'syntax match ' . useSearch . ' "' . a:word . '" containedin=ALL'

    exe "b " . now_buf

    "exe "normal! /\<Up>" . '\|\<' . a:word . '\>'
    "normal! n
    call PopPos()
    return ""
endfunction

" ---
" DoReset: Clear the highlighting
" ---
"function! DoReset()
"    if g:mymy == 0
"	return
"    endif
"
"    let now_buf = bufnr("")
"
"    let g:mymy = 0
"    hi Search	guifg=#ffffff guibg=#ff0000 gui=NONE
"    bufdo execute 'bufdo syntax clear MultipleSearchOrg'
"
"    let seq = 0
"    while seq < s:MaxColors
"	bufdo execute 'bufdo syntax clear MultipleSearch' . seq
"	let seq = seq + 1
"    endwhile
"
"    exe "b " . now_buf
"endfunction
function! DoReset(force)
    if g:mymy == 0 && !a:force
	return
    endif

    let now_buf = bufnr("")
    call PushPos()

    let g:mymy = 0
    "? hi Search	guifg=#ffffff guibg=#ff0000 gui=NONE
    hi	Search	guibg=#c0504d	guifg=white

    while 1
	execute 'syntax clear MultipleSearchOrg'
	let seq = 0
	"while seq < s:Max(s:MaxColors, a:force)
	while seq < s:MaxColors
	    execute 'syntax clear MultipleSearch' . seq
	    let seq = seq + 1
	endwhile
	keepjumps bnext
	if now_buf == bufnr("") | break | endif
    endwhile

    exe "b " . now_buf
    call PopPos()
endfunction

function! ReDo()
    if !g:my_multiple | return '' | endif

"function! s:ReDo()
    call PushPos()
    let now_buf = bufnr("")

    let g:mymy = 1
    hi Search	guifg=NONE guibg=NONE gui=NONE

    while 1
	execute g:synstr_org

	let seq = 0
	while seq < s:colorToUse
	    execute g:synstr[seq]
	    let seq = seq + 1
	endwhile
	keepjumps bnext
	if now_buf == bufnr("") | break | endif
    endwhile

    exe "b " . now_buf
    call PopPos()
    return ""
endfunction
command! Redo echo ReDo()



hi Search guibg=#c0504d guifg=white

call <SID>MultipleSearchInit()
let g:mymy = 0
call DoReset(10)

let g:synstr = ["", "", "", "", "", "", "", "", "", "", "", "", "", ""]

nnoremap <silent> * <Esc>:call DoReset(0)<CR>*
nnoremap <silent> # <Esc>:call DoReset(0)<CR>g*
nnoremap <silent> <Esc><Esc> <Esc>:noh<CR>:call clever_f#reset()<CR>:call DoReset(0)<CR>

nnoremap <silent> ! :<Esc>:call <SID>Mymy("<C-r><C-w>")<CR>/<C-p>\\|\<<C-r><C-w>\><CR>
nnoremap & /<C-p>\\|
"nnoremap & /<C-p>\\|\<<C-r><C-w>\><C-r>=<SID>Mymy("<C-r><C-w>")<CR><CR><CR>
"nnoremap & :<Esc>:call <SID>Mymy("<C-r><C-w>")<CR>



" TODO
" 新規バッファを開いたときに、auで色を付けないといけない。
"
"function! ForceReset()
"    "if g:mymy == 0
"    "endif
"
"    "let now_buf = bufnr("")
"
"    "let g:mymy = 0
"    "hi Search	guifg=#000000 guibg=#00eeee gui=NONE
"    "bufdo execute 'bufdo syntax clear MultipleSearchOrg'
"
"    "let seq = 0
"    "while seq < 20
"    "    bufdo execute 'bufdo syntax clear MultipleSearch' . seq
"    "    let seq = seq + 1
"    "endwhile
"
"    "exe "b " . now_buf
"
"    if g:mymy == 0
"    endif
"
"    let now_buf = bufnr("")
"
"    let g:mymy = 0
"    hi Search	guifg=#ffffff guibg=#ff0000 gui=NONE
"    bufdo execute 'bufdo syntax clear MultipleSearchOrg'
"
"    let seq = 0
"    while seq < 10
"	bufdo execute 'bufdo syntax clear MultipleSearch' . seq
"	let seq = seq + 1
"    endwhile
"
"    exe "b " . now_buf
"endfunction



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
