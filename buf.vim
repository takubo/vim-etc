hi	MyBuf	guibg=#c0504d	guifg=white
hi	MyBuf	guibg=#c00000	guifg=white
hi	MyBuf	guibg=#cccccc	guifg=black
hi	MyBuf	guibg=#444444	guifg=white
hi	MyBuf	guibg=#442222	guifg=white

let s:FONT = 0

functio! Buf()
	let before_more = &more
	let &more = 0

	let l:bufcount = bufnr('$')
	"let l:displayedbufs = 0
	"let l:activebuf = bufnr('')
	"let l:activebufline = 0
	"let l:buflist = ''
	"let l:bufnumbers = ''
	"let l:width = g:BufferListWidth

	"call ResizeFont(+1.5)
	if s:FONT && has('gui')
		let old_font = &guifont
		call ResizeFont(+2.5)
	endif
	"red

	let indent = "          "

	" iterate through the buffers
	let l:i = 0 | while l:i <= (l:bufcount - 1) | let l:i = l:i + 1
		let l:bufname = bufname(l:i)
		"let keys = 'jkhlfdgsa;"vnmc,x.z/tuyiroepwq'	" usa
		let keys = 'jkhlfdgsa;:vnmc,x.z/tuyiroepwq'	" jis

		let ffff = ""
		let ffff = ffff . "" . (getbufvar(l:i, '&modified')    ? "+" : " ")
		"let ffff = ffff . "" . (!getbufvar(l:i, '&modifiable') ? "=" : " ")
		"let ffff = ffff . "" . (getbufvar(l:i, '&readonly')    ? "=" : " ")
		
		"if strlen(l:bufname) && getbufvar(l:i, '&modifiable') && getbufvar(l:i, '&buflisted')
		"endif
		"echo "a" bufname getbufvar(l:i, '&modified') ? "[+]" : "   "
		let k = strpart(keys, i - 1, 1)
		if !(i % 2)
			echohl MyBuf
		else
			echohl Normal
		endif
		"echo " " k "" ffff bufname "  "
		echo " " indent k "" ffff bufname "  " k
	endwhile
	if (i % 2)
		echohl MyBuf
	else
		echohl Normal
	endif
	echo "                                    "
	echohl Normal
	echo " "
	let inkey = nr2char(getchar())
	let bn = stridx(keys, inkey)
	"echo bn
	if bn >= 0 && bn < bufcount
		execute "b" bn + 1
		"echo "b" bn + 1
	endif
	let &more = before_more
	call feedkeys("\<Esc>")
	if s:FONT && has('gui')
		"call ResizeFont(0)
		let &guifont = old_font
	endif
endfunction

"call Buf()

nnoremap K :call Buf()<CR>
nnoremap f :call Buf()<CR>
