">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

nnoremap \e :so %


" netrwは常にtree view
let g:netrw_liststyle = 3
" ファイルのプレビューを垂直分割で開く。
let g:netrw_preview   = 1

" let g:mbuf = ''

function! All_buf(...)
	let bn = bufnr('$')

	for i in range(1, bn)
		let name = bufname(i)
		if match(name, 'NetrwTreeListing\( \d\+\)\?$') != -1
			if a:1 == 1
				try
					exe 'bdel ' i
					"exe 'bwipeout ' i
				catch
				endtry
			else
				echo '### ' . name . ' @ ' . i
				sleep 1
			endif
		endif
	endfor
endfunction

function! MyExplore()
	set autochdir

	let g:filename = expand("%")
	let g:pwd = getcwd(win_getid())

	call All_buf(1)

	" if 0 && g:mbuf != '' | echo 'pppp ' . g:mbuf | exe 'bwipeout ' g:mbuf | sleep 3 | endif
	" let g:bnr = bufnr('NetrwTreeListing')
	" let g:bnm = bufname('NetrwTreeListing')
	" if 0 && (-1 != bufnr('NetrwTreeListing')) | bdel bufnr('NetrwTreeListing') | end

	exe 'cd ' . g:pwd
	Vexplore
	"exe 'cd ' . g:pwd
	
	let crs = ""

	for i in range(6)

		" if 0 | pwd | echo i | sleep 3 | endif

		if filereadable(s:root_file)
			call MyExploreSub(crs)
			return
		endif

		"redraw
		"? call feedkeys("\<CR>")
		let crs = crs . "\<CR>"
		"normal! <CR>
		"redraw

		cd ..
	endfor

	exe 'cd ' . g:pwd
	call MyExploreSub("")
endfunction

function! MyExploreSub(crs)
	set autochdir

	" let g:mbuf = bufnr('%')

	"normal! <C-w>H
	call feedkeys("\<C-w>H")
	call feedkeys(a:crs)

	call feedkeys("\<Esc>:\<C-u>call search('│ ' . g:filename . '$')\<CR>")
	"call feedkeys("\<Esc>:\<Esc>\<Esc>")

	"exe "normal! /│ " . g:filename . "$\<CR>n"
	"let dummy =  search("│ " . g:filename . "$")
endfunction

"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

com! MyExplore call MyExplore()

nnoremap <silent> <leader>t :<C-u>call MyExplore()<CR>

let s:root_file = "cesar.csfolder"


"function! MyExplore_old()
"	let pwd = getcwd()
"	for i in range(6)
"		if filereadable(s:root_file)
"			exe 'Vexplore ' . getcwd()
"			break
"		endif
"		cd ..
"	endfor
"endfunction

