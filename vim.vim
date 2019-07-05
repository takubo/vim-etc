scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:
" (この行に関しては:help modelineを参照)


if !isdirectory($HOME . "/vim_buckup")
  call mkdir($HOME . "/vim_buckup")
endif

if !isdirectory($HOME . "/vim_swap")
  call mkdir($HOME . "/vim_swap")
endif

set autochdir
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=2
set backupdir=$HOME/vim_buckup
set directory=$HOME/vim_swap
set clipboard=unnamed
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
set nocompatible
set cursorline
set cursorcolumn
set encoding=utf-8
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
set gp=grep\ -n
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,a:blinkon0
set hidden
if !&hlsearch
  " ReVimrcする度にハイライトされるのを避ける。
  set hlsearch
endif
set history=10000
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
set incsearch
set mps+=<:>
set nowrapscan
set number
" 常にステータス行を表示
set laststatus=2
set list
"trail:末尾のスペース, eol:改行, extends:, precedes:, nbsp:
set listchars=tab:>_,trail:$,extends:>,precedes:< | ",eol:,extends:,precedes:,nbsp:
" タイトルを表示
set title
set shiftwidth=8
" コマンドをステータス行に表示
set showcmd
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
set matchtime=2
" オンのとき、ウィンドウを横分割すると新しいウィンドウはカレントウィンドウの下に開かれる。
set splitbelow
" オンのとき、ウィンドウを縦分割すると新しいウィンドウはカレントウィンドウの右に開かれる。
set splitright
"リロードするときにアンドゥのためにバッファ全体を保存する
set undoreload=-1
"実際に文字がないところにもカーソルを置けるようにする
set virtualedit=block
set wildmenu
set wildmode=longest:full,full
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set nowrapscan
set noundofile
set nrformats=bin,hex
set shiftround
set fileformats=unix,dos,mac
" for 1st empty buffer
set fileformat=unix
"set tag+=;
set tags=./tags,./tags;
"grepコマンドの出力を取り込んで、gfするため。
set isfname-=:

"set viminfo+='100,c
set sessionoptions+=unix,slash
" set_end set end

set showtabline=0

set display+=lastline

set numberwidth=3

set visualbell t_vb=

filetype on

syntax enable

colorscheme Rimpa
" TODO hi CursorLine ctermbg=NONE guibg=NONE

set mouse=
set mousehide

" from default
filetype plugin indent on


set timeoutlen=1100

augroup MyVimrc
  au!

  au QuickfixCmdPost make,grep,grepadd,vimgrep,cbuffer,cfile exe 'botright cwindow ' . &lines / 4
  au QuickfixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lcbuffer,lcfile lwindow
 "au BufNewFile,BufRead,FileType qf set modifiable

  " grepする際に'|cw'を付けなくても、Quickfixに結果を表示する
  "au QuickfixCmdPost vimgrep botright cwindow
  "au QuickfixCmdPost make,grep,grepadd,vimgrep 999wincmd w

 "au InsertEnter * set timeoutlen=3000
  au InsertEnter * set timeoutlen=700
  au InsertLeave * set timeoutlen=1100

  "au FileType c,cpp,awk set mps+=?::,=:;

 "au BufNewFile,BufRead,FileType *.awk so $vim/avd/avd.vim
  au BufNewFile,BufRead,FileType * set textwidth=0

augroup end


augroup MyVimrc_Init
  au!
  au VimEnter * clearjumps | au! MyVimrc_Init
augroup end


ru macros/PushposPopPos.vim



" Basic {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

nnoremap Y y$

" US Keyboard {{{
nnoremap ; :
vnoremap ; :
cnoremap <expr> ; getcmdline() =~# '^:*$' ? ':' : ';'
cnoremap <expr> : getcmdline() =~# '^:*$' ? ';' : ':'
" US Keyboard }}}

nnoremap <silent> ZZ <Nop>
nnoremap <silent> ZQ <Nop>

nnoremap cr caw
nnoremap dr daw
nnoremap yr yiw

nnoremap cs ciw
nnoremap ds diw
nnoremap ys yaw

" 検索時に/, ?を楽に入力する
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

cnoremap (( \(
cnoremap )) \)
cnoremap << \<
cnoremap >> \>
cnoremap <Bar><Bar> \<Bar>

" コメント行の後の新規行の自動コメント化のON/OFF
nnoremap <expr> <Leader>@ &formatoptions =~# 'o' ? ':<C-u>set formatoptions-=o<CR>:set formatoptions-=r<CR>' : ':<C-u>set formatoptions+=o<CR>:set formatoptions+=r<CR>'
nmap <Leader>2 <Leader>@

nnoremap <silent> <Leader># :<C-u>call <SID>ToggleLineNumber()<CR>
nmap <Leader>3 <Leader>#

function! s:ToggleLineNumber()
  if !&l:number && !&l:relativenumber
    let &l:number = 1
  elseif &l:number && !&l:relativenumber
    let &l:relativenumber = 1
  else
    let &l:number = 0
    let &l:relativenumber = 0
  endif
endfunction

cnoremap <expr> <C-t>	  getcmdtype() == ':' ? '../' :
			\ (getcmdtype() == '/' <Bar><Bar> getcmdtype() == '?') ? '\\|' :
			\ '<C-t>'

nnoremap <leader>; q:


"nnoremap  ]]  ]]f(bzt
nnoremap g]]  ]]f(b
"nnoremap  [[  [[f(bzt
nnoremap g[[  [[f(b
"nnoremap  ][  ][zb
nnoremap g][  ][
"nnoremap  []  []zb
nnoremap g[]  []

vnoremap af ][<ESC>V[[
vnoremap if ][k<ESC>V[[j

" Basic }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Cursor Move, CursorLine, CursorColumn, and Scroll {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


"----------------------------------------------------------------------------------------
" Vertical Move

set noshowcmd

nnoremap j  gj
nnoremap k  gk

vnoremap j  gj
vnoremap k  gk


"----------------------------------------------------------------------------------------
" Horizontal Move

" ^に、|の機能を重畳
nnoremap <silent> ^ <Esc>:exe v:prevcount ? ('normal! ' . v:prevcount . '<Bar>') : 'normal! ^'<CR>


"----------------------------------------------------------------------------------------
" Scroll

set sidescroll=1
set sidescrolloff=5

nnoremap <silent> <C-j> <C-d>
nnoremap <silent> <C-k> <C-u>

vnoremap <silent> <Space>   <C-d>
vnoremap <silent> <S-Space> <C-u>

let g:comfortable_motion_friction = 253.0
let g:comfortable_motion_air_drag = 45.0
let g:comfortable_motion_impulse_multiplier = 38.0
nnoremap <silent> <Plug>(ComfortableMotion-Flick-Down) :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0)     )<CR>
nnoremap <silent> <Plug>(ComfortableMotion-Flick-Up)   :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -1)<CR>

nmap gj <Plug>(ComfortableMotion-Flick-Down)
nmap gk <Plug>(ComfortableMotion-Flick-Up)

vnoremap gj <C-d>
vnoremap gk <C-u>


"----------------------------------------------------------------------------------------
" Cursorline & Cursorcolumn

augroup MyVimrc_Cursor
  au!
  au WinEnter,BufEnter * setl cursorline   cursorcolumn
  au WinLeave          * setl nocursorline nocursorcolumn
augroup end

nnoremap <silent> <Leader>c :<C-u>setl cursorline!<CR>
nnoremap <silent> <leader>C :<C-u>setl cursorcolumn!<CR>


"----------------------------------------------------------------------------------------
" Scrolloff

function! s:best_scrolloff()
  " Quickfixでは、なぜかWinNewが発火しないので、exists()で変数の存在を確認せねばならない。
  let &l:scrolloff = (g:BrowsingScroll || (exists('w:BrowsingScroll') && w:BrowsingScroll)) ? 99999 : ( winheight(0) < 10 ? 0 : winheight(0) < 20 ? 2 : 5 )
endfunction

let g:BrowsingScroll = v:false
nnoremap z<Space>  :<C-u> let g:BrowsingScroll = !g:BrowsingScroll
                  \ <Bar> exe g:BrowsingScroll ? 'normal! zz' : ''
                  \ <Bar> call <SID>best_scrolloff()
                  \ <Bar> echo g:BrowsingScroll ? 'Global BrowsingScroll' : 'Global NoBrowsingScroll'<CR>
nnoremap g<Space>  :<C-u> let w:BrowsingScroll = !w:BrowsingScroll
                  \ <Bar> exe w:BrowsingScroll ? 'normal! zz' : ''
                  \ <Bar> call <SID>best_scrolloff()
                  \ <Bar> echo w:BrowsingScroll ? 'Local BrowsingScroll' : 'Local NoBrowsingScroll'<CR>

augroup MyVimrc_ScrollOff
  au!
  au WinNew              * let w:BrowsingScroll = v:false
  au WinEnter,VimResized * call <SID>best_scrolloff()
  " -o, -Oオプション付きで起動したWindowでは、WinNew, WinEnterが発火しないので、別途設定。
  au VimEnter * call PushPos_All() | exe 'tabdo windo let w:BrowsingScroll = v:false | call <SID>best_scrolloff()' | call PopPos_All()
augroup end


" Cursor Move, CursorLine, CursorColumn, and Scroll }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Emacs {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" コマンドラインでのキーバインドを Emacs スタイルにする
" 行頭へ移動
cnoremap <C-a>		<Home>
" 一文字戻る
cnoremap <C-b>		<Left>
" カーソルの下の文字を削除
cnoremap <C-d>		<Del>
" 行末へ移動
cnoremap <C-e>		<End>
" 一文字進む
cnoremap <C-f>		<Right>
" コマンドライン履歴を一つ進む
cnoremap <C-n>		<Down>
" コマンドライン履歴を一つ戻る
cnoremap <C-p>		<Up>
" Emacs Yank
cnoremap <C-y> <C-R><C-O>*
" 次の単語へ移動
cnoremap <A-f>		<S-Right>
"cnoremap <Esc>f		<S-Right>
" 前の単語へ移動
cnoremap <A-b>		<S-Left>
" 単語削除
"cnoremap <A-d>		TODO
" Emacs }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Esc_Esc {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

let g:EscEsc = []

function! EscEsc_Add(str)
  call add(g:EscEsc, a:str)
endfunction

com! EscDisp echo g:EscEsc

function! Esc_Esc()
  for i in g:EscEsc
    "echo i
    exe i
  endfor
endfunction

" 'noh'はユーザ定義関数内では(事実上)実行出来ないので、別途実行の要あり。
nnoremap <silent> <Esc><Esc> <Esc>:<C-u>call Esc_Esc() <Bar> noh  <Bar> echon <CR>

" おかしくなったときにEscEscで復帰できるように、念のためforceをTrueにして呼び出す。
call EscEsc_Add('call RestoreDefaultStatusline(v:true)')
call EscEsc_Add('call clever_f#reset()')

" Esc_Esc }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Search {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


"----------------------------------------------------------------------------------------
" General Mapping

cmap <expr> <CR> ( getcmdtype() == '/' ) ?
               \ ( '<Plug>(MySearch-SlashCR)' ) :
               \ ( '<CR>' )

"------------------------------------
" 単語   新規 動く	*
" 単語   新規 留まる	g*	g8
" 単語   追加 動く	g&	g7
" 単語   追加 留まる	&
" 非単語 新規 動く	#
" 非単語 新規 留まる	g#	g3
" 非単語 追加 動く	g@	g2
" 非単語 追加 留まる	@
"------------------------------------

nmap *  <Plug>(MySearch-CWord-New-Word-Move)
nmap &  <Plug>(MySearch-CWord-Add-Word-Keep)
nmap #  <Plug>(MySearch-CWord-New-Part-Move)
nmap @  <Plug>(MySearch-CWord-Add-Part-Keep)

nmap g* <Plug>(MySearch-CWord-New-Word-Keep)
nmap g& <Plug>(MySearch-CWord-Add-Word-Move)
nmap g# <Plug>(MySearch-CWord-New-Part-Keep)
nmap g@ <Plug>(MySearch-CWord-Add-Part-Move)

nmap g8 g*
nmap g7 g&
nmap g3 g#
nmap g2 g@

nmap n  <Plug>(MySearch-n)
nmap N  <Plug>(MySearch-N)

" move to first
"nmap <Leader>n ggnN
" move to last
"nmap <Leader>N  GNn

"nnoremap <Leader>& <Plug>(MySearch-TopUnderScore)
"nnoremap <Leader>@ <Plug>(MySearchT-ToggleMultiHighLight)

" clear status
"nmap <Esc><Esc> <Plug>(anzu-clear-search-status)


"----------------------------------------------------------------------------------------
" 補償

nnoremap g9 g8


"----------------------------------------------------------------------------------------
" 行検索

nnoremap <Leader>* ^y$:let lstmp = @"<CR>/\C\V<C-r>=escape(lstmp, '/\|\\')<CR><CR>
vnoremap <Leader>*   y:let lstmp = @"<CR>/\C\V<C-r>=escape(lstmp, '/\|\\')<CR><CR>
vnoremap         *   y:let lstmp = @"<CR>/\C\V<C-r>=escape(lstmp, '/\|\\')<CR><CR>


" Search }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Substitute {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

nnoremap <C-s>           :<C-u>g$.$s    ##<Left>
nnoremap S               :<C-u>g$.$s    #<C-R>/##g<Left><Left>
nnoremap gs              :<C-u>g$.$s    #<C-R><C-W>##g<Left><Left>
nnoremap gS              :<C-u>g$.$s    #<C-R><C-W>#<C-R><C-W>#g<Left><Left>
nnoremap <Leader>s           :<C-u>s    ###g<Left><Left><Left>

vnoremap <C-s>                    :s    ##<Left>
vnoremap S                        :s    #<C-R>/##g<Left><Left>
vnoremap gs                       :s    #<C-R>/#<C-R><C-W>#g

"cnoremap <expr> <C-g> match(getcmdline(), '\(g.\..s\\|s\)    /') == 0 ? '<End>/g' :
"                    \ match(getcmdline(), '\(g.\..s\\|s\)    %') == 0 ? '<End>/g' : ''

" Substitute }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Grep {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

set grepprg=$HOME/bin/ag\ --line-numbers
set grepprg=/usr/bin/grep\ -an
set grepprg=git\ grep\ --no-index\ -I\ --line-number

"========================================================

nnoremap !             :<C-u>grep ''<Left>
nnoremap <Leader>g     :<C-u>grep '<C-R>/'<CR>
nnoremap <C-g>         :<C-u>grep '\<<C-R><C-W>\>'<CR>

"========================================================

let g:prj_root_file = '.git'

augroup MyVimrc_Grep
  au!
  exe "au WinEnter * if (&buftype == 'quickfix') | cd " . getcwd() . " | endif"
augroup end

function! CS(str)
  let save_autochdir = &autochdir
  set autochdir

  let pwd = getcwd()

  for i in range(7)
    if glob(g:prj_root_file) != ''  " prj_root_fileファイルの存在確認
      try
        if exists("*CS_Local")
          call CS_Local(a:str)
        else
          exe "silent grep! '" . a:str . "' **/*.c" . " **/*.h" . " **/*.s"
        endif
        call feedkeys("\<CR>:\<Esc>\<C-o>", "tn")  " 見つかった最初へ移動させない。
      finally
      endtry
      break
    endif
    cd ..
  endfor

  exe 'cd ' . pwd
  exe 'set ' . save_autochdir
endfunction

com! CS call CS("\<C-r>\<C-w>")

"nnoremap          <leader>g     :<C-u>call CS("\\<<C-r><C-w>\\>")<CR>
"nnoremap <silent> <C-g>         :<C-u>call CS("\\<<C-r><C-w>\\>")<CR>
"nnoremap          <leader>G     :<C-u>call CS("<C-r><C-w>")<CR>
"nnoremap          <leader><C-g> :<C-u>call CS('')<Left><Left>
"nnoremap <silent> <C-g>         :<C-u>call CS("\\b<C-r><C-w>\\b")<CR>
"nnoremap <silent> <leader>g     :<C-u>call CS("\\b<C-r><C-w>\\b")<CR>
"nnoremap          <leader>g     :<C-u>call CS('')<Left><Left>

"========================================================

nnoremap <Leader>g :<C-u>vim "\<<C-r><C-w>\>" *.c<CR>

" Grep }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Quickfix & Locationlist {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

let c_jk_local = 0

"例外をキャッチしないと、最初と最後の要素の次に移動しようとして例外で落ちる。
nnoremap <silent> m         :<C-u>try <Bar> exe (c_jk_local ? ":lnext" : "cnext") <Bar> catch <Bar> endtry<CR>:FuncNameStl<CR>
nnoremap <silent> M         :<C-u>try <Bar> exe (c_jk_local ? ":lprev" : "cprev") <Bar> catch <Bar> endtry<CR>:FuncNameStl<CR>
nnoremap <silent> <Leader>m :<C-u>exe (c_jk_local ? ":lfirst" : "cfirst")<CR>:FuncNameStl<CR>
nnoremap <silent> <Leader>M :<C-u>exe (c_jk_local ? ":llast" : "clast")<CR>:FuncNameStl<CR>
nnoremap <silent> <A-m>     :<C-u>let c_jk_local = !c_jk_local<CR>

" Quickfix & Locationlist }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Tag, Jump, and Unified CR {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" Browse
"nnoremap H <C-o>
"nnoremap L <C-i>
nmap <silent> H         <Plug>(BrowserJump-Back)
nmap <silent> L         <Plug>(BrowserJump-Foward)
"nmap <silent> <Leader>H <Plug>(BrowserJump-Disp)
"nmap <silent> <Leader>L <Plug>(BrowserJump-ToggleOrgPos)

" 補償
noremap zh H
noremap zl L
"nnoremap zm M
"nnoremap <expr> zh &wrap ? 'H' : 'zh'
"nnoremap <expr> zl &wrap ? 'L' : 'zl'

" 補償の補償
noremap <C-@> zh
noremap <C-^> zl

" ---------------
" Unified CR
"   数字付きなら、行へジャンプ
"   qfなら当該行へジャンプ
"   helpなら当該行へジャンプ
"   それ以外なら、タグジャンプ
" ---------------
function! Unified_CR(mode)
  if v:prevcount
    " jumpする前に登録しないと、v:prevcountが上書されてしまう。
    call histadd('cmd', v:prevcount)
    " jumplistに残すためGを使用
    exe 'normal! ' . v:prevcount . 'G'
    return
  elseif &ft == 'qf'
    call feedkeys("\<CR>:FF2\<CR>", 'nt')
    return
  elseif &ft == 'help'
    call feedkeys("\<C-]>", 'nt')
    return
  else
    call JumpToDefine(a:mode)
    return
  endif
endfunction


" ----------------------------------------------------------------------------------------------
" Tag Match

augroup MyVimrc_TagMatch
  au!
  au ColorScheme * hi TagMatch	guibg=#c0504d	guifg=white
augroup end

function! TagHighlightDelete(dummy)
  "echo a:dummy
  "sleep 5
  "call matchdelete(g:TagMatch)
  call matchdelete(g:TagMatchI[a:dummy])
  call remove(g:TagMatchI, a:dummy . '')
  "echo g:TagMatchI
endfunction

let g:TagMatchI = {}
let s:TagHighlightTime = 1000  " [ms]

" TODO
"   ラベルならf:b
"   変数なら、スクロールしない
"   引数のタグ
"   asmのタグ
function! JumpToDefine(mode)
  let w0 = expand("<cword>")

  if w0 !~ '\<\i\+\>'
    return
  endif

  let w = w0

  let g:TagMatch0 = matchadd('TagMatch', '\<'.w.'\>')
  let g:TimerTagMatch0 = timer_start(s:TagHighlightTime, 'TagHighlightDelete')
  let g:TagMatchI[g:TimerTagMatch0] = g:TagMatch0
  redraw

  for i in range(2 + 2)
    try
      if a:mode =~? 's'
	exe (a:mode =~? 'p' ? 'p' : (a:mode =~? 'w' ? 's' : '')) . "tselect " . w
      else
	exe (a:mode =~? 'p' ? 'p' : (a:mode =~? 'w' ? 's' : '')) . "tjump " . w
      endif
      " 表示範囲を最適化
      exe "normal! z\<CR>" . (winheight(0)/4) . "\<C-y>"
      " カーソル位置を調整 (C専用)
      call PostTagJumpCursor_C()
      let g:TagMatch = matchadd('TagMatch', '\<'.w.'\>')
      let g:TimerTagMatch = timer_start(s:TagHighlightTime, 'TagHighlightDelete')
      let g:TagMatchI[g:TimerTagMatch] = g:TagMatch
      return
    catch /:E426:/
      if w0 =~ '^_'
	" 元の検索語は"_"始まり
	let w = substitute(w0, '^_', '', '')
      else
	" 元の検索語は"_"始まりでない
	let w = '_' . w0
      endif
      if i == 0
      let exception = v:exception
      endif
    catch /:E433:/
      echohl ErrorMsg | echo matchstr(v:exception, 'E\d\+:.*') | echohl None
      return
    endtry
  endfor
  echohl ErrorMsg | echo matchstr(exception, 'E\d\+:.*') | echohl None
endfunction

" カーソル位置を調整 (C専用)
function! PostTagJumpCursor_C()
  if search('\%##define\s\+\k\+(', 'bcn')
  "関数形式マクロ
    normal! ww
  elseif search('\%##define\s\+\k\+\s\+', 'bcn')
  "定数マクロ
    normal! ww
  elseif search('\%#.\+;', 'bcn')
  "変数
    normal! f;b
  else
    "関数
    normal! $F(b
  endif
endfunction

" 対象
"   カーソル下  ->  Normal mode デフォルト
"   Visual      ->  Visual mode デフォルト
"   (入力)      ->  対応なし

" タグ動作
"   直接ジャンプ -> なし
"   よきに計らう(タグの数次第で) -> デフォルトとする
"   強制選択

" ウィンドウ
"   そのまま
"   別ウィンドウ
"   プレビュー

" mode
"   s:select
"   p:preview
"   w:別ウィンドウ
"
" 最初の<Esc>がないと、prevcountをうまく処理できない。
nnoremap <silent> <CR>         <Esc>:call Unified_CR('')<CR>
nnoremap <silent> g<CR>        <Esc>:call Unified_CR('p')<CR>
nnoremap <silent> <Leader><CR> <Esc>:call Unified_CR('w')<CR>
nnoremap <silent> <C-CR>       <Esc>:call Unified_CR('s')<CR>
nnoremap <silent> <S-CR>       <Esc>:call Unified_CR('sp')<CR>
nnoremap <silent> <C-S-CR>     <Esc>:call Unified_CR('sw')<CR>
nnoremap          <C-S-CR>     <Esc>:tags<CR>;pop

nmap     <silent> <BS><CR>     <BS><BS><CR>

" Tag, Jump, and Unified CR }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Diff {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

set diffopt+=iwhite

" diff Close
nnoremap dc    :<C-u>diffoff<CR>
nnoremap d<BS> :<C-u>diffoff<CR>

" diff (all window) Quit
nnoremap <silent> dq :<C-u>call PushPos_All() <Bar> exe 'windo diffoff' <Bar> call PopPos_All() <Bar> echo 'windo diffoff'<CR>

" diff (all window and buffer) Quit
nnoremap <silent> dQ :<C-u>call PushPos_All() <Bar> exe 'bufdo diffoff' <Bar> exe 'windo diffoff' <Bar> call PopPos_All()<CR>:echo 'bufdo diffoff <Bar> windo diffoff'<CR>

" Toggle Scrollbind
nnoremap dx :<C-u>setl scrollbind!<CR>

" diff toggle ignorecase (uはVisualモードでの、toggle case.)
nnoremap <expr> du match(&diffopt, 'icase' ) < 0 ? ':<C-u>set diffopt+=icase<CR>'  : ':<C-u>set diffopt-=icase<CR>'

" diff Y(whi)tespace
nnoremap <expr> dy match(&diffopt, 'iwhite') < 0 ? ':<C-u>set diffopt+=iwhite<CR>' : ':<C-u>set diffopt-=iwhite<CR>'

" diff off
nnoremap d<S-Space> :<C-u>diffoff<CR>

" diff accept (obtain and next, obtain and previouse) (dotは、repeat'.')
nnoremap d. do1gs]c^
nnoremap dp do1gs[c^

" Next Hunk
"nnoremap <silent> t ]c^zz:FuncNameStl<CR>
nnoremap <silent> t ]c^:FuncNameStl<CR>

" Previouse Hunk
"nnoremap <silent> T [c^zz:FuncNameStl<CR>
nnoremap <silent> T [c^:FuncNameStl<CR>

" 最初にgg/G/[c/]cすると、FuncNameStlが実行されない不具合あり。対策として、t/Tをnmap。

" Top Hunk
nmap      <silent> <Leader>t ggtT
"nnoremap <silent> <Leader>t gg]c[c^zz:FuncNameStl<CR>

" Bottom Hunk
nmap      <silent> <Leader>T  GTt
"nnoremap <silent> <Leader>T  G[c]c^zz:FuncNameStl<CR>

" diff Special
nnoremap <expr> d<Space>
        \ &diff ? ':<C-u>diffupdate<CR>' :
        \ winnr('$') == 2 ? ':<C-u>call PushPos_All() <Bar> exe "windo diffthis" <Bar> call PopPos_All()<CR>' :
        \ ':<C-u>diffthis<CR>'

" diff toggle
nnoremap <expr> d<CR>
        \ &diff ? ':<C-u>diffoff<CR>' :
        \ winnr('$') == 2 ? ':<C-u>call PushPos_All() <Bar> exe "windo diffthis" <Bar> call PopPos_All()<CR>' :
        \ ':<C-u>diffthis<CR>'

" Block Diff
vmap <leader>1 <Plug>(BlockDiff-GetBlock1)
vmap <leader>2 <Plug>(BlockDiff-GetBlock2andExe)

" Diff }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Window {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

set noequalalways

"----------------------------------------------------------------------------------------
" Window Ratio
"
"   正方形 w:h = 178:78
"   横長なほど、大きい値が返る。
function! s:WindowRatio()
  let h = winheight(0) + 0.0
  let w = winwidth(0) + 0.0
  return (w / h - 178.0 / 78.0)
endfunction

"----------------------------------------------------------------------------------------
" Skip Terminal

function! s:SkipTerm(direction)
  "Window番号を指定されてら、そのWindowへ移動。
  if v:prevcount | return v:prevcount | endif

  "windowが2つしかないなら、もう一方へ移動することは自明なので、terminalであっても移動を許す。
  if winnr('$') == 2 | return winnr() == 1 ? 2 : 1 | endif

  let terms = term_list()
  let next_win = winnr()

  for i in range(winnr('$'))
    if a:direction >= 0
      let next_win = ( next_win == winnr('$') ? 1 : next_win + 1 )  "順方向
    else
      let next_win = ( next_win == 1 ? winnr('$') : next_win - 1 )  "逆方向
    endif
    let nr = winbufnr(next_win)
    if count(terms, nr) < 1 || term_getstatus(nr) =~# 'normal' | return next_win | endif
  endfor
endfunction

"----------------------------------------------------------------------------------------
" Trigger

nnoremap <BS> <C-w>

"----------------------------------------------------------------------------------------
" Split

" Auto
nnoremap <silent> <expr> <BS><BS>         ( <SID>WindowRatio() >= 0 ? "\<C-w>v" : "\<C-w>s" ) . ':diffoff<CR>'
nnoremap <silent> <expr> <Leader><Leader> ( <SID>WindowRatio() >= 0 ? ":\<C-u>vnew\<CR>" : "\<C-w>n" )
"nnoremap <silent> <expr> <Leader><Leader> ( <SID>WindowRatio() <  0 ? "\<C-w>v" : "\<C-w>s" ) . ':diffoff<CR>'
"nnoremap <BS><CR> " Tag, Jump, and Unified CR を参照。

" Manual
"nnoremap gu                        <C-w>s:setl noscrollbind<CR>
nnoremap <silent> _                <C-w>s:setl noscrollbind<CR>
nnoremap <silent> g_               <C-w>n
nnoremap <silent> <Bar>            <C-w>v:setl noscrollbind<CR>
nnoremap <silent> g<Bar>           :<C-u>vnew<CR>

"----------------------------------------------------------------------------------------
" Reopen as Tab

nnoremap <C-w><C-w> :<C-u>tab split<CR>
tnoremap <C-w><C-t> <C-w>T

" TODO diffのバッファも再現する。

"----------------------------------------------------------------------------------------
" Close

nnoremap <silent> q         <C-w><C-c>
nnoremap <silent> <Leader>q :<C-u>q<CR>

" 補償
nnoremap <silent> <C-q>; q:
nnoremap <silent> <C-q>/ q/
nnoremap <silent> <C-q>? q?

" ウィンドウレイアウトを崩さないでバッファを閉じる   (http://nanasi.jp/articles/vim/kwbd_vim.html)
com! Kwbd let s:kwbd_bn = bufnr('%') | enew | exe 'bdel '. s:kwbd_bn | unlet s:kwbd_bn
nnoremap <silent> <C-q><C-q> :<C-u>Kwbd<CR>

"----------------------------------------------------------------------------------------
" Focus

" Basic
"nnoremap <silent> <Space>   <Esc>:exe <SID>SkipTerm(+1) . ' wincmd w'<CR>
"nnoremap <silent> <S-Space> <Esc>:exe <SID>SkipTerm(-1) . ' wincmd w'<CR>
nnoremap <silent> <Plug>(MyVimrc-SkipTerm-Inc) <Esc>:exe <SID>SkipTerm(+1) . ' wincmd w'<CR>
nnoremap <silent> <Plug>(MyVimrc-SkipTerm-Dec) <Esc>:exe <SID>SkipTerm(-1) . ' wincmd w'<CR>

" Previouse
"nnoremap <Tab> <C-w>p

" Terminal Windowから抜ける。
nnoremap        <C-Tab> <C-w>p
" Windowが１つしかないなら、Tabを抜ける。
tnoremap <expr> <C-Tab> winnr('$') == 1 ? '<C-w>:tabNext<CR>' : '<C-w>p'

"----------------------------------------------------------------------------------------
" Resize

" 漸次
nnoremap <silent> <C-j> <esc>1<C-w>+:<C-u>call <SID>best_scrolloff()<CR>
nnoremap <silent> <C-k> <esc>1<C-w>-:<C-u>call <SID>best_scrolloff()<CR>
nnoremap <silent> <C-h> <esc>3<C-w><
nnoremap <silent> <C-l> <esc>3<C-w>>

tnoremap <silent> <up>	  <C-w>1+:<C-u>call <SID>best_scrolloff()<CR>
tnoremap <silent> <down>  <C-w>1-:<C-u>call <SID>best_scrolloff()<CR>
tnoremap <silent> <left>  <C-w>3<
tnoremap <silent> <right> <C-w>3>

tnoremap <silent> <S-up>    <C-w>+:<C-u>
tnoremap <silent> <S-down>  <C-w>-:<C-u>
tnoremap <silent> <S-left>  <C-w><
tnoremap <silent> <S-right> <C-w>>

" 補償
nnoremap <silent> <A-o> <C-l>

" 最小化・最大化
nnoremap <silent> g<C-j> <esc><C-w>_:<C-u>call <SID>best_scrolloff()<CR>
nnoremap <silent> g<C-k> <esc>1<C-w>_:<C-u>call <SID>best_scrolloff()<CR>
nnoremap <silent> g<C-h> <esc>1<C-w>|
nnoremap <silent> g<C-l> <esc><C-w>|

tnoremap <silent> <C-up>     <C-w>_:<C-u>call		<SID>best_scrolloff()<CR>
tnoremap <silent> <C-down>  1<C-w>_:<C-u>call		<SID>best_scrolloff()<CR>
tnoremap <silent> <C-left>  1<C-w><bar>:<C-u>call	<SID>best_scrolloff()<CR>
tnoremap <silent> <C-right>  <C-w><bar>:<C-u>call	<SID>best_scrolloff()<CR>

"----------------------------------------------------------------------------------------
" Move

nnoremap <silent> <A-h> <C-w>H:<C-u>call		<SID>best_scrolloff()<CR>
nnoremap <silent> <A-j> <C-w>J:<C-u>call		<SID>best_scrolloff()<CR>
nnoremap <silent> <A-k> <C-w>K:<C-u>call		<SID>best_scrolloff()<CR>
nnoremap <silent> <A-l> <C-w>L:<C-u>call		<SID>best_scrolloff()<CR>

tnoremap <silent> <A-left>  <C-w>H:<C-u>call		<SID>best_scrolloff()<CR>
tnoremap <silent> <A-down>  <C-w>J:<C-u>call		<SID>best_scrolloff()<CR>
tnoremap <silent> <A-up>    <C-w>K:<C-u>call		<SID>best_scrolloff()<CR>
tnoremap <silent> <A-right> <C-w>L:<C-u>call		<SID>best_scrolloff()<CR>

" Window }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Terminal {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

function! OpenTerm_Sub(key, val)
  if bufwinnr(a:val) < 0
    return 9999
  endif
  if bufwinnr(v:val) >= winnr()
    let ret = bufwinnr(a:val) - winnr()
  else
    let ret = winnr('$') - winnr() + bufwinnr(a:val)
  endif
  return ret
endfunction

function! OpenTerm()
  let terms = term_list()
  "echo terms
  call map(terms, function('OpenTerm_Sub'))
  "echo terms
  let minval = min(terms)
  "echo minval
  if minval != 0 && minval != 9999
    exe (minval + winnr() - 1) % (winnr('$')) + 1 . ' wincmd w'
  else
    terminal
  endif
endfunction

nnoremap <silent> gt         :<C-u>call OpenTerm()<CR>
nnoremap <silent> gT         :terminal<CR>
nnoremap <silent> <Leader>gt :vsplit<CR>:terminal ++curwin<CR>

tnoremap <C-w>; <C-w>:
tnoremap <Esc><Esc> <C-w>N
tnoremap <S-Ins> <C-w>"*
"tnoremap <C-l> <C-l>
"tnoremap <expr> <S-Del> '<C-w>:call term_sendkeys(bufnr(""), "cd " . expand("#" . winbufnr(1) . ":h"))<CR>'
tnoremap <expr> <S-Del> 'cd ' . expand('#' . winbufnr(1) . ':p:h')

for k in split('0123456789abcdefghijklmnopqrstuvwxyz', '\zs')
  exec 'tnoremap <A-' . k . '> <Esc>' . k
endfor

nmap <expr> o &buftype == 'terminal' ? 'i' : 'o'

" Terminal }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Buffer {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

nnoremap K         :<C-u>ls <CR>:b<Space>
nnoremap gK        :<C-u>ls!<CR>:b<Space>
nnoremap <Leader>K :<C-u>ls <CR>:bdel<Space>

nnoremap <silent> <A-n> :<C-u>bnext<CR>
nnoremap <silent> <A-p> :<C-u>bprev<CR>

nnoremap <Leader>z :<C-u>bdel
nnoremap <Leader>Z :<C-u>bdel!

" Buffer }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Tab {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

nnoremap <C-t> :<C-u>tabnew<Space>

nnoremap <C-f> gt
nnoremap <C-b> gT

nnoremap <A-f> :exe tabpagenr() == tabpagenr('$') ? 'tabmove 0' : 'tabmove +1'<CR>
nnoremap <A-b> :exe tabpagenr() == 1              ? 'tabmove $' : 'tabmove -1'<CR>

" Tab }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Tabline {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

"----------------------------------------------------------------------------------------
" Make TabLine

function! s:make_tabpage_label(n)
  " カレントタブページかどうかでハイライトを切り替える
  let hi = a:n is tabpagenr() ? '%#Statusline#' : '%#TabLine#'

  if s:TablineStatus == 1
    return hi . ' [ ' . a:n . ' ] %#TabLineFill#'
  endif

  " タブ番号
  let no = '[' . a:n . ']'

  " タブ内のバッファのリスト
  let bufnrs = tabpagebuflist(a:n)

  " バッファ数
  let num = '(' . len(bufnrs) . ')'

  " タブ内に変更ありのバッファがあったら '+' を付ける
  let mod = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ? ' +' : ''

  if s:TablineStatus == 2
    return hi . ' [ ' . a:n . ' ' . mod . ' ] %#TabLineFill#'
  endif

  if s:TablineStatus == 3
    return hi . ' [ ' . a:n . ' ' . num . mod . ' ] %#TabLineFill#'
  endif

  " カレントバッファ
  let curbufnr = bufnrs[tabpagewinnr(a:n) - 1]  " tabpagewinnr() は 1 origin
  let fname = ( s:TablineStatus == 4 || s:TablineStatus == 5 ? expand('#' . curbufnr . ':t') : pathshorten(bufname(curbufnr)) )
 "let fname = pathshorten(expand('#' . curbufnr . ':p'))
  let fname = fname == '' ? 'No Name' : fname  " 無名バッファは、バッファ名が出ない。

  let label = no . ' ' . num . (s:TablineStatus == 5 || s:TablineStatus == 7 ? mod : '') . ' '  . fname

  return '%' . a:n . 'T' . hi . '  ' . label . '%T  %#TabLineFill#'
endfunction

function! TabLineStr()
  " Tab Label
  let tab_labels = map(range(1, tabpagenr('$')), 's:make_tabpage_label(v:val)')
  let sep = '%#SLFileName# | '  " タブ間の区切り
  let tabpages = sep . join(tab_labels, sep) . sep . '%#TabLineFill#%T'

  " Left
  let left = ''
  let left .= '%#Statusline#  ' . strftime('%Y/%m/%d (%a) %X') . '  '
  let left .= '%#SLFileName# ' . g:BatteryInfo . ' '
  let left .= '%#Statusline#  '

  " Right
  let right = ''
  let right .= "%#Statusline#  "
  let right .= "%#SLFileName# %{'[ '. substitute(&diffopt, ',', ', ', 'g') . ' ]'} "
 "let right .= '%#Statusline#  ' . strftime('%Y/%m/%d (%a) %X')
  let right .= '%#Statusline#  ' . s:TablineStatus . '/' . (s:TablineStatusNum - 1)
  let right .= '%#Statusline#  ' . printf("%2d", &l:ts)
  let right .= '%#Statusline#  '

  return left . '%##    %<' . tabpages . '%=  ' . right
endfunction

"----------------------------------------------------------------------------------------
" TabLine Timer

function! UpdateTabline(dummy)
  set tabline=%!TabLineStr()
endfunction

" 旧タイマの削除  vimrcを再読み込みする際、古いタイマを削除しないと、どんどん貯まっていってしまう。
if exists('TimerTabline')
  call timer_stop(TimerTabline)
endif

let s:UpdateTablineInterval = 1000
let TimerTabline = timer_start(s:UpdateTablineInterval, 'UpdateTabline', {'repeat': -1})

"----------------------------------------------------------------------------------------
" Switch TabLine Status

let s:TablineStatusNum = 8
let s:TablineStatus = 7 - 1  " 初回のToggleTabline呼び出しがあるので、ここは本来値-1を設定。

function! s:ToggleTabline()
  let s:TablineStatus = ( s:TablineStatus + 1 ) % s:TablineStatusNum
  if s:TablineStatus == 0
    set showtabline=0
  else
    set showtabline=2
  endif
  call UpdateTabline(0)
  "echo 'TablineStatus (' s:TablineStatus '/' s:TablineStatusNum - 1 ')'
endfunction

" 初期設定
silent call <SID>ToggleTabline()

nnoremap <silent> <leader>= :<C-u>call <SID>ToggleTabline()<CR>

" Tabline }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Statusline {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

"----------------------------------------------------------------------------------------
" Set Statusline

function! s:SetStatusline(stl, local, time)
  " 旧タイマの削除
  if a:time > 0 && exists('s:TimerUsl')
     call timer_stop(s:TimerUsl)
     unlet s:TimerUsl
  endif

  " Local Statusline の保存。および、WinLeaveイベントの設定。
  if a:local == 'l'
    let w:stl = getwinvar(winnr(), 'stl', &l:stl)
    augroup MyVimrc_Restore_LocalStl
      au!
      au WinLeave * if exists('w:stl') | let &l:stl = w:stl | unlet w:stl | endif
      au WinLeave * au! MyVimrc_Restore_LocalStl
    augroup end
  else
    let cur_win = winnr()
    "windo if !exists('w:stl') | let w:stl = &l:stl | endif
    "windo let w:stl = !exists('w:stl') ? &l:stl : w:stl
    windo let w:stl = getwinvar(winnr(), 'stl', &l:stl)
    silent exe cur_win . 'wincmd w'
    augroup MyVimrc_Restore_LocalStl
      au!
    augroup end
  endif

  " Statusline の設定
  exe 'set' . a:local . ' stl=' . substitute(a:stl, ' ', '\\ ', 'g')

  " タイマスタート
  if a:time > 0
    let s:TimerUsl = timer_start(a:time, 'RestoreDefaultStatusline', {'repeat': v:false})
  endif
endfunction

function! RestoreDefaultStatusline(force)
  " 旧タイマの削除
  if !exists('s:TimerUsl') && !a:force
    return
  elseif exists('s:TimerUsl')
    call timer_stop(s:TimerUsl)
    unlet s:TimerUsl
  endif

  call s:SetStatusline(s:stl, '', -1)
  let cur_win = winnr()
  windo if exists('w:stl') | let &l:stl = w:stl | unlet w:stl | endif
  " Localしか設定してないときは、全WindowのStlを再設定するより、if existsの方が速いか？
  "windo let &l:stl = getwinvar(winnr(), 'stl', '')
  silent exe cur_win . 'wincmd w'
endfunction

augroup MyVimrc_Stl
  au!
  " このイベントがないと、AltStlが設定されているWindowを分割して作ったWindowの&l:stlに、
  " (分割元Windowの)AltStlの内容が設定されっぱなしになってしまう。
  au WinEnter * let &l:stl = ''
augroup end

"----------------------------------------------------------------------------------------
" Make Default Statusline

function! s:SetDefaultStatusline(statusline_contents)

  let s:stl = "  "
  let s:stl .= "%#SLFileName#[ %{winnr()} ]%## ( %n ) "
  let s:stl .= "%##%m%r%{(!&autoread&&!&l:autoread)?'[AR]':''}%h%w "

  if a:statusline_contents['Fullpath']
    let s:stl .= "%<"
    let s:stl .= "%##%#SLFileName# %F "
  else
    let s:stl .= "%##%#SLFileName# %t "
    let s:stl .= "%<"
  endif

  " ===== Separate Left Right =====
  let s:stl .= "%#SLFileName#%="
  " ===== Separate Left Right =====

  let s:stl .= "%## %-4{&ft==''?'    ':&ft}  %-5{&fenc==''?'     ':&fenc}  %4{&ff} "

  let s:stl .= "%#SLFileName# %{&l:scrollbind?'$':'@'} "
 "let s:stl .= "%#SLFileName# %1{stridx(&isk,'.')<0?' ':'.'} %1{stridx(&isk,'_')<0?' ':'_'} "
  let s:stl .= "%1{c_jk_local!=0?'L':'G'} %1{&l:wrap?'==':'>>'} %{g:clever_f_use_migemo?'(M)':'(F)'} %4{&iminsert?'Jpn':'Code'} "

  let s:stl .= "%#SLFileName#  %{repeat(' ',winwidth(0)-178)}"

  let s:stl .= "%## %3p%% [%4L] "
 "let s:stl .= "%## %3p%%  %5L  "
  if a:statusline_contents['CurrentLineColumn']
    let s:stl .= "%## %4lL, %3v(%3c)C "
  endif
  if 0
    let s:stl .= "%#SLFileName# "
  endif

  call RestoreDefaultStatusline(v:true)
endfunction

"----------------------------------------------------------------------------------------
" Switch Statusline Contents

let g:StatuslineContents = {}

let g:StatuslineContents['Fullpath'] = v:false
let g:StatuslineContents['CurrentLineColumn'] = v:false

com! StlFullpath let g:StatuslineContents['Fullpath'] = !g:StatuslineContents['Fullpath'] | call <SID>SetDefaultStatusline(g:StatuslineContents)
nnoremap <silent> <Leader>- :<C-u>StlFullpath<CR>

com! StlCurrentLineColumn let g:StatuslineContents['CurrentLineColumn'] = !g:StatuslineContents['CurrentLineColumn'] | call <SID>SetDefaultStatusline(g:StatuslineContents)

" 初期設定のために1回は呼び出す。
call s:SetDefaultStatusline(g:StatuslineContents)

"----------------------------------------------------------------------------------------
" Alt Statusline API

function! SetAltStatusline(stl, local, time)
  call s:SetStatusline(a:stl, a:local, a:time)
endfunction

function! AddAltStatusline(stl, local, time)
  call s:SetStatusline((a:local == 'l' ? &l:stl : &stl) . a:stl, a:local, a:time)
endfunction

"----------------------------------------------------------------------------------------
" Alt Statusline Enter Visual Mode (TODO)
nnoremap <silent> v     :<C-u>call RestoreDefaultStatusline(v:false)<CR>v
nnoremap <silent> V     :<C-u>call RestoreDefaultStatusline(v:false)<CR>V
nnoremap <silent> <C-v> :<C-u>call RestoreDefaultStatusline(v:false)<CR><C-v>

" Statusline }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Battery {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" Battery.vimが存在しない場合に備えて。
let g:BatteryInfo = '? ---% [--:--:--]'

" Battery }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Unified_Space {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
"
nmap <expr> <Space>   winnr('$') == 1 ? '<Plug>(ComfortableMotion-Flick-Down)' : '<Plug>(MyVimrc-SkipTerm-Inc)'
nmap <expr> <S-Space> winnr('$') == 1 ? '<Plug>(ComfortableMotion-Flick-Up)'   : '<Plug>(MyVimrc-SkipTerm-Dec)'

" Unified_Space }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Mru {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" MRU Plugin ----------------------------------------------------------------------------------------------
"let MRU_Window_Height = min([20, &lines / 4 ])
"let MRU_Window_Height = max([8, &lines / 4 ])
let MRU_Window_Height = 25
augroup MyVimrc_MRU
    au!
    "au VimResized * let MRU_Window_Height = min([25, &lines / 3 ])
  au VimEnter,VimResized * let MRU_Window_Height = max([8, &lines / 3 ])
augroup end
" nnoremap <silent> <leader>o :<C-u>MRU<CR>

" My MRU --------------------------------------------------------------------------------------------------
command! -nargs=* MRU2 exe 'browse filter %\c' . substitute(<q-args>, '[ *]', '.*', 'g') . '% oldfiles'
" nnoremap <Leader>o  :<C-u>/ oldfiles<Home>browse filter /\c

" Common --------------------------------------------------------------------------------------------------
nnoremap <Leader>o :<C-u>MRU<Space>

" Mru }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Completion {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

set complete=.,w,b,u,i,t
set completeopt=menuone,preview
set pumheight=25


" 全文字キーへの補完開始トリガの割り当て
function! SetCpmplKey(str)
  for k in split(a:str, '\zs')
    exec "inoremap <expr> " . k . " pumvisible() ? '" . k . "' : search('\\k\\{1\\}\\%#', 'bcn') ? TrigCompl('" . k . "')" . " : '" . k . "'"
  endfor
endfunction
call SetCpmplKey('_0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')
inoremap <expr> <BS> pumvisible() ? (search('\k\k\k\k\%#', 'bcn') ? '<BS>' : "\<BS>") : (search('\k\k\k\%#', 'bcn') ? TrigCompl("\<BS>") : "\<BS>")

augroup MyComplete
  au!

  au CompleteDone * try | iunmap gg | catch | finally
  au CompleteDone * inoremap <silent> <expr> jj pumvisible() ? '<C-N><C-N>' : s:esc_and_wirte

  au InsertCharPre * try | iunmap gg | catch | finally

  au TextChangedI * exe pumvisible() ? "" : "inoremap <silent> <expr> jj pumvisible() ? '<C-N><C-N>' : " . s:esc_and_wirte_quoted
  au TextChangedI * exe pumvisible() ? "" : "try | iunmap gg | catch | finally"

  au InsertLeave * try | iunmap gg | catch | finally
  au InsertLeave * inoremap <silent> <expr> jj pumvisible() ? '<C-N><C-N>' : s:esc_and_wirte

  au InsertCharPre * exe ( pumvisible() || v:char != "j" ) ? ( "" ) : ( "inoremap <silent> <expr> jj pumvisible() ? '<C-N><C-N>' : " . s:esc_and_wirte_quoted )
  au InsertCharPre * exe pumvisible() ? "" : "try | iunmap gg | catch | finally"

augroup end

" 補完を開始する
function! TrigCompl(key)
  try
    iunmap jj
  catch
    inoremap <expr> gg pumvisible() ? '<C-Y><Esc>:<C-u>w<CR>' : 'gg'
  finally
  endtry
  call feedkeys("\<C-n>\<C-p>", 'n')
  return a:key
endfunc

" 補完中のj,kキーの処理を行う
function! Cmpl_jk(key)
  try
    iunmap jj
  catch
  finally
  inoremap <expr> gg pumvisible() ? '<C-Y><Esc>:<C-u>w<CR>' : 'gg'
  endtry
  call feedkeys(a:key, 'n')
  return ''
endfunction

inoremap <silent> <expr> jj pumvisible() ? '<C-N><C-N>' : s:esc_and_wirte
inoremap          <expr> jj pumvisible() ? '<C-N><C-N>' : s:esc_and_wirte
inoremap <expr> j pumvisible() ? Cmpl_jk("\<C-n>") : TrigCompl('j')
inoremap <expr> k pumvisible() ? Cmpl_jk("\<C-p>") : TrigCompl('k')
inoremap <expr> <C-j> pumvisible() ? 'j' : '<C-n>'
inoremap <expr> <C-k> pumvisible() ? 'k' : '<Esc>'

inoremap <expr> <CR>  pumvisible() ? '<C-y>' : '<C-]><C-G>u<CR>'
inoremap <expr> <Esc> pumvisible() ? '<C-e>' : '<Esc>'

inoremap <expr> gg ( pumvisible() ? '<C-Y>' : '' ) . s:esc_and_wirte

let s:esc_and_wirte =  '<Esc>:<C-u>w<CR>'
let s:esc_and_wirte_quoted = "'" . s:esc_and_wirte . "'"

" Completion }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" i_Esc {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

let g:IEscPre = []
let g:IEscPost = []

function! IEscPre_Add(str)
  call add(g:IEscPre, a:str)
endfunction

function! IEscPost_Add(str)
  call add(g:IEscPost, a:str)
endfunction

com! IEscDisp echo g:IEscPre g:IEscPost

"function! I_Esc()
"  call IEscPre()
"  call feedkeys("\<Esc>", 'ntx')
"  "normal! <Esc>
"  call IEscPost()
"  return ''
"endfunction

function! IEscPre()
  let input = ''
  for i in g:IEscPre
    "echo i
    "exe i
    let input = input . funcref(i)()
  endfor
  "call feedkeys("k", 'ntx')
  return input
endfunction

function! IEscPost()
  for i in g:IEscPost
    "echo i
    exe i
  endfor
  return ''
endfunction

inoremap <expr> <plug>(I_Esc_Write) IEscPre() . "\<Esc>" . ':w<CR>'
"imap , <Plug>(I_Esc_Write)

"call IEscPre_Add('Semi')
"function! Semi()
"  return 'eStert'
"endfunction
"call IEscPost_Add('w')

" i_Esc }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Snippets {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

"source D:/bin/vim74-kaoriya-win32/vim74/plugin/snipMate.vim
if exists('*TriggerSnippet')
  inoremap <silent> <Tab>   <C-R>=<SID>TriggerSnippet()<CR>
endif

" Snippets }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Configuration {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

let s:vimrc_path  = 'C:/User/' . $USERNAME . '/.vimrc'
let s:gvimrc_path = 'C:/User/' . $USERNAME . '/.gvimrc'
let s:colors_path = 'C:/User/' . $USERNAME . '/vimfiles/colors/'

let s:vimrc_path  = '~/.vimrc'
let s:gvimrc_path = '~/.gvimrc'
let s:colors_path = '~/vimfiles/colors/'

com! ReVimrc :exe 'so ' . s:vimrc_path

com! Vimrc   :exe 'sp '     . s:vimrc_path
com! VIMRC   :exe 'sp '     . s:vimrc_path
com! EVIMRC  :exe 'e '      . s:vimrc_path
com! VVIMRC  :exe 'vsp '    . s:vimrc_path
com! TVIMRC  :exe 'tabnew ' . s:vimrc_path

com! Gvimrc  :exe 'sp '     . s:gvimrc_path
com! GVIMRC  :exe 'sp '     . s:gvimrc_path
com! EGVIMRC :exe 'e '      . s:gvimrc_path
com! VGVIMRC :exe 'vsp '    . s:gvimrc_path
com! TGVIMRC :exe 'tabnew ' . s:gvimrc_path

com! EditColor  :exe 'sp ' . s:colors_path . g:colors_name . '.vim'
com! ColorEdit  :exe 'sp ' . s:colors_path . g:colors_name . '.vim'
com! VEditColor :exe 'vs ' . s:colors_path . g:colors_name . '.vim'
com! VColorEdit :exe 'vs ' . s:colors_path . g:colors_name . '.vim'

let g:vimrc_buf_name = '^' . s:vimrc_path
let g:color_buf_name = '^' . s:colors_path
let g:color_file_ext = '.vim$'

nnoremap <expr> <Leader>v  ( len(win_findbuf(buffer_number(g:vimrc_buf_name))) > 0 ) && win_id2win(reverse(win_findbuf(buffer_number(g:vimrc_buf_name)))[0]) > 0 ?
			\  ( win_id2win(reverse(win_findbuf(buffer_number(g:vimrc_buf_name)))[0]) . '<C-w><C-w>' ) :
			\  ( bufname('')=='' && &buftype=='' && !&modified ) ? ':EVIMRC<CR>' :
			\  ( <SID>WindowRatio() >= 0 ? ':VVIMRC<CR>' : ':VIMRC<CR>' )
nnoremap <expr> <Leader>V  ( len(win_findbuf(buffer_number(g:color_buf_name . g:colors_name . g:color_file_ext))) > 0 ) ?
			\  ( win_id2win(win_findbuf(buffer_number(g:color_buf_name . g:colors_name . g:color_file_ext))[0]) . '<C-w><C-w>' ) :
			\  ( <SID>WindowRatio() >= 0 ? ':VEditColor<CR>' : ':EditColor<CR>' )

" Configuration }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Other Key-Maps {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

nnoremap <leader>w :<C-u>w<CR>
nnoremap <silent><expr> <Leader>r &l:readonly ? ':<C-u>setl noreadonly<CR>' : ':<C-u>setl readonly<CR>'
nnoremap <silent><expr> <Leader>R &l:modifiable ? ':<C-u>setl nomodifiable <BAR> setl readonly<CR>' : ':<C-u>setl modifiable<CR>'
nnoremap <leader>L :<C-u>echo len("<C-r><C-w>")<CR>
nnoremap <silent> yx :PushPos<CR>ggyG:PopPos<CR> | ":echo "All lines yanked."<CR>

"nnoremap <silent> <C-o> :<C-u>exe (g:alt_stl_time > 0 ? '' : 'normal! <C-l>')
"                      \ <Bar> let g:alt_stl_time = 12
nnoremap <silent> <C-o> :<C-u>pwd
                      \ <Bar> echon '        ' &fileencoding '  ' &fileformat '  ' &filetype '    ' printf('L %d  C %d  %3.2f %%  TL %3d', line('.'), col('.'), line('.') * 100.0 / line('$'), line('$'))
                      \ <Bar> call SetAltStatusline('%#hl_buf_name_stl#  %F', 'g', 10000)<CR>


"nnoremap <C-Tab> <C-w>p
inoremap <C-f> <C-p>
inoremap <C-e>	<End>
"inoremap <CR> <C-]><C-G>u<CR>
inoremap <C-H> <C-G>u<C-H>

nnoremap <silent><expr> gl &l:wrap ? ':setl nowrap<CR>' : ':setl wrap<CR>'

nnoremap gG G

nnoremap <silent> gf :<C-u>aboveleft sp<CR>gF

" Other Key-Maps }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Clever-f {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

let g:clever_f_smart_case=1			"
let g:clever_f_use_migemo=1			"
"let g:clever_f_fix_key_direction=1		"
let g:clever_f_chars_match_any_signs = '\\'	" 任意の記号にマッチする文字を設定する
"let g:clever_f_chars_match_any_signs = ';'	" 任意の記号にマッチする文字を設定する
"let g:clever_f_chars_match_any_signs = ';'	" 任意の記号にマッチする文字を設定する
if 1
  hi MyCfC guifg=yellow guibg=black
  let g:clever_f_mark_cursor_color = 'MyCfC'
  "let g:clever_f_mark_char_color   = 'MyCfC'
  let g:clever_f_mark_cursor = 1
  "let g:clever_f_mark_char = 1
endif

nnoremap <Leader>k :<C-u>call <SID>clever_f_use_migemo_toggle()<CR>
function! s:clever_f_use_migemo_toggle()
  let g:clever_f_use_migemo = !g:clever_f_use_migemo
  echo g:clever_f_use_migemo ? 'clever_f_use_migemo' : 'No clever_f_use_migemo'
endfunction

" Clever-f }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Transparency {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

let g:my_transparency = 229
let g:my_transparency = 235
augroup MyVimrc_GUI
  au!
  "au GUIEnter * simalt ~x
  "au GUIEnter * ScreenMode 4
  au GUIEnter * ScreenMode 5
  exe 'au GUIEnter * set transparency=' . g:my_transparency
augroup end
nnoremap <silent> <S-PageUp>   :<C-u>ScreenMode 5<CR>
nnoremap <silent> <S-PageDown> :<C-u>ScreenMode 4<CR>

nnoremap <silent><expr> <PageUp>   ':<C-u>se transparency=' .    ( &transparency + 1      ) . '<Bar> Transparency <CR>'
nnoremap <silent><expr> <PageDown> ':<C-u>se transparency=' . max([&transparency - 1,   1]) . '<Bar> Transparency <CR>'   | " transparencyは、0以下を設定すると255になってしまう。

nnoremap <silent>       <C-PageUp>   :exe 'se transparency=' . (&transparency == g:my_transparency ? 255 : g:my_transparency) <Bar> Transparency <CR>
nnoremap <silent>       <C-PageDown> :exe 'se transparency=' . (&transparency == g:my_transparency ?  50 : g:my_transparency) <Bar> Transparency <CR>

com! Transparency echo printf(' Transparency = %4.1f%%', &transparency * 100 / 255.0)

exe 'set transparency=' . g:my_transparency


" Transparency }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" FuncName {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


function! Func_Name_Stl(alt_stl_time)
  let stl="   %m   %#hl_func_name_stl#   " . cfi#format("%s ()", "... ()") . "   %##"
  call SetAltStatusline(stl, 'l', a:alt_stl_time)
endfunction


com! FuncNameStl       call Func_Name_Stl(5000)
com! FuncNameEcho      echo cfi#format("%s ()", "... ()")
com! FuncNameEchoColor echohl hl_func_name_stl <Bar> echo cfi#format("%s", "... ()") <Bar> echohl None
com! FuncName          exe 'FuncNameStl' | exe 'FuncNameEcho'


nnoremap <silent> <Plug>(FuncName-Stl) :<C-u>FuncNameStl<CR>


" 関数名表示
nnoremap <silent> , :<C-u>FuncName<CR>


" Command Line での関数名挿入
cnoremap <C-r><C-f> <C-R>=cfi#format('%s', '')<CR>
cmap     <C-r>f <C-r><C-f>


" FuncName }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Util {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


function! TitleCase(str)
  return toupper(a:str[0]) . a:str[1:]
endfunction


" 数値比較用の関数 lhs のほうが大きければ正数，小さければ負数，lhs と rhs が等しければ 0 を返す
function! CompNr(lhs, rhs)
    return a:lhs - a:rhs
endfunction


function! GetKey()
  return nr2char(getchar())
endfunction


function! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc
"例 iabbr <silent> if if ()<Left><C-R>=Eatchar('\s')<CR>


function! ProcTopUnderScore(word)
  if a:word[0] == '_'
    return '_\?' . a:word[1:]
  elseif a:word[0] =~ '\a'
    return '_\?' . a:word
  endif
  return a:word
endfunction


function! Factorial(n)
  python3 import math
  return pyxeval('math.factorial(' . a:n . ')')
endfunction


" Util }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
com! Tab2Space :setlocal   expandtab | retab<CR>
com! Space2Tab :setlocal noexpandtab | retab!<CR>

" Windowsでの設定例です。Mac他の場合は外部コマンド部分を読み替えてください。
au FileType plantuml command! OpenUml :!/cygdrive/c/Program\ Files/Google/Chrome/Application/chrome.exe %

com! FL help function-list<CR>

com! XMLShape :%s/></>\r</g | filetype indent on | setf xml | normal gg=G

com! AR :setl autoread!
"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<



set renderoptions=type:directx,scrlines:1



" {{{
hi HlWord	guifg=#4050cd	guibg=white
hi HlWord	guibg=#4050cd	guifg=white
hi HlWord	guibg=NONE	guifg=NONE
hi HlWord	gui=reverse
hi HlWord	gui=NONE
hi HlWord	guibg=gray30	guifg=gray80
nnoremap <silent> <leader>` :<C-u>match HlWord /\<<C-r><C-w>\>/<CR>
"call EscEsc_Add('PushPosAll')
"call EscEsc_Add('windo match')
"call EscEsc_Add('PopPosAll')
augroup MyHiLight
  au!
  au WinLeave * match
augroup end
" `}}}



nnoremap <Leader><Space> :<C-u>let &iminsert = (&iminsert ? 0 : 2) <Bar> exe "colorscheme " . (&iminsert ? "Asche" : "Rimpa") <CR>
nnoremap <Leader>j       :<C-u>let &iminsert = (&iminsert ? 0 : 2) <Bar> exe "colorscheme " . (&iminsert ? "Asche" : "Rimpa") <CR>
nnoremap        g<Space> :<C-u>let &iminsert = (&iminsert ? 0 : 2) <Bar> exe "colorscheme " . (&iminsert ? "Asche" : "Rimpa") <CR>

" Refactoring
nnorema <silent> <Leader>d :<C-u>PushPos<CR>:g$.$s    /<C-r>//<C-r><C-w>/g<CR>:PopPos<CR>:let @/='<C-r><C-w>'<CR>

nnoremap <C-@> g-
nnoremap <C-^> g+
nnoremap <C-]> g;
nnoremap <C-\> g,

cnoremap <C-o> <C-\>e(getcmdtype() == '/' <Bar><Bar> getcmdtype() == '?') ? '\<' . getcmdline() . '\>' : getcmdline()<CR><Left><Left>

nnoremap + :setl isk+=
nnoremap - :setl isk-=

nnoremap <silent> <C-]> [c^:FuncNameStl<CR>
nnoremap <silent> <C-\> ]c^:FuncNameStl<CR>

nnoremap <silent> <C-]> g;:FuncNameStl<CR>
nnoremap <silent> <C-\> g,:FuncNameStl<CR>

nnoremap U                         <C-w>n

nnoremap ( zh
nnoremap ) zl
nnoremap g4 g$
nnoremap g6 g^



function! CursorOnWord()
  return search('\%#\k', 'cnz')
endfunction
function! CursorWord()
  if search('\<\%#\k', 'cnz')
    return -1
  elseif search('\%#\k', 'cnz')
    return 1
  endif
  return 0
endfunction



function! ZZ()
  let n = 25
  for i in range(n)
    execute "normal! " . g:comfortable_motion_scroll_down_key
    redraw
  endfor
endfunction
"==========================================================================================================================================================================
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:


if !has('win32')
  finish
endif

" Shellの設定 (Cygwinでも、なぜか設定しないとbashになる。)
set sh=C:/cygwin/bin/zsh

let s:home = 'C:/cygwin/home/' . $USERNAME
if substitute($HOME, '\', '/', 'g') == s:home
  " Cygwinから起動されたときの設定

  " $TMPを(Cygwinではなく)Windowsのパスにしないと、Diffの結果を読み込めない。
  "let $TMP  = 'C:/Users/' . $USERNAME . '/AppData/Local/Temp'
  "let $TEMP = $TMP

  " cygwinから起動されたときは、この後の設定を実施すると二重になる。
  finish
endif


" $HOMEの設定
if isdirectory(s:home)
  let $HOME=s:home
endif

" ファイル名の展開にスラッシュを使う
set shellslash

" PATHの追加
let $PATH .= ';C:/cygwin/bin;'
let $PATH .= $HOME . '/bin;'

" Shellの設定
"set sh=C:\cygwin\bin\zsh

" ! や :! 等のコマンドを実行するためにシェルに渡されるフラグ。
" 末尾のスペースは必要!!
set shellcmdflag=-c\ 

" ! や :! 等のコマンドでコマンドをシェルに渡すときに、コマンドを囲む引用符(の列)。
set shellxquote=\"

" runtimepathの追加
exe 'set runtimepath+=C:/cygwin/home/' . $USERNAME . '/vimfiles/'
exe 'set runtimepath+=C:/cygwin/home/' . $USERNAME . '/vimfiles/after'

" packpathの追加
exe 'set packpath+=C:/cygwin/home/' . $USERNAME . '/vimfiles/'
exe 'set packpath+=C:/cygwin/home/' . $USERNAME . '/vimfiles/after'
"==========================================================================================================================================================================
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)
"

" My favarite color
"	#c0504d

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "Rimpa"


" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLineNr	guibg=#000000 guifg=#ffffff gui=NONE cterm=bold ctermfg=yellow cterm=underline
  hi CursorLine	guibg=NONE guifg=NONE gui=underline ctermbg=NONE cterm=underline
  hi CursorColumn	guibg=#000000 ctermbg=236 gui=NONE
  hi CursorColumn	guibg=#121212 ctermbg=236 gui=NONE
  hi MatchParen	guifg=#f6f3e8 guibg=#857b6f gui=bold ctermbg=59
  hi Pmenu	guifg=#dcda8f guibg=#1a1a1a gui=none ctermfg=239 ctermbg=232
  hi Pmenu	guifg=#dcda8f guibg=black gui=none ctermfg=239 ctermbg=232
  hi PmenuSel 	guifg=#000000 guibg=#cdd129 ctermfg=0 ctermbg=184
  hi PmenuSel 	guifg=#000000 guibg=#c0504d ctermfg=0 ctermbg=184
  hi PmenuSbar 	guifg=#000000 guibg=black ctermfg=0 ctermbg=184
  hi PmenuThumb 	guifg=#000000 guibg=white ctermfg=0 ctermbg=184
endif


" General colors
"hi Search	guifg=#000000 guibg=#00eeee
hi Search	guibg=#c0504d	guifg=white
hi Search	guibg=#b7282e	guifg=NONE
hi Search	guibg=#c0504d	guifg=NONE
hi Search	guibg=#b7282e	guifg=white
hi SignColumn	guibg=Red guifg=White
hi FoldColumn	guibg=#444444 guifg=#ff5d28
hi TabLineFill	guifg=#8f3338 guibg=#A4A4A4
hi TabLineFill	guibg=#343434 guifg=#343434
hi TabLineFill	guibg=black guifg=#343434
hi TabLineFill2	guibg=#181818 guifg=#181818
hi TabLineSel	guibg=#111111 guifg=#a63318 gui=underline gui=bold
hi TabLineSel	guibg=#111111 guifg=#a63318 gui=None
hi TabLineSel	guibg=#111111 guifg=#a63318 gui=underline
hi TabLine	guifg=#ee8855 guibg=#333333
hi TabLine	guifg=#efd3b8 guibg=#393333
hi TabLine	guifg=#eedddd guibg=#393333
hi Cursor 	guifg=NONE    guibg=NONE gui=reverse ctermbg=0x241
hi Normal 	guifg=#f6f3f0 guibg=#121212 gui=none ctermfg=254 ctermbg=235
hi SpecialKey	guifg=#242424 guibg=#121212 gui=none
hi SpecialKey	guifg=#202020 guibg=#121212 gui=none
hi Normal 	guifg=#f6f3f0 guibg=#181818 gui=none ctermfg=254 ctermbg=235
hi Normal 	guifg=#f6f3f0 guibg=#1C1C1C gui=none ctermfg=254 ctermbg=235
hi Normal 	guifg=#f6f3f0 guibg=#222222 gui=none ctermfg=254 ctermbg=235
hi Normal 	guifg=#f6f3f0 guibg=#202020 gui=none ctermfg=254 ctermbg=235
hi Normal 	guifg=#f6f3f0 guibg=#282828 gui=none ctermfg=254 ctermbg=235
"hi Normal 	guifg=#f6f3f0 guibg=grey20 gui=none ctermfg=254 ctermbg=235
hi SpecialKey	guifg=#2D2D2D guibg=#222222 gui=none
hi NonText 	guifg=#808080 guibg=#303030 gui=none ctermfg=242 ctermbg=237
hi LineNr 	guifg=#5c5a4f guibg=#000000 gui=none ctermfg=239 ctermbg=232
hi Folded 	guibg=#252525 guifg=#c0c0c0 gui=none
hi Title	guifg=#f6f3e8 guibg=NONE	gui=bold
hi Visual	guifg=#ffffd7 guibg=#444444 gui=none ctermfg=186 ctermbg=238
hi StatusLine 	guifg=#f6f3c8 guibg=#6f2f2f gui=none  | "italic
hi StatusLine	guibg=#ff7d58 guifg=#000000 gui=none  |  "none
hi StatusLine	guifg=#ff2d18 guibg=#000000 gui=none  |  "none
hi StatusLine	guifg=#ede39e guibg=#7f1f1a gui=none  | "italic
hi StatusLine	guifg=black guibg=#7f1f1a gui=none  | "italic
hi StatusLine	guifg=#efb398 guibg=#7f1f1a gui=none  | "italic
hi StatusLine	guifg=#ffe3c8 guibg=#7f1f1a gui=none  | "italic
hi StatusLine2	guifg=black guibg=#7f1f1a gui=none  | "italic
hi StatusLine	guifg=black guibg=#7f1f1a gui=none  | "italic
hi StatusLine	guifg=#141414 guibg=#7f1f1a gui=none  | "italic
hi StatusLine	guifg=#efd3b8 guibg=#7f1f1a gui=none  | "italic
hi StatusLineTerm	guifg=#efd3b8 guibg=#df2a1a gui=none  | "italic
hi StatusLineTerm	guifg=#efd3b8 guibg=#df2a1a gui=none  | "italic
hi StatusLineTerm	guifg=#efd3b8 guibg=#8f1a02 gui=none  | "italic
hi StatusLineTerm	guifg=#efd3b8 guibg=#e83929 gui=none  | "italic
hi StatusLineTerm	guifg=#efd3b8 guibg=#d0330b gui=none  | "italic
"hi StatusLineTermNC	guifg=#efd3b8 guibg=#af1a0a gui=none  | "italic
"hi StatusLineTermNC	guifg=#efd3b8 guibg=#480d01 gui=none  | "italic
hi StatusLineTermNC	guifg=#efd3b8 guibg=#701a06 gui=none  | "italic
hi StatusLineTermNC	guifg=#8f7368 guibg=#6d2006 gui=none  | "italic
hi StatusLineNC	guifg=#343434 guibg=#300a03 gui=none  |  "none
hi StatusLineNC	guifg=#444444 guibg=#300a03 gui=none  |  "none
hi StatusLineNC	guifg=#cfb398 guibg=#300a03 gui=none  |  "none
hi StatusLineNC	guifg=#5c5a4f guibg=#300a03 gui=none  |  "none
"hi StatusLine	guifg=#695753 guibg=#500f05 gui=none  |  "none
"hi StatusLineNC	guifg=#5c5a4f guibg=#200501 gui=none  |  "none
"hi StatusLineNC	guifg=#ee8855 guibg=#333333
hi StatusLineDate	guifg=#5c5a4f guibg=#7f1f1a
hi StatusLineDate	guifg=#efd3b8 guibg=#7f1f1a gui=none  | "italic
hi StatusLineDate	guifg=#5c5a4f guibg=NONE
"hi StatuslineFile	guifg=#acf0f2 gui=none ctermfg=159
hi StatuslineFile	guifg=white guibg=black
hi StatuslineFile	guifg=#acf0f2 guibg=black
hi VertSplit	guifg=#300a03 guibg=#300a03 gui=none  |  "none
hi VertSplit	guifg=#5c5a4f guibg=#300a03 gui=none  |  "none
hi VertSplit	guifg=#000000 guibg=#000000 gui=none
hi VertSplit	guifg=#4c4a3f guibg=#300a03 gui=none
hi VertSplit	guifg=#5c5a4f guibg=#300a03 gui=none
hi VertSplit	guifg=#424035 guibg=#300a03 gui=none
hi VertSplit	guifg=#300a03 guibg=#300a03 gui=none
hi VertSplit	guifg=#000000 guibg=#300a03 gui=none
hi VertSplit	guifg=#121212 guibg=#300a03 gui=none
hi VertSplit	guifg=#7f1f1a guibg=black gui=none
hi VertSplit	guifg=#7f1f1a guibg=#121212 gui=none
hi Red	guifg=#d63a3a guibg=black
hi yellow	guifg=#f6f3f0 guibg=black
hi yellow	guifg=#ffd90b
hi yellow	guifg=#3ad6d6
hi yellow	guifg=#f75ecb
hi gold		guifg=gold


" For Statusline
hi SLWinNr	guibg=#ffffff guifg=#a64348 gui=bold
hi SLFileName	guifg=#cf302d guibg=#000000
hi SLFileNameT	guifg=#7f1f1a guibg=#000000
hi TabLine	guifg=#cfb8af guibg=#000000
hi TabLine	guifg=#cfb8af guibg=#000000
hi TabLine	guifg=#cfaf8f guibg=#000000
hi TabLine	guifg=#cfb88f guibg=#000000
hi TabLine	guifg=#cfbfaf guibg=#000000
hi TabLine	guifg=#cfafaf guibg=#000000
hi TabLine	guifg=#7f6f6f guibg=#000000
hi TabLine	guibg=black	guifg=#ff3d28	gui=none	ctermfg=202
hi TabLine	guifg=#8f7f7f guibg=#000000
hi TabLine	guibg=black	guifg=#ff5d28	gui=none	ctermfg=202
hi TabLine	guifg=#ee8855 guibg=#333333 gui=underline
hi TabLine	guibg=black	guifg=#aaaaaa
hi TabLine	guifg=#eeddcc guibg=#363330 gui=none
hi TabLine	guifg=#eeddcc guibg=black gui=none
hi WildMenu	guifg=#ffffff guibg=#000000


" gui cursor
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,a:blinkon0
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,a:blinkon0
set guicursor=n-v-c:ver10-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,a:blinkon0


" supplemental
hi qfFileName	guifg=#c0504d
hi ErrorMsg	guifg=black	guibg=#ffd129


" Syntax highlighting
hi Comment 	guifg=#808080 ctermfg=244 | "gui=italic
hi Todo 	guifg=#8f8f8f gui=italic ctermfg=245
hi Constant 	guifg=#acf0f2 gui=none ctermfg=159
hi String 	guifg=#ff5d28 gui=none ctermfg=202
hi Identifier 	guifg=#ff5d28 gui=none ctermfg=202
hi Function 	guifg=#cdd129 gui=none ctermfg=184
hi Type 	guifg=#cdd129 gui=none ctermfg=184
hi Statement 	guifg=#af5f5f gui=none ctermfg=131
hi Keyword	guifg=#cdd129 gui=none ctermfg=184
hi PreProc 	guifg=#ede39e gui=none ctermfg=187
hi Number	guifg=#ede39e gui=none ctermfg=187
hi Special	guifg=#acf0f2 gui=none ctermfg=159


" transparency
set transparency=244


" Diff
"hi DiffChange	guifg=NONE	guibg=#191919	gui=none	ctermfg=NONE	ctermbg=235
hi DiffChange	guibg=#755332	guifg=NONE	gui=NONE	term=bold	ctermbg=5
hi DiffChange	guibg=#453020	guifg=NONE	gui=NONE	term=bold	ctermbg=5
hi DiffChange	guibg=#303030	guifg=NONE	gui=NONE	term=NONE	ctermbg=NONE
hi DiffChange	guibg=NONE	guifg=NONE	gui=NONE	term=NONE	ctermbg=NONE
hi DiffText	guibg=#b505b5	guifg=NONE	gui=NONE	term=reverse	ctermbg=12	cterm=bold
hi DiffText	guibg=#850585	guifg=NONE	gui=NONE	term=reverse	ctermbg=12	cterm=bold
hi DiffText	guibg=Red	guifg=NONE	gui=NONE	term=reverse	ctermbg=12	cterm=bold
hi DiffText	guibg=#780578	guifg=NONE	gui=NONE	term=reverse	ctermbg=12	cterm=bold
hi DiffText	guibg=NONE	guifg=NONE	gui=reverse	term=reverse	ctermbg=12	cterm=bold
hi DiffText	guibg=#686888	guifg=NONE	gui=NONE	term=reverse	ctermbg=12	cterm=bold
hi DiffText	guibg=#585878	guifg=NONE	gui=NONE	term=reverse	ctermbg=12	cterm=bold
hi DiffText	guibg=#303080	guifg=NONE	gui=NONE	term=reverse	ctermbg=12	cterm=bold
hi DiffText	guibg=#303088	guifg=NONE	gui=NONE	term=reverse	ctermbg=12	cterm=bold
hi DiffAdd	guibg=#111138	guifg=NONE	gui=NONE	term=bold	ctermbg=1
hi DiffAdd	guibg=#381111	guifg=NONE	gui=NONE	term=bold	ctermbg=1
hi DiffAdd	guibg=#301111	guifg=NONE	gui=NONE	term=bold	ctermbg=1
hi DiffAdd	guibg=#281111	guifg=NONE	gui=NONE	term=bold	ctermbg=1
hi DiffAdd	guibg=#241010	guifg=NONE	gui=NONE	term=bold	ctermbg=1
hi DiffAdd	guibg=#200a0a	guifg=NONE	gui=NONE	term=bold	ctermbg=1
hi DiffDelete	guibg=#112311	guifg=#2a2a2a	gui=NONE	term=bold	ctermbg=3	ctermfg=9
hi DiffDelete	guibg=#111138	guifg=#2a2a2a	gui=NONE	term=bold	ctermbg=1
hi DiffDelete	guibg=#111130	guifg=#1a1a4a	gui=NONE	term=bold	ctermbg=1


"""""""""""""""""""""""""""""""挿入モード時、ステータスラインの色を変更""""""""""""""""""""""""""""""

let s:hi_insert = 'highlight	StatusLine	guifg=white	guibg=#1a1f7f		gui=none	ctermfg=blue	ctermbg=yellow	cterm=none'
let s:hi_cmdwin = 'highlight	StatusLine	guifg=darkblue	guibg=darkyellow	gui=none	ctermfg=blue	ctermbg=yellow	cterm=none'
let s:slhlcmd = ''

if has('syntax')
  augroup InsertHook
    au!
    au InsertEnter * call s:StatusLine('IEnter')
    au InsertLeave * call s:StatusLine('ILeave')
    au CmdwinEnter * call s:StatusLine('CEnter')
    au CmdWinLeave * call s:StatusLine('CLeave')
  augroup END
endif

function! s:StatusLine(mode)
  if a:mode == 'IEnter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec s:hi_insert
  elseif a:mode == 'CEnter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec s:hi_cmdwin
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction


"""""""""""""""""""""""""""""""フォントサイズ""""""""""""""""""""""""""""""

if has('win32') || has('win64')
  let s:FontName		= "MeiryoKe_Console"
  "let s:FontHeight	= 9.5
  "let s:FontWidth	= 4.5
  "let s:FontWidth	= 4.45
  let s:FontHeight	= 9.0
  let s:FontWidth		= 4.2
  let s:FontHeight	= 9.0
  let s:FontWidth		= 4.5
  let s:FontHeight	= 8.5
  let s:FontWidth		= 4.5
  let s:MinFontHeight	= 2.0
  let s:MinFontWidth	= 1.0
  let s:FontK		= 0.5
endif

com! Font echo '' &guifont

function! ResizeFont(r)
  if a:r != 0
    let s:CurFontHeight += a:r
    let s:CurFontWidth  += a:r * s:FontK
    "let s:CurFontWidth += a:r * (s:CurFontWidth / s:CurFontHeight)
    if s:CurFontHeight < s:MinFontHeight | let s:CurFontHeight = s:MinFontHeight | endif
    if s:CurFontWidth  < s:MinFontWidth  | let s:CurFontWidth  = s:MinFontWidth  | endif
  else	" デフォルトサイズに戻す
    let s:CurFontHeight = s:FontHeight
    let s:CurFontWidth  = s:FontWidth
  endif
  exe "set guifont=" . s:FontName . ":h" . printf("%.2f", s:CurFontHeight) . ":w" . printf("%.2f", s:CurFontWidth)
  let g:CurFontHeight=s:CurFontHeight
  let g:CurFontWidth=s:CurFontWidth
  simalt ~x

endfunction

" mapping
nnoremap <Home>		:<C-u>call ResizeFont(+0.5)<CR>:Font<CR>
nnoremap <End>		:<C-u>call ResizeFont(-0.5)<CR>:Font<CR>
nnoremap <C-Home>	:<C-u>call ResizeFont(0)<CR>:Font<CR>
nnoremap <C-End>	:<C-u>call ResizeFont(0)<CR>:Font<CR>
nnoremap <S-End>	:<C-u>call ResizeFont(-99999)<CR>:Font<CR>

" initialize
"exe 'set guifont=' . s:FontName . ':h' . s:FontHeight . ':w' s:FontWidth
if !exists('g:font_init_done')
  call ResizeFont(0)
endif
let g:font_init_done = v:true


" func_name
"kari hi hl_func_name		guifg=#cdd129	gui=none	ctermfg=184
hi hl_func_name		guibg=Red	guifg=white	gui=none	ctermfg=202
hi hl_func_name		guibg=NONE	guifg=#ff5d28	gui=none	ctermfg=202
hi hl_func_name		guifg=#acf0f2	gui=none	ctermfg=159
hi hl_func_name		guifg=#cdd129	gui=none	ctermfg=184
hi hl_func_name_stl	guibg=black guifg=white	gui=none	ctermfg=184
hi hl_func_name_stl	guibg=black guifg=#cdd129	gui=none	ctermfg=184
hi hl_func_name_stl	guibg=black guifg=#85dfb0	gui=none	ctermfg=184
hi hl_func_name_stl	guibg=black	guifg=#ff5d28	gui=none	ctermfg=202
hi hl_func_name_stl	guibg=black guifg=#85b0df	gui=none	ctermfg=184
hi hl_buf_name_stl	guibg=black guifg=#cdd129	gui=none	ctermfg=184
hi hl_buf_name_stl	guibg=black	guifg=white	gui=none	ctermfg=202
hi hl_buf_name_stl	guibg=black	guifg=#ff5d28	gui=none	ctermfg=202
