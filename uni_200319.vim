"+++++ .vimrc ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set encoding=utf-8
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0 expandtab:
" (この行に関しては:help modelineを参照)


if !isdirectory($HOME . "/vim_buckup")
  call mkdir($HOME . "/vim_buckup")
endif

if !isdirectory($HOME . "/vim_swap")
  call mkdir($HOME . "/vim_swap")
endif


set nocompatible


set autochdir
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=2
set backupdir=$HOME/vim_buckup
set directory=$HOME/vim_swap
set clipboard=unnamed
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
"set encoding=utf-8
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
set formatoptions-=o
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
set tagcase=followscs
set incsearch
set mps+=<:>
set nowrapscan
set nostartofline

set number
set norelativenumber
set numberwidth=3

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
set virtualedit=block,onemore
set virtualedit=onemore
set wildmenu
"set wildmode=longest:full,full
"set wildmode=longest,list:longest,full
set wildmode=longest,full
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

set display+=lastline

set visualbell t_vb=

if 0
  set belloff=backspace,cursor,complete,copy,ctrlg,error,esc,ex,hangul,insertmode,lang,mess,showmatch,operator,register,shell,spell,wildmode
  set belloff-=shell
  set visualbell
else
 "set novisualbell
  set belloff=all
endif


filetype on

syntax enable

" 最後に置かないと、au ColorScheme が実行されないので、最後へ移動した。
"colorscheme Rimpa
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
ru macros/EscEsc.vim

" 本ファイル内で使用するので、先にloadする必要あり。
packadd vim-submode



" Basic {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


nnoremap Y y$


" US Keyboard {{{

noremap ; :

" ; を連続で押してしまったとき用。
cnoremap <expr> ; getcmdline() =~# '^:*$' ? ':' : ';'
cnoremap <expr> : getcmdline() =~# '^:*$' ? ';' : ':'

" US Keyboard }}}


nnoremap <silent> ZZ <Nop>
nnoremap <silent> ZQ <Nop>


nmap <silent> W <Plug>CamelCaseMotion_w
nmap <silent> B <Plug>CamelCaseMotion_b
if 0
  noremap E ge
  map <silent> ge <Plug>CamelCaseMotion_e
  map <silent> gE <Plug>CamelCaseMotion_ge
elseif 1
  map E  <Plug>CamelCaseMotion_e
  map gE <Plug>CamelCaseMotion_ge
else
  map E  <Plug>CamelCaseMotion_e
  map gE <Plug>CamelCaseMotion_ge

  call submode#enter_with('ge', 'nvo', '', 'ge', 'ge')
  call submode#map(       'ge', 'nvo', '', 'e',  'ge')
  call submode#map(       'ge', 'nvo', '', 'E',  'e')
  call submode#enter_with('gE', 'nvo', 'r', 'gE', '<Plug>CamelCaseMotion_ge')
  call submode#map(       'gE', 'nvo', 'r', 'E',  '<Plug>CamelCaseMotion_ge')
  call submode#map(       'gE', 'nvo', 'r', 'e',  '<Plug>CamelCaseMotion_e')
endif


" 検索時に/, ?を楽に入力する
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'


" 正規表現のメタ文字を楽に入力する
cnoremap (( \(
cnoremap )) \)
cnoremap << \<
cnoremap >> \>
cnoremap <Bar><Bar> \<Bar>


cnoremap <C-o> <C-\>e(getcmdtype() == '/' <Bar><Bar> getcmdtype() == '?') ? '\<' . getcmdline() . '\>' : getcmdline()<CR><Left><Left>


cnoremap <expr> <C-t> getcmdtype() == ':' ? '../' : '<C-t>'
cnoremap <expr> <C-^> getcmdtype() == ':' ? '../' : '<C-^>'


nnoremap g4 g$
nnoremap g6 g^

nnoremap ]3 ]#
nnoremap [3 [#

nnoremap ]8 ]*
nnoremap [8 [*


function! s:SwitchLineNumber()
  if !&l:number && !&l:relativenumber
    let &numberwidth = 3
    let &l:number = 1
  elseif &l:number && !&l:relativenumber
    let &numberwidth = 1
    let &l:relativenumber = 1
  else
    let &l:number = 0
    let &l:relativenumber = 0
  endif
endfunction

nnoremap <silent> <Leader>@ :<C-u>call <SID>SwitchLineNumber()<CR>
nmap <Leader>2 <Leader>@


" コメント行の後の新規行の自動コメント化のON/OFF
nnoremap <expr> <Leader>#
      \ &formatoptions =~# 'o' ?
      \ ':<C-u>set formatoptions-=o<CR>:set formatoptions-=r<CR>' :
      \ ':<C-u>set formatoptions+=o<CR>:set formatoptions+=r<CR>'
nmap <Leader>3 <Leader>#


vnoremap af ][<ESC>V[[
vnoremap if ][k<ESC>V[[j


nnoremap <silent> +  :echo '++ ' <Bar> exe 'setl isk+=' . GetKeyEcho()<CR>
nnoremap <silent> -  :echo '-- ' <Bar> exe 'setl isk-=' . GetKeyEcho()<CR>
nnoremap <silent> z+ :exe 'setl isk+=' . substitute(input('isk++ '), '.\($\)\@!', '&,', 'g')<CR>
nnoremap <silent> z- :exe 'setl isk-=' . substitute(input('isk-- '), '.\($\)\@!', '&,', 'g')<CR>
nnoremap <silent> z= :exe 'setl isk+=' . substitute(input('isk++ '), '.\($\)\@!', '&,', 'g')<CR>


" Basic }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Text_Objects {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

nnoremap cr ciw
nnoremap dr diw
nnoremap yr yiw

nnoremap cs caw
nnoremap ds daw
nnoremap ys yaw

"nnoremap cu ciw
"nnoremap du daw
"nnoremap yu yiw

" 括弧(Kakko)
onoremap ik i(
onoremap ak a(

" Double Quote
onoremap id i"
onoremap ad a"

" Text_Objects }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Visual_Mode {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


" Entering Block Visual ----------------------------------------------------------------------------------------

xnoremap <Plug>(Visual-i) i
xnoremap <Plug>(Visual-a) a

" line("'<"), line("'>") は、一旦VisualMode を抜けないと、前回の選択範囲分となってしまう。
"xnoremap <silent> <Plug>(Visual-I) <Esc>:xunmap <buffer> i<CR>:call feedkeys('gv' . ( line("'<") != line("'>") ? 'I' : 'i'), 't')<CR>
"xnoremap <silent> <Plug>(Visual-A) <Esc>:xunmap <buffer> a<CR>:call feedkeys('gv' . ( line("'<") != line("'>") ? 'A' : 'a'), 't')<CR>
" feedkeysのArg#3の根拠。⇒ 余るv_Aは再マップして、他に流用したい。一方、text-objectの'a'はマップされているかもしれない。
xnoremap <silent> <Plug>(Visual-I) <Esc>:xunmap <buffer> i<CR>:call feedkeys('gv' . ( line("'<") != line("'>") ? 'I' : 'i'), 't' . ( line("'<") != line("'>") ? 'n' : ''))<CR>
xnoremap <silent> <Plug>(Visual-A) <Esc>:xunmap <buffer> a<CR>:call feedkeys('gv' . ( line("'<") != line("'>") ? 'A' : 'a'), 't' . ( line("'<") != line("'>") ? 'n' : ''))<CR>

" nr2char(22) は "<C-v>"
let Ctrl_v = function('nr2char', [22])
" <buffer>と<nowait>により、各omapより優先させる。
nnoremap <silent> v :<C-u>call RestoreDefaultStatusline(v:false)<CR>
      \:xmap <expr> <buffer> <nowait> i mode() == Ctrl_v() ? "<Plug>(Visual-I)" : "<Plug>(Visual-i)"<CR>
      \:xmap <expr> <buffer> <nowait> a mode() == Ctrl_v() ? "<Plug>(Visual-A)" : "<Plug>(Visual-a)"<CR>
      \<C-v>
      ":xmap <expr> <buffer> <nowait> i mode() == nr2char(22) ? "<Plug>(Visual-I)" : "<Plug>(Visual-i)"<CR>
      ":xmap <expr> <buffer> <nowait> a mode() == nr2char(22) ? "<Plug>(Visual-A)" : "<Plug>(Visual-a)"<CR>


" Entering Ohter Visual ----------------------------------------------------------------------------------------

nnoremap <silent> V     :<C-u>call RestoreDefaultStatusline(v:false)<CR>V

nnoremap <silent> <C-v> :<C-u>call RestoreDefaultStatusline(v:false)<CR>v


" Virtual Edit ----------------------------------------------------------------------------------------

vnoremap <Leader>v <Esc>:<C-u>exe 'set virtualedit' . (&virtualedit =~# 'block' ? '-=' : '+=') .'block'<CR>gv
vnoremap <C-k>     <Esc>:<C-u>exe 'set virtualedit' . (&virtualedit =~# 'block' ? '-=' : '+=') .'block'<CR>gv
vnoremap <C-j>     <Esc>:<C-u>exe 'set virtualedit' . (&virtualedit =~# 'block' ? '-=' : '+=') .'block'<CR>gv


" Visual_Mode }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Cursor Move, CursorLine, CursorColumn, and Scroll {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


"----------------------------------------------------------------------------------------
" Vertical Move

"set noshowcmd

nnoremap j  gj
nnoremap k  gk

xnoremap j  gj
xnoremap k  gk


"----------------------------------------------------------------------------------------
" Horizontal Move

" ^に、|の機能を付加
nnoremap <silent> ^ <Esc>:exe v:prevcount ? ('normal! ' . v:prevcount . '<Bar>') : 'normal! ^'<CR>


"----------------------------------------------------------------------------------------
" Vertical Scroll

set sidescroll=1
set sidescrolloff=5

nnoremap <silent> <C-j> <C-d>
nnoremap <silent> <C-k> <C-u>

vnoremap <silent> <Space>   <C-d>
vnoremap <silent> <S-Space> <C-u>

let g:comfortable_motion_friction = 253.0
let g:comfortable_motion_air_drag = 45.0
let g:comfortable_motion_impulse_multiplier = 38.0
nnoremap <silent> <Plug>(ComfortableMotion-Flick-Down) :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * min([64, winheight(0)])     )<CR>
nnoremap <silent> <Plug>(ComfortableMotion-Flick-Up)   :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * min([64, winheight(0)]) * -1)<CR>

nmap gj <Plug>(ComfortableMotion-Flick-Down)
nmap gk <Plug>(ComfortableMotion-Flick-Up)

vnoremap gj <C-d>
vnoremap gk <C-u>


"----------------------------------------------------------------------------------------
" Horizontal Scroll

call submode#enter_with('HorizScroll', 'n', '', 'zl', 'zl')
call submode#enter_with('HorizScroll', 'n', '', 'zh', 'zh')
call submode#map(       'HorizScroll', 'n', '', 'l' , 'zl')
call submode#map(       'HorizScroll', 'n', '', 'h' , 'zh')

call submode#enter_with('HorizScroll', 'n', '', 'zj', '<c-e>')
call submode#enter_with('HorizScroll', 'n', '', 'zk', '<c-y>')
call submode#map(       'HorizScroll', 'n', '', 'j' , '<c-e>')
call submode#map(       'HorizScroll', 'n', '', 'k' , '<c-y>')

"sidescrolloffが1以上のとき、タブ文字(または多バイト文字)上にカーソルがあると、水平スクロールできないバグ(?)があるので、カーソルを動かせるようにしておく。
if 0
  call submode#map(       'HorizScroll', 'n', '', 'w' , 'w')
  call submode#map(       'HorizScroll', 'n', '', 'b' , 'w')
else
  set sidescrolloff=0
 "call submode#map(       'HorizScroll', 'n', '', 'l' , ':set virtualedit=all<CR>zl:set virtualedit=block<CR>')
 "call submode#map(       'HorizScroll', 'n', '', 'l' , ':set sidescrolloff=0<CR>zl:set sidescrolloff=5<CR>')
 "call submode#map(       'HorizScroll', 'n', '', 'h' , 'zh')
endif

"----------------------------------------------------------------------------------------
" Cursorline & Cursorcolumn

set cursorline
set cursorcolumn

augroup MyVimrc_Cursor
  au!
  au WinEnter,BufEnter * setl cursorline "cursorcolumn
  au WinLeave          * setl nocursorline nocursorcolumn

  if 0
    au CursorHold  * setl nocursorcolumn
    au CursorMoved * setl cursorcolumn
  endif
augroup end

nnoremap <silent> <Leader>c :<C-u>setl cursorline!<CR>
nnoremap <silent> <leader>C :<C-u>setl cursorcolumn!<CR>


"----------------------------------------------------------------------------------------
" Scrolloff

function! s:best_scrolloff()
  " Quickfixでは、なぜかWinNewが発火しないので、exists()で変数の存在を確認せねばならない。
  let &l:scrolloff = (g:BrowsingScroll || (exists('w:BrowsingScroll') && w:BrowsingScroll)) ? 99999 : ( winheight(0) < 10 ? 0 : winheight(0) < 20 ? 2 : 5 )
endfunction

function! BestScrolloff()
  call s:best_scrolloff()
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
  au VimEnter * PushPosAll | exe 'tabdo windo let w:BrowsingScroll = v:false | call <SID>best_scrolloff()' | PopPosAll
augroup end


" Cursor Move, CursorLine, CursorColumn, and Scroll }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Emacs {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" コマンドラインでのキーバインドを Emacs スタイルにする
" 行頭へ移動
noremap! <C-a>		<Home>
" 一文字戻る
noremap! <C-b>		<Left>
" カーソルの下の文字を削除
noremap! <C-d>		<Del>
" 行末へ移動
noremap! <C-e>		<End>
" 一文字進む
noremap! <C-f>		<Right>
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



" EscEsc {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

nmap <Esc><Esc> <Plug>(EscEsc)

"if !exists('s:EscEsc_Add_Done')

" おかしくなったときにEscEscで復帰できるように、念のためforceをTrueにして呼び出す。
call EscEsc_Add('call RestoreDefaultStatusline(v:true)')
call EscEsc_Add('call clever_f#reset()')

"endif
"let s:EscEsc_Add_Done = v:true

" EscEsc }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Search {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


"----------------------------------------------------------------------------------------
" General Mapping

cmap <expr> <CR> ( getcmdtype() == '/' ) ?
               \ ( '<Plug>(Search-SlashCR)' ) :
               \ ( '<CR>' )

nmap n  <Plug>(Search-n)
nmap N  <Plug>(Search-N)

" 末尾が\|でないときだけ、\|を追加しないと、\|の後でEscでキャンセルすると、\|が溜まっていってしまう。
"nnoremap ? /<C-p><C-\>e getcmdline() . ( match(getcmdline(), '\|$') == -1 ? '\\|' : '') <CR>
nnoremap g/ /<C-p><C-r>=match(getcmdline(), '\|$') == -1 ? '\\|' : ''<CR>


"----------------------------------------------------------------------------------------
" CWord

nmap  * <Plug>(Search-CWord-New-Word-Keep-Strict)
nmap z* <Plug>(Search-CWord-New-Word-Keep-Option)
nmap  # <Plug>(Search-CWord-New-Part-Keep-Strict)
nmap z# <Plug>(Search-CWord-New-Part-Keep-Option)
nmap  & <Plug>(Search-CWord-Add-Word-Keep-Option)
nmap z& <Plug>(Search-CWord-Add-Part-Keep-Option)

nmap z8 z*
nmap z3 z#
nmap z7 z&


"----------------------------------------------------------------------------------------
" 補償

nnoremap g9 g8
nnoremap 8g9 8g8
nnoremap 9g9 8g8


"----------------------------------------------------------------------------------------
" シンボル名のPart

"nnoremap z* :<C-u>setl isk-=_ <Bar> let @/=expand("<cword>") <Bar> set hlsearch <Bar> setl isk+=_<CR>
"nnoremap z& :<C-u>setl isk-=_ <Bar> let @/.='\\|'.expand("<cword>") <Bar> set hlsearch <Bar> setl isk+=_<CR>

nmap g* "xyiv/\C<C-r>x<CR>
nmap g# "xyiv/<C-r>x<CR>
nmap g& "xyiv/<C-p>\\|<C-r>x<CR>

nmap g8 g*
nmap g3 g#
nmap g7 g&


"----------------------------------------------------------------------------------------
" 行検索

nnoremap <Leader>* ^y$:let lstmp = @"<CR>/\C\V<C-r>=escape(lstmp, '/\|\\')<CR><CR>
nnoremap <Leader>* ^y$/\C\V<C-r>=escape(@", '/\|\\')<CR><CR>
nmap     <Leader>8 <Leader>*

nnoremap <Leader>& 0y$/\C\V\_^<C-r>=escape(@", '/\|\\')<CR>\_$<CR>
nmap     <Leader>7 <Leader>&

vnoremap <Leader>* y:let lstmp = @"<CR>/\C\V<C-r>=escape(lstmp, '/\|\\')<CR><CR>
vnoremap         * y:let lstmp = @"<CR>/\C\V<C-r>=escape(lstmp, '/\|\\')<CR><CR>
vmap     <Leader>8 <Leader>*
"vnoremap         *   y:let lstmp = @"<CR>/\C\V<C-r>=escape(lstmp, '/\|\\')<CR><CR>
"vnoremap <Leader>#   y:let lstmp = @"<CR>/\C\V<C-r>=escape(lstmp, '/\|\\')<CR><CR>
"vnoremap         #   y:let lstmp = @"<CR>/\C\V<C-r>=escape(lstmp, '/\|\\')<CR><CR>


"----------------------------------------------------------------------------------------
" 検討

"nnoremap ? /<C-p>\<Bar>

"nnoremap <Leader>& <Plug>(Search-TopUnderScore)
"nnoremap <Leader>@ <Plug>(MySearchT-ToggleMultiHighLight)

" clear status
"nmap <Esc><Esc> <Plug>(anzu-clear-search-status)

"nmap g8 :<C-u>setl isk-=_<CR>#:setl isk+=_<CR>
"nnoremap g8 :<C-u>setl isk-=_<CR>:setl isk+=_<CR>
"nnoremap g8 :<C-u>setl isk-=_<CR>:let @/=expand("<cword>")<CR>:set hlsearch<CR>:setl isk+=_<CR>
"nnoremap g8 :<C-u>setl isk-=_<CR>/<C-r><C-w><CR>:setl isk+=_<CR>


" Search }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Substitute {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


"----------------------------------------------------------------------------------------
" Basic

nnoremap S               :<C-u>g$.$s    %%<Left>
vnoremap S                        :s    %%<Left>

nnoremap <C-s>           :<C-u>g$.$s    %<C-R>/%%g<Left><Left>
vnoremap <C-s>                    :s    %<C-R>/%%g<Left><Left>

"? nnoremap gs              :<C-u>g$.$s    %<C-R><C-W>%%g<Left><Left>
"? vnoremap gs                       :s    %<C-R>/%<C-R><C-W>%g

"? "nnoremap gS              :<C-u>g$.$s    %<C-R><C-W>%<C-R><C-W>%g<Left><Left>

"? nnoremap gS              :<C-u>g$.$s    %<C-R>"%%g<Left><Left>
"? nnoremap gS                       :s    %<C-R>"%%g<Left><Left>

"? nnoremap <Leader>s           :<C-u>s    %%%g<Left><Left><Left>


"cnoremap <expr> <C-g> match(getcmdline(), '\(g.\..s\\|s\)    /') == 0 ? '<End>/g' :
"                    \ match(getcmdline(), '\(g.\..s\\|s\)    %') == 0 ? '<End>/g' : ''


"----------------------------------------------------------------------------------------
" Symbol_Rename    ( Search -> CWord )

" 関数内のシンボルだけを置換
" TODO Cの特定の書き方しか対応してない。
function!  s:rename_func_inner_symbol() 
  let sword = @/
  let cword = expand('<cword>')

  PushPos

  " 2jは、関数の先頭に居た時用
  " 2kは、関数定義行を含むため
  " TODO いずれも暫定
  keepjumps normal! 2j[[2k
  let first_line = line('.')
  keepjumps normal! ][
  let last_line = line('.')

  let cmd_range = first_line . ',' . last_line
  "echo cmd_range

  let cmd_body = 's/' . sword . '/' . cword . '/g'

  let cmd = cmd_range . cmd_body

  exe cmd

  PopPos
endfunction

com! RenameFuncInnerSymbol call s:rename_func_inner_symbol()

" 関数内のシンボルだけを置換
nnoremap <silent> <Leader>s :<C-u>RenameFuncInnerSymbol<CR>
nmap gs <Leader>s

" ファイル内全てのシンボルを置換
nnoremap <silent> <Leader>S :<C-u>PushPos<CR>:g$.$s    /<C-r>//<C-r><C-w>/g<CR>:PopPos<CR>:let @/='<C-r><C-w>'<CR>
nmap gS <Leader>S


"----------------------------------------------------------------------------------------
" 残りのキー
"
" 1   2   3       4              5
" gs  gS  g<C-s>  <Leader><C-s>  zS


" Substitute }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Grep {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

set grepprg=$HOME/bin/ag\ --line-numbers
set grepprg=/usr/bin/grep\ -an
set grepprg=git\ grep\ --no-index\ -I\ --line-number
set grepprg=git\ grep\ -I\ --line-number

"========================================================

nnoremap !             :<C-u>grep ''<Left>
nnoremap <Leader>g     :<C-u>grep '<C-R>/'<CR>
nnoremap <silent> <C-g><C-g> :<C-u>grep '\<<C-R><C-W>\>'<CR>
nnoremap <silent> <C-g><C-g> :<C-u>grep '\<<C-R><C-W>\>' -- ':!.svn/' ':!tags'<CR>
nnoremap <silent> <C-g><C-g> :<C-u>exe 'noautocmd cd ' GetPrjRoot() <Bar> echo 'GGrep  \<' . expand('<cword>') . '\> ... ' <Bar> silent grep '\<<C-R><C-W>\>' -- ':!.svn/' ':!tags'<CR>
nnoremap <silent> <C-g><C-g> :<C-u>exe 'noautocmd cd ' GetPrjRoot() <Bar> echo "GGrep  '\\<" . expand('<cword>') . "\\>'  ... " <Bar> silent grep '\<<C-R><C-W>\>' -- ':!.svn/' ':!tags'<CR>
nnoremap <silent> <C-g><C-g> :<C-u>exe 'noautocmd cd ' GetPrjRoot() <Bar> echo "GGrep  '\\<" . expand('<cword>') . "\\>'  ... " <Bar> silent grep '\<<C-R><C-W>\>' -- ':!.git/' ':!.svn/' ':!tags'<CR>
nnoremap <silent> <C-g><C-a> :<C-u>exe 'noautocmd cd ' GetPrjRoot() <Bar> echo 'GGrep  --no-index    \<' . expand('<cword>') . '\>  ... ' <Bar> silent grep --no-index !'\<<C-R><C-W>\>' -- ':!.svn/' ':!tags'<CR>
nnoremap <silent> <C-g><C-a> :<C-u>exe 'noautocmd cd ' GetPrjRoot() <Bar> echo 'GGrepAll  \<' . expand('<cword>') . '\>  ... ' <Bar> silent grep --no-index !'\<<C-R><C-W>\>' -- ':!.svn/' ':!tags'<CR>

"========================================================

function! GGrep(word)
  exe 'noautocmd cd ' GetPrjRoot()
  echo a:word
 echo 'silent grep -E' a:word '-- :!.svn/ :!tags'
  exe 'silent grep -E' a:word '-- :!.svn/ :!tags'
endfunction
function! GGrep(word)
  exe 'noautocmd cd ' GetPrjRoot()
  echo a:word
  let cmd = 'silent grep -E ' . a:word . ' -- :!.svn/ :!tags'
  echo cmd
  exe cmd
endfunction
function! GGrep(word, add = v:false)
  exe 'noautocmd cd ' GetPrjRoot()
  echo a:word
  let cmd = 'silent grep' . (a:add ? 'add' : '') . ' -E ' . a:word . ' -- :!.svn/ :!tags'
  echo cmd
  exe cmd
endfunction
function! GGrep(word, add = v:false, location_list = v:false)
  exe 'noautocmd cd ' GetPrjRoot()
  echo a:word
  let cmd = 'silent ' . (a:location_list ? 'l' : '') . 'grep' . (a:add ? 'add' : '') . ' -E ' . a:word . ' -- :!.svn/ :!tags'
  echo cmd
  exe cmd
endfunction

function! GGrep(word, add = v:false, location_list = v:false)
  echo a:word
  let cmd = 'silent ' . (a:location_list ? 'l' : '') . 'grep' . (a:add ? 'add' : '') . ' -E ' . a:word . ' -- :!.svn/ :!tags'
  echo cmd

  "? let save_autochdir = &autochdir
  "? set noautochdir
  exe 'noautocmd cd ' GetPrjRoot()

  " Setpathを発動させないよう、noautocmd付き。
  " TODO Setpathに関わるcmdだけを禁止しないと、必要なcmdが実行されない。
  "? exe 'noautocmd ' cmd
  "? copen

  try
    " Setpathを発動させない。
    set eventignore=BufRead,BufNewFile,BufNew
    exe cmd
  finally
    set eventignore=
  endtry

  "? let &autochdir = save_autochdir
endfunction

com! -nargs=+ GGrep call GGrep(<q-args>)
com! -nargs=+ GG    call GGrep(<q-args>)
com! -nargs=+ GGA   call GGrep(<q-args>, v:true)

com! -nargs=+ LGG   call GGrep(<q-args>, v:false, v:true)
com! -nargs=+ GGL   call GGrep(<q-args>, v:false, v:true)
nnoremap <silent> <C-g><C-l> :<C-u>LGG '\<<C-R><C-W>\>'<CR>

nnoremap <silent> <C-g><C-g> :<C-u>echo "GGrep  '\\<" . expand('<cword>') . "\\>'  ... " <Bar> silent GG '\<<C-R><C-W>\>'<CR>

function! QfChdir(dir)
  cclose

  let save_autochdir = &autochdir
  set noautochdir

  let org_dir = getcwd()
  exe 'noautocmd cd ' a:dir

  copen

  exe 'noautocmd cd' org_dir

  let &autochdir = save_autochdir
endfunction

com! QfChdirPrjRoot call QfChdir(   GetPrjRoot())

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


"----------------------------------------------------------------------------------------
"TODO
" 2 コマンド vim, grep
" 2 結果     new, add
" 2 git      index, no-index
" 5 範囲     cur_file, cur_dir, cur_dir&childs, prj, user_input
" 3 拡張子   all, cur(c,h), user_input
" 4 対象     user_input, cword, register, search
" 2 QL       quickfix, location_list
"----------------------------------------------------------------------------------------


"========================================================

nnoremap <Leader>g :<C-u>vim "\<<C-r><C-w>\>" *.c<CR>

" Grep }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Quickfix & Locationlist {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

let c_jk_local = 0

nnoremap <silent> <Plug>(MyVimrc-Toggle-Qf-Ll) :<C-u>let c_jk_local = !c_jk_local<CR>

"例外をキャッチしないと、最初と最後の要素の次に移動しようとして例外で落ちる。
nnoremap <silent> <Plug>(MyVimrc-CNext) :<C-u>try <Bar> exe (c_jk_local ? ":lnext" : "cnext") <Bar> catch <Bar> endtry<CR>:FuncNameStl<CR>
nnoremap <silent> <Plug>(MyVimrc-CPrev) :<C-u>try <Bar> exe (c_jk_local ? ":lprev" : "cprev") <Bar> catch <Bar> endtry<CR>:FuncNameStl<CR>

"例外をキャッチしないと、最初と最後の要素の次に移動しようとして例外で落ちる。
nnoremap <silent> <Plug>(MyVimrc-QfNext) :<C-u>try <Bar> cnext <Bar> catch <Bar> endtry<CR>:FuncNameStl<CR>
nnoremap <silent> <Plug>(MyVimrc-QfPrev) :<C-u>try <Bar> cprev <Bar> catch <Bar> endtry<CR>:FuncNameStl<CR>

"例外をキャッチしないと、最初と最後の要素の次に移動しようとして例外で落ちる。
nnoremap <silent> <Plug>(MyVimrc-LlNext) :<C-u>try <Bar> lnext <Bar> catch <Bar> endtry<CR>:FuncNameStl<CR>
nnoremap <silent> <Plug>(MyVimrc-LlPrev) :<C-u>try <Bar> lprev <Bar> catch <Bar> endtry<CR>:FuncNameStl<CR>

nmap <silent> <Del> <Plug>(MyVimrc-QfNext)
nmap <silent> <Ins> <Plug>(MyVimrc-QfPrev)
nmap <silent> <A-n> <Plug>(MyVimrc-LlNext)
nmap <silent> <A-m> <Plug>(MyVimrc-LlPrev)

" Quickfix & Locationlist }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Tag, Jump, and Unified CR {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" Browse
if 0
  "nnoremap H <C-o>
  "nnoremap L <C-i>

  "nmap H <Plug>(BrowserJump-Back)
  "nmap L <Plug>(BrowserJump-Foward)

  "nnoremap <silent> H :<C-u>pop<CR>
  "nnoremap <silent> L :<C-u>tag<CR>

  "nmap <BS>H  <Plug>(MyVimrc-WindowSplitAuto)<C-w>p<Plug>(BrowserJump-Back)
  "nmap <BS>L  <Plug>(MyVimrc-WindowSplitAuto)<C-w>p<Plug>(BrowserJump-Foward)

  "nmap <BS>H  <Plug>(MyVimrc-WindowSplitAuto)<Plug>(MyVimrc-WinCmd-p)<Plug>(BrowserJump-Back)
  "nmap <BS>L  <Plug>(MyVimrc-WindowSplitAuto)<Plug>(MyVimrc-WinCmd-p)<Plug>(BrowserJump-Foward)
else
  nmap <C-p>      <Plug>(BrowserJump-Back)
  nmap <C-n>      <Plug>(BrowserJump-Foward)

  nmap <BS><C-p>  <Plug>(MyVimrc-Window-AutoSplit)<Plug>(MyVimrc-WinCmd-p)<C-p>
  nmap <BS><C-n>  <Plug>(MyVimrc-Window-AutoSplit)<Plug>(MyVimrc-WinCmd-p)<C-n>
endif


" ---------------
" Unified CR
"   数字付きなら、行へジャンプ
"   qfなら当該行へジャンプ
"   helpなら当該行へジャンプ
"   それ以外なら、タグジャンプ
" ---------------
function! Unified_CR(mode)

  if v:prevcount
    "jumpする前に登録しないと、v:prevcountが上書されてしまう。
    call histadd('cmd', v:prevcount)
    "jumplistに残すために、Gを使用。
    exe 'normal!' v:prevcount . 'G'
    return
  endif

 "if &ft == 'qf'
  if &buftype == 'quickfix'
    call feedkeys("\<CR>:FF2\<CR>", 'nt')
    return
 "elseif &ft == 'help'
  elseif &buftype == 'help'
    call feedkeys("\<C-]>", 'nt')
    return
  endif

  if EmIsNum()
    EmDispNoTimeOut
    return
  endif

  if JumpToDefine(a:mode) <= 0
    return
  endif

  if &ft == 'vim'
    try
      exe 'help ' . expand('<cword>')

      let g:TagMatch = matchadd('TagMatch', '\<' . expand("<cword>") . '\>')
      let g:TimerTagMatch = timer_start(s:TagHighlightTime, 'TagHighlightDelete')
      let g:TagMatchI[g:TimerTagMatch] = g:TagMatch
      augroup ZZZZ
        au!
        au WinLeave * call TagHighlightDelete(g:TimerTagMatch)
      augroup end
      return
    catch
      "keeppatterns normal! gd
    endtry
  endif
  "keeppatterns normal! gd

  if search('\%#\f', 'bcn')
    try
      normal! gf
      if v:version < 802
        echohl Search
        echo 'Go File' . repeat(' ', &columns - 40)
        echohl None
      elseif 1
        " Cursor 下
        call popup_create('    Go  File    ' , #{
              \ line: 'cursor+3',
              \ col: 'cursor',
              \ posinvert: v:true,
              \ wrap: v:false,
              \ zindex: 200,
              \ highlight: 'SLFileName',
              \ border: [1, 1, 1, 1],
              \ borderhighlight: ['QuickFixLine'],
              \ moved: 'any',
              \ time: 2000,
              \ })
      else
        " Center
        call popup_create('                G o    F i l e                ' , #{
              \ line: 'cursor+2',
              \ col: 'cursor',
              \ pos: 'center',
              \ posinvert: v:true,
              \ wrap: v:false,
              \ zindex: 200,
              \ highlight: 'SLFileName',
              \ border: [1, 1, 1, 1],
              \ borderhighlight: ['QuickFixLine'],
              \ padding: [1, 1, 1, 1],
              \ moved: 'any',
              \ time: 2000,
              \ })
      endif
    catch /E447/
    finally
    endtry
    return
  endif

  keeppatterns normal! gd

endfunction


" ----------------------------------------------------------------------------------------------
" Tag Match

augroup MyVimrc_TagMatch
  au!
  au ColorScheme * hi TagMatch	guibg=#c0504d	guifg=white
augroup end

function! TagHighlightDelete(dummy)
  call timer_stop(a:dummy)

  "echo a:dummy
  "sleep 5
  "call matchdelete(g:TagMatch)
  call matchdelete(g:TagMatchI[a:dummy])
  call remove(g:TagMatchI, a:dummy . '')
  "echo g:TagMatchI

  if a:dummy == g:TimerTagMatch0
    au! ZZZZ0
    "ここでreturnしないと、この下のif文でg:TimerTagMatchが未定義エラーになる。
    return
  endif
  if a:dummy == g:TimerTagMatch
    au! ZZZZ
    return
  endif
endfunction

let g:TagMatchI = {}
let s:TagHighlightTime = 1500  " [ms]

" TODO
"   ラベルならf:b
"   変数なら、スクロールしない
"   引数のタグ
"   asmのタグ
function! JumpToDefine(mode)
  let w0 = expand("<cword>")

  if w0 !~ '\<\i\+\>'
    return -1
  endif

  let w = w0

  let g:TagMatch0 = matchadd('TagMatch', '\<'.w.'\>')
  let g:TimerTagMatch0 = timer_start(s:TagHighlightTime, 'TagHighlightDelete')
  let g:TagMatchI[g:TimerTagMatch0] = g:TagMatch0
  augroup ZZZZ0
    au!
    au WinLeave * call TagHighlightDelete(g:TimerTagMatch0)
  augroup end
  redraw

  for i in range(2)
    try
      if 0
        if a:mode =~? 's'
          exe (a:mode =~? 'p' ? 'p' : (a:mode =~? 'w' ? 's' : '')) . "tselect " . w
        else
          exe (a:mode =~? 'p' ? 'p' : (a:mode =~? 'w' ? 's' : '')) . "tjump " . w
        endif
      else
        if ! TTTT(w, a:mode)
          " TODO 無理やり例外を発生させる
          throw ':E426:'
        endif
      endif
      " 表示範囲を最適化
      exe "normal! z\<CR>" . (winheight(0)/4) . "\<C-y>"
      " カーソル位置を調整 (C専用)
      call PostTagJumpCursor_C()
      let g:TagMatch = matchadd('TagMatch', '\<'.w.'\>')
      let g:TimerTagMatch = timer_start(s:TagHighlightTime, 'TagHighlightDelete')
      let g:TagMatchI[g:TimerTagMatch] = g:TagMatch
      augroup ZZZZ
	au!
	au WinLeave * call TagHighlightDelete(g:TimerTagMatch)
      augroup end
      return 0
    catch /:E426:/
      if w0 =~ '^_'
	" 元の検索語は"_"始まり
	let w = substitute(w0, '^_', '', '')
      else
	" 元の検索語は"_"始まりでない
	let w = '_' . w0
      endif
      if i == 0
	" エラーメッセージ表示用にオリジナル単語でのエラー文字列を保存
      let exception = v:exception
      endif
    catch /:E433:/
      echohl ErrorMsg | echo matchstr(v:exception, 'E\d\+:.*') | echohl None
      return 1
    endtry
  endfor
  echohl ErrorMsg | echo matchstr(exception, 'E\d\+:.*') | echohl None
  return 1
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

nmap <BS><CR>     <Plug>(MyVimrc-Window-AutoSplit)<CR>
nmap <S-CR>       <Plug>(MyVimrc-Window-AutoSplit)<CR>
nmap <Leader><CR> <Plug>(MyVimrc-Window-AutoSplit-Rev)<CR>

" Tag, Jump, and Unified CR }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Diff {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


"set diffopt+=iwhite
" 一括で設定すると値が重複するバグ?
"set diffopt+=internal,filler,algorithm:histogram,indent-heuristic

set diffopt+=internal
set diffopt+=filler
set diffopt+=algorithm:histogram
set diffopt+=indent-heuristic


" diff Cancel
nnoremap dc    :<C-u>diffoff<CR>
nnoremap d<BS> :<C-u>diffoff<CR>


" diff (all window) Quit
nnoremap <silent> dq
     \ :<C-u>PushPosAll <Bar> exe 'windo diffoff' <Bar> PopPosAll<CR>
      \:echo 'windo diffoff'<CR>


" diff (all window and buffer) Quit
nnoremap <silent> dQ
     \ :<C-u>PushPosAll <Bar> exe 'bufdo diffoff' <Bar> exe 'windo diffoff' <Bar> PopPosAll<CR>
      \:echo 'bufdo diffoff <Bar> windo diffoff'<CR>


" diff Update
nmap du d<Space>


" diff I(l)gnorecase
nnoremap <expr> dl match(&diffopt, 'icase' ) < 0 ? ':<C-u>set diffopt+=icase<CR>'  : ':<C-u>set diffopt-=icase<CR>'


" diff whi(Y)tespace
nnoremap <expr> dy match(&diffopt, '\<iwhite\>') < 0 ? ':<C-u>set diffopt+=iwhite<CR>' : ':<C-u>set diffopt-=iwhite<CR>'


" diff toggle
nnoremap <expr> dx
        \ &diff ? ':<C-u>diffoff<CR>' :
        \ winnr('$') == 2 ? ':<C-u>PushPosAll <Bar> exe "windo diffthis" <Bar> PopPosAll<CR>' :
        \ ':<C-u>diffthis<CR>'

nnoremap d<Leader> dx


" diff Special

function! DiffSpecial()
  if &diff | echo 'diffupdate' | diffupdate | return | endif

  let win = s:get_diff_special_windows()

  if win == [] | echo 'diffthis' | diffthis | return | endif

  echo 'Diff Execute Win' win
  PushPosAll
  for i in win
    exe i 'wincmd w' | diffthis
  endfor
  PopPosAll
endfunction

function! s:get_diff_special_windows()
  let ret = []

  for winnr in range(1, winnr('$'))
    if s:is_diff_special_window(winnr)
      call add(ret, winnr)
    endif
  endfor

  return (len(ret) == 2) ? ret : []
endfunction

" Diff Specialの判定では、次のWindowを除いて、Window数が2個ならDiffするようにする。
"   NERDTree, Terminal, Quickfix, Locationlist
function! s:is_diff_special_window(winnr)
  let bufnr   = winbufnr(a:winnr)
  let bufname = bufname(bufnr)
  let buftype = getbufvar(bufnr, '&buftype')

  if buftype =~ 'quickfix' || buftype =~ 'help' || buftype =~ 'terminal'
    return v:false
  elseif bufname =~ '^NERD_tree_'
    return v:false
  endif
  return v:true
endfunction

nnoremap d<Space> :<C-u>call DiffSpecial()<CR>


" Git Diff
"   ・Windowが1つだけならそのタブで、そうでなければ新しいタブで実行。
"   ・Focusを元のWindowへ戻す。
"   ・なぜかfeedkeysにしないと、ウィンドウ移動できない。マップ中にウィンドウを作成すると、それを認識できないようだ。
"   ・Gdiffsplit実行中は、コマンドラインにGdiffsplitが見えるようにする。
nnoremap d<CR> :<C-u>exe ( winnr('$') > 1 ? 'tab split' : '' )<CR>:Gdiffsplit<CR>:call feedkeys('<C-v><C-w>L<C-v><C-w>p', 'nt')<CR>
" TODO なぜかfeedkeysに<C-v>を付けないといけない。


" Next Hunk
"nnoremap <silent> <Tab> ]c^zz:FuncNameStl<CR>
nnoremap <silent> <Tab>   ]c^:FuncNameStl<CR>

" Previouse Hunk
"nnoremap <silent> <S-Tab> [c^zz:FuncNameStl<CR>
nnoremap <silent> <S-Tab> [c^:FuncNameStl<CR>


" diff accept (obtain and next, obtain and previouse) (dotは、repeat'.')

let g:DiffAcceptComfirmTime = 500  " [ms]

nnoremap d. do:exe 'sleep' g:DiffAcceptComfirmTime . 'm'<CR>]c^zz
nnoremap d, do:exe 'sleep' g:DiffAcceptComfirmTime . 'm'<CR>[c^zz


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

" Vert       Split すべきとき、正数が返る。
" Horizontal Split すべきとき、負数が返る。
function! s:SplitDirection()
  return ( winwidth(0) > (&columns * 7 / 10) && <SID>WindowRatio() >=  0 ) ? '9999' : '-9999'
endfunction


"----------------------------------------------------------------------------------------
" Trigger

nmap <BS> <C-w>


"----------------------------------------------------------------------------------------
" Split & New

" Auto Split
nnoremap <silent> <expr> <Plug>(MyVimrc-Window-AutoSplit)
      \ ( <SID>SplitDirection() >= 0 ? "\<C-w>v" : "\<C-w>s" ) . ':diffoff<CR>'
nnoremap <silent> <expr> <Plug>(MyVimrc-Window-AutoSplit-Rev)
      \ ( <SID>SplitDirection() <  0 ? "\<C-w>v" : "\<C-w>s" ) . ':diffoff<CR>'

nnoremap <silent> <expr> <Plug>(MyVimrc-Window-AutoSplit-Dumb)
      \ ( <SID>WindowRatio() >= 0 ? "\<C-w>v" : "\<C-w>s" ) . ':diffoff<CR>'
nnoremap <silent> <expr> <Plug>(MyVimrc-Window-AutoSplit-Rev-Dumb)
      \ ( <SID>WindowRatio() <  0 ? "\<C-w>v" : "\<C-w>s" ) . ':diffoff<CR>'

nmap <BS><BS>         <Plug>(MyVimrc-Window-AutoSplit-Dumb)
nmap m                <Plug>(MyVimrc-Window-AutoSplit-Dumb)
nmap <Leader><Leader> <Plug>(MyVimrc-Window-AutoSplit-Rev-Dumb)

" Tag, Jump, and Unified CR を参照。

" Manual
nnoremap <silent> _                <C-w>s:setl noscrollbind<CR>
nnoremap <silent> _                <C-w>s:diffoff<CR>
nnoremap <silent> g_               <C-w>n
nnoremap <silent> U                :<C-u>new<CR>
nnoremap <silent> <Bar>            <C-w>v:setl noscrollbind<CR>
nnoremap <silent> <Bar>            <C-w>v:diffoff<CR>
nnoremap <silent> g<Bar>           :<C-u>vnew<CR>

" Auto New
nnoremap <silent> <expr> <Plug>(MyVimrc-Window-AutoNew)
      \ ( winwidth(0) > (&columns * 7 / 10) && <SID>WindowRatio() >=  0 ) ? ':<C-u>vnew<CR>' : '<C-w>n'


"----------------------------------------------------------------------------------------
" Close

" TODO NERDTreeも閉じられるようにする。
nnoremap <silent> q         <C-w><C-c>
nnoremap <silent> <Leader>q :<C-u>q<CR>

" 補償
nnoremap <C-q>  q
nnoremap <C-q>: q:
nnoremap <C-q>; q:
nnoremap <C-q>/ q/
nnoremap <C-q>? q?

" ウィンドウレイアウトを崩さないでバッファを閉じる   (http://nanasi.jp/articles/vim/kwbd_vim.html)
com! CloseWindow let s:kwbd_bn = bufnr('%') | enew | exe 'bdel '. s:kwbd_bn | unlet s:kwbd_bn


"? "----------------------------------------------------------------------------------------
"? " On tab close Move to previouse tab
"? 
"? augroup MyVimrc_LastTab
"?   au!
"?   au TabLeave  * let g:PreviouseTab = tabpagenr()
"?  "au TabClosed * exe 'tabn' g:PreviouseTab
"? augroup end
"? 
"? if !exists('g:PreviouseTab')
"?   let g:PreviouseTab = 1
"? endif
"? 
"? nnoremap <silent> <expr> q         '<C-w><C-c>' . LastTab()
"? nnoremap <silent> <expr> <Leader>q ':<C-u>q<CR>' . LastTab()
"? 
"? function! LastTab()
"?   let g:PreviouseTab -= tabpagenr() < g:PreviouseTab ? 1 : 0
"?   return ( winnr('$') == 1 ? g:PreviouseTab . 'gt' : '' )
"? endfunction
"? 
"? "----------------------------------------------------------------------------------------
"? " On tab close Move to previouse tab
"? 
"? augroup MyVimrc_LastTab
"?   au!
"?   au TabLeave  * let g:PreviouseTab = tabpagenr()
"?   au TabClosed * exe 'tabn' g:PreviouseTab
"? augroup end
"? 
"? if !exists('g:PreviouseTab')
"?   let g:PreviouseTab = 1
"? endif
"? 
"? nnoremap <silent> <expr> q         '<C-w><C-c>' . LastTab()
"? nnoremap <silent>        <Leader>q :<C-u>q<CR>
"? 
"? function! LastTab()
"?   let cur_tab = tabpagenr('')
"?   let g:PreviouseTab -= tabpagenr() < g:PreviouseTab ? 1 : 0
"?   return '<C-w><C-c>' . ( winnr('$') == 1 ? g:PreviouseTab . 'gt' : '' )
"? endfunction


"----------------------------------------------------------------------------------------
" Focus

" Basic
"nmap t <Plug>(Window-Focus-SkipTerm-Inc)
"nmap T <Plug>(Window-Focus-SkipTerm-Dec)
" Unified_Spaceを参照。

" Direction Focus
nmap H <Plug>(Window-Focus-WrapMove-h)
"nmap J <Plug>(Window-Focus-WrapMove-j)
"nmap K <Plug>(Window-Focus-WrapMove-k)
nmap L <Plug>(Window-Focus-WrapMove-l)

vnoremap H <C-w>h
vnoremap J <C-w>j
vnoremap K <C-w>k
vnoremap L <C-w>l

" 便利化
let g:WinFocusThresh = 5
"nmap <expr> J winnr('$') >= g:WinFocusThresh ? '<Plug>(Window-Focus-WrapMove-j)' : '<Plug>(Window-Focus-SkipTerm-Inc)'
"nmap <expr> K winnr('$') >= g:WinFocusThresh ? '<Plug>(Window-Focus-WrapMove-k)' : '<Plug>(Window-Focus-SkipTerm-Dec)'

" 数値指定対応
nmap <expr> J v:prevcount ? '<Esc>' . v:prevcount . '<C-w>w' : winnr('$') >= g:WinFocusThresh ? '<Plug>(Window-Focus-WrapMove-j)' : '<Plug>(Window-Focus-SkipTerm-Inc)'
nmap <expr> K v:prevcount ? '<Esc>' . v:prevcount . '<C-w>w' : winnr('$') >= g:WinFocusThresh ? '<Plug>(Window-Focus-WrapMove-k)' : '<Plug>(Window-Focus-SkipTerm-Dec)'

if 0
  nmap J <Plug>(Window-Focus-SkipTerm-Inc)
  nmap K <Plug>(Window-Focus-SkipTerm-Dec)
  if 0
    nunmap H
    nunmap L
  endif
endif

" 補償
nnoremap gM M
nnoremap gH H
nnoremap gL L
if 0
  noremap m   J
  noremap gm gJ
elseif 0
  noremap M   J
  noremap gM gJ
else
  nnoremap U   J
  nnoremap gU gJ
endif

" Direction Focus (Terminal)
tnoremap <S-Left>  <C-w>h
tnoremap <S-Down>  <C-w>j
tnoremap <S-Up>    <C-w>k
tnoremap <S-Right> <C-w>l

" Terminal Windowから抜ける。 (Windowが１つしかないなら、Tabから抜ける。)
tnoremap <expr> <C-Tab>    winnr('$') == 1 ? '<C-w>:tabNext<CR>' : '<C-w>p'
tnoremap <expr> <C-t>      winnr('$') == 1 ? '<C-w>:tabNext<CR>' : '<C-w>p'
tnoremap <expr> <C-w><C-w> winnr('$') == 1 ? '<C-w>:tabNext<CR>' : '<C-w>p'


"----------------------------------------------------------------------------------------
" Resize

" 漸次
nnoremap <silent> <C-h>  <Esc><C-w>+:call <SID>best_scrolloff()<CR>
nnoremap <silent> <C-l>  <Esc><C-w>-:call <SID>best_scrolloff()<CR>
nnoremap <silent> t  <Esc><C-w>+:call <SID>best_scrolloff()<CR>
nnoremap <silent> T  <Esc><C-w>-:call <SID>best_scrolloff()<CR>
nnoremap <silent> <S-BS> <Esc><C-w>+:call <SID>best_scrolloff()<CR>
nnoremap <silent> <C-BS> <Esc><C-w>-:call <SID>best_scrolloff()<CR>
nnoremap <silent> (      <Esc><C-w>3<
nnoremap <silent> )      <Esc><C-w>3>

tnoremap <silent> <C-up>    <C-w>+:call <SID>best_scrolloff()<CR>
tnoremap <silent> <C-down>  <C-w>-:call <SID>best_scrolloff()<CR>
tnoremap <silent> <C-left>  <C-w><
tnoremap <silent> <C-right> <C-w>>

" 補償
nnoremap <silent> <A-o> <C-l>

" 最小化・最大化
"nnoremap <silent> g<C-j> <esc><C-w>_:call <SID>best_scrolloff()<CR>
"nnoremap <silent> g<C-k> <esc>1<C-w>_:call <SID>best_scrolloff()<CR>
"nnoremap <silent> g<C-h> <esc>1<C-w>|
"nnoremap <silent> g<C-l> <esc><C-w>|

nmap @  <Plug>(Window-Resize-EqualOnlyWidth)
nmap g@ <Plug>(Window-Resize-EqualOnlyHeight)

nmap <Leader><Leader> <Plug>(Window-Resize-OptimalWidth)
nmap <Leader><BS>     <Plug>(Window-Resize-OptimalHeight)

" Submode
call submode#enter_with('WinSize', 'n', 's', '<C-w>+', '<C-w>+:call BestScrolloff()<CR>')
call submode#enter_with('WinSize', 'n', 's', '<C-w>-', '<C-w>-:call BestScrolloff()<CR>')
call submode#enter_with('WinSize', 'n', 's', '<C-w>>', '<C-w>>')
call submode#enter_with('WinSize', 'n', 's', '<C-w><', '<C-w><')
call submode#map(       'WinSize', 'n', 's', '+', '<C-w>+:call BestScrolloff()<CR>')
call submode#map(       'WinSize', 'n', 's', '=', '<C-w>+:call BestScrolloff()<CR>') " Typo対策
call submode#map(       'WinSize', 'n', 's', '-', '<C-w>-:call BestScrolloff()<CR>')
call submode#map(       'WinSize', 'n', 's', '>', '<C-w>>')
call submode#map(       'WinSize', 'n', 's', '<', '<C-w><')
if 1
  call submode#enter_with('WinSize', 'n', 's', '<C-w>h', '<C-w><')
  call submode#enter_with('WinSize', 'n', 's', '<C-w>j', '<C-w>+:call BestScrolloff()<CR>')
  call submode#enter_with('WinSize', 'n', 's', '<C-w>k', '<C-w>-:call BestScrolloff()<CR>')
  call submode#enter_with('WinSize', 'n', 's', '<C-w>l', '<C-w>>')
endif
if 0
  call submode#map(       'WinSize', 'n', 's', 'h', '<C-w>h')
  call submode#map(       'WinSize', 'n', 's', 'j', '<C-w>j')
  call submode#map(       'WinSize', 'n', 's', 'k', '<C-w>k')
  call submode#map(       'WinSize', 'n', 's', 'l', '<C-w>l')
else
  call submode#map(       'WinSize', 'n', 's', 'h', '<C-w><')
  call submode#map(       'WinSize', 'n', 's', 'j', '<C-w>+:call BestScrolloff()<CR>')
  call submode#map(       'WinSize', 'n', 's', 'k', '<C-w>-:call BestScrolloff()<CR>')
  call submode#map(       'WinSize', 'n', 's', 'l', '<C-w>>')
endif


"----------------------------------------------------------------------------------------
" Window Move

nnoremap <silent> <A-h> <C-w>H:call <SID>best_scrolloff()<CR>
nnoremap <silent> <A-j> :<C-u>let WinMove_WinWidth = winwidth(0)<CR><C-w>J:exe WinMove_WinWidth != winwidth(0) ? 'wincmd =' : ''<CR>:call <SID>best_scrolloff()<CR>
nnoremap <silent> <A-k> :<C-u>let WinMove_WinWidth = winwidth(0)<CR><C-w>K:exe WinMove_WinWidth != winwidth(0) ? 'wincmd =' : ''<CR>:call <SID>best_scrolloff()<CR>
nnoremap <silent> <A-l> <C-w>L:call <SID>best_scrolloff()<CR>

tnoremap <silent> <A-left>  <C-w>H:call <SID>best_scrolloff()<CR>
tnoremap <silent> <A-down>  <C-w>J:call <SID>best_scrolloff()<CR>
tnoremap <silent> <A-up>    <C-w>K:call <SID>best_scrolloff()<CR>
tnoremap <silent> <A-right> <C-w>L:call <SID>best_scrolloff()<CR>


"----------------------------------------------------------------------------------------
" Reopen as Tab
" TODO diffのバッファも再現する。

nnoremap <silent> <Plug>(TabSplit) :<C-u>tab split <Bar> diffoff<CR>
nmap     <C-w><C-w> <Plug>(TabSplit)
nnoremap <C-w><C-t> <C-w>T

tnoremap <C-w><C-t> <C-w>T


"----------------------------------------------------------------------------------------
" WinCmd <Plug>

nnoremap <Plug>(MyVimrc-WinCmd-p) <C-w>p


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
    "exe "normal! \<C-w>p"
  endif
endfunction

"nnoremap <silent> gt         :<C-u>call OpenTerm()<CR>
"nnoremap <silent> gT         :terminal<CR>
"nnoremap <silent> <Leader>gt :vsplit<CR>:terminal ++curwin<CR>

"nnoremap <C-d> :<C-u>terminal<CR><C-w>p
nnoremap g<C-d> :<C-u>call OpenTerm()<CR>

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

if 0
  nnoremap K         :<C-u>ls <CR>:b<Space>
  nnoremap gK        :<C-u>ls!<CR>:b<Space>
  nnoremap <Leader>K :<C-u>ls <CR>:bdel<Space>
  nnoremap zK        :<C-u>ls <CR>:bdel<Space>
else
  nnoremap <C-k>         :<C-u>ls <CR>:b<Space>
  nnoremap g<C-k>        :<C-u>ls!<CR>:b<Space>
  nnoremap <Leader><C-k> :<C-u>ls <CR>:bdel<Space>
  nnoremap z<C-k>        :<C-u>ls <CR>:bdel<Space>

  if 0
    " CmdlineEnterイベントを起こすためには、feedkeysとする必要がある。
    function! KKK()
      call feedkeys(":ls \<CR>:b\<Space>", 'nt')
    endfunction
    nnoremap <C-k>         :<C-u>call KKK()<CR>
  endif
  nnoremap <C-k>         :<C-u>KKK<CR>:ls <CR>:b<Space>
endif

nnoremap <silent> <A-n> :<C-u>bnext<CR>
nnoremap <silent> <A-p> :<C-u>bprev<CR>

nnoremap <Leader>z :<C-u>bdel
nnoremap <Leader>Z :<C-u>bdel!

" Buffer }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Tab {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

nnoremap <silent>  <C-t>  :<C-u>tabnew<CR>
nnoremap <silent>  <C-t>  :<C-u>tabnew<CR>:SetpathSilent<CR>
nnoremap          g<C-t>  :<C-u>tabnew<Space>
"nnoremap <silent> z<C-t>  :<C-u>tab split<CR>

nnoremap <C-f> gt
nnoremap <C-b> gT

nnoremap <silent> <A-f> :exe tabpagenr() == tabpagenr('$') ? 'tabmove 0' : 'tabmove +1'<CR>
nnoremap <silent> <A-b> :exe tabpagenr() == 1              ? 'tabmove $' : 'tabmove -1'<CR>


"----------------------------------------------------------------------------------------
" On tab close Move to previouse tab

augroup MyVimrc_LastTab
  au!
  " Leave , Closeイベント発生の順番がおかしいようなので、TmpとEnterが必要。
  au TabLeave  * let g:PreviouseTabTmp = tabpagenr()
  au TabEnter  * let g:PreviouseTab = g:PreviouseTabTmp
  au TabClosed * let g:PreviouseTab -= tabpagenr() < g:PreviouseTab ? 1 : 0 | exe 'tabn' g:PreviouseTab
augroup end

if !exists('g:PreviouseTab')
  let g:PreviouseTab = 1
endif

if 0
" Leave , Closeイベント発生の順番がおかしい。

augroup MyVimrc_Tab
  au!
augroup end

augroup MyVimrc_LastTab
  au!
  au TabLeave  * let g:PreviouseTab = tabpagenr()
 "au TabClosed * exe 'tabn' g:PreviouseTab
  au TabClosed * call LastTab()
augroup end

if !exists('g:PreviouseTab')
  let g:PreviouseTab = 1
endif

function! LastTab()
  echo 's' g:PreviouseTab tabpagenr()
  redraw
  sleep 2

  let g:PreviouseTab -= tabpagenr() < g:PreviouseTab ? 1 : 0

  echo 'e' g:PreviouseTab tabpagenr()
  redraw
  sleep 2

  call feedkeys(g:PreviouseTab . 'gt', 'nt' )
endfunction

endif

" Tab }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Tabline {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


"----------------------------------------------------------------------------------------
" Make TabLineStr

function! TabLineStr()
  " Tab Label
  let tab_labels = map(range(1, tabpagenr('$')), 's:make_tabpage_label(v:val)')
  let sep = '%#SLFileName# | '  " タブ間の区切り
  let tabpages = sep . join(tab_labels, sep) . sep . '%#TabLineFill#%T'

  " Left
  let left = ''
  if 0
    let left .= '%#TabLineDate#  ' . strftime('%Y/%m/%d (%a) %X') . '  '
  else
    let left .= '%#TabLineDate#  ' . strftime('%X') . ' '
  endif
  let left .= '%#SLFileName#  ' . g:BatteryInfo . '  '
  let left .= '%#TabLineDate#  '

  " Right
  let right = ''
  let right .= "%#TabLineDate#  "
 "let right .= "%#SLFileName# %{'[ '. substitute(&diffopt, ',', ', ', 'g') . ' ]'} "
  let right .= '%#TabLineDate#  ' . s:TablineStatus . '/' . (s:TablineStatusNum - 1)
  let right .= '%#TabLineDate#  '

  return left . '%##    %<' . tabpages . '%=  ' . right
endfunction
function! TabLineStr()
  " Tab Label
  let tab_labels = map(range(1, tabpagenr('$')), 's:make_tabpage_label(v:val)')
 "let sep = '%#SLFileName# | '  " タブ間の区切り
  let sep = '%#TabLineSep#| '  " タブ間の区切り
  let sep = '%#TabLineSep# | '  " タブ間の区切り
  let tabpages = sep . join(tab_labels, sep) . sep . '%#TabLineFill#%T'

  " Left
  let left = ''
  if 0
    let left .= '%#TabLineDate#  ' . strftime('%Y/%m/%d (%a) %X') . '  '
  else
   "let left .= '%#TabLineDate# 💮 %#SLFileName#  ' . strftime('%X') . '  %#TabLineDate#    '
    let left .= '%#TabLineDate# ' . (winnr('$') > g:WinFocusThresh ? '💎' : '🐎') . ' %#SLFileName#  ' . strftime('%X') . '  %#TabLineDate#    '
  endif
  let left .= '%#SLFileName# ' . g:BatteryInfo . '  '
  let left .= '%#TabLineDate#    '

  " Right
  let right = ''
  let right .= "%#TabLineDate#  "

  if 0
    let right .= "%#SLFileName# %{'[ '. substitute(&diffopt, ',', ', ', 'g') . ' ]'} "
  elseif 0
    let right .= "%#SLFileName# [ "
    let right .= "(&diffopt =~ '\<iwhite\>' ? '%#SLNoNameDir#' : '%#SLFileName#') " . "White"
    let right .= "(&diffopt =~ 'icase'  ? '%#SLNoNameDir#' : '%#SLFileName#') " . "Case"
    let right .= "%#SLFileName ] "
  else
    let right .= "%#SLFileName# [ "
    let right .= (&diffopt =~ '\<iwhite\>' ? "%#SLNoNameDir#" : "%#SLFileName#") . "White "
    let right .= (&diffopt =~ 'icase'  ? "%#SLNoNameDir#" : "%#SLFileName#") . "Case"
    let right .= "%#SLFileName# ] "
  endif

 "let right .= '%#TabLineDate#  ' . s:TablineStatus . '/' . (s:TablineStatusNum - 1)
  let right .= '%#TabLineDate# 💻 ' . s:TablineStatus . '/' . (s:TablineStatusNum - 1)
  let right .= '%#TabLineDate#  '

  return left . '%#TabLineFill#    %<' . tabpages . '%#TabLineFill#%=  ' . right
  "return left . '%#SLFileName#    %<' . tabpages . '%#SLFileName#%=  ' . right
  return left . '%##%<' . tabpages . '%=  ' . right
endfunction


"----------------------------------------------------------------------------------------
" Make TabLabel

function! s:make_tabpage_label(n)
  " カレントタブページかどうかでハイライトを切り替える
  "let hi = a:n is tabpagenr() ? '%#Directory#' : '%#TabLine#'
  "let hi = a:n is tabpagenr() ? '%#SLFileName#' : '%#TabLine#'
  "let hi = a:n is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
  let hi = a:n is tabpagenr() ? '%#TabLineSel#' : '%#VertSplit#'

  if s:TablineStatus == 1 | return hi . ' [ ' . a:n . ' ] %#TabLineFill#' | endif

  " タブ内のバッファのリスト
  let bufnrs = tabpagebuflist(a:n)

  " タブ内に変更ありのバッファがあったら '+' を付ける
  let mod = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ? ' +' : ''

  " バッファ数
  let num = '(' . len(bufnrs) . ')'

  if s:TablineStatus == 2 | return hi . ' [ ' . a:n . ' ' . num . mod . ' ] %#TabLineFill#' | endif

  " タブ番号
  let no = '[' . a:n . ']'

  " カレントバッファ
  let curbufnr = bufnrs[tabpagewinnr(a:n) - 1]  " tabpagewinnr() は 1 origin
  let buf_name = ( s:TablineStatus =~ '[345]' ? expand('#' . curbufnr . ':t') : pathshorten(bufname(curbufnr)) )  " let buf_name = pathshorten(expand('#' . curbufnr . ':p'))
  let buf_name = buf_name == '' ? 'No Name' : buf_name  " 無名バッファは、バッファ名が出ない。

  " 最終的なラベル
  let label = no . (s:TablineStatus != 3 ? (' ' . num) : '') . (s:TablineStatus =~ '[57]' ? mod : '') . ' '  . buf_name
  return '%' . a:n . 'T' . hi . '  ' . label . '%T  %#TabLineFill#'
endfunction


"----------------------------------------------------------------------------------------
" Switch TabLine Status

function! s:ToggleTabline(arg)
  if (a:arg . '') == ''
    let s:TablineStatus = ( s:TablineStatus + 1 ) % s:TablineStatusNum
  elseif a:arg < s:TablineStatusNum
    let s:TablineStatus = a:arg
  else
    echoerr 'Tabline:Invalid argument.'
    return
  endif

  let &showtabline = ( s:TablineStatus == 0 ? 0 : 2 )

  call UpdateTabline(0)
endfunction

nnoremap <silent> <leader>= :<C-u>call <SID>ToggleTabline('')<CR>
function! s:CompletionTabline(ArgLead, CmdLine, CusorPos)
  return range(0, s:TablineStatusNum)
endfunction
com! -nargs=1 -complete=customlist,s:CompletionTabline Tabline call <SID>ToggleTabline(<args>)


"----------------------------------------------------------------------------------------
" TabLine Timer

function! UpdateTabline(dummy)
  set tabline=%!TabLineStr()
endfunction

" 旧タイマの削除  vimrcを再読み込みする際、古いタイマを削除しないと、どんどん貯まっていってしまう。
if exists('TimerTabline') | call timer_stop(TimerTabline) | endif

let s:UpdateTablineInterval = 1000
let TimerTabline = timer_start(s:UpdateTablineInterval, 'UpdateTabline', {'repeat': -1})
"let TimerTabline = timer_start(s:UpdateTablineInterval, { dummy -> execute('redrawtabline') }, {'repeat': -1})


"----------------------------------------------------------------------------------------
" Initial Setting

" 0
" 1  タブ番号
" 2  タブ番号 バッファ数 Mod
" 3  タブ番号                バッファ名
" 4  タブ番号 バッファ数     バッファ名
" 5  タブ番号 バッファ数 Mod バッファ名
" 6  タブ番号 バッファ数     フルバッファ名
" 7  タブ番号 バッファ数 Mod フルバッファ名
let s:TablineStatusNum = 8

" 初期設定
" 最後に実施する必要あり。
"silent call <SID>ToggleTabline(3)


" Tabline }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Statusline {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


"----------------------------------------------------------------------------------------
" Battery (Battery.vimが存在しない場合に備えて。)
let g:BatteryInfo = '? ---% [--:--:--]'


"----------------------------------------------------------------------------------------
" Alt Statusline

function! s:SetStatusline(stl, local, time)
  " 旧タイマの削除
  if a:time > 0 && exists('s:TimerUsl') | call timer_stop(s:TimerUsl) | unlet s:TimerUsl | endif

  " Local Statusline の保存。および、WinLeaveイベントの設定。
  if a:local == 'l'
    let w:stl = getwinvar(winnr(), 'stl', &l:stl)
    augroup MyVimrc_Restore_LocalStl
      au!
      au WinLeave * if exists('w:stl') | let &l:stl = w:stl | unlet w:stl | endif
      au WinLeave * au! MyVimrc_Restore_LocalStl
    augroup end
  else
    let save_cur_win = winnr()
    windo let w:stl = getwinvar(winnr(), 'stl', &l:stl)
    silent exe save_cur_win . 'wincmd w'
    augroup MyVimrc_Restore_LocalStl
      au!
    augroup end
  endif

  " Statusline の設定
  exe 'set' . a:local . ' stl=' . substitute(a:stl, ' ', '\\ ', 'g')

  " タイマスタート
  if a:time > 0 | let s:TimerUsl = timer_start(a:time, 'RestoreDefaultStatusline', {'repeat': v:false}) | endif
endfunction

function! RestoreDefaultStatusline(force)
  " AltStlになっていないときは、強制フラグが立っていない限りDefaultへ戻さない。
  if !exists('s:TimerUsl') && !a:force | return | endif

  " 旧タイマの削除
  if exists('s:TimerUsl') | call timer_stop(s:TimerUsl) | unlet s:TimerUsl | endif

  " TODO これの呼び出し意図確認
  call s:SetStatusline(s:stl, '', -1)

  let save_cur_win = winnr()

  " Localしか設定してないときは、全WindowのStlを再設定するより、if existsの方が速いか？
  "windo let &l:stl = getwinvar(winnr(), 'stl', '')
  windo if exists('w:stl') | let &l:stl = w:stl | unlet w:stl | endif

  silent exe save_cur_win . 'wincmd w'
endfunction

augroup MyVimrc_Stl
  au!
  " このイベントがないと、AltStlが設定されているWindowを分割して作ったWindowの&l:stlに、
  " 分割元WindowのAltStlの内容が設定されっぱなしになってしまう。
  au WinEnter * let &l:stl = ''
augroup end


"----------------------------------------------------------------------------------------
" Make Default Statusline

function! s:SetDefaultStatusline(statusline_contents)

 "let s:stl = "  "
  let s:stl = " "

 "let s:stl .= "%#SLFileName#[ %{winnr()} ]%## ( %n ) "
 "let s:stl .= "%##%m%r%{(!&autoread&&!&l:autoread)?'[AR]':''}%h%w "

 "let s:stl .= "%#SLFileName#[ %{winnr()} ] %#VertSplit# ( %n ) "
 "let s:stl .= "%##%m%r%{(!&autoread&&!&l:autoread)?'[AR]':''}%h%w"

"?let s:stl .= "%#SLFileName# [ %{winnr()} ] %#VertSplit# ( %n ) "
"?let s:stl .= "%#SLFileName# [ %{winnr()} ] %## ( %n ) "
"?let s:stl .= "%#VertSplit# [ %{winnr()} ] %## ( %n ) "
"?let s:stl .= "%##[ %{winnr()} ] %#VertSplit# ( %n ) %h%w%#SLFileName# "
  let s:stl .= "%##[ %{winnr()} ] %#VertSplit# ( %n )%h%w %#SLFileName# "
"?let s:stl .= "%#SLFileName# [ %{winnr()} ] %## ( %n ) %h%w%#SLFileName# "
"?let s:stl .= " %#VertSplit# [ %{winnr()} ] %## ( %n ) %h%w%#SLFileName# "
"?let s:stl .= " %#VertSplit# %{winnr()} %## ( %n ) %h%w%#SLFileName# "

"?let s:stl .= "%#VertSplit#%m%r%{(!&l:autoread\\\<Bar>\\\<Bar>(&l:autoread==-1&&!&autoread))?'':'[AR]'}%h%w"
  let s:stl .= "%#VertSplit#%m%r%{(!&l:autoread\\\<Bar>\\\<Bar>(&l:autoread==-1&&!&autoread))?'':'[AR]'}"
"?let s:stl .= "%#VertSplit#%w%m%r%{(!&l:autoread\\\<Bar>\\\<Bar>(&l:autoread==-1&&!&autoread))?'':'[AR]'}"

  let g:MyStlFugitive = a:statusline_contents['Branch'] ? ' [fugitive]' : ' fugitive'
  let s:stl .= "%#hl_func_name_stl#%{bufname('') =~ '^fugitive' ? g:MyStlFugitive : ''}"
  let s:stl .= "%#hl_func_name_stl#%{&filetype == 'fugitive' ? g:MyStlFugitive : ''}"

  if a:statusline_contents['Branch']
   "let s:stl .= "%#hl_func_name_stl# %{FugitiveHead(7)}"
   "let s:stl .= "%#hl_func_name_stl# [%{FugitiveHead(7)}]"
   "let s:stl .= "%#hl_func_name_stl#%{bufname('')!='' ? (' ['.FugitiveHead(7).']') : ''}"
   "let s:stl .= "%#hl_func_name_stl#%{(bufname('')!='' && bufname('')!~'^NERD_tree') ? (' ['.FugitiveHead(7).']') : ''}"
    let s:stl .= "%#hl_func_name_stl#%{(FugitiveHead(7)!=''&& bufname('')!~'^NERD_tree') ? (' ['.FugitiveHead(7).']') : ''}"
  elseif 0
    let s:stl .= "%#hl_func_name_stl#%{(FugitiveHead(7)!='' && FugitiveHead(7)!='master' && bufname('')!~'^NERD_tree') ? (' ['.FugitiveHead(7).']') : ''}"
  endif

  if a:statusline_contents['Path']
    let s:stl .= "%<"
    let s:stl .= "%##%#SLFileName# %F "
  else
  "?let s:stl .= "%##%#SLFileName# %t "
    let s:stl .= "%##%#SLFileName#  %t  "
    let s:stl .= "%<"
  endif
 "let s:stl .= "%#hl_func_name_stl#%{ bufname('') == '' ? getcwd(winnr()) : '' }"
 "let s:stl .= "%#SLFileName#%{ bufname('') == '' ? getcwd(winnr()) : '' }"
 if a:statusline_contents['ShadowPath'] && !a:statusline_contents['Path']
   if 0
    "let s:stl .= " %#SLNoNameDir#%{ getcwd(winnr()) }    "
     let s:stl .= " %#SLNoNameDir#%F    "
   else
   "?let s:stl .= " %#SLNoNameDir#%F"
     let s:stl .= "%#SLNoNameDir#%F"
     let s:stl .= "%{bufname('')=='' ? ' '.getcwd(winnr()) : ''}"
     let s:stl .= "    "
   endif
 else
   " 無名レジスタなら、常にcwdを表示。
   let s:stl .= "%#SLNoNameDir#%{ bufname('') == '' ? getcwd(winnr()) : '' }"
 endif
 "let s:stl .= "%#SLNoNameDir#%{  getcwd(winnr())  }"

  if a:statusline_contents['FuncName']
   "let s:stl .= "%#hl_func_name_stl# %{cfi#format('%s()', '')}"
    let s:stl .= "%#hl_func_name_stl#%{cfi#format('%s()', '')}"
  endif


  " ===== Separate Left Right =====
  let s:stl .= "%#SLFileName#%="
  " ===== Separate Left Right =====

  if a:statusline_contents['IsKeywords']
   "let s:stl .= " %1{stridx(&isk,'.')<0?' ':'.'} %1{stridx(&isk,'_')<0?' ':'_'} "
   "let s:stl .= " %{&isk} "
   "let s:stl .= " %{substitute(substitute(&isk, '\\\\d\\\\+-\\\\d\\\\+', '', 'g'), ',,\\\\+', ',', 'g')} "
    let s:stl .= " %{substitute(substitute(&isk, '\\\\d\\\\+-\\\\d\\\\+', '', 'g'), ',\\\\+', ' ', 'g')} "
  endif

  if 1
   "let s:stl .= "%## %-3{ &ft == '' ? '    ' : &ft }  %-5{ &fenc == '' ? '     ' : &fenc }  %4{ &ff } "
   "let s:stl .= "%## %-3{ &ft == '' ? '    ' : &ft }  %-5{ &fenc == '' ? 'ascii' : &fenc }  %4{ &ff } "
   "let s:stl .= "%## %-3{ &ft == '' ? '?  ' : TitleCase(&ft) }  %-5{ &fenc == '' ?  &enc   : TitleCase(&fenc) }  %4{ TitleCase(&ff) } "
    let s:stl .= "%## %-3{ &ft == '' ? '?  ' : ToCapital(&ft) }  %-5{ &fenc == '' ?  &enc   : toupper(&fenc) }  %4{ ToCapital(&ff) } "
  else
    let s:stl .= "%## %-3{ &ft == '' ? '    ' : &ft } "
    let s:stl .= "%## %-5{ &fenc == '' ? '     ' : &fenc } "
    let s:stl .= "%## %4{ &ff } "
  endif

 "let s:stl .= "%#SLFileName# %{&l:scrollbind?'$':'@'} "
  let s:stl .= "%#VertSplit# %{&l:scrollbind?'$':'@'} "
  let s:stl .= "%1{ c_jk_local != 0 ? 'L' : 'G' } %1{ &l:wrap ? '==' : '>>' } %{g:clever_f_use_migemo?'(M)':'(F)'} %4{ &iminsert ? 'Jpn' : 'Code' } "

  let s:stl .= "%#SLFileName#  %{repeat(' ',winwidth(0)-178)}"

  let s:stl .= "%##"
 "let s:stl .= "%#VertSplit#"
  if a:statusline_contents['Line']
    let s:stl .= " %3p%% [%4L] "
  endif

  if a:statusline_contents['LineColumn']
    let s:stl .= " %4lL, %3c(%3v)C "
  elseif a:statusline_contents['Column']
   "let s:stl .= " %3c,%3v "
    let s:stl .= " %3c(%3v) "
  endif

  if a:statusline_contents['TabStop']
    let s:stl .= " ⇒%{&l:tabstop} "
  endif

  call RestoreDefaultStatusline(v:true)
endfunction


"----------------------------------------------------------------------------------------
" Switch Statusline Contents

let g:StatuslineContents = {}

let g:StatuslineContents['Branch']     = v:false
let g:StatuslineContents['Column']     = v:true
let g:StatuslineContents['FuncName']   = v:false
let g:StatuslineContents['IsKeywords'] = v:false
let g:StatuslineContents['Line']       = v:false
let g:StatuslineContents['LineColumn'] = v:false
let g:StatuslineContents['Path']       = v:false
let g:StatuslineContents['ShadowPath'] = v:true
let g:StatuslineContents['TabStop']    = v:false

function! s:CompletionStlContents(ArgLead, CmdLine, CusorPos)
  return sort(keys(g:StatuslineContents))
endfunction
com! -nargs=1 -complete=customlist,s:CompletionStlContents Stl let g:StatuslineContents['<args>'] = !g:StatuslineContents['<args>'] | call <SID>SetDefaultStatusline(g:StatuslineContents)

" nnoremap <silent> <Leader>_ :<C-u>Stl Column<CR>
" nnoremap <silent> <Leader>. :<C-u>Stl Branch<CR>
" nnoremap <silent> <Leader>, :<C-u>Stl FuncName<CR>
" nnoremap <silent> <Leader>+ :<C-u>Stl Line<CR>
" nnoremap <silent> <Leader>- :<C-u>Stl Path<CR>


"----------------------------------------------------------------------------------------
" Initialize Statusline

" 初期設定のために1回は呼び出す。
call s:SetDefaultStatusline(g:StatuslineContents)


"----------------------------------------------------------------------------------------
" Alt-Statusline API

function! SetAltStatusline(stl, local, time)
  call s:SetStatusline(a:stl, a:local, a:time)
endfunction

function! AddAltStatusline(stl, local, time)
  call s:SetStatusline((a:local == 'l' ? &l:stl : &stl) . a:stl, a:local, a:time)
endfunction


" Statusline }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Unified_Space {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
"
"nmap <expr> <Space>   winnr('$') == 1 ? '<Plug>(ComfortableMotion-Flick-Down)' : '<Plug>(Window-Focus-SkipTerm-Inc)'
"nmap <expr> <S-Space> winnr('$') == 1 ? '<Plug>(ComfortableMotion-Flick-Up)'   : '<Plug>(Window-Focus-SkipTerm-Dec)'

"nmap <Space>   <Plug>(ComfortableMotion-Flick-Down)
"nmap <S-Space> <Plug>(ComfortableMotion-Flick-Up)

" Unified_Space }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" MRU {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

augroup MyVimrc_MRU
  au!
 "au VimEnter,VimResized * let MRU_Window_Height = max([8, &lines / 3 ])
  au VimEnter,VimResized * let MRU_Window_Height = max([8, &lines / 2 ])
augroup end

nnoremap <Leader>o :<C-u>MRU<Space>

" MRU }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



"? " Completion {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
"? 
"? set complete=.,w,b,u,i,t
"? set complete=.,b,u,i
"? set complete=.,i
"? set complete=.,b,u
"? set complete=.,w,b,u
"? set completeopt=menuone,preview
"? set completeopt=menuone
"? set pumheight=25
"? 
"? 
"? augroup MyComplete
"?   au!
"? augroup end
"? 
"? if 0
"? 
"? " 全文字キーへの補完開始トリガの割り当て
"? function! SetCpmplKey(str)
"?   for k in split(a:str, '\zs')
"?     exec "inoremap <expr> " . k . " pumvisible() ? '" . k . "' : search('\\k\\{1\\}\\%#', 'bcn') ? TrigCompl('" . k . "')" . " : '" . k . "'"
"?   endfor
"? endfunction
"? call SetCpmplKey('_0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')
"? inoremap <expr> <BS> pumvisible() ? (search('\k\k\k\k\%#', 'bcn') ? '<BS>' : "\<BS>") : (search('\k\k\k\%#', 'bcn') ? TrigCompl("\<BS>") : "\<BS>")
"? 
"? augroup MyComplete
"?   au!
"? 
"?   au CompleteDone * try | iunmap gg | catch | finally
"?   au CompleteDone * inoremap <silent> <expr> jj pumvisible() ? '<C-N><C-N>' : InsertLast() . s:esc_and_write
"? 
"?   au InsertCharPre * try | iunmap gg | catch | finally
"? 
"?   au TextChangedI * exe pumvisible() ? "" : "inoremap <silent> <expr> jj pumvisible() ? '<C-N><C-N>' : " . s:esc_and_write_quoted
"?   au TextChangedI * exe pumvisible() ? "" : "try | iunmap gg | catch | finally"
"? 
"?   au InsertLeave * try | iunmap gg | catch | finally
"?   au InsertLeave * inoremap <silent> <expr> jj pumvisible() ? '<C-N><C-N>' : InsertLast() . s:esc_and_write
"? 
"?   au InsertCharPre * exe ( pumvisible() || v:char != "j" ) ? ( "" ) : ( "inoremap <silent> <expr> jj pumvisible() ? '<C-N><C-N>' : " . s:esc_and_write_quoted )
"?   au InsertCharPre * exe pumvisible() ? "" : "try | iunmap gg | catch | finally"
"? 
"? augroup end
"? 
"? " 補完を開始する
"? function! TrigCompl(key)
"?   try
"?     iunmap jj
"?   catch
"?     inoremap <expr> gg pumvisible() ? '<C-Y>' . Semicolon_plus() . '<Esc>:<C-u>w<CR>' : 'gg'
"?   finally
"?   endtry
"?   call feedkeys("\<C-n>\<C-p>", 'n')
"?   return a:key
"? endfunc
"? 
"? " 補完中のj,kキーの処理を行う
"? function! Cmpl_jk(key)
"?   try
"?     iunmap jj
"?   catch
"?   finally
"?   inoremap <expr> gg pumvisible() ? '<C-Y>' . Semicolon_plus() . '<Esc>:<C-u>w<CR>' : 'gg'
"?   endtry
"?   call feedkeys(a:key, 'n')
"?   return ''
"? endfunction
"? 
"? "inoremap <silent> <expr> jj pumvisible() ? '<C-N><C-N>' : InsertLast() . s:esc_and_write
"? inoremap          <expr> jj pumvisible() ? '<C-N><C-N>' : InsertLast() . s:esc_and_write
"? 
"? inoremap <expr> j pumvisible() ? Cmpl_jk("\<C-n>") : TrigCompl('j')
"? inoremap <expr> k pumvisible() ? Cmpl_jk("\<C-p>") : TrigCompl('k')
"? 
"? inoremap <expr> <C-j> pumvisible() ? 'j' : '<C-n>'
"? inoremap <expr> <C-k> pumvisible() ? 'k' : '<Esc>'
"? 
"? inoremap <expr> <CR>  pumvisible() ? '<C-y>' : '<C-]><C-G>u<CR>'
"? inoremap <expr> <Esc> pumvisible() ? '<C-e>' : '<Esc>'
"? 
"? inoremap <expr> gg ( pumvisible() ? '<C-y>' : '' ) . InsertLast() . s:esc_and_write
"? 
"? let s:esc_and_write =  '<Esc>:w<CR>'
"? let s:esc_and_write_quoted = "InsertLast() . '" . s:esc_and_write . "'"
"? 
"? function! InsertLast()
"?   if &ft == 'c' || &ft == 'cpp'
"?     return Semicolon_plus()
"?   else
"?     return ''
"?   endif
"? endfunction
"? 
"? endif
"? 
"? " Completion }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



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

" ru snipMate.vim
if exists('*TriggerSnippet')
  inoremap <silent> <Tab>   <C-R>=<SID>TriggerSnippet()<CR>
endif

" Snippets }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Configuration {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


let g:vimrc_path  = has('win32') ? '~/vimfiles/.vimrc' : '~/.vimrc'
let g:gvimrc_path = has('win32') ? '~/vimfiles/.gvimrc' : '~/.gvimrc'
let g:colors_dir = '~/vimfiles/colors/'


com! ReVimrc :exe 'so ' . g:vimrc_path


com! EVIMRC  :exe 'e      ' . g:vimrc_path
com! SVIMRC  :exe 'sp     ' . g:vimrc_path
com! TVIMRC  :exe 'tabnew ' . g:vimrc_path
com! VVIMRC  :exe 'vs     ' . g:vimrc_path
"com! VIMRC   :exe IsEmptyBuf() ? ':EVIMRC' : <SID>SplitDirection() >= 0 ? 'VVIMRC' : 'SVIMRC'
com! Vimrc   :VIMRC

com! EGVIMRC :exe 'e      ' . g:gvimrc_path
com! SGVIMRC :exe 'sp     ' . g:gvimrc_path
com! TGVIMRC :exe 'tabnew ' . g:gvimrc_path
com! VGVIMRC :exe 'vs     ' . g:gvimrc_path
com! GVIMRC  :exe IsEmptyBuf() ? ':EGVIMRC' : <SID>SplitDirection() >= 0 ? 'VGVIMRC' : 'SGVIMRC'
com! Gvimrc  :Gvimrc

com! EEditColor :exe 'e      ' . g:colors_dir . g:colors_name . '.vim'
com! SEditColor :exe 'sp     ' . g:colors_dir . g:colors_name . '.vim'
com! TEditColor :exe 'tabnew ' . g:colors_dir . g:colors_name . '.vim'
com! VEditColor :exe 'vs     ' . g:colors_dir . g:colors_name . '.vim'
com! EditColor  :exe IsEmptyBuf() ? ':EEditColor' : <SID>SplitDirection() >= 0 ? 'VEditColor' : 'SEditColor'


" let g:vimrc_buf_name  = '^' . g:vimrc_path
let g:gvimrc_buf_name = '^' . g:gvimrc_path

if 0
nnoremap <expr> <silent> <Leader>v
	\ ( len(win_findbuf(bufnr(g:vimrc_buf_name))) > 0 ) && ( win_id2win(reverse(win_findbuf(bufnr(g:vimrc_buf_name)))[0]) > 0 ) ?
	\  ( win_id2win(reverse(win_findbuf(bufnr(g:vimrc_buf_name)))[0]) . '<C-w><C-w>' ) : ':VIMRC<CR>'
else
  function! s:Vimrc()
    let win_id_list = bufnr(g:vimrc_buf_name)->win_findbuf()

    " 現在のタブページ内で開かれていれば
    for w in win_id_list
      if win_id2win(w) > 0
        "exe win_id2win(reverse(win_id_list)[0]) 'wincmd w'
        call win_gotoid(w)
        return
      endif
    endfor

    " 別のタブページで開かれていれば
    if 0
      for w in win_id_list
        if win_id2tabwin(w) > 0
          call win_gotoid(w)
          return
        endif
      endfor
    endif

    if IsEmptyBuf()
      EVIMRC
    elseif <SID>SplitDirection() >= 0
      VVIMRC
    else
      SVIMRC
    endif
  endfunction

  function! s:Vimrc(path)
    let buf_name  = '^' . a:path
    let win_id_list = bufnr(buf_name)->win_findbuf()

    " 現在のタブページ内で開かれていれば
    for w in win_id_list
      if win_id2win(w) > 0
        "exe win_id2win(reverse(win_id_list)[0]) 'wincmd w'
        call win_gotoid(w)
        return
      endif
    endfor

    " 別のタブページで開かれていれば
    if 0
      for w in win_id_list
        if win_id2tabwin(w) > 0
          call win_gotoid(w)
          return
        endif
      endfor
    endif

    if IsEmptyBuf()
      "EVIMRC
      exe 'e'  a:path
    elseif <SID>SplitDirection() >= 0
      "VVIMRC
      exe 'vs' a:path
    else
      "SVIMRC
      exe 'sp' a:path
    endif
  endfunction

  com! -bar VIMRC call <SID>Vimrc(g:vimrc_path)
  nnoremap <silent> <Leader>v :<C-u>VIMRC<CR>
endif

nnoremap <expr> <silent> <Leader><C-v>
	\  ( len(win_findbuf(bufnr(g:gvimrc_buf_name))) > 0 ) && ( win_id2win(reverse(win_findbuf(bufnr(g:gvimrc_buf_name)))[0]) > 0 ) ?
	\  ( win_id2win(reverse(win_findbuf(bufnr(g:gvimrc_buf_name)))[0]) . '<C-w><C-w>' ) : ':GVIMRC<CR>'

nnoremap <expr> <silent> <Leader>V
	\ ( len(win_findbuf(bufnr(g:colors_dir . g:colors_name . '.vim$'))) > 0 ) && ( win_id2win(reverse(win_findbuf(bufnr(g:colors_dir . g:colors_name . '.vim$')))[0]) > 0 ) ?
	\  ( win_id2win(win_findbuf(bufnr(g:colors_dir . g:colors_name . '.vim$'))[0]) . '<C-w><C-w>' ) : ':EditColor<CR>'


" Configuration }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Swap_Exists {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

let s:swap_select = v:false

augroup MyVimrc_SwapExists
  au!
  au SwapExists * if s:swap_select | let v:swapchoice = '' | else | let v:swapchoice = 'o' | endif
augroup END

" function! s:swap_select()
"   let s:swap_select = v:true
"   edit %
"   let s:swap_select = v:false
" endfunction
" 
" com! SwapSelect call s:swap_select()

com! SwapSelect let s:swap_select = v:true | edit % | let s:swap_select = v:false

" Swap_Exists }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Other Key-Maps {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

nnoremap <leader>w :<C-u>w<CR>
nnoremap <silent> <leader>w :<C-u>update<CR>
nnoremap <silent><expr> <Leader>r &l:readonly ? ':<C-u>setl noreadonly<CR>' : ':<C-u>setl readonly<CR>'
nnoremap <silent><expr> <Leader>R &l:modifiable ? ':<C-u>setl nomodifiable <BAR> setl readonly<CR>' : ':<C-u>setl modifiable<CR>'
nnoremap <leader>L :<C-u>echo len("<C-r><C-w>")<CR>
nnoremap <silent> yx :PushPos<CR>ggyG:PopPos<CR> | ":echo "All lines yanked."<CR>

"nnoremap <silent> <C-o> :<C-u>exe (g:alt_stl_time > 0 ? '' : 'normal! <C-l>')
"                      \ <Bar> let g:alt_stl_time = 12
nnoremap <silent> g<C-o> :<C-u>pwd
                      \ <Bar> echon '        ' &fileencoding '  ' &fileformat '  ' &filetype '    ' printf('L %d  C %d  %3.2f %%  TL %3d', line('.'), col('.'), line('.') * 100.0 / line('$'), line('$'))
                      \ <Bar> call SetAltStatusline('%#hl_buf_name_stl#  %F', 'g', 10000)<CR>


"nnoremap <C-Tab> <C-w>p
inoremap <C-f> <C-p>
inoremap <C-e>	<End>
"inoremap <CR> <C-]><C-G>u<CR>
inoremap <C-H> <C-G>u<C-H>

nnoremap <silent> gl :setl nowrap!<CR>
nnoremap <silent> <Leader><CR> :setl nowrap!<CR>

nnoremap gG G

nnoremap <silent> gf :<C-u>aboveleft sp<CR>gF

nnoremap <Plug>(Normal-gF) gF
nmap <silent> gf <Plug>(MyVimrc-Window-AutoSplit)<Plug>(Normal-gF)

" Other Key-Maps }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Clever-f {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

let g:clever_f_smart_case = 1

let g:clever_f_use_migemo = 1

com! CleverfUseMigemoToggle let g:clever_f_use_migemo = !g:clever_f_use_migemo | echo g:clever_f_use_migemo ? 'clever-f Use Migemo' : 'clever-f No Migemo'

" fは必ず右方向に移動，Fは必ず左方向に移動する
"let g:clever_f_fix_key_direction = 1

" 任意の記号にマッチする文字を設定する
let g:clever_f_chars_match_any_signs = "\<BS>"

" 過去の入力の再利用
"let g:clever_f_repeat_last_char_inputs = ["\<CR>"]	" ["\<CR>", "\<Tab>"]

" タイムアウト
let g:clever_f_timeout_ms = 3000

augroup MyVimrc_cleverf
  au!
  au ColorScheme * hi My_cleverf_Cursor guifg=yellow guibg=black
  au ColorScheme * hi My_cleverf_Char   guifg=#cff412 guibg=black
  "au ColorScheme * hi My_cleverf_Cursor guifg=cyan guibg=black
  "au ColorScheme * hi My_cleverf_Char   guifg=yellow guibg=black
augroup end
let g:clever_f_mark_cursor_color = 'My_cleverf_Cursor'
let g:clever_f_mark_char_color   = 'My_cleverf_Char'
"let g:clever_f_mark_cursor = 1
"let g:clever_f_mark_char = 1

" TODO !!! clever-fが重い !!!
let g:clever_f_mark_char = 0
"   とするか、
"let g:clever_f_use_migemo = 0
"   とするかすれば、重いのが解消される。

" Clever-f }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Vertical-f {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

com! -nargs=1 VerticalF let @m=<q-args> | call search('^\s*'. @m)
com! -nargs=1 VerticalFBack let @m=<q-args> | call search('^\s*'. @m, 'b')
nnoremap <C-g>j :VerticalF<Space>
nnoremap <C-g>k :VerticalFBack<Space>

" Vertical-f }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" NERDTree {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

let g:NERDTreeMapActivateNode = ''
let g:NERDTreeMapOpenInTab = 'o'
let g:NERDTreeShowHidden = 1

if 1

" DOS環境で、set shellslash がONのとき、NERDTreeVCSが無限ループに陥る。
nnoremap <silent> gt :<C-u>echo 'Open NERDTree...'<CR>
      \:set noshellslash<CR>
      \:<C-u>exe 'silent NERDTreeVCS <Bar> NERDTreeFind' expand('%:p')<CR>
      \:OptimalWindowWidth<CR>
      \:set shellslash<CR>
      \:nunmap <buffer> J<CR>
      \:nunmap <buffer> K<CR>
      \:nunmap <buffer> f<CR>
      \:nunmap <buffer> F<CR>
"     \:nunmap <buffer> m<CR>
"     \:normal! ^<CR>

augroup MyVimrc_NERDTree
  au!
  au TabNew NERD_tree_* setl winfixwidth
augroup end

" NERDTreeは時間が掛かるので、遅延ロード。
augroup MyVimrc_NERDTree_AutoLoad
  au!
  au CmdUndefined NERDTree* packadd nerdtree | au! MyVimrc_NERDTree_AutoLoad CmdUndefined NERDTree*
augroup END


else

  " NERDTreeは時間が掛かるので、遅延ロード。
  nnoremap <silent> gt :<C-u>call <SID>load_NERDTree()<CR>

  function! s:load_NERDTree()
    packadd nerdtree

    augroup MyVimrc_NERDTree
      au!
      au TabNew NERD_tree_* setl winfixwidth
    augroup end

    nnoremap <silent> gt :<C-u>echo 'Open NERDTree...'<CR>
          \:set noshellslash<CR>
          \:<C-u>exe 'silent NERDTreeVCS <Bar> NERDTreeFind' expand('%:p')<CR>
          \:OptimalWindowWidth<CR>
          \:set shellslash<CR>
          \:nunmap <buffer> J<CR>
          \:nunmap <buffer> K<CR>
          \:nunmap <buffer> f<CR>
          \:nunmap <buffer> F<CR>
    "     \:nunmap <buffer> m<CR>
    "     \:normal! ^<CR>

    normal gt
  endfunction

endif

" NERDTree }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" GUI {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


"----------------------------------------------------------------------------------------
" Transparency

let g:my_transparency = 229
let g:my_transparency = 227
let g:my_transparency = 235

nnoremap <silent><expr> <PageUp>   ':<C-u>se transparency=' .    ( &transparency + 1      ) . '<Bar> Transparency <CR>'
nnoremap <silent><expr> <PageDown> ':<C-u>se transparency=' . max([&transparency - 1,   1]) . '<Bar> Transparency <CR>'   | " transparencyは、0以下を設定すると255になってしまう。

nnoremap <silent>       <C-PageUp>   :exe 'se transparency=' . (&transparency == g:my_transparency ? 255 : g:my_transparency) <Bar> Transparency <CR>
nnoremap <silent>       <C-PageDown> :exe 'se transparency=' . (&transparency == g:my_transparency ?  50 : g:my_transparency) <Bar> Transparency <CR>

com! TransparencyEcho echo printf(' Transparency = %4.1f%%', &transparency * 100 / 255.0)

" exe 'set transparency=' . g:my_transparency


"----------------------------------------------------------------------------------------
" Autocmd

augroup MyVimrc_GUI
  au!
  if has('kaoriya')
   "au GUIEnter * ScreenMode 4
    au GUIEnter * ScreenMode 5
  else
    au GUIEnter * simalt ~x
  endif
  exe 'au GUIEnter * set transparency=' . g:my_transparency
augroup end


"----------------------------------------------------------------------------------------
" Screen (General)

nnoremap <silent> <Left>    :exe 'winpos' getwinposx() - 7 ' ' getwinposy() - 0<CR>
nnoremap <silent> <Down>    :exe 'winpos' getwinposx() + 0 ' ' getwinposy() + 7<CR>
nnoremap <silent> <Up>      :exe 'winpos' getwinposx() - 0 ' ' getwinposy() - 7<CR>
nnoremap <silent> <Right>   :exe 'winpos' getwinposx() + 7 ' ' getwinposy() + 0<CR>

nnoremap <silent> <S-Left>  :exe 'winpos' getwinposx() - 1 ' ' getwinposy() - 0<CR>
nnoremap <silent> <S-Down>  :exe 'winpos' getwinposx() + 0 ' ' getwinposy() + 1<CR>
nnoremap <silent> <S-Up>    :exe 'winpos' getwinposx() - 0 ' ' getwinposy() - 1<CR>
nnoremap <silent> <S-Right> :exe 'winpos' getwinposx() + 1 ' ' getwinposy() + 0<CR>

nnoremap <silent> <C-Left>  :let &columns -= 1<CR>
nnoremap <silent> <C-Down>  :let &lines   += 1<CR>
nnoremap <silent> <C-Up>    :let &lines   -= 1<CR>
nnoremap <silent> <C-Right> :let &columns += 1<CR>

nnoremap <silent> <A-Left>  :let &columns -= 1<CR>
nnoremap <silent> <A-Down>  :let &lines   += 1<CR>
nnoremap <silent> <A-Up>    :let &lines   -= 1<CR>
nnoremap <silent> <A-Right> :let &columns += 1<CR>

com! XGeometry echo 'line:' &lines 'col:' &columns 'x:' getwinposx() 'y:' getwinposy()


"----------------------------------------------------------------------------------------
" Screen (Special)

" line
"	HD:  1080:90
"	XGA:  768:64
" col
"	HD:  1920:320
"	XGA: 1024:170.666667

com! XGA set lines=64 columns=171

" Thinkpad X1 Carbon Gen.1st (HD Size)
com! Thinkpad set lines=75 columns=267 | winpos 150 110


"----------------------------------------------------------------------------------------
" Screen (ScreenMode)

if has('kaoriya')
  nnoremap <silent> <S-PageUp>   :<C-u>ScreenMode 5<CR>
  nnoremap <silent> <S-PageDown> :<C-u>ScreenMode 4<CR>
  nnoremap <silent> <A-PageUp>   :<C-u>ScreenMode 5<CR>:Thinkpad<CR>
  nnoremap <silent> <A-PageDown> :<C-u>ScreenMode 4<CR>:Thinkpad<CR>
endif


"----------------------------------------------------------------------------------------
" Guioptions & Disable Menu

if 0
  let did_install_default_menus = 1
  " TODO $VIMRUNTIME/menu.vimを削除する。
else
  " menu.vim の読み込みを抑止
  " ReVimrc時のちらつき防止のため、+=で設定。
  " https://hail2u.net/blog/software/dont-load-menu-in-gvim.html

  "set guioptions+=M

  if has('kaoriya')
    set ambiwidth=auto
    set guioptions=!CM
  else
    set guioptions=!M
  endif

endif


" GUI }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" FuncName {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


function! Func_Name_Stl(alt_stl_time)
  if 0
    let func_name = cfi#format('%s ()', '')
    if func_name != ''
      let stl = '   %m   %#hl_func_name_stl#   ' . func_name . '   %##'
      call SetAltStatusline(stl, 'l', a:alt_stl_time)
    else
      call RestoreDefaultStatusline(v:true)
    endif
  else
    let stl = '   %m   %#hl_func_name_stl#   ' . cfi#format('%s ()', '... ()') . '   %##'
  call SetAltStatusline(stl, 'l', a:alt_stl_time)
  endif
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



" Util Functions {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


function! IsEmptyBuf()
  return bufname('')=='' && &buftype=='' && !&modified
endfunction


function! ToCapital(str)
  return substitute(a:str, '.*', '\L\u&', '')
 "return toupper(a:str[0]) . a:str[1:]
endfunction


" 数値比較用の関数 lhs のほうが大きければ正数，小さければ負数，lhs と rhs が等しければ 0 を返す
function! CompNr(lhs, rhs)
    return a:lhs - a:rhs
endfunction


function! GetKey()
  return nr2char(getchar())
endfunction


function! GetKeyEcho()
  let k = nr2char(getchar())
  echon k
  return k
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


" 返り値
"   CursorがWordの上:       正整数
"   CursorがWordの上でない: 0
function! IsCursorOnWord()
  return search('\%#\k', 'cnz')
endfunction


" 返り値
"   CursorがWordの先頭:             -1
"   CursorがWordの上(先頭でなはい):  1
"   CursorがWordの上でない:          0
function! CursorWord()
  if search('\<\%#\k', 'cnz')
    return -1
  elseif search('\%#\k', 'cnz')
    return 1
  endif
  return 0
endfunction

" 返り値
"   CursorがWordの先頭:             -1
"   CursorがWordの上(先頭でなはい):  1
"   CursorがWordの上でない:          0
function! CursorWord()
  return search('\<\%#\k', 'cnz') ? -1 : search('\%#\k', 'cnz') ? 1 : 0
endfunction

" TODO rename CursorWord() -> CursorOnWord()

" Util Funtions }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Util Commands {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


"com! AR let &l:autoread = !&l:autoread
com! AR setl autoread!


com! Tab2Space setlocal   expandtab | retab<CR>
com! Space2Tab setlocal noexpandtab | retab!<CR>
com! T2S Tab2Space
com! S2T Space2Tab


com! FL help function-list<CR>


com! -nargs=1 Unicode exe 'normal! o<C-v>u' . tolower('<args>') . '<Esc>'


com! XMLShape :%s/></>\r</g | filetype indent on | setf xml | normal gg=G


" Windowsでの設定例です。他の場合は外部コマンド部分を読み替えてください。
au FileType plantuml com! OpenUml :!/cygdrive/c/Program\ Files/Google/Chrome/Application/chrome.exe %


" ifdefを閉じる
com! FoldIfdef setl foldmarker=#if,#endif | setl foldmethod=marker | normal! zM
com! IfdefFold FoldIfdef


com! Branch echo FugitiveHead(7)


" Util Commands }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



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



nnoremap <Leader>J       :<C-u>let &iminsert = (&iminsert ? 0 : 2) <Bar> exe "colorscheme " . (&iminsert ? "Asche" : "Rimpa") <CR>



nnoremap <C-@> g-
nnoremap <C-^> g+



nnoremap <silent> <C-]> g;:FuncNameStl<CR>
nnoremap <silent> <C-\> g,:FuncNameStl<CR>



function! ZZ()
  let n = 25
  for i in range(n)
    execute "normal! " . g:comfortable_motion_scroll_down_key
    redraw
  endfor
endfunction



let plugin_dicwin_disable = v:true



ru! ftplugin/man.vim



"-------------------------------------------------------------------
" カーソル下のhighlight情報を表示する {{{
function! s:get_syn_id(transparent)
    let synid = synID(line('.'), col('.'), 1)
    return a:transparent ? synIDtrans(synid) : synid
endfunction
function! s:get_syn_name(synid)
    return synIDattr(a:synid, 'name')
endfunction
function! s:get_highlight_info()
    execute "highlight " . s:get_syn_name(s:get_syn_id(0))
    execute "highlight " . s:get_syn_name(s:get_syn_id(1))
endfunction
command! HighlightInfo call s:get_highlight_info()
"-------------------------------------------------------------------



nnoremap <Leader>$ :<C-u>setl scrollbind!<CR>
nmap <Leader>4 <Leader>$



" {{{
function! SurroundLineBrace() range
" echo a:firstline a:lastline
" red
" sleep 2
  exe a:lastline
  normal! o}
  exe a:firstline
  normal! O{
  normal! j>i{>a{
endfunction

com! -range Brace <line1>,<line2>call SurroundLineBrace()
"vnoremap J :Brace<CR>
" }}}



"nnoremap  ]]  ]]f(bzt
"nnoremap g]]  ]]f(b
"nnoremap  [[  [[f(bzt
"nnoremap g[[  [[f(b
"nnoremap  ][  ][zb
"nnoremap g][  ][
"nnoremap  []  []zb
"nnoremap g[]  []




" TODO 
" BrowserJump  Orgへのジャンプもキーバインドを提供する



"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if 0
  nnoremap <C-i> g;
  nnoremap <C-o> g,

  nmap ' \

  set whichwrap+=hl

  set grepprg=git\ grep\ -I\ --line-number

endif
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



" Basic {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Cursor Move, CursorLine, CursorColumn, and Scroll {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Emacs {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" EscEsc {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Search {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Substitute {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Grep {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Quickfix & Locationlist {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Tag, Jump, and Unified CR {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Diff {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Window {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Terminal {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Buffer {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Tab {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Tabline {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Statusline {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Battery {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Unified_Space {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Mru {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Completion {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" i_Esc {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Snippets {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Configuration {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Swap Exists {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Other Key-Maps {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Clever-f {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Transparency {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" FuncName {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Util {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Basic {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{




" Cursor Move, CursorLine, CursorColumn, and Scroll {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Tag, Jump, and Unified CR {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Unified_Space {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" Tabline {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Statusline {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Battery {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" Window {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Terminal {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Buffer {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Tab {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" Search {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Grep {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Quickfix & Locationlist {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Substitute {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Diff {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" Completion {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Snippets {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" i_Esc {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" EscEsc {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Configuration {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Emacs {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" Swap Exists {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Clever-f {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Mru {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Transparency {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" FuncName {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" Other Key-Maps {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" Util {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{



" Basic {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Emacs {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Cursor Move, CursorLine, CursorColumn, and Scroll {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" EscEsc {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Tag, Jump, and Unified CR {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


" Search {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Substitute {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Grep {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Quickfix & Locationlist {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" Diff {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" Buffer {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Window {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Terminal {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Tab {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Tabline {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Statusline {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Battery {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" Completion {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Snippets {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" i_Esc {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Swap Exists {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" EscEsc {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Configuration {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" Emacs {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


" MRU {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" FuncName {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" GUI {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" Clever-f {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" Other Key-Maps {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{



" Util {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{



" Window Temp {{{{{{{{{{{{{{{{{{{{{{{


" Submode Window Size {{{

if 0
  call submode#enter_with('WinSize', 'n', '', '<Space>l', '<C-w>>')
  call submode#enter_with('WinSize', 'n', '', '<Space>h', '<C-w><')
  call submode#enter_with('WinSize', 'n', '', '<Space>j', '<C-w>+')
  call submode#enter_with('WinSize', 'n', '', '<Space>k', '<C-w>-')
  call submode#map(       'WinSize', 'n', '', 'l', '<C-w>>')
  call submode#map(       'WinSize', 'n', '', 'h', '<C-w><')
  call submode#map(       'WinSize', 'n', '', 'j', '<C-w>+')
  call submode#map(       'WinSize', 'n', '', 'k', '<C-w>-')

  let g:submode_timeoutlen = 5000
endif

let g:submode_timeoutlen = 5000

" Submode Window Size }}}


" Window Wrap Focus 補償 {{{

"noremap zh H
"noremap zl L
"noremap zm M
"noremap zk H
"noremap zj L

"nnoremap <C-h> H
"nnoremap <C-l> L
"nnoremap <C-j> M


nnoremap M <C-w>n
"nmap U *
nmap M <Plug>(MyVimrc-Window-AutoNew)


" Window Wrap Focus 補償 }}}



" Window Temp }}}}}}}}}}}}}}}}}}}}}}}



nnoremap <silent> <C-o> o<Esc>
nnoremap <silent> <C-o> :<C-u>call append(expand('.'), '')<CR>j

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



nnoremap go :<C-u>MRU<Space>
nnoremap gO :<C-u>MRU<CR>
nnoremap gw :<C-u>w<CR>
"nmap gr <Leader>e



let g:submode_timeoutlen = 5000



" {{{

let s:IsSpaceFree = v:false

if s:IsSpaceFree

  nnoremap <Space>w :<C-u>w<CR>
  nnoremap <Space>o :<C-u>MRU<Space>

  nmap <Space>v <Leader>v
  nmap <Space>V <Leader>V

  nmap <Leader>e <Nop>
  nmap <silent> <Space>e <Leader>e

  nmap <Space>- <Leader>-
  nmap <Space>_ <Leader>_

  nmap <Space>t <Leader>t

  nmap <Space><Space> <Leader><Space>

endif

" }}}

if 0
  "let mapleader = '\'
  nmap <Space>w <Leader>w
  nmap <Space>e <Leader>e
  nmap <Space>e <Leader>e
  nmap <Space>o <Leader>o
  nmap <Space>v <Leader>v
  nmap <Space>V <Leader>V
else
  nmap <Space>w \w
  nmap <Space>e \e
  nmap <Space>o \o
  nmap <Space>v \v
  nmap <Space>V \V
  nmap <Space>f \f
endif







" Undo Redo {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
call submode#map('undo/redo', 'n', '', '-', 'g-')
call submode#map('undo/redo', 'n', '', '+', 'g+')

" Undo Redo  }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



com! -nargs=1 -complete=custom,VimrcContents V VIMRC <Bar> silent 1 <Bar> call search(<q-args> . ' {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{', 'cW')
com! -nargs=1 -complete=custom,VimrcContents V VIMRC <Bar> silent 1 <Bar> call search(<q-args> . ' {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{', 'cW') <Bar> normal! z<CR>

" function! Grep()
"   let g:strs = ''
"   redir => g:strs
"   g/ {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{/p
"   redir END
" endfunction
" 
" function! Grep()
"   let g:strs = execute('vimgrep ' . '" {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{" %')
" endfunction

function! Grep()
  vimgrep ' {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{' %
endfunction

let s:vimrc_conts = [ 'Basic', 'Text_Objects', 'Visual_Mode', 'Cursor Move, CursorLine, CursorColumn, and Scroll', 'Emacs', 'EscEsc', 'Search', 'Substitute', 'Grep', 'Quickfix & Locationlist', 'Tag, Jump, and Unified CR', 'Diff', 'Window', 'Terminal', 'Buffer', 'Tab', 'Tabline', 'Statusline', 'Unified_Space', 'Mru', 'Completion', 'i_Esc', 'Snippets', 'Configuration', 'Swap Exists', 'Other Key-Maps', 'Clever-f', 'Vertical-f', 'NERDTree', 'EasyMotionn', 'Transparency', 'FuncName', 'Undo Redo', 'Util Functions', 'Util Commands', 'Basic', 'Cursor Move, CursorLine, CursorColumn, and Scroll', 'Emacs', 'EscEsc', 'Search', 'Substitute', 'Grep', 'Quickfix & Locationlist', 'Tag, Jump, and Unified CR', 'Diff', 'Window', 'Terminal', 'Buffer', 'Tab', 'Tabline', 'Statusline', 'Battery', 'Unified_Space', 'Mru', 'Completion', 'i_Esc', 'Snippets', 'Configuration', 'Swap Exists', 'Other Key-Maps', 'Clever-f', 'Transparency', 'FuncName', 'Util', 'Basic', 'Cursor Move, CursorLine, CursorColumn, and Scroll', 'Tag, Jump, and Unified CR', 'Unified_Space', 'Tabline', 'Statusline', 'Battery', 'Window', 'Terminal', 'Buffer', 'Tab', 'Search', 'Grep', 'Quickfix & Locationlist', 'Substitute', 'Diff', 'Completion', 'Snippets', 'i_Esc', 'EscEsc', 'Configuration', 'Emacs', 'Swap Exists', 'Clever-f', 'Mru', 'Transparency', 'FuncName', 'Other Key-Maps', 'Util' ]

function! VimrcContents(ArgLead, CmdLine, CusorPos)
  return join(s:vimrc_conts,"\n")
endfunction




" TODO
" Diff Specialの判定では、NERDTreeのWindowを無視して、2個ならDiffするようにする。おなじくTerminalも。Quickfix, Locationlistも。

"
"■お気に入り
"
"Window
"
"CWord Search
"
"Completion
"
"Numbers (Em)
"
"
"■力を入れざるを得ないもの
"
"Scroll
"
"Tag Browsing
"
"
"■力を入れてしまったもの
"
"Diff
"
"Stl
"
"(Esc_Esc)
"


" 🐹
" 🌀
" 🐎
" 🐬
" 🐜
" 🐝
" 👉
" 💀
" 💉
" 💻
" 💮
" 📜
" 📓
" 💎
" 💿
" 📎
" 🔗
" 🔘
" 🔃



" word
" part
"
" strict
" smart
"
" add
" new
"
"
"
" word	new	strict
" word	new	smart
"
" word	add	strict
" word	add	smart
"
" part	new	strict
" part	new	smart
"
" part	add	strict
" part	add	smart
"
"
"
" word	new	strict	*
" word	new	smart	g#
"
" part	new	strict	#
" part	new	smart	g#
"
" word	add		&
" part	add		g&



" vn vg vw Gcommit gitcon


" so ~/vimfiles/new.vim



" ---------------------------------------------------------------------------------------------------------------------------------------------------------

set completeopt=menuone

let g:CompleteKey = "\<C-n>"


" 全文字キーへの補完開始トリガの割り当て
function! SetCpmplKey(str)
  for k in split(a:str, '\zs')
    exec "inoremap <expr> " . k . " pumvisible() ? '" . k . "' : search('\\k\\{1\\}\\%#', 'bcn') ? TriggerCompleteDefault('" . k . "')" . " : '" . k . "'"
  endfor
endfunction
call SetCpmplKey('_0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')
"inoremap <expr> <BS> pumvisible() ? (search('\k\k\k\k\%#', 'bcn') ? '<BS>' : "\<BS>") : (search('\k\k\k\%#', 'bcn') ? TriggerCompleteDefault("\<BS>") : "\<BS>")
inoremap <expr> <BS> pumvisible() ? "\<BS>" : (search('\k\k\k\%#', 'bcn') ? TriggerCompleteDefault("\<BS>") : "\<BS>")


" 補完を開始する
function! TriggerCompleteDefault(insert_key)
  return TriggerComplete(g:CompleteKey, a:insert_key)
endfunc

function! TriggerComplete(start_key, insert_key)
  try
    iunmap jj
    call Map_gg()
  catch
  finally
  endtry
  call feedkeys(a:start_key . "\<C-p>", 'n')
  return a:insert_key
endfunc


" 補完中のj,kキーの処理を行う
function! Complete_jk(key)
  try
    iunmap jj
    call Map_gg()
  catch
  finally
  endtry
  call feedkeys(a:key, 'n')
  return ''
endfunction


function! Map_gg()
  "imap gg <Plug>(Completion-Yes-And-InsertLeave)
  imap <expr> gg pumvisible() ? '<Plug>(Completion-Yes-And-InsertLeave)' : '<Plug>(InsertLeave)'
endfunction


inoremap <Plug>(Completion-Yes) <C-y>

inoremap <expr> <Plug>(InsertLeavePre)  InsertLeavePre_Hook()
inoremap <Plug>(I-Esc) <Esc>
" ここはnnoremapでなければならない。
" nnoremap <Plug>(InsertLeavePost) l:w<CR>
nnoremap <expr> <Plug>(InsertLeavePost) InsertLeavePost_Hook()

imap <Plug>(InsertLeave) <Plug>(InsertLeavePre)<Plug>(I-Esc)<Plug>(InsertLeavePost)
imap <Plug>(Completion-Yes-And-InsertLeave) <Plug>(Completion-Yes)<Plug>(InsertLeave)


" 候補選択
inoremap <expr> j pumvisible() ? Complete_jk("\<C-n>") : TriggerCompleteDefault('j')
inoremap <expr> k pumvisible() ? Complete_jk("\<C-p>") : TriggerCompleteDefault('k')

" 日本語入力時用 + 強制補完開始
inoremap <expr> <C-j> pumvisible() ? Complete_jk("\<C-n>") : TriggerCompleteDefault('')
inoremap <expr> <C-k> pumvisible() ? Complete_jk("\<C-p>") : TriggerCompleteDefault('')

" 日本語入力時の補完確定
imap <expr> <C-g> pumvisible() ? '<Plug>(Completion-Yes-And-InsertLeave)' : '<Plug>(InsertLeave)'

" ファイル名補完
inoremap <expr> <C-l> TriggerComplete('<C-x><C-f>', '')
inoremap <expr> <C-l> "\<C-o>:cd " . GetPrjRoot() . "\<CR>" . TriggerComplete('<C-x><C-f>', '')

" 短縮入力を展開 & Hook発動 & 行ごとにUndo & 改行
inoremap <expr> <CR>  pumvisible() ? '<C-y>' : '<C-]>' . NewLine_Hook() . '<C-G>u' . '<CR>'
inoremap <expr> <Esc> pumvisible() ? '<C-e>' : '<Esc>l'


augroup MyVimrc_Completion
  au!

  au CompleteDone * if v:completed_item != {} | call s:Completion_Yes_Hook() | else | call s:Completion_Esc_Hook() | endif

  au InsertEnter,CompleteDone * imap jj <Plug>(InsertLeave)
  au InsertEnter let s:erace_num = 0

  " Insert Mode を<C-c>で抜けたとき用に、InsertEnterでも無効化する。
  au InsertEnter,CompleteDone * try | iunmap gg | catch | finally
augroup end


function! s:Completion_Yes_Hook()
  " TODO 重複部分を消す
  " TODO メタ文字 兼 キーワードのエスケープ
  if search('\%#\k\+', 'cnz')
    let s:compl_word = v:completed_item['word']
    let s:cursor_word = expand('<cword>')

    let s:left_word = s:compl_word
    let s:right_word = substitute(s:cursor_word, '^\V' . s:left_word, '', 'g')

    if len(s:right_word) > 1
      " 念のため
      let s:left_left_word  = substitute(s:left_word, '\V' . s:right_word . '\$', '', 'g')
      let s:erace_num = len(s:left_word) - len(s:left_left_word)
      "let s:key = repeat("\<Del>", s:erace_num)
      "call feedkeys(repeat("\<Del>", s:erace_num), 'ni')
      " Delじゃなく、BSにしておかないと、ドットリピート時に意図しないことになる。
      "   例: 下記で、DefをXyzに変える場合。
      "       Abc_Def_ghi0
      "       Abc_Def_ghi1
      call feedkeys(repeat("\<BS>", s:erace_num) . repeat("\<Right>", s:erace_num), 'ni')
    endif
  endif
  return ''
endfunction
com! CCC echo s:left_word s:compl_word s:cursor_word s:right_word s:left_left_word s:erace_num s:key


function! s:Completion_Esc_Hook()
  " do nothing
  return ''
endfunction

function! NewLine_Hook()
  " TODO semicolon
  return InsertLast()
  return ''
endfunction

function! InsertLeavePre_Hook()
  " TODO semicolon
  return InsertLast()
  return ''
endfunction


" 中間補完のとき、カーソルが補完位置にとどまるようにようにした。
let s:erace_num = 0

function! InsertLeavePost_Hook()
 "return "l:w\<CR>"
 "return repeat('h', s:erace_num) . "l:w\<CR>"
 "return repeat('h', s:erace_num) . "l:update\<CR>"
  return repeat('h', s:erace_num) . 'l' . (bufname('')=='' ? '' : ":update\<CR>")
endfunction


function! Completion_Yes_Hook()
  normal! "zye
  echo @z
endfunction

function! Completion_Yes_Hook()
  let compl_word = v:completed_item['word']
  let right_word = ''
endfunction


" -----------------------------------------------------------------------------
  " TODO semicolon

function! InsertLast()
  if &ft == 'c' || &ft == 'cpp'
    " enumなどの中なら、セミコロンではなく、カンマとする。
    return Semicolon_plus()
  else
    return ''
  endif
endfunction

function! Semicolon_plus()
  return ''
endfunction

" -----------------------------------------------------------------------------




" inoremap <expr> <Plug>(I-NewLine) '<C-]>' . NewLine_Hook() . '<C-G>u' . '<CR>'

" inoremap <silent> <expr> <Plug>(Completion-Yes) '<C-y>' . Completion_Yes_Hook()
" inoremap <silent> <expr> <Plug>(Completion-Esc) '<C-e>' . Completion_Esc_Hook()
"inoremap <expr> <C-l>  pumvisible() ? "\<C-l>" : TriggerComplete2('<C-x><C-f>')




" match\(pattern\)\@=
" 
" \@=	幅ゼロの肯定先読み。先行するアトムに幅ゼロでマッチします。
" 	foo\(bar\)\@=		"foobar" の "foo"
" 
" 
" match\(pattern\)\@!
" 
" \@!	幅ゼロの否定先読み。先行するアトムが現在の位置でマッチしない場合に、幅ゼロでマッチします。
" 	foo\(bar\)\@!		後ろに "bar" のない "foo"
" 
" 
" \(pattern\)\@<=match
" 
" \@<=	幅ゼロの肯定後読み。先行するアトムが、この後に続くパターンの直前にマッチする場合に、幅ゼロでマッチします。
" 	\(an\_s\+\)\@<=file	"an" と空白文字 (改行含む) の後の "file"
" 
" 
" \(pattern\)\@<!match
" 
" \@<!	幅ゼロの否定後読み。先行するアトムが、この後に続くパターンの直前にマッチしない場合に、幅ゼロでマッチします。
" 	\(foo\)\@<!bar		"foobar" 以外の "bar"
"



"cmap <C-j> <Tab>
"cmap <C-k> <S-Tab>
"set wildchar=<C-j>




"nnoremap L gt
"nnoremap H gT

cnoremap <C-l> <C-d>
cnoremap <C-j> <C-d>
" cunmap <C-d>
cnoremap <C-j> <C-d>
cnoremap <C-k> <S-Tab>


let g:ctrlp_map = '<C-j>'

highlight link MRUFileName Identifier
highlight link MRUFileName Statement
highlight link MRUFileName MyMru
highlight link MRUFileName DirectoryMyMru
highlight link MRUFileName String



"================================================================================



" Path {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


"set path+=./**
"set path+=;


function! GetPrjRoot()
  let save_autochdir = &autochdir
  set autochdir

  let org_dir = getcwd()

  let ret = ''

  for i in range(7)
    if glob(g:prj_root_file) != ''  " prj_root_fileファイルの存在確認
      let ret = getcwd()
      break
    endif
    " Windowsのネットワークドライブには、一定以上、親Dirへ移動できない(というかエラーになる)バグ(?)がある。
    noautocmd cd ..
  endfor

  exe 'noautocmd cd' org_dir

  let &autochdir = save_autochdir

  return ret
endfunction

function! GetPrjRootPath()
  let root = GetPrjRoot()
  if root == ''
    return ''
  else
    return ',' . root . '/**'
  endif
endfunction

function! GetIncPath()
  return 'V:/include'
 "return ',V:/include'
endfunction

com! -bar Setpath let &l:path = &path . ',' . GetPrjRoot() . ';' | echo &l:path
com! -bar Setpath let &l:path = &path . ';' . GetPrjRoot() . ';' | echo &l:path
com! -bar Setpath let &l:path = &path . ',' . GetPrjRoot() . '/**' | echo &l:path
com! -bar Setpath let &l:path .= GetPrjRootPath() | echo &l:path
com! -bar SetpathSilent let &l:path .= GetPrjRootPath()
com! -bar SetpathSilent let &l:path .= GetPrjRootPath() . GetIncPath()
com! -bar SetpathSilent let &l:path .= '.,' . GetIncPath() . GetPrjRootPath()
com! -bar SetpathSilent let &l:path .= ',.,' . GetIncPath() . GetPrjRootPath()
"com! -bar SetpathSilent if &l:path !~ '\*$' | let &l:path .= '.,' . GetIncPath() . GetPrjRootPath() | endif

augroup MyVimrc_SetPath
  au!
 "au BufRead * let &l:path = &path . ',' . GetPrjRoot() . ';' | " echo &l:path
 "au BufRead * let &l:path = &path . ',' . GetPrjRoot() . '/**' | " echo &l:path
 "au BufRead,BufNewFile * SetpathSilent
  au BufRead,BufNewFile,BufNew * SetpathSilent
augroup end

com! -bar ResetPath let &l:path = '' | SetpathSilent | set path " 最後のsetは表示が目的
com! -bar SetpathForce let &l:path = '' | SetpathSilent | set path " 最後のsetは表示が目的

set wildignore+=**/.git/**
set wildignore+=**/.svn/**

augroup MyVimrc_SetPathNum
  au!
 "au BufRead * let &l:path = &path . ',' . repeat('../', GetPrjRootNum()) . ';' | " echo &l:path
 "au BufRead * let &l:path = &path . ',' . repeat('../', GetPrjRootNum()) . '/**' | " echo &l:path
augroup end

" Path }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}


" MakeTags {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" ( ctags -aR && \awk '{ print $1 }' tags > tag_only ) &
" ( git rev-parse --show-toplevel; ctags -aR && \awk '{ print $1 }' tags > tag_only ) &
" ( cd `git rev-parse --show-toplevel` && ctags -Rf tags_tmp && mv tags_tmp tags && \awk '{ print $1 }' tags > tag_only ) &

" let job = job_start('sh -c "cd `git rev-parse --show-toplevel` && ctags -Rf tags_tmp && mv tags_tmp tags && awk ' . "'{ print $1 }'" . ' tags > tag_only"')
" echo job_status(job)

com! MakeTags let mk_tag_job = job_start('sh -c "cd `git rev-parse --show-toplevel` && ctags -Rf tags_tmp && mv tags_tmp tags && awk ' . "'{ print $1 }'" . ' tags > tag_only"')

com! MakeTags call MakeTags()

augroup MyVimrc_AutCtags
  au!
  au BufWritePost *.c,*.h MakeTags
augroup end

let s:mk_tag_exe = 0
function! MakeTags()
  if s:mk_tag_exe
    if job_status(s:mk_tag_job) == 'run'
      return
    endif
  endif
  if 0  " UTF-8
    let s:mk_tag_job = job_start('sh -c "cd `git rev-parse --show-toplevel && git rev-parse --show-toplevel` && ctags -Rf tags_tmp && mv tags_tmp tags && awk ' . "'{ print $1 }'" . ' tags > tag_only"')
  elseif 0  " cp932 失敗
    "let s:mk_tag_job = job_start('sh -c "cd `git rev-parse --show-toplevel && git rev-parse --show-toplevel` && echo "!_TAG_FILE_ENCODING	CP932" > tags_tmp && ctags -Raf tags_tmp && mv tags_tmp tags && awk ' . "'{ print $1 }'" . ' tags > tag_only"')
  else  " cp932
    let s:mk_tag_job = job_start('sh -c "cd `git rev-parse --show-toplevel && git rev-parse --show-toplevel` && ctags -Rf tags_tmp && sed ' . "'1i!_TAG_FILE_ENCODING	CP932'" . ' tags_tmp > tags && awk ' . "'{ print $1 }'" . ' tags > tag_only"')
  endif
  let s:mk_tag_exe = 1
endfunction

function! MakeTags()
  if exists('s:mk_tag_job')
    if job_status(s:mk_tag_job) == 'run'
      return
    endif
  endif
  if &fileencoding == 'cp932'
   "let s:mk_tag_job = job_start('sh -c "git rev-parse --show-toplevel && cd `git rev-parse --show-toplevel` && rm tags_tmp && ctags -Rf tags_tmp && sed -i -e' . "'1i!_TAG_FILE_ENCODING	CP932'" . ' tags_tmp && mv tags_tmp tags && awk ' . "'{ print $1 }'" . ' tags > tag_only"')
    let s:mk_tag_job = job_start('sh -c "git rev-parse --show-toplevel && cd `git rev-parse --show-toplevel` &&                ctags -Rf tags_tmp && sed -i -e' . "'1i!_TAG_FILE_ENCODING	CP932'" . ' tags_tmp && mv tags_tmp tags && awk ' . "'{ print $1 }'" . ' tags > tag_only"')
  else
    " utf-8
    let s:mk_tag_job = job_start('sh -c "git rev-parse --show-toplevel && cd `git rev-parse --show-toplevel` && ctags -Rf tags_tmp && mv tags_tmp tags && awk ' . "'{ print $1 }'" . ' tags > tag_only"')
  endif
endfunction

" 最終版
" ( git rev-parse --show-toplevel && cd `git rev-parse --show-toplevel` && ctags -Rf tags_tmp && mv tags_tmp tags && awk '{ print $1 }' tags > tag_only ) &
" ( git rev-parse --show-toplevel && cd `git rev-parse --show-toplevel` && rm tags_tmp && ctags -Rf tags_tmp && sed -i -e'1i!_TAG_FILE_ENCODING	CP932' tags_tmp && mv tags_tmp tags && awk '{ print $1 }' tags > tag_only)


" MakeTags }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}

if 0
  com! ReadTag silent sfind tag_only | setl autoread | close
  set complete=.,w,b,u,U
  com! ReadTag try | silent sfind tag_only | setl autoread | bdelete | catch | finally | endtry
  com! ReadTag try | silent exe 'split' GetPrjRoot() . '/tag_only' | setl autoread | bdelete | catch | finally | endtry
  augroup MyVimrc_ReadTag
    au!
    "au BufReadPost *.c,*.h let v:swapchoice = 'o' | ReadTag
    " TODO 遅延化
    au BufReadPost *.c,*.h ReadTag
  augroup end
elseif 0
  augroup MyVimrc_ReadTag
    au!
    au BufReadPost *.c,*.h exe 'set complete+=k' . GetPrjRoot() . '/tag_only'
  augroup end
elseif 0
  set complete=.,w,b
  augroup MyVimrc_ReadTag
    au!
    au BufReadPost * exe 'set complete+=k' . GetPrjRoot() . '/tag_only'
  augroup end
else
  set complete=.,w,b,u
  set complete=.,w,b
  com! ReadTag try | silent exe 'sview' GetPrjRoot() . '/tag_only' | setl autoread | close | catch | finally | endtry
  augroup MyVimrc_ReadTag
    au!
    "au BufReadPost *.c,*.h let v:swapchoice = 'o' | ReadTag
    " TODO 遅延化
   "au BufReadPost *.c,*.h ReadTag
    au BufReadPost * ReadTag
  augroup end
endif



function! GetPrjRootNum()
  let save_autochdir = &autochdir
  set autochdir

  let org_dir = getcwd()

  let ret = 0

  for i in range(7)
    if glob(g:prj_root_file) != ''  " prj_root_fileファイルの存在確認
      let ret = i
      break
    endif
    cd ..
  endfor

  exe 'cd ' . org_dir

  let &autochdir = save_autochdir

  return ret
endfunction

cabb f find



" 初期設定
" 最後に実施する必要あり。
silent call <SID>ToggleTabline(3)




" ==============================  form .gvimrc  {{{

set mps+=（:）,「:」,『:』,【:】

call SetCpmplKey('ァアィイゥウェエォオカガキギクグケゲコゴサザシジスズセゼソゾタダチヂッツヅテデトドナニヌネノハバパヒビピフブプヘベペホボポマミムメモャヤュユョヨラリルレロヮワヰヱヲンヴヵヶヷヸヹヺー')

" いわゆる全角Ｊ
inoremap <buffer><expr> ｊ pumvisible() ? '<C-n>' : 'j'
" いわゆる全角ｋ
inoremap <buffer><expr> ｋ pumvisible() ? '<C-p>' : 'k'
"inoremap <buffer><expr> <C-j> pumvisible() ? '<C-n>' : '<C-j>'
"inoremap <buffer><expr> <C-k> pumvisible() ? '<C-p>' : '<C-k>'

inoremap <expr>   ｊｊ pumvisible() ? '<C-N><C-N>' : '<Esc>:w<CR>'
inoremap <expr>   ｇｇ pumvisible() ? '<C-N><C-N>' : '<Esc>:w<CR>'
inoremap <expr>     ｊ pumvisible() ? '<C-N><C-N>' : '<Esc>:w<CR>'
"inoremap <expr>   っｊ pumvisible() ? '<C-N><C-N>' : '<Esc>:w<CR>'
"inoremap <silent> っj  <ESC>
"inoremap <expr>   っｇ pumvisible() ? '<C-N><C-N>' : '<Esc>:w<CR>'
"inoremap <silent> っｇ <ESC>

"highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#ffffff
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#333377
au BufNewFile,BufRead * match ZenkakuSpace /　/


iab <silent> q1  ①<C-R>=Eatchar('\s')<CR>
iab <silent> q2  ②<C-R>=Eatchar('\s')<CR>
iab <silent> q3  ③<C-R>=Eatchar('\s')<CR>
iab <silent> q4  ④<C-R>=Eatchar('\s')<CR>
iab <silent> q5  ⑤<C-R>=Eatchar('\s')<CR>
iab <silent> q6  ⑥<C-R>=Eatchar('\s')<CR>
iab <silent> q7  ⑦<C-R>=Eatchar('\s')<CR>
iab <silent> q8  ⑧<C-R>=Eatchar('\s')<CR>
iab <silent> q9  ⑨<C-R>=Eatchar('\s')<CR>
iab <silent> q10 ⑩<C-R>=Eatchar('\s')<CR>
iab <silent> q11 ⑪<C-R>=Eatchar('\s')<CR>
iab <silent> q12 ⑫<C-R>=Eatchar('\s')<CR>


iab <silent> qd ・<C-R>=Eatchar('\s')<CR>


function! C_A()
      if search('\%#①', 'bcn')	| return "s②\<Esc>"
  elseif search('\%#②', 'bcn')	| return "s③\<Esc>"
  elseif search('\%#③', 'bcn')	| return "s④\<Esc>"
  elseif search('\%#④', 'bcn')	| return "s⑤\<Esc>"
  elseif search('\%#⑤', 'bcn')	| return "s⑥\<Esc>"
  elseif search('\%#⑥', 'bcn')	| return "s⑦\<Esc>"
  elseif search('\%#⑦', 'bcn')	| return "s⑧\<Esc>"
  elseif search('\%#⑧', 'bcn')	| return "s⑨\<Esc>"
  elseif search('\%#⑨', 'bcn')	| return "s⑩\<Esc>"
  elseif search('\%#⑩', 'bcn')	| return "s⑪\<Esc>"
  elseif search('\%#⑪', 'bcn')	| return "s⑫\<Esc>"
  elseif search('\%#⑫', 'bcn')	| return "s⑬\<Esc>"
  elseif search('\%#⑬', 'bcn')	| return "s⑭\<Esc>"
  elseif search('\%#⑭', 'bcn')	| return "s⑮\<Esc>"
  elseif search('\%#⑮', 'bcn')	| return "s⑯\<Esc>"
  endif
  return ''
endfunc
function! C_X()
      if search('\%#②', 'bcn')	| return "s①\<Esc>"
  elseif search('\%#③', 'bcn')	| return "s②\<Esc>"
  elseif search('\%#④', 'bcn')	| return "s③\<Esc>"
  elseif search('\%#⑤', 'bcn')	| return "s④\<Esc>"
  elseif search('\%#⑥', 'bcn')	| return "s⑤\<Esc>"
  elseif search('\%#⑦', 'bcn')	| return "s⑥\<Esc>"
  elseif search('\%#⑧', 'bcn')	| return "s⑦\<Esc>"
  elseif search('\%#⑨', 'bcn')	| return "s⑧\<Esc>"
  elseif search('\%#⑩', 'bcn')	| return "s⑨\<Esc>"
  elseif search('\%#⑪', 'bcn')	| return "s⑩\<Esc>"
  elseif search('\%#⑫', 'bcn')	| return "s⑪\<Esc>"
  elseif search('\%#⑬', 'bcn')	| return "s⑫\<Esc>"
  elseif search('\%#⑭', 'bcn')	| return "s⑬\<Esc>"
  elseif search('\%#⑮', 'bcn')	| return "s⑭\<Esc>"
  elseif search('\%#⑯', 'bcn')	| return "s⑮\<Esc>"
  endif
  return ''
endfunc
nnoremap <C-a> :call C_A()<CR>
nnoremap <C-x> :call C_X()<CR>

nnoremap <expr> <C-a> search('\%#[\U2460-\U2473]', 'bcn') ? C_A() : "<C-a>"
nnoremap <expr> <C-x> search('\%#[\U2460-\U2473]', 'bcn') ? C_X() : "<C-x>"

"inoremap (( （
"inoremap )) ）

"nmap 　 <Space>


" ==============================  form .gvimrc  }}}


"com! -nargs=+ F
"      \ exe 'sfind ' . ('<args>'[0] == '.' ? '' : '*') . substitute('<args>', ' ', '*', 'g') . '*'


com! -nargs=+ F
      \ try | exe 'find' <q-args> | catch |
      \ try | exe 'find ' . ('<args>'[0] == '.' ? '' : '*') . substitute('<args>', ' ', '*', 'g') . '*' | catch |
      \ call feedkeys(':find *' . substitute('<args>', ' ', '*', 'g') . '*<Tab><Tab><Tab>', 'nt') | endtry | endtry

com! -nargs=+ S
      \ try | exe 'sfind' <q-args> | catch |
      \ try | exe 'sfind ' . ('<args>'[0] == '.' ? '' : '*') . substitute('<args>', ' ', '*', 'g') . '*' | catch |
      \ call feedkeys(':sfind *' . substitute('<args>', ' ', '*', 'g') . '*<Tab><Tab><Tab>', 'nt') | endtry | endtry

com! -nargs=+ T
      \ try | exe 'tab sfind' <q-args> | catch |
      \ try | exe 'tab sfind ' . ('<args>'[0] == '.' ? '' : '*') . substitute('<args>', ' ', '*', 'g') . '*' | catch |
      \ call feedkeys(':tab sfind *' . substitute('<args>', ' ', '*', 'g') . '*<Tab><Tab><Tab>', 'nt') | endtry | endtry


if 0
  com! -nargs=+ S
        \ try | exe 'sfind' <q-args> | catch
        \ try | exe 'sfind ' . ('<args>'[0] == '.' ? '' : '*') . substitute('<args>', ' ', '*', 'g') . '*' | 
        \ catch | call feedkeys(':sfind *' . substitute('<args>', ' ', '*', 'g') . '*<Tab>', 'nt') | endtry

  com! -nargs=+ T
        \ try | exe 'tab sfind' <q-args> | catch
        \ try | exe 'tab sfind ' . ('<args>'[0] == '.' ? '' : '*') . substitute('<args>', ' ', '*', 'g') . '*' | 
        \ catch | call feedkeys(':tab sfind *' . substitute('<args>', ' ', '*', 'g') . '*<Tab>', 'nt') | endtry
endif

"com! -nargs=+ F
"      \ exe 'find ' . ('<args>'[0] == '.' ? '' : '*') . substitute('<args>', ' ', '*', 'g') . '*'


"com! -nargs=+ F
"     \ call feedkeys(':find *' . substitute('<args>', ' ', '*', 'g') . '*<Tab>', 'nt')
"     \ try | exe 'find' <q-args> | catch
"     \ try | exe 'find ' . ('<args>'[0] == '.' ? '' : '*') . substitute('<args>', ' ', '*', 'g') . '*' | endtry |
"     \ catch | call feedkeys(':find *' . substitute('<args>', ' ', '*', 'g') . '*<Tab>', 'nt') | endtry



"nnoremap t ]m
"nnoremap T [m



com! Date echo system("date")
com! Cal echo system("cal")
com! Cal echo system("cal") <Bar> echo system("date")
com! Cal echo ' ' <Bar> echo system("date") <Bar> echo ' ' <Bar> echo ' ' <Bar> echo system("cal")



com! -bar -nargs=? ETempfile exe 'edit'      tempname() . (<q-args> =~ '^[^.]' ? '.' . <q-args> : <q-args>)
com! -bar -nargs=? STempfile exe 'split'     tempname() . (<q-args> =~ '^[^.]' ? '.' . <q-args> : <q-args>)
com! -bar -nargs=? VTempfile exe 'vsplit'    tempname() . (<q-args> =~ '^[^.]' ? '.' . <q-args> : <q-args>)
com! -bar -nargs=? TTempfile exe 'tab split' tempname() . (<q-args> =~ '^[^.]' ? '.' . <q-args> : <q-args>)
com! -bar -nargs=? Tempfile  STempfile <args>


"match CursorLineNr /\%#./


" TODO 不正なプリプロ命令をハイライト


set winminwidth=0



nnoremap <silent> <F9>  :exe 'winpos' getwinposx() - 1 ' ' getwinposy() - 0<CR>
nnoremap <silent> <F10> :exe 'winpos' getwinposx() + 0 ' ' getwinposy() + 1<CR>
nnoremap <silent> <F11> :exe 'winpos' getwinposx() - 0 ' ' getwinposy() - 1<CR>
nnoremap <silent> <F12> :exe 'winpos' getwinposx() + 1 ' ' getwinposy() + 0<CR>

nnoremap <silent> <S-F9>  :let &columns -= 1<CR>
nnoremap <silent> <S-F10> :let &lines   += 1<CR>
nnoremap <silent> <S-F11> :let &lines   -= 1<CR>
nnoremap <silent> <S-F12> :let &columns += 1<CR>



nnoremap <silent> <Leader>e :update<CR>



let g:Words = [
      \ [ 'TRUE', 'FALSE' ],
      \ [ 'true', 'false' ],
      \ [ '==',   '!=' ],
      \ [ '0',    '1' ],
      \ [ '0U',   '1U' ],
      \ [ '0x0U', '0x1U' ],
      \ [ 'mcu_DI', 'mcu_EI' ],
\ ]







if 0
function! DiffSpecial()
 "if &diff | diffupdate | return | endif

  let win = s:get_diff_special_windows()

  if win == [] | diffthis | echo 'diffthis' | return | endif

  PushPosAll
  for i in win
    exe i 'wincmd w' | diffthis
  endfor
  PopPosAll
  echo 'Diff win' win
endfunction



nnoremap <expr> d<Space> ':<C-u>' . (&diff ? 'diffupdate' : 'call DiffSpecial()') . '<CR>'
endif


nnoremap <Leader>9 :<C-u>RainbowParenthesesToggle<CR>



com! WinOptimalWidth PushPosAll | exe 'silent windo call Window#Resize#SetOptimalWidth()' | PopPosAll

com! WinOptimalWidthRev PushPosAll | for i in reverse(range(1, winnr('$'))) | exe i 'wincmd w' | sile call Window#Resize#SetOptimalWidth() | endfor | PopPosAll


nnoremap <silent> gM :<C-u>enew<CR>



":amenu ]Toolbar.Make	:make
":amenu ]Toolbar.Mare	:Date
":popup ]Toolbar

"aunmenu ]Toolbar
com! -bar FAM aunmenu ]Toolbar | exe 'amenu' ']Toolbar.' . cfi#format('%s ()', '') ':echo<CR>'
com! FSM FAM | popup ]Toolbar
nnoremap , :<C-u>FSM<CR>
"nnoremap , :<C-u>FSM<CR>:3sleep<CR><Esc>




if 0
  set completeopt=longest
  set completeopt=
  inoremap <C-j> <C-n>
  inoremap <C-k> <C-p>
  imap jj <Plug>(InsertLeave)
endif
"iunmap jj

so ~/vimfiles/ime.vim



augroup MyVimrc_WinColor
  au!
 "autocmd ColorScheme * highlight NormalNC guifg=NONE guibg=#121212
  "autocmd WinEnter,BufWinEnter * set wincolor=
  "autocmd WinLeave * set wincolor=NormalNC
augroup end


com! Time call popup_create( strftime('%Y/%m/%d (%a)    %X'), #{
        \ pos: 'center',
        \ moved: 'any',
        \ tabpage: 0,
        \ wrap: v:false,
        \ zindex: 200,
        \ highlight: 'NormalPop',
        \ border: [2, 2, 2, 2],
        \ close: 'click',
        \ padding: [2, 4, 2, 4],
        \ })
        " time: a:time,
        " minwidth: 30,
        " maxheight: &lines - 4 - 3,
        " mask: mask
        " filter: 'popup_filter_menu',


iab IF0 #if 0
#else
#endif<C-R>=Eatchar('\s')<CR>

augroup MyVimrc_ChDir
  au!
 "au DirChanged window,tabpage,global pwd
  au DirChanged global pwd
augroup end

set cursorlineopt=number,screenline





" vim.vim {{{



command! -nargs=* BUF exe 'browse filter %\c' . substitute(<q-args>, '[ *]', '.*', 'g') . '% ls' | call feedkeys(':b ', 'n')

"nnoremap K :<C-u>BUF<Space>



iab <silent> inc  #include ""<Left><C-x><C-f><C-R>=Eatchar('\s')<CR>
iab <silent> inca #include ""<Left>src_a/<C-x><C-f><C-R>=Eatchar('\s')<CR>
iab <silent> inci #include ""<Left>inc/<C-x><C-f><C-R>=Eatchar('\s')<CR>



"? nnoremap <silent> <Leader>O :<C-u>MyExplore<CR>



"? function! PyCyg()
"? python3 << PYCODE
"? import subprocess
"? subprocess.Popen(["C:/cygwin/bin/mintty.exe", "--title", "Vim Term", "--size", "160,50", "-o", "Locale=ja_JP", "-o", "Charset=UTF-8", "C:/cygwin/bin/zsh.exe"])  # , "-B", "frame"
"? PYCODE
"? endfunction
"? com! PyCyg call PyCyg()

"nnoremap <silent> <C-z> :<C-u>SH2<CR>
"nnoremap <silent> <C-z> :<C-u>PyCyg<CR>



function! L() range
  echo a:lastline - a:firstline + 1
endfunction
com! -range L <line1>, <line2> call L()
"vnoremap <silent> L :L<CR>
nnoremap <Leader>l :<C-u>echo len("<C-r><C-w>")<CR>



function! TempHighLight()
  let w = expand("<cword>")
  let g:TagMatch0 = matchadd('TagMatch', '\<'.w.'\>')
  let g:TimerTagMatch0 = timer_start(1500, 'QQQQ')
  let g:TagMatchI[g:TimerTagMatch0] = g:TagMatch0
endfunction
"nnoremap <F5>  :<C-u>call TempHighLight()<CR>
"nnoremap <C-n> :<C-u>call TempHighLight()<CR>
"nnoremap <silent> @ :<C-u>call TempHighLight()<CR>



nnoremap <silent> gL :<C-u>call GLLLL()<CR>

function! GLLLL()
  PushPosAll
  let wrap = !&l:wrap
  windo let &l:wrap = wrap
  PopPosAll
endfunction



" Git


function! TestGitLsFile()
  echo system("git ls-files")
endfunction
com! TGF call TestGitLsFile()


function! GetGitRoot()
  return system('git rev-parse --show-toplevel')
endfunction


python3 << PYCODE
import subprocess
PYCODE

function! PyTestGitFile()
python3 << PYCODE
#git_root = subprocess.Popen(["C:/cygwin/bin/git.exe", "rev-parse", "--show-toplevel"], stdout=subprocess.PIPE, shell=True).stdout.readlines()
git_root = subprocess.Popen(["git.exe", "rev-parse", "--show-toplevel"], stdout=subprocess.PIPE, shell=True).stdout.readlines()
vim.command('let git_root = "' + git_root[0].decode('utf-8') + '"')
PYCODE
return git_root
endfunction

function! TestGitCdRoot()
  exe 'cd ' . PyTestGitFile()
  pwd
endfunction



" TabStopを簡単に変える
com! -nargs=? Ts let &l:ts = ( "<args>" == "" ? 8 : "<args>" )
com! -nargs=? TS Ts <args>



" メーデー Tablineを非表示にする
com! Mayday set showtabline=0
com! MayDay Mayday
com! MAYDAY Mayday



" vim.vim }}}



" test.vim {{{



function! s:GoToDeclaration()
  let cl0 = line(".")
  let bn0 = bufnr(0)

  set tags=./tags
  try
    "tjump
    "exe "normal! \<C-]>"
    normal! 
  catch
  endtry
  let cl = line(".")
  let bn = bufnr(0)
  if cl0 != cl || bn0 != bn | return | endif

  set tags=tags;
  try
    "tjump
    "exe "normal! \<C-]>"
    normal! 
  catch
  endtry
  let cl = line(".")
  let bn = bufnr(0)
  if cl0 != cl || bn0 != bn | return | endif

  try
    normal! gD
    let cl = line(".")
    let bn = bufnr(0)
  catch
  endtry
  if cl0 != cl || bn0 != bn | return | endif

  try
    normal! gd
    let cl = line(".")
    if cl0 != cl | return | endif
  catch
  endtry

  " echoe 'Declaration not found.'
  echo 'Declaration not found.'
endfunction
"call <SID>GoToDeclaration()
"nnoremap <buffer> <silent> <CR> :<C-u>call <SID>GoToDeclaration()<CR>
"nnoremap  <CR> :<C-u>call <SID>GoToDeclaration()<CR>

" TODO
" 念のため、バッファが変わったことも確認する。
" なぜか、statusline用のauが効かないので、独自にbuf_name_lenの設定を行う。
"



" ver 0.1
" function! s:GoToDeclaration()
" 	let cl0 = line(".")
" 
" 	try
" 		normal! 
" 	catch
" 	endtry
" 	let cl = line(".")
" 	if cl0 != cl | return | endif
" 
" 	normal! gD
" 	let cl = line(".")
" 	if cl0 != cl | return | endif
" 
" 	normal! gd
" 	let cl = line(".")
" 	if cl0 != cl | return | endif
" 
" 	echoe 'Declaration not found.'
" endfunction
" "call <SID>GoToDeclaration()
" nnoremap <silent> <CR> :<C-u>call <SID>GoToDeclaration()<CR>




func! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc
"iabbr <silent> if if ()<Left><C-R>=Eatchar('\s')<CR>
iabbr <silent> di Ghddrv_DI();<CR><C-R>=Eatchar('\s')<CR>
iabbr <silent> ei Ghddrv_EI();<CR><C-R>=Eatchar('\s')<CR>
iabbr <silent> DI Ghddrv_DI();<CR><C-R>=Eatchar('\s')<CR>
iabbr <silent> EI Ghddrv_EI();<CR><C-R>=Eatchar('\s')<CR>
iabbr <silent> bo <Tab>// ブレーク置き場<C-R>=Eatchar('\s')<CR>

"iabbr di Ghddrv_DI();<CR>


"echohl Special | echon 90 | echohl None | echon 80

"// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

"MMC
"#define	TAKUBO_PORT	CO_VVL_FS_RLY
"TAKUBO_PORT ^= 1UL;


"SMC ENG
"#define	TAKUBO_PORT		(PORT.PCR5_1.BIT.P)


" #define	TAKUBO_PORT		CO_VVL_FS_RLY
" #define TAKUBO_50us_DIV_125ns	400UL	/* ( 50000 / 125  ) */
" 
" volatile ulong	takubo;
"
"
"
"	,rammnt.bss.pm1 &	;RAM monitor
"	,main.bss.pm1 &








func! s:func_copy_cmd_output(cmd)
  redir @*>
  silent execute a:cmd
  redir END
endfunc

command! -nargs=1 -complete=command CopyCmdOutput call <SID>func_copy_cmd_output(<q-args>)



"echo "a"
"echo "a"
"echo "a"
"echo "a"
"call feedkeys(":b ")

" function! CollectFuncs()
function! s:GotoFunc()
  let n = 0
  let ftop = []

  call PushPos()

  keepjumps normal! gg
  "let old_line = line(".")
  "echo getline(".")
  "try
  while 1
    keepjumps normal! ]]
    "if old_line == line("$")
    if line(".") == line("$")
      break
    endif
    "let old_line = line(".")
    keepjumps normal! k
    " TODO 各スタイルに対応
    echo printf("%2d  %s", n + 1, getline("."))
    "exe "let ftop_" . n + 1 . " = line('.')"
    call add(ftop, line('.'))
    let n += 1
    keepjumps normal! j
  endwhile
  "finally
  "endtry

  call PopPos()
  "echo "normal! " . ftop_" . n . " = line('.')"

  if n >= 10
    let m = input("> ")
  else
    echo "> "
    let m = nr2char(getchar())
    call feedkeys("<CR>")
  endif

  if m =~# 'g'
    normal! gg
  elseif m =~# 'G'
    normal! G
  elseif m =~ '\d\+'
    exe "normal!" ftop[m - 1] . "G"
    "exe "normal!" ftop[m - 1] . "Gz\<CR>"
    normal! 0f(bz

  endif
  "if m !~ '\d\+' | return | endif
endfunction

function! s:GotoFunc()

  "便宜上の措置
  GotoFuncCloseWin

  let n = 0
  let funcs = []
  let ftop = []

  PushPos

  keepjumps normal! gg

  while 1
    keepjumps normal! ]]

    if line(".") == line("$")
      break
    endif

    keepjumps normal! k

    " TODO 各スタイルに対応

    call add(funcs, printf("%2s  %s", n + 1, getline(".")))
    if 1
      call add(funcs, '')
    endif

    call add(ftop, line('.'))
    let n += 1

    keepjumps normal! j
  endwhile

  PopPos

  let s:win_id = popup_create( funcs, #{
        \ line: 'cursor+1',
        \ col: 'cursor',
        \ pos: 'center',
        \ posinvert: v:true,
        \ minwidth: 30,
        \ maxheight: &lines - 4 - 3,
        \ tabpage: 0,
        \ wrap: v:false,
        \ zindex: 200,
        \ drag: 1,
        \ highlight: 'NormalPop',
        \ border: [1, 1, 1, 1],
        \ close: 'click',
        \ padding: [1, 1, 0, 1],
        \ })
        " cursorline: 1,
        " moved: 'any',
        " time: a:time,
        " mask: mask
        " filter: 'popup_filter_menu',

  call setbufvar(winbufnr(s:win_id), '&filetype', getbufvar(bufnr(), '&filetype'))

  redraw

  if n >= 10
    let m = input("> ")
  else
    echo "> "
    let m = nr2char(getchar())
    call feedkeys("<CR>")
  endif

  if m =~# 'g'
    normal! gg
  elseif m =~# 'G'
    normal! G
  elseif m =~ '\d\+'
    exe "normal!" ftop[m - 1] . "G"
   "exe "normal!" ftop[m - 1] . "Gz\<CR>"
    normal! 0f(bz<CR>
  else "if n < 10
    "call feedkeys(m, 'mt')
  endif

  call popup_close(s:win_id)
endfunction

let s:keys = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
let s:keys = '123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ0'
let s:keys = 'FJGHKDLTUYREA;\123456789BCIMNOPSVWXZ0Q'
let s:keys = 'JFHGKDLSTUYREA;\123456789BCIMNOPVWXZ0Q'
" Qは使わない
let s:keys = 'JFHGKDLSTUYREA;\123456789BCIMNOPVWXZ0'

function! s:GotoFunc()

  "便宜上の措置
  GotoFuncCloseWin

  let n = 0
  let funcs = []
  let ftop = []

  PushPos

  keepjumps normal! gg

  while 1
    keepjumps normal! ]]

    if line(".") == line("$")
      break
    endif

    keepjumps normal! k

    " TODO 各スタイルに対応

   "call add(funcs, printf("%2d  %2s  %s", n + 1, n < len(s:keys) ? s:keys[n] : n + 1, getline(".")))
   "call add(funcs, printf("%2s  %s    // %2d  ", n < len(s:keys) ? s:keys[n] : n + 1, getline("."), n + 1))
    call add(funcs, printf("%2s   %s", n < len(s:keys) ? s:keys[n] : n + 1, getline(".")))
    if 1
      call add(funcs, '')
    endif

    call add(ftop, line('.'))
    let n += 1

    keepjumps normal! j
  endwhile

  call add(funcs, printf("[  %d  ]  ", n))

  PopPos

  let s:win_id = popup_create( funcs, #{
        \ line: 'cursor+1',
        \ col: 'cursor',
        \ posinvert: v:true,
        \ pos: 'center',
        \ minwidth: 30,
        \ maxheight: &lines - 4 - 3,
        \ tabpage: 0,
        \ wrap: v:false,
        \ zindex: 200,
        \ mousemoved: [0, 0, 0],
        \ drag: 1,
        \ highlight: 'NormalPop',
        \ border: [1, 1, 1, 1],
        \ close: 'click',
        \ padding: [1, 4, 1, 1],
        \ })
        " cursorline: 1,
        " moved: 'any',
        " time: a:time,
        " mask: mask
        " filter: 'popup_filter_menu',

  call setbufvar(winbufnr(s:win_id), '&filetype', getbufvar(bufnr(), '&filetype'))

  redraw

  if n >= len(s:keys)
    let m = input("> ")
  else
    echo "> "
    let m = nr2char(getchar())
    call feedkeys("<CR>")
  endif

  let nn = match(s:keys, m)

  if nn >= 0 && nn < n
   "exe "normal!" ftop[nn] . "G"
    exe "normal!" ftop[nn] . "Gz\<CR>"
    normal! 0f(bz<CR>
  elseif m =~ '\d\+'
    " 救済
   "exe "normal!" ftop[m - 1] . "G"
    exe "normal!" ftop[m - 1] . "Gz\<CR>"
    normal! 0f(bz<CR>
  endif

  call popup_close(s:win_id)
endfunction

let s:win_id = 0

function! GotoFunc_CloseWin()
  call popup_close(s:win_id)
endfunction
call EscEsc_Add('call GotoFunc_CloseWin()')

nnoremap <leader>f :call <SID>GotoFunc()<CR>
com! GotoFuncCloseWin call GotoFunc_CloseWin()




function! s:mk_temp(...)
  let c = 'sp '
  if a:0 > 0
    if     a:1 =~ '^e' | let c = 'e '
    elseif a:1 =~ '^n' | let c = 'e '
    elseif a:1 =~ '^t' | let c = 'tabnew '
    elseif a:1 =~ '^v' | let c = 'vs '
    endif
  endif
  exe c . tempname()
endfunction
com! -nargs=? TF call <SID>mk_temp(<f-args>)
com! -nargs=? TFe call <SID>mk_temp("e")
com! -nargs=? TFs call <SID>mk_temp("s")
com! -nargs=? TFt call <SID>mk_temp("t")
com! -nargs=? TFv call <SID>mk_temp("v")
"com! TF exe "sp " . tempname()

" type は、"r"かそれ以外""
"exe "r!~/bin/matsub " . expand("#24:p") . " " . expand("#23:p")
function! Test0(type, cmd, ...)

  "let cmd = (a:type == 'r' ? a:type : '') . '!' . a:cmd
  let cmd = (a:type == 'r' ? a:type : '') . '!' . (a:cmd == '0' ? expand('%:p') : a:cmd)

  if a:0 == 0
    let cmd .= ' ' .  expand('%:p')
  else
    for i in a:000
      if i =~ '^\d\+$'
        let cmd .= ' ' . (i == 0 ? expand('%:p') : expand('#' . i . ':p'))
      else 
        let cmd .= ' ' . i
      endif
    endfor
  endif

  "echo cmd
  exe cmd
endfunction
" call Test0("r", "ls", 5, 8)
com! -nargs=* R call Test0('r', <f-args>)
com! -nargs=* P call Test0('n', <f-args>)



" IncSubstitude
"

function! IncSubstitude(...)
  echo a:000 a:0 a:1 a:2 a:3
  normal! gg
  for i in range(1, a:2)
    normal! n
    "echo i
    "exe 'normal! ' . '/' . a:1
    let s = 's/' . a:1 . '/' . printf(a:3, i) . '/'
    "echo s
    exe s
    "red
    "sleep 0.5
  endfor
endfunction
com! -nargs=* IncSubstitude call IncSubstitude('@', <f-args>)
"IncSubstitude 15 【テストケース%d】














" function! g:Get_highlight_info()
" 	let hl = []
" 	let old = ""
" 	for i in range(10)	" とりあえず10。普通はbreakする。
" 		let tmp = s:get_syn_name(s:get_syn_id(i))
" 		if tmp == old | break | endif
" 		let old = tmp
" 		call add(hl, tmp)
" 
" 		if 
" 		echo hl[i]
" 	endfor
" endfunction

" カーソル下のhighlight情報を表示する {{{

function! s:get_syn_id(transparent, col)
  let synid = synID(line('.'), a:col, 1)
  return a:transparent ? synIDtrans(synid) : synid
endfunction

function! s:get_syn_name(synid)
  return synIDattr(a:synid, 'name')
endfunction

function! g:Get_highlight_info(show, cont)
  let N = 10	" とりあえず10。普通はbreakする。

  let old = ""

  for i in range(N)	" 普通はbreakする。
    let hl = s:get_syn_name(s:get_syn_id(i, col('.')))

    if hl == old | break | endif
    let old = hl

    if a:show | echo '. ' . hl i | endif

    if hl =~? 'comment'	| return -1 | endif		" Block Comment
    if hl =~? 'string'	| return  1 | endif		" String
  endfor

  if a:cont
    let old = ""
    for i in range(N)	" 普通はbreakする。
      let hl = s:get_syn_name(s:get_syn_id(i, 1))

      if hl == old | break | endif
      let old = hl

      if a:show | echo '1 ' . hl | endif

      if hl =~? 'comment'	| return -1 | endif		" Block Comment
      "if hl =~? 'string'	| return  1 | endif		" String
    endfor
  endif

  return 0	" Normal
endfunction

command! HighlightInfo call g:Get_highlight_info(1, 1)


function! g:Get_highlight_info_LineLast(show, cont, off)
  let N = 10	" とりあえず10。普通はbreakする。

  let old = ""

  for i in range(N)	" 普通はbreakする。
    let hl = s:get_syn_name(s:get_syn_id(i, col('.')+a:off))

    if hl == old | break | endif
    let old = hl

    if a:show | echo '. ' . hl i | endif

    if hl =~? 'comment'	| return -1 | endif		" Block Comment
    if hl =~? 'string'	| return  1 | endif		" String
  endfor

  if a:cont
    let old = ""
    for i in range(N)	" 普通はbreakする。
      let hl = s:get_syn_name(s:get_syn_id(i, 1))

      if hl == old | break | endif
      let old = hl

      if a:show | echo '1 ' . hl | endif

      if hl =~? 'comment'	| return -1 | endif		" Block Comment
      "if hl =~? 'string'	| return  1 | endif		" String
    endfor
  endif

  return 0	" Normal
endfunction

"   echo hl_lang
"   echo hl_univ



"" " カーソル下のhighlight情報を表示する {{{
"" 
"" function! s:get_syn_id(transparent)
""   let synid = synID(line("."), col("."), 1)
""   if a:transparent
""     return synIDtrans(synid)
""   else
""     return synid
""   endif
"" endfunction
"" function! s:get_syn_attr(synid)
""   let name = synIDattr(a:synid, "name")
""   let ctermfg = synIDattr(a:synid, "fg", "cterm")
""   let ctermbg = synIDattr(a:synid, "bg", "cterm")
""   let guifg = synIDattr(a:synid, "fg", "gui")
""   let guibg = synIDattr(a:synid, "bg", "gui")
""   return {
""         \ "name": name,
""         \ "ctermfg": ctermfg,
""         \ "ctermbg": ctermbg,
""         \ "guifg": guifg,
""         \ "guibg": guibg}
"" endfunction
"" function! s:get_syn_info()
""   let baseSyn = s:get_syn_attr(s:get_syn_id(0))
""   echo "name: " . baseSyn.name .
""         \ " ctermfg: " . baseSyn.ctermfg .
""         \ " ctermbg: " . baseSyn.ctermbg .
""         \ " guifg: " . baseSyn.guifg .
""         \ " guibg: " . baseSyn.guibg
""   let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
""   echo "link to"
""   echo "name: " . linkedSyn.name .
""         \ " ctermfg: " . linkedSyn.ctermfg .
""         \ " ctermbg: " . linkedSyn.ctermbg .
""         \ " guifg: " . linkedSyn.guifg .
""         \ " guibg: " . linkedSyn.guibg
"" endfunction
"" command! SyntaxInfo call s:get_syn_info()



""" Form Vimrc


" Cscope
" nnoremap <C-j><C-a> :<C-u>cscope add cscope.out<CR>
" nnoremap <C-j><C-j> :<C-u>cscope find 
" nnoremap <C-j>c     :<C-u>cscope find c 
" nnoremap <C-j>d     :<C-u>cscope find d 
" nnoremap <C-j>e     :<C-u>cscope find e 
" nnoremap <C-j>f     :<C-u>cscope find f 
" nnoremap <C-j>g     :<C-u>cscope find g 
" nnoremap <C-j>i     :<C-u>cscope find i 
" nnoremap <C-j>s     :<C-u>cscope find s 
" nnoremap <C-j>t     :<C-u>cscope find t 
" nnoremap <C-j>C     :<C-u>cscope find c <C-r><C-w><CR>
" nnoremap <C-j>D     :<C-u>cscope find d <C-r><C-w><CR>
" nnoremap <C-j>E     :<C-u>cscope find e <C-r><C-w><CR>
" nnoremap <C-j>F     :<C-u>cscope find f <C-r><C-w><CR>
" nnoremap <C-j>G     :<C-u>cscope find g <C-r><C-w><CR>
" nnoremap <C-j>I     :<C-u>cscope find i <C-r><C-w><CR>
" nnoremap <C-j>S     :<C-u>cscope find s <C-r><C-w><CR>
" nnoremap <C-j>T     :<C-u>cscope find t <C-r><C-w><CR>


if exists('*smartchr#one_of')
  "TODO 行末
  inoremap <expr> , smartchr#one_of(', ', ',')

  " 演算子の間に空白を入れる
  inoremap <expr> + smartchr#one_of(' = ', ' == ', '=')
  inoremap <expr> + smartchr#one_of(' + ', '++', '+')
  inoremap <expr> - smartchr#one_of(' - ', '--', '-')
  inoremap <expr> * smartchr#one_of(' * ', '*')
  inoremap <expr> / smartchr#one_of(' / ', '/')
  inoremap <expr> % smartchr#one_of(' % ', '%')
  inoremap <expr> & smartchr#one_of(' & ', ' && ', '&')
  inoremap <expr> <Bar> smartchr#one_of(' <Bar> ', ' <Bar><Bar> ', '<Bar>')

  if &filetype == "c"
    " 下記の文字は連続して現れることがまれなので、二回続けて入力したら改行する
    inoremap <buffer><expr> } smartchr#one_of('}', '}<cr>')
    inoremap <buffer><expr> ; smartchr#one_of(';', ';<cr>')
  endif
  inoremap <expr> + smartchr#one_of(' = ', ' == ', '=')
endif


"nnoremap s f_l
"nnoremap S F_h
"nnoremap ci s
"nnoremap cI S


">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
function! CountFunctionLines()
  " 現在位置を保存
  let cur = line('.')
  normal! H
  let cur_top = line('.')
  execute 'normal ' . cur . 'G'
  " 関数先頭へ移動
  normal! [[
  let s = line('.')
  " 関数末尾へ移動
  normal! ][
  let e = line('.')
  " 結果表示
  echo e - s + 1
  " 保存していた位置に戻る
  execute 'normal ' . cur_top . 'G'
  normal! z<CR>
  execute 'normal ' . cur . 'G'
endfunction
command! FuncLines call CountFunctionLines()
"nnoremap <silent> <leader>l :<C-u>FuncLines<CR>
"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<



" test.vim }}}




" 起動速度

" どうしようもない時間は、170ms程度。余裕を見て180～200msくらいか。

"let did_install_default_menus = 1
" TODO $VIMRUNTIME/menu.vimを削除する。

" 以下を削除。
" $VIM\gvimrc
" $HOME\_gvimrc
" $VIMRUNTIME\gvimrc_example.vim




" .gvimrc {{{
" set guioptions=

"? scriptencoding utf-8
"? " vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)
"? 
"? 
"? " set visualbell t_vb=
"? 
"? " set guioptions=
"? 
"? " colorscheme Rimpa
"? 
"? " set transparency=235
"? 
"? " set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,a:blinkon0
"? " set guicursor=n-v-c:ver10-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,a:blinkon0
"? 
"? " call ResizeFont(0)
"? 
"? 
"? 
" .gvimrc }}}




inoremap <Left>	  <Nop>
inoremap <Right>  <Nop>
inoremap <Down>   <Nop>
inoremap <Up>     <Nop>

cnoremap <Left>	  <Nop>
cnoremap <Right>  <Nop>
cnoremap <Down>   <Nop>
cnoremap <Up>     <Nop>

cnoremap <S-Ins>  <Nop>




com! Utf8  setl fileencoding=utf-8
com! Cp932 setl fileencoding=cp932





" 最後に置かないと、au ColorScheme が実行されない。
colorscheme Rimpa




" Bug Issue
"     ・E443のメッセージ
"     ・NerdTreeVCS が無限ループ
"     ・zl zh が動かなくなる
"     ・find でワイルドカードを使用すると、E480のエラー。
"     ・CursorLineがONで、改行を含む文字列を検索したとき、hlsearchでの改行のハイライトがカレント行のときだけになるのは、おかしい。
"

com! QfStl setlocal stl=%#SLFileName#[\ %{winnr()}\ ]%##\ (\ %n\ )\ %t%{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ %=%-15(%l,%c%V%)\ %P



set cedit=<C-q>

augroup MyVimrc_CmdWin
  au!
  au CmdwinEnter * call s:init_cmdwin()
augroup end
function! s:init_cmdwin()
  "nnoremap <buffer> q :<C-u>quit<CR>
  "nnoremap <buffer> <TAB> :<C-u>quit<CR>
  "inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  "inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  "inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"

  "" Completion.
  "inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  "startinsert!

  nnoremap <buffer> <CR> <CR>
endfunction


hi PPP	guifg=#f6f3f0	guibg=#292927	gui=none	ctermfg=254	ctermbg=235
set previewpopup=height:30,width:120,highlight:PPP




" Func Inner Search ---------------------------------

"function s:func_inner_search()
function! FuncInnerSearch()
  let lines = FuncRange()

  let search = '\%>' . (lines[0] - 1) . 'l\%<' . (lines[1]  + 1). 'l'

  return search
endfunction

" TODO Cの特定の書き方しか対応してない。
function! FuncRange() 
  PushPos

  " 2jは、関数の先頭に居た時用
  " 2kは、関数定義行を含むため
  " TODO いずれも暫定
  keepjumps normal! 2j[[2k
  let first_line = line('.')
  keepjumps normal! ][
  let last_line = line('.')

  PopPos

  return [first_line, last_line]
endfunction




" EasyMotionn {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

let g:EasyMotion_smartcase = 1

let g:EasyMotion_use_migemo = 1

let g:EasyMotion_do_shade = 1
let g:EasyMotion_do_shade = 0

if 0
  nmap <Space>J <Plug>(easymotion-j)
  nmap <Space>K <Plug>(easymotion-k)
endif

if 0
  nmap <tab> <Plug>(easymotion-overwin-line)
  "nmap <Space><Space> <Plug>(easymotion-overwin-f2)
  "nmap M <Plug>(easymotion-overwin-f2)
  nmap <tab> <Plug>(easymotion-overwin-f2)
  nmap <tab> <Plug>(easymotion-overwin-w)
endif

if 0
  packadd vim-easymotion-master
  nmap <C-j> <Plug>(easymotion-overwin-w)
  nmap <C-j> <Plug>(easymotion-overwin-f2)
endif
if 0
  nmap <Space> <Plug>(easymotion-overwin-w)
endif

" EasyMotionn }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Tag_Test {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

"■仕様
"
" タグが1つならそれ
" 内部タグがあればそれ（内部タグ複数はない想定）
" 外タグなら
"   IncludeFilesに対して
"     1つならそれ
"     同Dirに1つならそれ
"     下位Dirに1つならそれ
"     TODO: ファイル名の特徴から推測
"   非IncludeFilesに対して
"     同Dirに1つならそれ
"     下位Dirに1つならそれ
"     TODO: ファイル名の特徴から推測
" ユーザ選択
"

function! GetTags(word)
 "echo len(taglist(expand('<cword>')))
 "let word = expand('<cword>')
 "let taglist = len(taglist(word))
  let taglist = taglist(a:word)
  let num_tag = len(taglist)
  PrettyPrint taglist
  echo num_tag
endfunction

com! GetTags call GetTags(expand('<cword>'))


function! GetIncludeFiles(file)
  let inclist = execute('checkpath!')
  "echo inclist
  let incs = split(inclist, '\n')
  call remove(incs, 0)
  call filter(incs, { idx, val -> val !~ '-->$' })
  call filter(incs, { idx, val -> val !~ ')$' })  " '(既に列挙)'行を削除
  call filter(incs, { idx, val -> val !~ '"\f\+"' })  " '見つかりません'行を削除
  "PrettyPrint incs

  return incs
endfunction

com! GetIncludeFiles call GetIncludeFiles(expand('%f'))

function! TTTT(word, mode)
  let taglist = taglist(a:word)
  "PrettyPrint taglist

  " タグが1つならそれ
  if len(taglist) == 1
    "return v:false
    exe 'tag' a:word
    return v:true
  endif

  let cmd_tag     = (a:mode =~? 'w' ? 's' : '') . 'tag'
  let cmd_tselect = (a:mode =~? 'w' ? 's' : '') . 'tselect'

  let t_file = range(len(taglist))

  " 内部タグがあればそれ（内部タグ複数はない想定）
  let cur_file = expand('%:p')
  for i in range(len(taglist))
    let t_file = fnamemodify(taglist[i]['filename'], ':p')
    " cache
    "let t_file[i] = fnamemodify(taglist[i]['filename'], ':p')
    if t_file == cur_file
      "exe i (a:mode =~? 'w' ? 's' : '')) . 'tag' a:word
      exe i cmd_tag a:word
      return v:true
    endif
    "echo i
  endfor

  "   IncludeFilesに対して
  let incs = GetIncludeFiles(expand('%f'))

  for i in range(len(taglist))
    "let t_file = fnamemodify(taglist[i]['filename'], ':p')
    for j in incs
      " TODO
      let inc = substitute(j, ' \+', '', 'g')
      let inc_file = fnamemodify(inc, ':p')
      "echo inc_file
      if t_file == inc_file
        "exe i (a:mode =~? 'w' ? 's' : '')) . 'tag' a:word
        exe i cmd_tag a:word
        return v:true
      endif
    endfor
    "echo i
  endfor

  " TODO
  "exe (a:mode =~? 'w' ? 's' : '')) . 'tselect' a:word
  exe cmd_tselect a:word

  """  "let num_tag = len(taglist)
  """  "echo num_tag

  """  "let org_dir = getcwd()

  """  if 0
  """    if 0
  """      for i in tagfiles()
  """        let dir = fnamemodify(i, ':h')
  """        echo dir
  """      endfor
  """    else
  """      let dir = GetPrjRoot()
  """    endif
  """  endif

  """  "exe 'cd ' . org_dir

  return v:false
endfunction

function! TTTT(word, mode)
  "let org_dir = getcwd()

  "if 0
  "  for i in tagfiles()
  "    let dir = fnamemodify(i, ':h')
  "    echo dir
  "  endfor
  "else
  "  let dir = GetPrjRoot()
  "endif
  "exe 'cd ' . dir

  let taglist = taglist('\<' . a:word . '\>')
  "PrettyPrint taglist

  "exe 'cd ' . org_dir

  if len(taglist) == 0
    return v:false
  endif

  let cmd_tag     = (a:mode =~? 'p' ? 'p' : (a:mode =~? 'w' ? 's' : '')) . 'tag'
  let cmd_tselect = (a:mode =~? 'p' ? 'p' : (a:mode =~? 'w' ? 's' : '')) . 'tselect'
  if a:mode =~? 's'
    let cmd_tag = cmd_tselect
  endif

  " タグが1つならそれ
  if len(taglist) == 1
    "return v:false
    exe cmd_tag a:word
    return v:true
  endif

  " 内部タグがあればそれ（内部タグ複数はない想定）
  let cur_file = expand('%:p')
  " カレントディレクトリ相対にしないと、ctagsとDOSでパスの形式が異なる。
  let cur_file = fnamemodify(cur_file, ':.')

  for i in range(len(taglist))
    let t_file = taglist[i]['filename']
    let t_file = fnamemodify(t_file, ':.')

     "echo '^r' t_file '$'
     "echo '^r' cur_file '$'
     "echo '^m' fnamemodify(t_file, ':.') '$'
     "echo '^m' fnamemodify(cur_file, ':.') '$'

    if t_file == cur_file
      "echo i
      exe i+1 cmd_tag a:word
      return v:true
    endif
    "echo i
  endfor

  "   IncludeFilesに対して

  "let dir = GetPrjRoot()
  "exe 'cd ' . dir
  let incs = GetIncludeFiles(expand('%f'))
  "exe 'cd ' . org_dir

  for i in range(len(taglist))
    let t_file = taglist[i]['filename']
    for j in incs
      " TODO Trim
      let inc = substitute(j, ' \+', '', 'g')

      let inc_file = inc
      "echo inc_file
      if t_file == inc_file
        " echo i
        " echo taglist[i - 1]
        " echo taglist[i    ]
        " echo taglist[i + 1]
        " sleep 2
        exe i+1 cmd_tag a:word
        return v:true
      endif
    endfor
    "echo i
  endfor

  exe cmd_tselect a:word

  return v:true
endfunction

com! TTTT call TTTT(expand('<cword>'), '')

if 0
  augroup TTTT
    au!
    au CursorHold *.[ch] nested exe "silent! psearch " . expand("<cword>")
  augroup end
  set previewpopup=
else
  augroup TTTT
    au!
  augroup end
endif

" Tag_Test }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



com! Unicode normal! g8
nnoremap ga ^C
nnoremap gA S



nunmap gU

nmap S *

nnoremap <C-s>           :<C-u>g$.$s    %%<Left>
vnoremap <C-s>                    :s    %%<Left>

nnoremap gs              :<C-u>g$.$s    %<C-R>/%%g<Left><Left>
vnoremap gs                       :s    %<C-R>/%%g<Left><Left>


augroup example
  autocmd!
  autocmd CmdUndefined Foo* execute 'command! -nargs=*' expand('<afile>') 'echo' string(expand('<afile>'))
augroup END
"FooBar
"" => FooBar


vnoremap ga :EasyAlign<Space>//<Left>
vnoremap g= :EasyAlign<Space>//<Left>
vnoremap A  :EasyAlign<Space>//<Left>



" onoremap ib iB
" onoremap ab aB

" onoremap ip ib
" onoremap ap ab

" onoremap iP ip
" onoremap aP ap

let NumWin = function('winnr',     ['$'])
let NumTab = function('tabpagenr', ['$'])



com! III normal! i" Path {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{<CR>" Path }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}<Esc>k0w


let g:EmAutoState = v:false



"com! -nargs=? CheckIncludes CommnadOutputCapture checkpath! | normal! /<args><CR>
com! -nargs=? CheckIncludes CommnadOutputCapture checkpath! | call feedkeys('/<args><CR>', 'n')
com! -nargs=? CheckPath CommnadOutputCapture checkpath! | call feedkeys('/<args><CR>', 'n')



" 正規表現 (肯|否)定(先|後)読み {{{
cnoremap <C-@>! \%()\@<!<Left><Left><Left><Left><Left>
cnoremap <C-@>@ \%()\@<=<Left><Left><Left><Left><Left>
cnoremap <C-@># \%()\@=<Left><Left><Left><Left>
cnoremap <C-@>$ \%()\@!<Left><Left><Left><Left>
" }}}


nnoremap <Leader>D :<C-u>e .<CR>



" Fold {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


nnoremap ]z :try <Bar> exe 'normal! ]z' <Bar> catch exe 'normal! zj' <Bar> endtry<CR>

com! ToggleFold if foldclosed(line('.')) != -1 | foldopen | else | foldclose | endif

" Fold }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



nnoremap  r gr
nnoremap gr r
nnoremap  R gR
nnoremap gR R


if 1
  set shellpipe=2>\&1\|iconv\ -f\ cp932\ -t\ utf-8\ -c>%s
  set shellpipe=2>\&1\|iconv\ -f\ cp932\ -t\ utf-8\ -c\ 2>\&1\|tee\ >%s
  set shellpipe=2>\&1\|iconv\ -f\ cp932\ -t\ utf-8\ -c\ 2>\&1\|tee
else
 "set shellpipe&
endif



cnoremap <C-r><C-t> <C-r><C-r>*



"+++++ autoload/Window/Focus.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0 expandtab :

if !exists('loaded_Window')
  finish
endif

let s:save_cpo = &cpo
set cpo&vim



"----------------------------------------------------------------------------------------
" Skip Terminal

function! Window#Focus#SkipTerm(direction)
  "Window番号を指定されていたら、そのWindowへ移動。
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
" Wrap Move

function! Window#Focus#WinWrapMove(m)
  if winnr('$') < 3
    "Windowの数が3未満なら、もう一方へ移動することは自明。
    wincmd w
    return
  endif


  let org = winnr()


  "++++++++++++ 元々指定された方向に動く ++++++++++++

  let last_moved_win = org

  while 1
    " terminalを全てSkipする必要があるので、ループする。

    let old = winnr()
    exe 'wincmd ' . a:m
    let new = winnr()

    if new == old
      " もう動けないので、orgに戻って終了。
      exe org 'wincmd w'
      break
    endif

    if &l:buftype !~ 'terminal' || term_getstatus(winbufnr(new)) =~ 'normal'
      " terminalでないwindowを見つけたので、移動して終了。
      " 一旦戻って、直接移動にしないと、前Window(<C-w>p)が意図しないものとなる。
      exe org 'wincmd w'
      exe new 'wincmd w'
      return
    else
      " 移動できた最後のwindowを憶えておく。 (直交移動で使う。)
      let last_moved_win = new
    endif
  endwhile


  "++++++++++++ 元々指定されのと反対方向に動く ++++++++++++

  let rev = {'h' : 'l', 'j' : 'k', 'k' : 'j', 'l' : 'h'}

  " ここでorgで初期化しておかないと、terminal windowへしか動けなったときに変数未定義になる。
  let last_not_term_win = org

  while 1
    " 逆端まで動く必要があるのでループする。

    let old = winnr()
    exe 'wincmd ' . rev[a:m]
    let new = winnr()

    if &l:buftype !~ 'terminal' || term_getstatus(winbufnr(new)) =~ 'normal'
      " 移動できた最後のterminalでないwindowを憶えておく。
      let last_not_term_win = winnr()
    endif

    if new == old
      " もう動けない。つまり、逆端まで動ききったということ。

      if org != last_not_term_win
	" 逆方向にterminalでないwindowがあったので、移動して終了。
	" 一旦戻って、直接移動にしないと、前Window(<C-w>p)が意図しないものとなる。
	exe org 'wincmd w'
	exe last_not_term_win 'wincmd w'
	return
      else
	if last_moved_win == org
	  " 移動できた最後のwindowを憶えておく。 (直交移動で使う。)
	  let last_moved_win = new
	endif
	break
      endif
    endif
  endwhile


  "++++++++++++ 直交移動 (水平、垂直を入れ替えて動く。) ++++++++++++
  " 適当に押しても、なるべく移動するため。

  " 以降の処理は、terminalでないwindowが2個以上ないと、無限再起に陥る。
  if (winnr('$') - s:get_num_of_not_normal_terminal()) > 2
    if last_moved_win != org
      " 移動できた最後のwindowに移動してから、直交移動を行う方が、本来意図に近い。
      exe last_moved_win 'wincmd w'
      call Window#Focus#WinWrapMove({'h' : 'k', 'j' : 'l', 'k' : 'h', 'l' : 'j'}[a:m])
      if org != winnr()
	return
      endif
      " それがダメなら、orgに戻ってから、直交移動を行う。
      exe org 'wincmd w'
    endif

    " orgを起点とした直交移動
    call Window#Focus#WinWrapMove({'h' : 'k', 'j' : 'l', 'k' : 'h', 'l' : 'j'}[a:m])
  endif
endfunction


" normal mode になっていない terminal window の数を返す。
function! s:get_num_of_not_normal_terminal()
  let n = 0

  let terms = term_list()

  for win in range(1, winnr('$'))
    let nr = winbufnr(win)
    if count(terms, nr) > 1 && term_getstatus(nr) =~# 'normal'
      let n += 1
    endif
  endfor
  return n
endfunction



let &cpo = s:save_cpo
unlet s:save_cpo
"+++++ autoload/Window/Resize.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0 expandtab :

if !exists('loaded_Window')
  finish
endif

let s:save_cpo = &cpo
set cpo&vim



"----------------------------------------------------------------------------------------
" Equal Only Height

function! Window#Resize#EqualOnlyHeight()
  let winfixwidth_save = range(winnr('$') + 1)  " 要素0は使われない。
  PushPosAll
  windo let winfixwidth_save[winnr()] = &l:winfixwidth
  windo let &l:winfixwidth = 1
  wincmd =
  windo let &l:winfixwidth = winfixwidth_save[winnr()]
  PopPosAll
endfunction



"----------------------------------------------------------------------------------------
" Equal Only Width
"
function! Window#Resize#EqualOnlyWidth()
  let winfixheight_save = range(winnr('$') + 1)  " 要素0は使われない。
  PushPosAll
  windo let winfixheight_save[winnr()] = &l:winfixheight
  windo let &l:winfixheight = 1
  wincmd =
  windo let &l:winfixheight = winfixheight_save[winnr()]
  PopPosAll
endfunction



"----------------------------------------------------------------------------------------
" Optimal Width

function! Window#Resize#SetOptimalWidth()
  let top = line('w0')
  let bot = line('w$')

  let max = 0
  for i in range(top, bot)
    "echo i virtcol([i, '$'])
    let max = max([max, virtcol([i, '$'])])
  endfor
  echo 'Width: ' . max

  ""let range(top, bot)
  "let lines = map( , virtcol([i, '$']) )
  "echo lines

  if bufname(0) =~ '^NERD_tree'
    let max -= 2
  endif

  exe max + (&number || &l:number || &relativenumber || &l:relativenumber ? 5 : 0) + &l:foldcolumn . ' wincmd |'
endfunction



"----------------------------------------------------------------------------------------
" Optimal Height

function! Window#Resize#SetOptimalHeight()
  let available_height = &lines - 6

  " バッファ全体を表示
  let buf_line = line('$') + 1

  if buf_line <= available_height
    exe buf_line 'wincmd _'
    let cur_line = line('.')
    normal! 1zt
    exe cur_line
  endif

  echo 'available_height' available_height 'buf_line' buf_line

  "TODO
  " 関数全体を表示
  " ブロック全体を表示
  " #ifブロック全体を表示
endfunction



let &cpo = s:save_cpo
unlet s:save_cpo
"+++++ colors/Asche.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Vim color file
" Maintainer:	Hans Fugal <hans@fugal.net>
" Last Change:	$Date: 2004/06/13 19:30:30 $
" Last Change:	$Date: 2004/06/13 19:30:30 $
" URL:		http://hans.fugal.net/vim/colors/desert.vim
" Version:	$Id: desert.vim,v 1.1 2004/06/13 19:30:30 vimboss Exp $

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="Asche"

hi Normal	guifg=White guibg=grey20

" highlight groups
hi Cursor	guibg=khaki guifg=slategrey
"hi CursorIM
"hi Directory
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
"hi ErrorMsg
hi VertSplit	guibg=#c2bfa5 guifg=grey50 gui=none
hi Folded	guibg=grey30 guifg=gold
hi FoldColumn	guibg=grey30 guifg=tan
hi IncSearch	guifg=slategrey guibg=khaki
"hi LineNr
hi ModeMsg	guifg=goldenrod
hi MoreMsg	guifg=SeaGreen
hi NonText	guifg=LightBlue guibg=grey30
hi Question	guifg=springgreen
hi Search	guibg=peru guifg=wheat
hi SpecialKey	guifg=#664488
hi StatusLine	guibg=#c2bfa5 guifg=black gui=none
hi StatusLineNC	guibg=#c2bfa5 guifg=grey50 gui=none
hi Title	guifg=indianred
hi Visual	gui=none guifg=khaki guibg=olivedrab
"hi VisualNOS
hi WarningMsg	guifg=salmon
"hi WildMenu
"hi Menu
"hi Scrollbar
"hi Tooltip

" syntax highlighting groups
hi Comment	guifg=SkyBlue
hi Constant	guifg=#ffa0a0
hi Identifier	guifg=palegreen
hi Statement	guifg=khaki	" gui=NONE
hi PreProc	guifg=indianred
hi Type		guifg=darkkhaki	" gui=NONE
hi Special	guifg=navajowhite
"hi Underlined
hi Ignore	guifg=grey40
"hi Error
hi Todo		guifg=orangered guibg=yellow2

" color terminal definitions
hi SpecialKey	ctermfg=darkgreen
hi NonText	cterm=bold ctermfg=darkblue
hi Directory	ctermfg=darkcyan
hi ErrorMsg	cterm=bold ctermfg=7 ctermbg=1
hi IncSearch	cterm=NONE ctermfg=yellow ctermbg=green
hi Search	cterm=NONE ctermfg=grey ctermbg=blue
hi MoreMsg	ctermfg=darkgreen
hi ModeMsg	cterm=NONE ctermfg=brown
hi LineNr	ctermfg=3
hi Question	ctermfg=green
hi StatusLine	cterm=bold,reverse
hi StatusLineNC cterm=reverse
hi VertSplit	cterm=reverse
hi Title	ctermfg=5
hi Visual	cterm=reverse
hi VisualNOS	cterm=bold,underline
hi WarningMsg	ctermfg=1
hi WildMenu	ctermfg=0 ctermbg=3
hi Folded	ctermfg=darkgrey ctermbg=NONE
hi FoldColumn	ctermfg=darkgrey ctermbg=NONE
hi DiffAdd	ctermbg=4
hi DiffChange	ctermbg=5
hi DiffDelete	cterm=bold ctermfg=4 ctermbg=6
hi DiffText	cterm=bold ctermbg=1
hi Comment	ctermfg=darkcyan
hi Constant	ctermfg=brown
hi Special	ctermfg=5
hi Identifier	ctermfg=6
hi Statement	ctermfg=3
hi PreProc	ctermfg=5
hi Type		ctermfg=2
hi Underlined	cterm=underline ctermfg=5
hi Ignore	cterm=bold ctermfg=7
hi Ignore	ctermfg=darkgrey
hi Error	cterm=bold ctermfg=7 ctermbg=1


hi CursorLine	guibg=NONE guifg=NONE gui=underline ctermbg=NONE cterm=underline
hi CursorColumn	guibg=#232323 ctermbg=236 gui=NONE
hi LineNr	guifg=#8888cc
hi LineNr	guifg=#77dd77
hi LineNr	guifg=#9999bb
hi CursorLineNr	guifg=#aaffaa
hi SLFilename	guibg=#1c1c1c
hi StatusLine	guibg=#949494 guifg=black gui=none
hi StatusLineNC	guibg=#747474 guifg=grey80 gui=none
hi Search	guibg=#3d40d0	guifg=white
hi ErrorMsg	guifg=black	guibg=#ffd129
hi Visual	guifg=#ffffd7 guibg=#444444 gui=none ctermfg=186 ctermbg=238
"hi Normal 	guifg=#f6f3f0 guibg=#282828 gui=none ctermfg=254 ctermbg=235


"vim: sw=4
"+++++ colors/Rimpa.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=8 sw=2 tw=0: (この行に関しては:help modelineを参照)

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "Rimpa"


" My favarite color  : #c0504d


" General colors
hi Normal	guifg=#f6f3f0	guibg=#202020	gui=none	ctermfg=254	ctermbg=235
hi Normal	guifg=#f6f3f0	guibg=#1c1c1c	gui=none	ctermfg=254	ctermbg=235
hi Normal	guifg=#f6f3f0	guibg=#282828	gui=none	ctermfg=254	ctermbg=235
hi Normal	guifg=#f6f3f0	guibg=#292927	gui=none	ctermfg=254	ctermbg=235
"hi Normal	guifg=#f6f3f0	guibg=#383838	gui=none	ctermfg=254	ctermbg=235
hi NormalNC	guifg=NONE	guibg=#181818	gui=none	ctermfg=254	ctermbg=235
hi NormalNC	guifg=NONE	guibg=#343434	gui=none	ctermfg=254	ctermbg=235
hi NormalNC	guifg=NONE	guibg=#383838	gui=none	ctermfg=254	ctermbg=235
hi NormalNC	guifg=NONE	guibg=#484848	gui=none	ctermfg=254	ctermbg=235
hi NormalPop	guifg=#f6f3f0	guibg=#181818	gui=none	ctermfg=254	ctermbg=235
"hi Normal	guifg=#f6f3f0	guibg=#0A0017	gui=none	ctermfg=254	ctermbg=235
"hi Normal	guifg=#f6f3f0	guibg=#170A00	gui=none	ctermfg=254	ctermbg=235
"hi Normal	guifg=#f6f3f0	guibg=#d0c589	gui=none	ctermfg=254	ctermbg=235	" 金箔背景
hi NonText	guifg=#808080	guibg=#303030	gui=none	ctermfg=242	ctermbg=237
hi NonText	guifg=#808080	guibg=#383838	gui=none	ctermfg=242	ctermbg=237
"hi NonText	guifg=#808080	guibg=#585858	gui=none	ctermfg=242	ctermbg=237
"hi NonText	guifg=#808080	guibg=#d0c589	gui=none	ctermfg=242	ctermbg=237	" 金箔背景
"hi Visual	gui=reverse
"hi Visual	guifg=#ffffd7	guibg=#444444	gui=none	ctermfg=186	ctermbg=238
hi Visual	guifg=NONE	guibg=#444444	gui=none	ctermfg=186	ctermbg=238
hi FoldColumn	guifg=#ff5d28	guibg=#444444
"hi FoldColumn	guifg=#ff5d28	guibg=#d0c589
hi Folded	guifg=#c0c0c0	guibg=#252525	gui=none
hi SignColumn	guifg=White	guibg=Red
hi SpecialKey	guifg=#2D2D2D	guibg=#222222	gui=none
hi SpecialKey	guifg=#343434	guibg=#282828	gui=none
hi SpecialKey	guifg=#3c3c3c	guibg=#282828	gui=none
hi SpecialKey	guifg=#3c3c3c	guibg=NONE	gui=none
hi Cursor	guifg=NONE	guibg=NONE	gui=reverse			ctermbg=0x241
hi CursorLine	guifg=NONE	guibg=NONE	gui=underline			ctermbg=NONE	cterm=underline
hi CursorColumn	guifg=NONE	guibg=#121212	gui=NONE			ctermbg=236
hi CursorColumn	guifg=NONE	guibg=#202020	gui=NONE			ctermbg=236
hi CursorColumn	guifg=NONE	guibg=#1A1A1A	gui=NONE			ctermbg=236

hi LineNr	guifg=#5c5a4f	guibg=#121212	gui=none	ctermfg=239	ctermbg=232
"hi CursorLineNr	guifg=#ffffff	guibg=#000000	gui=NONE	ctermfg=yellow			cterm=bold,underline
"hi CursorLineNr	guifg=#ffffff	guibg=#121212	gui=NONE	ctermfg=yellow			cterm=bold,underline
"hi CursorLineNr	guibg=#5c5a4f	guifg=#121212	gui=none	ctermfg=239	ctermbg=232
"hi CursorLineNr	guibg=#5c5a5f	guifg=#ffffff	gui=none	ctermfg=239	ctermbg=232
"hi CursorLineNr	guibg=#5c5a5f	guifg=#121212	gui=none	ctermfg=239	ctermbg=232
"hi CursorLineNr	guibg=#ff302d	guifg=#121212	gui=none	ctermfg=239	ctermbg=232
hi CursorLineNr	guibg=#cf302d	guifg=#121212	gui=none	ctermfg=239	ctermbg=232
hi CursorLineNr	guifg=#cf302d	guibg=NONE	gui=none	ctermfg=239	ctermbg=232
hi CursorLineNr	guifg=#cf302d	guibg=#121212	gui=none	ctermfg=239	ctermbg=232
hi CursorLineNr	guifg=#cf302d	guibg=NONE	gui=none	ctermfg=239	ctermbg=232
"hi CursorLineNr	guibg=#121212	guifg=#cf302d	gui=none	ctermfg=239	ctermbg=232
"hi CursorLineNr	guibg=#000000	guifg=#cf302d	gui=none	ctermfg=239	ctermbg=232
hi CursorLineNr	guifg=#ff6666	guibg=NONE	gui=none	ctermfg=239	ctermbg=232
hi CursorLineNr	guifg=#bb3333	guibg=NONE	gui=none	ctermfg=239	ctermbg=232
hi CursorLineNr	guifg=#efd3b8	guibg=#bb3333	gui=none
"hi CursorLineNr	guifg=#d0c589	guibg=#bb3333	gui=none
hi CursorLineNr	guifg=#efd3b8	guibg=#7f1f1a	gui=none
hi CursorLineNr	guifg=#cf302d	guibg=#282828	gui=none
hi CursorLineNr	guifg=#ff0000	guibg=#282828	gui=none
hi CursorLineNr	guifg=#ff302d	guibg=#282828	gui=none
hi CursorLineNr	guifg=#efd3b8	guibg=#7f1f1a	gui=none

hi Search	guifg=white	guibg=#b7282e
"hi QuickFixLine	guifg=NONE	guibg=NONE	gui=reverse
hi QuickFixLine	guifg=white	guibg=#87282e
hi QuickFixLine	guifg=NONE	guibg=NONE	gui=reverse
hi QuickFixLine	guifg=NONE	guibg=#404040	gui=none
hi MatchParen	guifg=#f6f3e8	guibg=#857b6f	gui=bold	ctermbg=59
hi Title	guifg=#f6f3e8	guibg=NONE	gui=bold


" For Completion Menu
hi Pmenu	guifg=#dcda8f	guibg=black	ctermfg=239	ctermbg=232
hi PmenuSel 	guifg=#000000	guibg=#c0504d	ctermfg=0	ctermbg=184
hi PmenuSbar 	guifg=#000000	guibg=black	ctermfg=0	ctermbg=184
hi PmenuThumb 	guifg=#000000	guibg=white	ctermfg=0	ctermbg=184

hi Pmenu	guifg=#eeeeee	guibg=#111111	ctermfg=239	ctermbg=232
hi PmenuSel 	guifg=#dcda8f	guibg=black	ctermfg=0	ctermbg=184

hi Pmenu	guifg=#eeeeee	guibg=black	ctermfg=239	ctermbg=232
hi PmenuSel 	guifg=#dcda8f	guibg=#333333	ctermfg=0	ctermbg=184

hi Pmenu	guifg=#eeeeee	guibg=#121212	ctermfg=239	ctermbg=232
hi PmenuSel 	guifg=#eeeeee	guibg=black	gui=none	ctermfg=0	ctermbg=184

hi Pmenu	guifg=#eeeeee	guibg=#121212	ctermfg=239	ctermbg=232
hi PmenuSel 	guifg=#121212	guibg=#eeddaa	gui=none	ctermfg=0	ctermbg=184

hi PmenuThumb 	guifg=#ddbbaa	guibg=#ddbbaa	ctermfg=0	ctermbg=184
hi PmenuSel	guifg=#eeeeee	guibg=#121212	ctermfg=239	ctermbg=232
hi Pmenu 	guifg=#fefefe	guibg=#343434	gui=none	ctermfg=0	ctermbg=184

hi Pmenu 	guifg=#cc4444	guibg=#343434	gui=none	ctermfg=0	ctermbg=184

" For Statusline
"hi StatusLine		guifg=#EF4123	guibg=#7f1f1a	gui=none	" ない
"hi StatusLine		guifg=#ff6666	guibg=#7f1f1a	gui=none	" Rimpaデフォルト 赤字
hi StatusLine		guifg=#dfc3a8	guibg=#7f1f1a	gui=none	" Rimpaデフォルト
hi StatusLine		guifg=#efd3b8	guibg=#7f1f1a	gui=none	" Rimpaデフォルト 高コントラスト白字
"hi StatusLine		guifg=#dfc3a8	guibg=#EF4123	gui=none	" 金赤   白字
"hi StatusLine		guifg=#efd3b8	guibg=#bb3333	gui=none	" 薄い赤 白字
"hi StatusLine		guifg=#efd3b8	guibg=#802020	gui=none	" 秋の色?
hi StatusLineNC		guifg=#5c5a4f	guibg=#300a03	gui=none
hi StatusLineNC		guifg=#5c5a4f	guibg=#101010	gui=none
hi SLNoNameDir		guifg=#5c5a4f	guibg=#000000	gui=none
hi SLFileName		guifg=#EF4123	guibg=#000000
hi SLFileName		guifg=#cf302d	guibg=#000000
"hi SLFileName		guifg=#cf302d	guibg=#170A00
"hi SLFileName		guifg=#EF4123	guibg=#000000
"hi SLFileName		guifg=#7f1f1a	guibg=#d0c589	gui=none	" guibgは色を錯覚するので#d0c589から補正

hi StatusLineTerm	guifg=#efd3b8	guibg=#d0330b	gui=none
hi StatusLineTermNC	guifg=#8f7368	guibg=#6d2006	gui=none

hi WildMenu		guifg=#ffffff	guibg=#000000
hi WildMenu		guifg=#efd3b8	guibg=#bb3333
hi WildMenu		guifg=#efd3b8	guibg=#7f1f1a	gui=none	" Rimpaデフォルト 高コントラスト白字
hi WildMenu		guifg=#efd3b8	guibg=#802020	gui=none	" 秋の色?
hi WildMenu		guifg=#dfc3a8	guibg=#EF4123	gui=none	" 金赤   白字
hi WildMenu		guifg=#efd3b8	guibg=#bb3333	gui=none	" 薄い赤 白字
hi WildMenu		guifg=#000000	guibg=#EF4123	gui=bold	" 
hi WildMenu		guifg=#ffffff	guibg=#2a2f5f	gui=none
hi WildMenu		guifg=#ffffff	guibg=#1a1f7f	gui=none
hi WildMenu		guifg=#ffffff	guibg=#000000	gui=none
hi WildMenu		guifg=#ffffff	guibg=#000000	gui=none
hi WildMenu		guifg=#cf302d	guibg=#000000
hi WildMenu		guifg=#d0c589	gui=none	ctermfg=184
hi WildMenu		guifg=#d0c589	guibg=#181818	gui=none	ctermfg=184
hi WildMenu		guifg=#d0c589	guibg=#080808	gui=none	ctermfg=184
hi WildMenu		guifg=#cdd129	guibg=#080808	gui=none	ctermfg=184
hi WildMenu		guifg=#dde139	guibg=#080808	gui=none	ctermfg=184
hi WildMenu		guifg=#acf0f2	guibg=#080808	gui=none	ctermfg=184
hi WildMenu		guifg=#85b0df	guibg=#080808	gui=none	ctermfg=184

"hi VertSplit		guifg=#121212	guibg=#300a03	gui=none
"hi VertSplit		guifg=#7f1f1a	guibg=black	gui=none
"hi VertSplit		guifg=#7f1f1a	guibg=#121212	gui=none
"hi VertSplit		guifg=#7f1f1a	guibg=#282828	gui=none
"hi VertSplit		guifg=#282828	guibg=#282828	gui=none	ctermfg=254	ctermbg=235
hi VertSplit		guifg=#121212	guibg=#121212	gui=none
"hi VertSplit		guifg=#282828	guibg=#282828	gui=none

hi MyMru		guifg=#E94040

if 1
  hi LineNr	guifg=#7c7a6f	guibg=#181818	gui=none
  hi VertSplit	guifg=#282828	guibg=#121212	gui=none
 "hi VertSplit	guifg=#121212	guibg=#282828	gui=none

 "hi LineNr	guifg=#7c7a6f	guibg=#282828	gui=none
 "hi VertSplit	guifg=#000000	guibg=#282828	gui=bold

  hi LineNr	guifg=#7c7a6f	guibg=#282828	gui=none
  hi VertSplit	guifg=#282828	guibg=#000000	gui=none
  hi LineNr	guifg=#7c7a6f	guibg=#1a1a1a	gui=none
  hi LineNr	guifg=#5c5a4f	guibg=#1a1a1a	gui=none
  hi VertSplit	guifg=#282828	guibg=#1a1a1a	gui=none
  hi VertSplit	guifg=#1a1a1a	guibg=#1a1a1a	gui=none
 "hi LineNr	guifg=#7c7a6f	guibg=#1d1d1d	gui=none
 "hi VertSplit	guifg=#1d1d1d	guibg=#1d1d1d	gui=none
 "hi VertSplit	guifg=#282828	guibg=#282828	gui=none
  hi LineNr	guifg=#5c5a4f	guibg=#282828	gui=none
  hi LineNr	guifg=#5c5a4f	guibg=NONE	gui=none
endif
"hi VertSplit		guifg=#d0c589	guibg=#d0c589	gui=none
"hi VertSplit		guifg=#1a1aaa	guibg=#efdf89	gui=none	" guibgは色を錯覚するので#d0c589から補正	fg青にした間違い
hi VertSplit		guifg=#1a1a1a	guibg=#d0c589	gui=none	" guibgは色を錯覚するので#d0c589から補正
hi VertSplit		guifg=#dfc3a8	guibg=#d0c589	gui=none	" guibgは色を錯覚するので#d0c589から補正
hi VertSplit		guifg=#7f1f1a	guibg=#d0c589	gui=none	" guibgは色を錯覚するので#d0c589から補正

hi StlGold		guifg=#1a1a1a	guibg=#d0c589	gui=none


" Asche
if 0
hi Normal	guifg=#f6f3f0	guibg=grey18	gui=none	ctermfg=254	ctermbg=235
hi NonText	guifg=#808080	guibg=grey22	gui=none	ctermfg=242	ctermbg=237
hi Normal	guifg=#f6f3f0	guibg=grey20	gui=none	ctermfg=254	ctermbg=235
hi NonText	guifg=#808080	guibg=grey30	gui=none	ctermfg=242	ctermbg=237
hi SpecialKey	guifg=#343434	guibg=NONE	gui=none
hi SpecialKey	guifg=#454545	guibg=NONE	gui=none
hi LineNr	guifg=#5c5a4f	guibg=NONE	gui=none	ctermfg=239	ctermbg=232
hi LineNr	guifg=#5c574f	guibg=NONE	gui=none	ctermfg=239	ctermbg=232
hi LineNr	guifg=#6c6a5f	guibg=NONE	gui=none	ctermfg=239	ctermbg=232
endif


" Tab
hi TabLine		guifg=#eeddcc	guibg=black	gui=underline
hi TabLine		guifg=#eeddcc	guibg=black	gui=none
hi TabLine		guifg=#7c6b5f	guibg=black	gui=none
hi TabLine		guifg=#8c7b6f	guibg=black	gui=none
hi TabLine		guifg=#d0c5a9	guibg=black	gui=none
hi TabLine		guifg=#8c7b73	guibg=black	gui=none
hi TabLine		guifg=#ac9b83	guibg=black	gui=none
hi TabLineSel		guifg=#efd3b8	guibg=#7f1f1a	gui=none
hi TabLineSel		guifg=#a63318	guibg=#111111	gui=underline
hi TabLineSel		guifg=#a63318	guibg=#111111	gui=none
hi TabLineSel		guifg=indianred
hi TabLineSel		guifg=red
hi TabLineSel		guifg=#EF4123
hi TabLineSel		guifg=#bb3333
hi TabLineSel		guifg=#cc1f1a
hi TabLineSel		guifg=#cc3333
hi TabLineSel		guibg=NONE
hi TabLineFill		guifg=#343434	guibg=black
hi TabLineDate		guifg=#efd3b8	guibg=#bb3333	gui=none
hi TabLineDate		guifg=#efd3b8	guibg=#7f1f1a	gui=none
hi TabLineFill		guifg=#d0c589	guibg=#d0c589
hi TabLineSep		guifg=black	guibg=#d0c589	gui=none
hi TabLineSep		guifg=#d0c589	guibg=black	gui=underline
hi TabLineSep		guifg=#d0c589	guibg=#d0c589	gui=none
hi TabLineSep		guifg=#d0c5b9	guibg=black	gui=none	" 錯覚のため、TabLineFillのfgから色を微調整。
hi TabLineSep		guifg=#d0c5b9	guibg=black	gui=underline	" 錯覚のため、TabLineFillのfgから色を微調整。
hi TabLineSep		guifg=#d0c5a9	guibg=black	gui=underline	" 錯覚のため、TabLineFillのfgから色を微調整。
hi TabLineSep		guifg=#d0c5a9	guibg=black	gui=NONE	" 錯覚のため、TabLineFillのfgから色を微調整。


" func_name
hi hl_func_name		guifg=#cdd129			gui=none	ctermfg=184
hi hl_func_name_stl	guifg=#85b0df	guibg=black	gui=none	ctermfg=184
hi hl_buf_name_stl	guifg=#ff5d28	guibg=black	gui=none	ctermfg=202

" Anzu PopWin
hi AnzuPopWin	guifg=#85b0df	guibg=#181818	gui=none	ctermfg=254	ctermbg=235

" Syntax highlighting
hi Comment 	guifg=#808080			ctermfg=244	| " gui=italic
hi Comment 	guifg=#848280			ctermfg=244	| " gui=italic
hi Todo 	guifg=#8f8f8f	gui=italic	ctermfg=245
hi Constant 	guifg=#acf0f2	gui=none	ctermfg=159
hi String 	guifg=#ff5d28	gui=none	ctermfg=202
hi Identifier 	guifg=#ff5d28	gui=none	ctermfg=202
hi Function 	guifg=#cdd129	gui=none	ctermfg=184
hi Type 	guifg=#ffad68	gui=none	ctermfg=202
hi Type 	guifg=#fdbd89	gui=none	ctermfg=184
hi Type 	guifg=#adb110	gui=none	ctermfg=184
hi Type 	guifg=#ff5d28	gui=none	ctermfg=184
hi Type 	guifg=#ffa678	gui=none	ctermfg=184
hi Type 	guifg=#bdbd89	gui=none	ctermfg=184
hi Type 	guifg=#bab889	gui=none	ctermfg=184
hi Type 	guifg=#beb589	gui=none	ctermfg=184
hi Type 	guifg=#cea589	gui=none	ctermfg=184
hi Type 	guifg=#d3ca94	gui=none	ctermfg=184
hi Type 	guifg=#f0c589	gui=none	ctermfg=184
hi Type 	guifg=#d8c589	gui=none	ctermfg=184
hi Type 	guifg=#cec589	gui=none	ctermfg=184
hi Type 	guifg=#d0c589	gui=none	ctermfg=184
"hi Type 	guifg=gold	gui=none	ctermfg=184
hi Statement 	guifg=#af5f5f	gui=none	ctermfg=131
hi Keyword	guifg=#cdd129	gui=none	ctermfg=184
hi PreProc 	guifg=#ede39e	gui=none	ctermfg=187
hi PreProc	guifg=indianred
hi PreProc 	guifg=#ff5d28	gui=none	ctermfg=202
hi PreProc	guifg=#bb99bb
hi PreProc	guifg=#9999bb
hi Include	guifg=#aaaaaa
hi Include	guifg=#cccccc
hi Include	guifg=#9999bb

"PreProc
hi PreProc	guifg=#9999bb
hi Include	guifg=#9999bb
hi Define	guifg=#bbeeff
hi Define	guifg=#bb9999
hi link Macro Define
hi PreCondit	guifg=#9999bb

hi String 	guifg=indianred
hi String	guifg=#bdbd89	gui=none	ctermfg=184
hi String 	guifg=#ffa678	gui=none	ctermfg=184
hi String 	guifg=#ff9678	gui=none	ctermfg=184
hi String 	guifg=#df9678	gui=none	ctermfg=184
"hi String 	guifg=#af5f5f	gui=none	ctermfg=131
hi String 	guifg=#ff9678	gui=none	ctermfg=184
"hi Statement	guifg=indianred
hi Number	guifg=indianred
hi Number 	guifg=#ff5d28	gui=none	ctermfg=202
hi Number 	guifg=#8cf2a0	gui=none	ctermfg=159
hi Number	guifg=#ede39e	gui=none	ctermfg=187
hi Number 	guifg=#acf0f2	gui=none	ctermfg=159
hi Number 	guifg=#fca08c	gui=none	ctermfg=159
hi Number	guifg=#ff9678	gui=none	ctermfg=184
hi String 	guifg=#ffbb88	gui=none	ctermfg=159
hi String 	guifg=#ffffaa	gui=none	ctermfg=159
hi String 	guifg=#ffaa88	gui=none	ctermfg=159
hi String 	guifg=#acf0f2	gui=none	ctermfg=159
"hi String 	guifg=#ffa678	gui=none	ctermfg=184
hi String	guifg=NONE	guibg=NONE	gui=italic	ctermfg=254	ctermbg=235
hi String	guifg=#ffddaa	guibg=NONE	gui=none	ctermfg=254	ctermbg=235
hi String	guifg=#9999bb
hi String	guifg=#E9EAEA
hi String	guifg=#99bb99
hi Number	guifg=#ff8f6f	gui=none	ctermfg=184	" Vim
hi Number	guifg=#ff9777	gui=none	ctermfg=184	" Vim
hi Number	guifg=#f08060	gui=none	ctermfg=184	" Vim
hi Number	guifg=#ff9797	gui=none	ctermfg=184	" C

hi Number	guifg=NONE	gui=NONE	ctermfg=184	" C
hi String	guifg=#ff9797	gui=none	ctermfg=184	" C
hi Number	guifg=NONE	gui=NONE	ctermfg=184	" C
hi Number	guifg=#e5e2d0	gui=NONE	ctermfg=184	" C
hi String	guifg=#ef3787	gui=none	ctermfg=184	" C
hi String	guifg=#ef6787	gui=none	ctermfg=184	" C
hi String	guifg=#ef7787	gui=none	ctermfg=184	" C
hi String	guifg=#ff8787	gui=none	ctermfg=184	" C
hi String	guifg=#ef5787	gui=none	ctermfg=184	" C
hi String	guifg=#ff8787	gui=none	ctermfg=184	" C
hi String	guifg=#efa787	gui=none	ctermfg=184	" C
hi String	guifg=#b7ef97	gui=none	ctermfg=184	" C
hi String	guifg=#bf97ff	gui=none	ctermfg=184	" C
hi String	guifg=#b797ef	gui=none	ctermfg=184	" C

hi Special	guifg=#acf0f2	gui=none	ctermfg=159

if 0
  " COMMON COLORS AND SETTINGS
  highlight PreProc guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  highlight Function guifg=#875f5f guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
  highlight Identifier guifg=#87afaf guibg=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
  highlight Statement guifg=#878787 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  highlight Constant guifg=#af8787 guibg=NONE gui=NONE ctermfg=138 ctermbg=NONE cterm=NONE
  highlight Type guifg=#af875f guibg=NONE gui=NONE ctermfg=137 ctermbg=NONE cterm=NONE
  highlight Label guifg=#878787 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  highlight Special guifg=#af5f5f guibg=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
  highlight Operator guifg=#878787 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  highlight Title guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  highlight Conditional guifg=#878787 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  highlight StorageClass guifg=#875f5f guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
  highlight htmlStatement guifg=#878787 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  highlight htmlItalic guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  highlight htmlArg guifg=#875f5f guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
  highlight cssIdentifier guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  highlight cssClassName guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  highlight Structure guifg=#875f5f guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
  highlight Typedef guifg=#875f5f guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
  highlight Repeat guifg=#878787 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  highlight Keyword guifg=#878787 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  highlight Exception guifg=#878787 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  highlight Number guifg=#af5f00 guibg=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
  highlight Character guifg=#af5f00 guibg=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
  highlight Boolean guifg=#af5f00 guibg=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
  highlight Float guifg=#af5f00 guibg=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
  highlight Include guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  highlight Define guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  "highlight Comment guifg=#87875f guibg=NONE gui=NONE ctermfg=101 ctermbg=NONE cterm=NONE
  highlight Repeat guifg=#87875f guibg=NONE gui=NONE ctermfg=101 ctermbg=NONE cterm=NONE
  highlight Conditional guifg=#87875f guibg=NONE gui=NONE ctermfg=101 ctermbg=NONE cterm=NONE

  highlight String guifg=#ffdf87 guibg=#121212 gui=NONE ctermfg=222 ctermbg=233 cterm=NONE
  highlight String guifg=#ffdf87 guibg=#1c1c1c gui=NONE ctermfg=222 ctermbg=234 cterm=NONE
  highlight String guifg=#ffdf87 guibg=#262626 gui=NONE ctermfg=222 ctermbg=235 cterm=NONE
  highlight String guifg=#ffdf87 guibg=NONE ctermfg=222 ctermbg=NONE cterm=NONE gui=NONE
endif

" Diff
hi DiffAdd	guifg=NONE	guibg=#200a0a	gui=NONE	term=bold	ctermbg=1
hi DiffDelete	guifg=#1a1a4a	guibg=#111130	gui=NONE	term=bold	ctermbg=1
hi DiffChange	guifg=NONE	guibg=NONE	gui=NONE	term=NONE	ctermbg=NONE
hi DiffText	guifg=NONE	guibg=#303088	gui=NONE	term=reverse	ctermbg=12	cterm=bold
hi DiffChange	guifg=NONE	guibg=#101010	gui=NONE	term=NONE	ctermbg=NONE
hi DiffText	guifg=NONE	guibg=#503058	gui=NONE	term=reverse	ctermbg=12	cterm=bold

hi DiffDelete	guifg=#101010	guibg=#101010	gui=NONE	term=bold	ctermbg=1
hi DiffChange	guifg=NONE	guibg=#111130	gui=NONE	term=NONE	ctermbg=NONE

hi DiffDelete	guifg=#101010	guibg=#111130	gui=NONE	term=bold	ctermbg=1
hi DiffChange	guifg=NONE	guibg=#101010	gui=NONE	term=NONE	ctermbg=NONE
hi DiffChange	guifg=NONE	guibg=#141414	gui=NONE	term=NONE	ctermbg=NONE

"hi DiffChange	guifg=NONE	guibg=NONE	gui=NONE	term=NONE	ctermbg=NONE
"hi DiffText	guifg=NONE	guibg=#111130	gui=NONE	term=reverse	ctermbg=12	cterm=bold
"hi DiffText	guifg=NONE	guibg=#802010	gui=NONE	term=reverse	ctermbg=12	cterm=bold
"hi DiffText	guifg=NONE	guibg=#701008	gui=NONE	term=reverse	ctermbg=12	cterm=bold
"hi DiffText	guifg=NONE	guibg=#600c04	gui=NONE	term=reverse	ctermbg=12	cterm=bold
"hi DiffAdd	guifg=NONE	guibg=#111130	gui=NONE	term=bold	ctermbg=1

" supplemental
hi qfFileName	guifg=#c0504d
hi ErrorMsg	guifg=black	guibg=#ffd129
hi ErrorMsg	guibg=black	guifg=#ffd129
hi ErrorMsg	guibg=black	guifg=#fff129
hi ErrorMsg	guibg=NONE	guifg=#f1ff29
hi ErrorMsg	guibg=NONE	guifg=#fff129


" File Tree
hi Directory	guifg=#ff2222	guibg=NONE
hi Directory	guifg=#ff4444	guibg=NONE
hi Directory	guifg=#ff6666	guibg=NONE




"""""""""""""""""""""""""""""""挿入モード時、ステータスラインの色を変更""""""""""""""""""""""""""""""

augroup InsertModeStlColor
  au!
  au InsertEnter  * call s:SetStatusLineColor('Insert')
  au InsertLeave  * call s:SetStatusLineColor('Normal')
  au CmdlineEnter * call s:SetStatusLineColor('CmdLine')
  au CmdlineLeave * call s:SetStatusLineColor('Normal')
augroup END

function! s:SetStatusLineColor(mode)
  if a:mode == 'Insert'
    silent highlight	StatusLine	guifg=white	guibg=#1a1f7f		gui=NONE	ctermfg=blue	ctermbg=yellow	cterm=NONE
  "elseif a:mode == 'Command'
    "silent highlight	StatusLine	guifg=darkblue	guibg=darkyellow	gui=NONE	ctermfg=blue	ctermbg=yellow	cterm=NONE
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

let s:sss = 1

if s:sss
function! s:SetStatusLineColor(mode)
  if a:mode == 'Insert'
    "silent highlight	CursorLineNr	guifg=White	guibg=#1a1f7f	gui=NONE	ctermfg=Blue			cterm=bold,underline
    "silent highlight	CursorLineNr	guifg=#aaccff	guibg=#1a1f7f	gui=NONE	ctermfg=Blue			cterm=bold,underline
    "silent highlight	CursorLineNr	guifg=black	guibg=darkyellow	gui=NONE	ctermfg=Blue			cterm=bold,underline
    "silent highlight	CursorLineNr	guifg=#aaccff	guibg=#0000ff	gui=NONE	ctermfg=Blue			cterm=bold,underline
    silent highlight	CursorLineNr	guifg=#b8d3ef	guibg=#4444ee	gui=NONE	ctermfg=Blue			cterm=bold,underline
  elseif a:mode == 'CmdLine'
   "silent highlight	StatusLine	guifg=white	guibg=#1a1f7f		gui=NONE	ctermfg=blue	ctermbg=yellow	cterm=NONE
    silent highlight	StatusLine	guifg=white	guibg=#2a2f5f		gui=NONE	ctermfg=blue	ctermbg=yellow	cterm=NONE
   "silent highlight	StatusLine	guifg=white	guibg=#000000		gui=NONE	ctermfg=blue	ctermbg=yellow	cterm=NONE
   "silent highlight	StatusLine	guifg=NONE	guibg=#181818	gui=none	ctermfg=254	ctermbg=235
    " 選択中項目は WildMenu 
    "redrawstatus
  else
    highlight clear CursorLineNr
    silent exec s:slhlcmdd
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction
endif

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

"silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')	" これだけだと、Command Lineの色が取得される。
augroup GetStatusLineHighlight
  au!
  au ColorScheme * silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
  au ColorScheme * au! GetStatusLineHighlight
augroup end


silent! let s:slhlcmdd = 'highlight ' . s:GetHighlight('CursorLineNr')




" gui cursor

"hi Cursor guifg=NONE guibg=red
"hi Cursor guifg=NONE guibg=black gui=none
hi Cursor	guifg=#c01f1a	guibg=black	gui=reverse	ctermbg=0x241
hi Cursor	guifg=#ffffff	guibg=black	gui=reverse	ctermbg=0x241
hi Cursor	guifg=indianred	guibg=black	gui=reverse	ctermbg=0x241
"hi CursorLine	guifg=NONE	guibg=NONE	gui=underline	ctermbg=NONE	cterm=underline

highlight CursorIM guifg=indianred guibg=indianred
highlight CursorIM guifg=yellow guibg=yellow

set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,a:blinkon0
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,a:blinkon0
set guicursor=n-v-c:ver10-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,a:blinkon0

set guicursor=n-v-c:block-blinkwait2000-blinkon600-blinkoff400-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
set guicursor=n-v-c:ver10-blinkwait2000-blinkon600-blinkoff400-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
set guicursor=n-v-c:ver10-blinkwait2000-blinkon600-blinkoff400-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:hor30-Cursor/lCursor,r-cr:Block-Cursor/lCursor
set guicursor=n-v-c:hor20-blinkwait2000-blinkon600-blinkoff400-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:hor30-Cursor/lCursor,r-cr:Block-Cursor/lCursor
set guicursor=n-v-c:block-blinkwait1000-blinkon600-blinkoff400-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:hor30-Cursor/lCursor,r-cr:Block-Cursor/lCursor
set guicursor=n-v-c:ver20-blinkwait1000-blinkon600-blinkoff400-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:hor30-Cursor/lCursor,r-cr:Block-Cursor/lCursor


" transparency
"?set transparency=244
"?set transparency=235




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

com! GuiFont echo '' &guifont

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


" 琳派
" Thinkpad
" Modern Red (Windows XP Zune)
" Zplus
"
" (Star Saver)
" (Comboy)


" kinaka 金赤	#EF4123	#ef4123
"
"
" TODO 赤っぽい橙 #FF3300


" Temp
hi Question	guifg=#cc1f1a
hi Question	guifg=#ff6666
hi Question	guifg=#dd3333
hi Question	guifg=#cf302d
hi WarningMsg	guifg=#cf302d

hi ErrorMsg	guifg=#44cc44
hi WarningMsg	guifg=#4444cc
hi Question	guifg=#666666

if 0

  hi ErrorMsg	guifg=#4444cc
  hi WarningMsg	guifg=#44cc44

  hi ErrorMsg	guifg=#cc4444
  hi WarningMsg	guifg=#cc4444

endif

hi ModeMsg	guifg=#cc4444	guibg=NONE


" 薄緑 hi TabLineFill		guifg=#00c589	guibg=#d0c589
com! KKK call s:SetStatusLineColor('CmdLine')



" #D13438
" #FF4141
" #F94C40
" #963634
"+++++ dos_mklink.bat ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
C:

cd C:\cygwin64\home\%USERNAME%

mklink .vimrc vimfiles\.vimrc

mklink .gvimrc vimfiles\.gvimrc



C:

cd C:\Users\%USERNAME%\bin\vim82-kaoriya-win64\

mklink vimrc_local.vim C:\cygwin64\home\%USERNAME%\vimfiles\vimrc_local.vim

mklink startuptime.bat C:\cygwin64\home\%USERNAME%\vimfiles\startuptime.bat





pause

"+++++ ftplugin/c.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:



" ========================================================================
"  Basic Setting

setl nowrap



" ========================================================================
"  Customize

let s:ccus_path = '~/vimfiles/pack/mypackage/start/tmp/plugin/customer.vim'
if filereadable(s:ccus_path)
  exe 'so ' . s:ccus_path
endif



" ========================================================================
"  Comment & String

iab CS /*

if exists("*Eatchar")
  iab <silent> CE */<C-R>=Eatchar('\s')<CR>
else
  iab          CE */
endif

iab CC //

" /* */コメントを楽に入れる
inoremap <buffer><expr> @ (<SID>in_str() != 0) ? '@' : '/*  */<left><left><left>'

" 文字列を楽に入れる
inoremap <buffer><expr> $ (<SID>in_str() != 0) ? '$' : '""<left>'



" ========================================================================
"  Jump to Function

nnoremap [[  [[k0f(bzt
nnoremap g[[ [[k0f(b
nnoremap ]]  :call <SID>jump_to_next_func()<CR>zt
nnoremap g]] :call <SID>jump_to_next_func()<CR>
function! s:jump_to_next_func()
  let fline = line('.')
  normal! ]]k0f(b
  if fline == line('.')
    normal! j]]k0f(b
  end
endfunc

vnoremap [[ [[k

vnoremap af ][<ESC>V[[kk



" ========================================================================
"  Grep

if 0
  noremap <buffer> <leader>r :vimgrep 
  noremap <buffer> <leader>g :set nocursorline<CR>:vimgrep /\C\<<C-r><C-w>\>/j *c *.h *.s *.S<CR>:set cursorline<CR>
  noremap <buffer> <leader>G :set nocursorline<CR>:grep "\C\<<C-r><C-w>\>" *c *.h *.s *.S<CR>:set cursorline<CR>
  noremap <buffer> <leader>w :vimgrep <C-r><C-w>
  noremap <buffer> <leader>i :vimgrep /<S-Insert>/j *c *.h *.s *.S<CR>
endif



" ========================================================================
"  smartchr (演算子の間に空白を入れる)

if exists("smartchr#one_of")
  inoremap <buffer><expr> + (<SID>in_str() != 0) ? '+' : smartchr#one_of(' + ', '++', '+')

  inoremap <buffer><expr> - (<SID>in_str() != 0) ? '-' : smartchr#one_of(' - ', '--', '-')

  inoremap <buffer><expr> % (<SID>in_str() != 0) ? '%' : smartchr#one_of(' % ', '%')

  inoremap <buffer><expr> ^ (<SID>in_str() != 0) ? '^' : smartchr#one_of(' ^ ', '^')

  inoremap <buffer><expr> ~ (<SID>in_str() != 0) ? '~' : smartchr#one_of(' ~ ', '~')

  inoremap <buffer><expr> <Bar> (<SID>in_str() != 0) ? '<Bar>' : smartchr#one_of(' <Bar> ', ' <Bar><Bar> ', '<Bar>')

  inoremap <buffer><expr> < (<SID>in_str() != 0) ? '<' : search('^#include\%#', 'bcn') ? ' <' : smartchr#one_of(' < ', ' << ', '<')

  inoremap <buffer><expr> > (<SID>in_str() != 0) ? '>' : search('^#include <.*\%#', 'bcn') ? '>' : smartchr#one_of(' > ', ' >> ', '>')

  inoremap <buffer><expr> = (<SID>in_str() != 0) ? '=' : Imap_eq('=')

  " 「->」は入力しづらいので、..で置換え
  inoremap <buffer><expr> . (<SID>in_str() != 0) ? '.' : smartchr#one_of('.', '->', '..')

  " 3項演算子
  inoremap <buffer><expr> ? (<SID>in_str() != 0) ? '?' : smartchr#one_of(' ? ', '?')
  inoremap <buffer><expr> : (<SID>in_str() != 0) ? ':' : smartchr#one_of(' : ', ':')

  " * はポインタで使う
  inoremap <buffer><expr> * (<SID>in_str() != 0) ? '*' :
	\ ( search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>\*\<bar>/\<bar>%\<bar>\^\<bar>>\<bar><\<bar>=\<bar>?\<bar>:\<bar>,\) \?\%#', 'bcn')
	\ <bar><bar> search('\(^\<bar>{\)\s*\%#', 'bcn') <bar><bar> search('(\%#', 'bcn') ) ? '*' :
	\ search('\(^\<bar>,\<bar>(\<bar>{\)\s*\(\w\s*\)*\i\+\s\?\%#', 'bcn') ? ' *' : smartchr#one_of(' * ', '*', '* ')

  " & は参照で使う
  inoremap <buffer><expr> & (<SID>in_str() != 0) ? '&' :
	\ search('\(<bar>\<bar>+\<bar>-\<bar>\*\<bar>/\<bar>%\<bar>\^\<bar>>\<bar><\<bar>=\<bar>?\<bar>:\<bar>,\) \?\%#', 'bcn')
	\ ?  smartchr#one_of('&', ' & ') : smartchr#one_of(' & ', ' && ', '&')

  " //コメントを楽に入れる
  inoremap <buffer><expr> / search('\(^\<bar>;\<bar>{\<bar>}\<bar>,\)\s*/\?/\?\s\?\%#','bcn') ? smartchr#one_of('// ', '//', '\<bs>/') : smartchr#one_of(' / ', '/')
endif


inoremap <expr> <buffer> .. (<SID>in_str() != 0) ? '..' : '->'



" ========================================================================
"  括弧前後の空白の自動挿入

" if/switch/for/while文直後の(は自動で間に空白を入れる
"iunmap <buffer> ((
inoremap <buffer><expr> ( search('\<\(if\\|switch\\|for\\|while\)\%#', 'bcn') ? ' (' : '('



" ========================================================================
"  セミコロンの自動挿入

function! s:semicolon()
  if search('^#.*\%#', 'bcn')
    "全てのプリプロセッサ命令行
  elseif search('\%#;', 'cn')
    "カーソル位置には既に;がある (これがないと、行末のセミコロンでEscしたとき、また;が付く。)
  elseif search('\%#,', 'cn')
    "カーソル位置に,がある (これがないと、TODO でEscしたとき、また;が付く。)
  elseif search('\([_0-9a-zA-Z)\]"'']\|++\|--\)\%#', 'bcn') || search('^\s*\i.*=\s\?{.*}\%#', 'bcn')
    "カーソル前が、イデンティファー文字、)、]、"、' のいずれか。	または、初期化付き配列宣言。
    "TODO 関数定義の終了以外の行頭の}
    if search('^\i.*\%#', 'bcn')
      "行頭がイデンティファー文字
      "関数定義、ラベルなのでセミコロンはなし
      "TODO グローバル変数の定義
    elseif s:in_str() != s:mdNon
    else
      if search('^\s*\(if\|else\|switch\|while\|for\).*\%#', 'bcn')
	"制御行
      elseif search('\%#.\s*$', 'cn') || search("\\%#.\\s*\\(/\\*\\\<bar>//\\)", 'cn') || !search('\%#..\+', 'cn') || search('\%#.\s*["''\w]', 'cn')
	"カーソル後には空白しかないか、カーソル後には空白+コメントしかないか、カーソル後に文字がない.			または、別の文が右にある。
	return ';'
      endif
    endif
  endif
  return ''
endfunction

function! s:semicolon_plus()
                               " 1文字手前を調べる必要がある。
  if Get_highlight_info_LineLast(0, 1, -1) == 0
    return s:semicolon()
  else
    return ''
  endif
endfunction

function! Semicolon_plus()
                               " 1文字手前を調べる必要がある。
  if Get_highlight_info_LineLast(0, 1, -1) == 0
    return s:semicolon()
  else
    return ''
  endif
endfunction

if 0
  "inoremap <buffer><expr>	<CR>	pumvisible() ? '<C-y>' : (<SID>in_str() != 0) ? '<CR>' : <SID>semicolon() . '<CR>'
  "inoremap <buffer><expr>	<ESC>	pumvisible() ? '<C-e>' : (<SID>in_str() != 0) ? '<ESC>' : <SID>semicolon() . '<ESC>'
  "inoremap <buffer><expr>	<CR>	pumvisible() ? '<C-y>' : (<SID>in_str() != 0) && (Get_highlight_info(0, 1) != 0) ? '<CR>' : <SID>semicolon() . '<CR>'
  "inoremap <buffer><expr>	<ESC>	pumvisible() ? '<C-e>' : (<SID>in_str() != 0) && (Get_highlight_info(0, 1) != 0) ? '<ESC>' : <SID>semicolon() . '<ESC>'
  "inoremap <buffer><expr>	<CR>	pumvisible() ? '<C-y>' : (Get_highlight_info(0, 1) != 0) ? '<CR>' : <SID>semicolon() . '<CR>'
  inoremap <buffer><expr>	<CR>	pumvisible() ? '<C-y>' : <SID>semicolon_plus() . '<CR>'
  inoremap <buffer><expr> <Esc>	pumvisible() ? '<C-e>' : <SID>semicolon_plus() . '<Esc>'
  inoremap <buffer><expr> gg	pumvisible() ? '<C-y>' : '' . <SID>semicolon_plus() . '<Esc>:w<CR>'
  inoremap <buffer><expr> jj	pumvisible() ? '<C-N><C-N>' : ( <SID>semicolon_plus() . '<Esc>:w<CR>' )
  "inoremap <buffer><expr>	<ESC>	pumvisible() ? '<C-e>' : (Get_highlight_info(0, 1) != 0) ? '<ESC>' : <SID>semicolon() . '<ESC>'
endif


function! C_Semicolon2()
  return <SID>semicolon()
endfunction
function! C_Semicolon()
" if &ft != 'c'
"   return ''
" endif
  "sleep 1
  "echo "@@@@ " Get_highlight_info(0, 1) 
  if Get_highlight_info(0, 1) == 0
    "return feedkeys(<SID>semicolon(), 'ntx')
    exe "silent noautocmd normal! a\<C-r>=C_Semicolon2()\<CR>"
  endif
endfunction

augroup C_Semicolon
  au!
  "au InsertLeave c,cpp call C_Semicolon()
" au InsertLeave c,cpp call C_Semicolon()
augroup end

"call IEscPre_Add('C_Semicolon')




" ========================================================================
"  Snipet

if 0
  function! s:Tab()
    if pumvisible()
      call feedkeys("\<C-n>")
      return ''
    else
      return TriggerSnippet()
    endif
  endfunction

  "inoremap <buffer>	<Tab>	<C-R>=<SID>Tab()<CR>
  inoremap <buffer>	<Tab>	<C-R>=TriggerSnippet()<CR>
  inoremap <buffer><expr>	<S-Tab>	pumvisible() ? '<C-p>' : '<C-p><C-n>'
endif



" ========================================================================
"  補完

"so $HOME/.vim/macros/complete.vim
"inoremap <buffer><expr> . pumvisible() ? "\<C-E>.\<C-X>\<C-O>\<C-N>" : ".\<C-X>\<C-O>\<C-N>"



" ========================================================================
"  in_str()

"let s:mdHed = -99	"行頭
let s:mdSlsh = -3	"単独/ (コメント開始記号の開始の可能性がある)
let s:mdLCmt = -2	"ラインコメント
let s:mdBCmt = -1	"ブロックコメント
let s:mdNon  =  0	"デフォルト
let s:mdStr  =  1	"文字列

function! s:in_str()
  let mode = s:mdNon
  let lin = getline(".")
  let col = col(".") - 1
  "let str = strpart(lin, 0, col - 1)
  "echo strpart(lin, 0, col)
  let i = 0
  while i < col
    let chr = strpart(lin, i, 1) | let i += 1
    if chr == '/'
      if i < col
	let chr = strpart(lin, i, 1) | let i += 1
	if chr == '*'
	  let mode = s:mdBCmt
	  while i < col
	    let chr = strpart(lin, i, 1)| let i += 1
	    if chr == '*'
	      if i < col
		let chr = strpart(lin, i, 1)| let i += 1
		if chr == '/'
		  let mode = s:mdNon
		endif
	      endif
	    endif
	  endwhile
	elseif chr == '/'
	  let mode = s:mdLCmt
	endif
      elseif
	let mode = s:mdSlsh
      endif
    elseif chr == '"'
      let mode = s:mdStr
      while i < col
	let chr = strpart(lin, i, 1)| let i += 1
	if chr == '\\'
	  if i < col
	    let chr = strpart(lin, i, 1)| let i += 1
	  endif
	  continue
	elseif chr == '"'
	  let mode = s:mdNon
	endif
      endwhile
    elseif chr == "'"
      let mode = s:mdStr
      while i < col
	let chr = strpart(lin, i, 1)| let i += 1
	if chr == '\\'
	  if i < col
	    let chr = strpart(lin, i, 1)| let i += 1
	  endif
	  continue
	elseif chr == "'"
	  let mode = s:mdNon
	endif
      endwhile
    else
      let mode = s:mdNon
    endif
  endwhile
  "echo chr
  return mode
endfunction

func! s:in_str_test()
    echo <SID>in_str()
endfunc
com! InStrTest :call <SID>in_str_test()



" ========================================================================
"  TODO

"TODO case行でコロンの自動付加
"TODO 単独elseの後に；を付加しないようにする。
"so $VIMRUNTIME/pack/takubo/start/tmp/plugin/test.vim

"+++++ ftplugin/qf.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:


if exists("b:did_ftplugin")
  "finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

let b:undo_ftplugin = "set stl<"

" Display the command that produced the list in the quickfix window:
setlocal stl=%t%{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ %=%-15(%l,%c%V%)\ %P


nnoremap <silent> <buffer> dd :call <SID>del_entry()<CR>
nnoremap <silent> <buffer> x :call <SID>del_entry()<CR>
vnoremap <silent> <buffer> d :call <SID>del_entry()<CR>
vnoremap <silent> <buffer> x :call <SID>del_entry()<CR>

nnoremap <silent> <buffer> u :<C-u>call <SID>undo_entry()<CR>

nnoremap <buffer> p <CR>zz<C-w>p

if exists('*s:undo_entry')
  finish
endif

function! s:del_entry() range
  let qf = getqflist()
  let history = get(w:, 'qf_history', [])
  call add(history, copy(qf))
  let w:qf_history = history
  unlet! qf[a:firstline - 1 : a:lastline - 1]
  call setqflist(qf, 'r')
  execute a:firstline
endfunction

function! s:undo_entry()
  let history = get(w:, 'qf_history', [])
  if !empty(history)
    call setqflist(remove(history, -1), 'r')
  endif
endfunction
"+++++ macros/EscEsc.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:

if exists('g:loaded_EscEsc')
  finish
endif
let g:loaded_EscEsc = 1

let s:save_cpo = &cpo
set cpo&vim


let s:EscEsc = []


function! EscEsc_Add(str)
  if count(s:EscEsc, a:str) == 0
    call add(s:EscEsc, a:str)
  endif
endfunction


function! EscEsc_Del(str)
  call filter(s:EscEsc, 'v:val !~ a:str')
endfunction


function! EscEsc_Exe()
  for i in s:EscEsc
    "echo i
    exe i
  endfor
endfunction


" 'noh'はユーザ定義関数内では(事実上)実行出来ないので、別途実行の要あり。
nnoremap <silent> <Plug>(EscEsc) :<C-u>call EscEsc_Exe() <Bar> noh  <Bar> echon <CR>


com! EscDisp echo s:EscEsc


let &cpo = s:save_cpo
unlet s:save_cpo
"+++++ macros/PushposPopPos.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:

if exists('g:loaded_PushposPopPos')
  finish
endif
let g:loaded_PushposPopPos = 1

let s:save_cpo = &cpo
set cpo&vim



"" データ構造定義 """"""""""""""""
"  dict {
"    'TopRow' : #;
"    'Cursor' : [];
"  } s:SavePos[スタック];
""""""""""""""""""""""""""""""""""

let s:SavePos = []


function! PushPos()
  " 画面最上行番号取得 (インデックス1が行番号)
  let toprow = getpos('w0')[1]

  " カーソル位置取得
  let cursor = getcurpos()

  " スタックへ保存
  call add(s:SavePos, {'TopRow' : toprow, 'Cursor' : cursor})
endfunction


function! ApplyPos()
  " " スタックが空なら何もしない
  " if empty(s:SavePos) | return | endif

  " silentを付けて回る!!!!!!

  " スタックトップの要素を取得
  let savepos = get(s:SavePos, len(s:SavePos)- 1)

  " 画面最上行番号を復帰
  " scrolloffを一旦0にしないと、上手く設定できない。
  let save_scrolloff = &scrolloff
  let &scrolloff = 0
  exe "normal! " . savepos['TopRow'] . "zt"
  let &scrolloff = save_scrolloff

  " カーソル位置を復帰
  call setpos('.', savepos['Cursor'])
endfunction


function! DropPos()
  " " スタックが空なら何もしない
  " if empty(s:SavePos) | return | endif

  " スタックトップの要素を除去
  call remove(s:SavePos, len(s:SavePos)- 1)
endfunction


function! PopPos()
  call ApplyPos()
  call DropPos()
endfunction



" ---------------
" PushPos_All:
" ---------------
function! PushPos_All()
    PushPos
    let g:now_buf = bufnr('')
    let g:now_win = winnr()
    let g:now_tab = tabpagenr()
endfunction


" ---------------
" PopPos_All:
" ---------------
function! PopPos_All()
    silent exe 'tabnext ' . g:now_tab
    silent exe g:now_win . 'wincmd w'
    silent exe 'buffer ' . g:now_buf
    PopPos
endfunction



com! -bar PushPos  call PushPos()
com! -bar ApplyPos call ApplyPos()
com! -bar DropPos  call DropPos()
com! -bar PopPos   call PopPos()

com! -bar PushPosAll call PushPos_All()
com! -bar PopPosAll  call PopPos_All()



let &cpo = s:save_cpo
unlet s:save_cpo
"+++++ plugin/BrowserJump.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim: set ts=8 sts=2 sw=2 tw=0 :

if exists('loaded_BrowserJump')
  finish
endif
let loaded_BrowserJump = v:true

let s:save_cpo = &cpo
set cpo&vim


function! s:init_win()
  let w:BrowserJumpList = []
  let w:BrowserJumpNowIndex = -1
  let w:BrowserJumpTop = v:false
endfunction


augroup BrowserJump
  au!
  au WinNew * call s:init_win()
  au VimEnter * PushPosAll | exe 'tabdo windo call s:init_win()' | PopPosAll
augroup end


com! -nargs=0 BrowserJumpBack         call BrowserJump#Back()
com! -nargs=0 BrowserJumpFoward       call BrowserJump#Foward()
com! -nargs=0 BrowserJumpHistory      call BrowserJump#History()
com! -nargs=0 BrowserJumpToggleOrgPos call BrowserJump#ToggleOrgPos()


nnoremap <silent> <Plug>(BrowserJump-Back)         :<C-u>BrowserJumpBack<CR>
nnoremap <silent> <Plug>(BrowserJump-Foward)       :<C-u>BrowserJumpFoward<CR>
nnoremap <silent> <Plug>(BrowserJump-Disp)         :<C-u>BrowserJumpHistory<CR>
nnoremap <silent> <Plug>(BrowserJump-ToggleOrgPos) :<C-u>BrowserJumpToggleOrgPos<CR>


let &cpo = s:save_cpo
unlet s:save_cpo
"+++++ plugin/CommnadOutput.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim: set ts=8 sts=2 sw=2 tw=0 :

if exists('loaded_CommnadOutput')
  "inish
endif
let loaded_CommnadOutput = v:true

let s:save_cpo = &cpo
set cpo&vim


" これだど、Buffer LocalやWindow Local なオプション値を正しく取得できない。
" checkpathも同様。
"function! s:cmd_out_capture(args, banged)
"  new
"  silent put =CommnadOutput(join(a:args))
"  1,2delete _
"endfunction


function! s:cmd_out_capture(args, banged)
  silent let @z = CommnadOutput(join(a:args))
  new
  put z
  1,2delete _
endfunction


function! s:cmd_out_yank(args, banged)
  silent let @* = CommnadOutput(join(a:args))
endfunction


function! CommnadOutputLine(args)
  return split(CommnadOutput(a:args), '\n')
endfunction


function! CommnadOutput(cmd)
  redir => result
  silent execute a:cmd
  redir END
  return result
endfunction


command! -nargs=+ -bang -complete=command CommnadOutputCapture call s:cmd_out_capture([<f-args>], <bang>0)
command! -nargs=+ -bang -complete=command CommnadOutputYank    call s:cmd_out_yank([<f-args>], <bang>0)


let &cpo = s:save_cpo
unlet s:save_cpo
"+++++ plugin/CygTerm.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim: set ts=8 sts=2 sw=2 tw=0 :

if !has('win32')
  finish
endif

if exists('loaded_CygTerm')
  finish
endif
let loaded_CygTerm = v:true

let s:save_cpo = &cpo
set cpo&vim


"com! -nargs=0 SH call system('/cygdrive/C/cygwin/bin/mintty.exe --size maxheight,maxwidth')
"com! -nargs=0 SH call system("/cygdrive/C/cygwin/bin/mintty.exe --title 'Vim Term' --size 160,50 -B void ")
"com! -nargs=0 SH call system("/cygdrive/C/cygwin/bin/mintty.exe --title 'Vim Term' --size 160,50 -B frame")
"com! -nargs=0 SH call system("/cygdrive/C/cygwin/bin/mintty.exe --title 'Vim Term' --size 160,50")
"com! -nargs=0 SH call system("/cygdrive/C/cygwin/bin/mintty.exe --title 'Vim Term' --size 160,50 /cygdrive/C/cygwin/bin/zsh.exe")
"com! -nargs=0 SH call system("/cygdrive/C/cygwin/bin/mintty.exe --option Locale=ja_JP --option Charset=UTF-8 --title 'Vim Term' --size 160,50 /cygdrive/C/cygwin/bin/zsh.exe")
"com! -nargs=0 SH call system("/cygdrive/C/cygwin/bin/mintty.exe --option Locale=ja_JP --option Charset=UTF-8 --title 'Vim Term' --size 160,50 -")


function! s:Sh()
python3 << PYCODE
import subprocess
subprocess.Popen(["C:/cygwin64/bin/mintty.exe", "--title", "Vim Term", "--size", "160,50", "-o", "Locale=ja_JP", "-o", "Charset=UTF-8", "C:/cygwin64/bin/zsh.exe"])  # , "-B", "frame"
PYCODE
endfunction


function! s:ShFront()
python3 << PYCODE
import ctypes
hWnd = ctypes.windll.user32.FindWindowW(None, "Vim Term")
if hWnd is not 0:
  ctypes.windll.user32.SetForegroundWindow(hWnd)
  vim.command(':let found = v:true')
else:
  vim.command(':let found = v:false')
PYCODE
  if !found
    SH
  endif
endfunction


com! SH call s:Sh()
com! -nargs=0 SHFront call s:ShFront()

nnoremap <silent> <C-z> :<C-u>SHFront<CR>
nnoremap <silent> g<C-z> :<C-u>SH<CR>


let &cpo = s:save_cpo
unlet s:save_cpo
"+++++ plugin/MultiHighLight.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0 expandtab: (この行に関しては:help modelineを参照)

if exists('loaded_MultipleHighLight')
  "finish
endif
let loaded_MultipleHighLight = v:true

if !has("gui_running")
  echoerr 'MultiHighLight.vim suppote GUI only.'
  "finish
endif


let s:BgColorSequence = [ "#b7282e", "red",   "blue",  "yellow", "magenta", "green", "cyan",  "#ee8822", "#22ee88", "#8822ee", "#ee2288", "#2288ee" ]
let s:FgColorSequence = [ "white",   "white", "white", "black",  "white",   "black", "black", "black",   "black",   "black",   "black",   "black"   ]


" ---------------
" Add
" ---------------
function! MultiHighLight_Add(pat)
  if a:pat == ''
    return
  endif

  let n = len(g:HighlightPatterns)

  if n == 0
    call s:set_autocmd()
  endif

  PushPosAll
  silent tabdo windo call matchadd('MultiHighLight' . n % s:ColorMax, a:pat, 1, 4 + n)
  PopPosAll

  call add(g:HighlightPatterns, a:pat)

  let s:Suspending = v:false
endfunction


" ---------------
" Reset
" ---------------
function! MultiHighLight_Reset()
  call MultiHighLight_Suspend()

  let g:HighlightPatterns = []
endfunction


" ---------------
" Suspend
" ---------------
function! MultiHighLight_Suspend()
  if !s:Suspending
    PushPosAll
    silent tabdo windo for i in range(len(g:HighlightPatterns)) | call matchdelete(4 + i) | endfor
    PopPosAll
  endif

  call s:unset_autocomd()

  let s:Suspending = v:true
endfunction


" ---------------
" Resume
" ---------------
function! MultiHighLight_Resume()
  PushPosAll
  silent tabdo windo for i in range(len(g:HighlightPatterns)) | call matchadd('MultiHighLight' . i % s:ColorMax, g:HighlightPatterns[i], 1, 4 + i) | endfor
  PopPosAll

  call s:set_autocmd()

  let s:Suspending = v:false
endfunction


" ---------------
" AutoCmd
" ---------------
function! s:set_autocmd()
  augroup MultiHighLight
    " 新規Windowを開いたときに、auで色を付けないといけない。
    au WinNew * for i in range(len(g:HighlightPatterns)) | call matchadd('MultiHighLight' . i % s:ColorMax, g:HighlightPatterns[i], 1, 4 + i) | endfor
  augroup end
endfunction

function! s:unset_autocomd()
  augroup MultiHighLight
    au!
  augroup end
endfunction


" ---------------
" Init
" ---------------
function! s:init()
  " All Clear
  PushPosAll
  silent tabdo windo call clearmatches()
  PopPosAll

  " Init Vars
  let s:ColorMax = len(s:BgColorSequence)
  let g:HighlightPatterns = []
  let s:Suspending = v:false  " Suspend中にResetされるとmatchdeleteがエラーになってしまう。

  " Make highlight
  augroup MultiHighLightColor
    au!
  augroup end
  for i in range(s:ColorMax)
    exe 'autocmd MultiHighLightColor VimEnter,ColorScheme * highlight MultiHighLight' . i . ' guifg=' . s:FgColorSequence[i] . ' guibg=' . s:BgColorSequence[i]
  endfor

  call s:unset_autocomd()
endfunction


call s:init()


" TODO
" matchaddのIDを自動取得にする
" Initでは clearmatches しない
" tabdo ではなく、auにする。
" 関数化を進める
" au を set unsetするのではなく、関数内のスイッチで制御する
" EscEsc_Addの処置
" Suspendingをなくしたい
"+++++ plugin/Numbers.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim: set ts=8 sts=2 sw=2 tw=0 :

if exists('loaded_Numbers')
  "finish
endif
let loaded_Numbers = v:true

let s:save_cpo = &cpo
set cpo&vim


let g:em_use_octal = v:false
let g:em_extend_bin = v:true
let g:em_extend_dec = v:false
let g:em_extend_hex = v:false


let s:b2h = { '0000' : '0', '0001' : '1', '0010' : '2', '0011' : '3', '0100' : '4', '0101' : '5', '0110' : '6', '0111' : '7',
            \ '1000' : '8', '1001' : '9', '1010' : 'a', '1011' : 'b', '1100' : 'c', '1101' : 'd', '1110' : 'e', '1111' : 'f' }

let s:h2b_dsip = { '0' : 'oooo', '1' : 'oooI', '2' : 'ooIo', '3' : 'ooII', '4' : 'oIoo', '5' : 'oIoI', '6' : 'oIIo', '7' : 'oIII',
                 \ '8' : 'Iooo', '9' : 'IooI', 'a' : 'IoIo', 'b' : 'IoII', 'c' : 'IIoo', 'd' : 'IIoI', 'e' : 'IIIo', 'f' : 'IIII' }

let s:h2b_norm = { '0' : '0000', '1' : '0001', '2' : '0010', '3' : '0011', '4' : '0100', '5' : '0101', '6' : '0110', '7' : '0111',
                 \ '8' : '1000', '9' : '1001', 'a' : '1010', 'b' : '1011', 'c' : '1100', 'd' : '1101', 'e' : '1110', 'f' : '1111' }

let s:now_disp = 0
let s:old_r_numstr = ''
let s:win_id = 0


function! s:ana_numstr(word)
  let rawstr = a:word
  let numstr = ''
  let base = 0

  if rawstr =~? '^0x\x\+[lLuU]\{,3\}$'	" long long型リテラルは、0x56LLのようにLが2つ付く
    let base = 16
    let numstr = substitute(strpart(rawstr, 2), '[ulUL]\+', '', '')
  elseif rawstr =~? '^\([1-9]\d*\|0\+\)[lLuU]\{,3\}$'	" 0のみから構成される数は、Cの仕様上、厳密には8進であるが、便宜上10進として扱う。
    let base = 10
    let numstr = substitute(rawstr, '[ulUL]\+', '', '')
  elseif g:em_use_octal && rawstr =~? '^0\o\+$'
    let base = 8
    let numstr = rawstr
  elseif rawstr =~? '^0b[01]\+$'  " 2進リテラル(C99)
    let base = 2
    let numstr = strpart(rawstr, 2)
  elseif g:em_extend_bin && rawstr =~? '^\(0b\)\?[_01]\{3,\}$'  " Cの接頭辞がない2進数 および 桁区切りにアンダースコアを使う2進数
    let base = 2
    let numstr = substitute(rawstr, '^0b\|_', '', 'g')
  elseif g:em_extend_hex && rawstr =~? '^\x\+$'  " Cの接頭辞がない16進数
    let base = 16
    let numstr = rawstr
  elseif g:em_extend_dec && rawstr =~? '^\([0-9,]\+\)$'  " 桁区切りにカンマを使う10進数
    let base = 10
    let numstr = substitute(rawstr, '^0\+\|,', '', 'g')
  elseif !g:em_use_octal && rawstr =~? '^\([0-9]\+\)$'  " 0で始まる10進数
    let base = 10
    let numstr = substitute(rawstr, '^0\+\|,', '', 'g')
  endif

  let ret = {'rawstr':rawstr, 'numstr':numstr, 'base':base}
  return ret
endfunc


function! s:hex_add_leading_zero(hex)
  let hex_len = len(a:hex)
  let hex = hex_len == 1 ? '0' . a:hex :
          \ hex_len == 3 ? '0' . a:hex :
          \ hex_len > 4 && hex_len <  8 ? matchstr('000' . a:hex, '.\{8\}$') :
          \ hex_len > 8 && hex_len < 16 ? matchstr('0000000' . a:hex, '.\{16\}$') :
          \ a:hex
  return hex
endfunction


function! s:hex2bin(hex, disp)
  let h2b = a:disp ? s:h2b_dsip : s:h2b_norm

  let bin = ''
  for i in split(a:hex, '\zs')
    let bin .= h2b[tolower(i)] . ' '
  endfor

  return bin
endfunc


function! Bin2Dec(bin)
  return Hex2Dec(Bin2Hex(a:bin))
endfunction


function! Bin2Hex(bin)
  let bin = a:bin

  let hex = ''
  while len(bin) > 0
    let tmp = matchstr('000' . strpart(bin, len(bin) - 4), '....$')
    let hex = s:b2h[tmp] . hex
    let bin = substitute(bin, '[01]\{0,4\}$', '', '')
  endwhile

  return s:hex_add_leading_zero(hex)
endfunc


function! Dec2Bin(dec)
  return s:hex2bin(Dec2Hex(a:dec), v:false)
endfunc


function! Dec2Hex(dec)
  if has('python3')
    python3 vim.command('let hex = "' + format(int(vim.eval('a:dec'), 10), 'x') + '"')
  else
    let hex = printf("%08x", a:dec)
  endif
  return s:hex_add_leading_zero(hex)
endfunc


function! Hex2Bin(hex)
  return s:hex2bin(a:hex, v:false)
endfunction


function! Hex2Dec(hex)
  if has('python3')
    python3 vim.command('let dec = "' + str(int(vim.eval('a:hex'), 16)) + '"')
  else
    let dec = printf("%u", (a:hex[0:1] != '0x' ? '0x' : '') . a:hex)
  endif
  return dec
endfunction


let s:GGG = 0

if s:GGG || v:version < 802
function! s:EmDisp(word)
  let r = s:ana_numstr(a:word)

  let dig = len(r.numstr)

  if r.base == 16
    let dec = printf('%-6s', Hex2Dec(r.numstr))
    let bin = s:hex2bin(r.numstr, v:true)
    let byt = len(r.numstr) / 2
    let bit = len(substitute(bin, '^[ o]\+\| ', '', 'g'))
    echo ' [Dec]' dec '    [Bin]' bin '' (winwidth(0) > 100 ? '    ' : '\n') '[Byt]' byt '    [Bit]' bit '    [Dig]' dig
    let s:now_disp = 1

  elseif r.base == 10
    let hex = Dec2Hex(r.numstr)
    let bin = s:hex2bin(hex, v:true)
    let byt = float2nr(ceil(len(hex) / 2.0))
    let bit = len(substitute(bin, '^[ o]\+\| ', '', 'g'))
    echo ' [Hex] 0x' . hex '    [Bin]' bin  '' (winwidth(0) > 100 ? '    ' : '\n') '[byt]' byt '    [Bit]' bit '    [Dig]' dig
    let s:now_disp = 1

  elseif r.base == 2
    let hex = Bin2Hex(r.numstr)
    let dec = Hex2Dec(hex)
    let byt = float2nr(ceil(len(r.numstr) / 8.0))
    let bit = len(substitute(r.numstr, '^0\+', '', ''))
    echo ' [Hex] 0x' . hex '    [Dec] ' dec '    [byt]' byt '    [Bit]' bit '    [Dig]' dig
    let s:now_disp = 1

  elseif s:now_disp
    echo ''
    let s:now_disp = 0
  endif
endfunction

else

function! s:EmDispPop(word)
  if !search('\%#\w', 'bcn')
    return
  endif
  let r = s:ana_numstr(a:word)

  let dig = len(r.numstr)

  let ret = []

  let old_now_disp = s:now_disp

  if r.base == 16
    let dec = printf('%-6s', Hex2Dec(r.numstr))
    let bin = s:hex2bin(r.numstr, v:true)
    let byt = len(r.numstr) / 2
    let bit = len(substitute(bin, '^[ o]\+\| ', '', 'g'))
    call add(ret, ' [Dec] ' . dec)
    call add(ret, ' [Bin] ' . bin)
    call add(ret, ' [Byt] ' . byt)
    call add(ret, ' [Bit] ' . bit)
    call add(ret, ' [Len] ' . dig)
    let s:now_disp = 1

  elseif r.base == 10
    let hex = Dec2Hex(r.numstr)
    let bin = s:hex2bin(hex, v:true)
    let byt = float2nr(ceil(len(hex) / 2.0))
    let bit = len(substitute(bin, '^[ o]\+\| ', '', 'g'))
    call add(ret, ' [Hex] 0x' . hex)
    call add(ret, ' [Bin] ' . bin)
    call add(ret, ' [byt] ' . byt)
    call add(ret, ' [Bit] ' . bit)
    call add(ret, ' [Len] ' . dig)
    let s:now_disp = 1

  elseif r.base == 2
    let hex = Bin2Hex(r.numstr)
    let dec = Hex2Dec(hex)
    let byt = float2nr(ceil(len(r.numstr) / 8.0))
    let bit = len(substitute(r.numstr, '^0\+', '', ''))
    call add(ret, ' [Hex] 0x' . hex)
    call add(ret, ' [Dec] ' . dec)
    call add(ret, ' [byt] ' . byt)
    call add(ret, ' [Bit] ' . bit)
    call add(ret, ' [Len] ' . dig)
    let s:now_disp = 1

  elseif s:now_disp
    "echo ''
    let s:now_disp = 0
    let s:old_r_numstr = r.numstr
  endif

  "echo 'n' s:now_disp 'o' s:old_r_numstr 'r' r.numstr 
  "if s:now_disp && s:old_r_numstr != r.numstr
  "if s:now_disp && (s:old_r_numstr != r.numstr || popup_getpos(s:old_win_id) == {})
  if s:now_disp
    "echo 'DISP '
    "call popup_close(s:old_win_id) " with moved word
    let s:old_win_id = popup_create( ret, #{
          \ line: 'cursor+1',
          \ col: 'cursor',
          \ moved: 'any',
          \ minwidth: 0,
          \ time: 5000,
          \ tabpage: 0,
	  \ wrap: v:false,
          \ zindex: 200,
          \ drag: 1,
          \ highlight: 'NumbersHl',
          \ close: 'click',
          \ padding: [0, 0, 0, 0],
          \ })
          " mask: [[1, 1, 1, 1], [-1, -1, 1, 1], [1, 1, -1, -1], [-1, -1, -1, -1]]
    let s:old_r_numstr = r.numstr
  endif
  return
endfunction

function! s:EmDispPop(word)
  if !search('\%#\w', 'bcn')
    return
  endif
  let r = s:ana_numstr(a:word)

  let dig = len(r.numstr)

  let ret = []
  let mask = []
  let disp_line = 1

  let old_now_disp = s:now_disp

  if r.base == 16
    let dec = printf('%s', Hex2Dec(r.numstr))
    let bin = s:hex2bin(r.numstr, v:true)
    let byt = len(r.numstr) / 2
    let bit = len(substitute(bin, '^[ o]\+\| ', '', 'g'))

    let dec_str = ' [Dec] ' . dec
    echo '^' . dec_str . '$'
    call add(ret, dec_str)
    call add(mask, [ strdisplaywidth(dec_str) + 2, -1, disp_line, disp_line])
    let disp_line += 1

    call add(ret, ' [Bin] ' . bin)
    let disp_line += 1

    let byt_str = ' [Byt] ' . byt
    call add(ret, byt_str)
    call add(mask, [ strdisplaywidth(byt_str) + 2, -1, disp_line, disp_line])
    let disp_line += 1

    let bit_str = ' [Bit] ' . bit
    call add(ret, bit_str)
    call add(mask, [ strdisplaywidth(bit_str) + 2, -1, disp_line, disp_line])
    let disp_line += 1

    let dig_str = ' [Len] ' . dig
    call add(ret, dig_str)
    call add(mask, [ strdisplaywidth(dig_str) + 2, -1, disp_line, disp_line])
    let disp_line += 1

    let s:now_disp = 1

  elseif r.base == 10
    let hex = Dec2Hex(r.numstr)
    let bin = s:hex2bin(hex, v:true)
    let byt = float2nr(ceil(len(hex) / 2.0))
    let bit = len(substitute(bin, '^[ o]\+\| ', '', 'g'))
    call add(ret, ' [Hex] 0x' . hex)
    call add(ret, ' [Bin] ' . bin)
    call add(ret, ' [byt] ' . byt)
    call add(ret, ' [Bit] ' . bit)
    call add(ret, ' [Len] ' . dig)
    call add(mask, [ strdisplaywidth(' [Len] ' . dig) + 2, -1, 5, 5])
    let s:now_disp = 1

  elseif r.base == 2
    let hex = Bin2Hex(r.numstr)
    let dec = Hex2Dec(hex)
    let byt = float2nr(ceil(len(r.numstr) / 8.0))
    let bit = len(substitute(r.numstr, '^0\+', '', ''))
    call add(ret, ' [Hex] 0x' . hex)
    call add(ret, ' [Dec] ' . dec)
    call add(ret, ' [byt] ' . byt)
    call add(ret, ' [Bit] ' . bit)
    call add(ret, ' [Len] ' . dig)
    call add(mask, [ strdisplaywidth(' [Len] ' . dig) + 2, -1, 5, 5])
    let s:now_disp = 1

  elseif s:now_disp
    "echo ''
    let s:now_disp = 0
    let s:old_r_numstr = r.numstr
  endif

  "echo 'n' s:now_disp 'o' s:old_r_numstr 'r' r.numstr 
  "if s:now_disp && s:old_r_numstr != r.numstr
  "if s:now_disp && (s:old_r_numstr != r.numstr || popup_getpos(s:old_win_id) == {})
  if s:now_disp
    "echo 'DISP '
    "call popup_close(s:old_win_id) " with moved word
    let s:old_win_id = popup_create( ret, #{
          \ line: 'cursor+1',
          \ col: 'cursor',
          \ moved: 'any',
          \ minwidth: 0,
          \ time: 5000,
          \ tabpage: 0,
	  \ wrap: v:false,
          \ zindex: 200,
          \ drag: 1,
          \ highlight: 'NumbersHl',
          \ close: 'click',
          \ padding: [0, 0, 0, 0],
	  \ mask: mask
          \ })
          " mask: [[1, 1, 1, 1], [-1, -1, 1, 1], [1, 1, -1, -1], [-1, -1, -1, -1]]
    let s:old_r_numstr = r.numstr
  endif
  return
endfunction

function! s:EmDispPop(word)
  if !search('\%#\w', 'bcn')
    return
  endif
  let r = s:ana_numstr(a:word)

  let dig = len(r.numstr)

  let ret = []
  let mask = []
  let disp_line = 1

  let old_now_disp = s:now_disp

  if r.base == 16
    let dec = printf('%s', Hex2Dec(r.numstr))
    let bin = s:hex2bin(r.numstr, v:true)
    let byt = len(r.numstr) / 2
    let bit = len(substitute(bin, '^[ o]\+\| ', '', 'g'))

    let dec_str = ' [Dec] ' . dec
    call add(ret, dec_str)
    call add(mask, [ strdisplaywidth(dec_str) + 2, -1, disp_line, disp_line])
    let disp_line += 1

    call add(ret, ' [Bin] ' . bin)
    let disp_line += 1

    let byt_str = ' [Byt] ' . byt
    call add(ret, byt_str)
    call add(mask, [ strdisplaywidth(byt_str) + 2, -1, disp_line, disp_line])
    let disp_line += 1

    let bit_str = ' [Bit] ' . bit
    call add(ret, bit_str)
    call add(mask, [ strdisplaywidth(bit_str) + 2, -1, disp_line, disp_line])
    let disp_line += 1

    let dig_str = ' [Len] ' . dig
    call add(ret, dig_str)
    call add(mask, [ strdisplaywidth(dig_str) + 2, -1, disp_line, disp_line])
    let disp_line += 1

    let s:now_disp = 1

  elseif r.base == 10
    let hex = Dec2Hex(r.numstr)
    let bin = s:hex2bin(hex, v:true)
    let byt = float2nr(ceil(len(hex) / 2.0))
    let bit = len(substitute(bin, '^[ o]\+\| ', '', 'g'))
    call s:sub_sub(' [Hex] 0x' . hex, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [Bin] ' .   bin, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [byt] ' .   byt, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [Bit] ' .   bit, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [Len] ' .   dig, ret, mask, disp_line) | let disp_line += 1
    let s:now_disp = 1

  elseif r.base == 2
    let hex = Bin2Hex(r.numstr)
    let dec = Hex2Dec(hex)
    let byt = float2nr(ceil(len(r.numstr) / 8.0))
    let bit = len(substitute(r.numstr, '^0\+', '', ''))
    call s:sub_sub(ret, ' [Hex] 0x' . hex, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(ret, ' [Dec] '   . dec, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(ret, ' [byt] '   . byt, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(ret, ' [Bit] '   . bit, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(ret, ' [Len] '   . dig, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(mask, [ strdisplaywidth(' [Len] ' . dig) + 2, -1, 5, 5])
    let s:now_disp = 1

  elseif s:now_disp
    "echo ''
    let s:now_disp = 0
    let s:old_r_numstr = r.numstr
  endif

  "echo 'n' s:now_disp 'o' s:old_r_numstr 'r' r.numstr 
  "if s:now_disp && s:old_r_numstr != r.numstr
  "if s:now_disp && (s:old_r_numstr != r.numstr || popup_getpos(s:old_win_id) == {})
  if s:now_disp
    "echo 'DISP '
    "call popup_close(s:old_win_id) " with moved word
    let s:old_win_id = popup_create( ret, #{
          \ line: 'cursor+1',
          \ col: 'cursor',
          \ moved: 'any',
          \ minwidth: 0,
          \ time: 5000,
          \ tabpage: 0,
	  \ wrap: v:false,
          \ zindex: 200,
          \ drag: 1,
          \ highlight: 'NumbersHl',
          \ close: 'click',
          \ padding: [0, 0, 0, 0],
	  \ mask: mask
          \ })
          " mask: [[1, 1, 1, 1], [-1, -1, 1, 1], [1, 1, -1, -1], [-1, -1, -1, -1]]
    let s:old_r_numstr = r.numstr
  endif
  return
endfunction

function! s:EmDispPop(word)
  if !search('\%#\w', 'bcn')
    return
  endif
  let r = s:ana_numstr(a:word)

  let dig = len(r.numstr)

  let ret = []
  let mask = []
  let disp_line = 1

  let old_now_disp = s:now_disp

  if r.base == 16
    let dec = printf('%s', Hex2Dec(r.numstr))
    let bin = s:hex2bin(r.numstr, v:true)
    let byt = len(r.numstr) / 2
    let bit = len(substitute(bin, '^[ o]\+\| ', '', 'g'))

    call s:sub_sub(' [Bin] ' . bin, ret, mask, disp_line)  | let disp_line += 1
    call s:sub_sub(' [Dec] ' . dec, ret, mask, disp_line)  | let disp_line += 1
    call s:sub_sub(' [Byt] ' . byt, ret, mask, disp_line)  | let disp_line += 1
    call s:sub_sub(' [Bit] ' . bit, ret, mask, disp_line)  | let disp_line += 1
    call s:sub_sub(' [Len] ' . dig, ret, mask, disp_line)  | let disp_line += 1

    let s:now_disp = 1

  elseif r.base == 10
    let hex = Dec2Hex(r.numstr)
    let bin = s:hex2bin(hex, v:true)
    let byt = float2nr(ceil(len(hex) / 2.0))
    let bit = len(substitute(bin, '^[ o]\+\| ', '', 'g'))
    call s:sub_sub(' [Bin] ' .   bin, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [Hex] 0x' . hex, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [byt] ' .   byt, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [Bit] ' .   bit, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [Len] ' .   dig, ret, mask, disp_line) | let disp_line += 1
    let s:now_disp = 1

  elseif r.base == 2
    let hex = Bin2Hex(r.numstr)
    let dec = Hex2Dec(hex)
    let byt = float2nr(ceil(len(r.numstr) / 8.0))
    let bit = len(substitute(r.numstr, '^0\+', '', ''))
    call s:sub_sub(' [Hex] 0x' . hex, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [Dec] '   . dec, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [byt] '   . byt, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [Bit] '   . bit, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [Len] '   . dig, ret, mask, disp_line) | let disp_line += 1
    let s:now_disp = 1

  elseif s:now_disp
    "echo ''
    let s:now_disp = 0
    let s:old_r_numstr = r.numstr
  endif

  "echo 'n' s:now_disp 'o' s:old_r_numstr 'r' r.numstr 
  "if s:now_disp && s:old_r_numstr != r.numstr
  "if s:now_disp && (s:old_r_numstr != r.numstr || popup_getpos(s:old_win_id) == {})
  if s:now_disp
    "echo 'DISP '
    "call popup_close(s:old_win_id) " with moved word
    let s:old_win_id = popup_create( ret, #{
          \ line: 'cursor+1',
          \ col: 'cursor',
          \ moved: 'any',
          \ minwidth: 0,
          \ time: 5000,
          \ tabpage: 0,
	  \ wrap: v:false,
          \ zindex: 200,
          \ drag: 1,
          \ highlight: 'NumbersHl',
          \ close: 'click',
          \ padding: [0, 0, 0, 0],
	  \ mask: mask
          \ })
          " mask: [[1, 1, 1, 1], [-1, -1, 1, 1], [1, 1, -1, -1], [-1, -1, -1, -1]]
    let s:old_r_numstr = r.numstr
  endif
  return
endfunction

function! s:EmDispPop(word, time = 5000)
  if !search('\%#\w', 'bcn')
    return
  endif
  let r = s:ana_numstr(a:word)

  let dig = len(r.numstr)

  let ret = []
  let mask = []
  let disp_line = 1

  let old_now_disp = s:now_disp

  if r.base == 16
    let dec = printf('%s', Hex2Dec(r.numstr))
    let bin = s:hex2bin(r.numstr, v:true)
    let byt = len(r.numstr) / 2
    let bit = len(substitute(bin, '^[ o]\+\| ', '', 'g'))

    call s:sub_sub(' [Dec] ' . dec, ret, mask, disp_line)  | let disp_line += 1
    call s:sub_sub(' [Bin] ' . bin, ret, mask, disp_line)  | let disp_line += 1
"   call s:sub_sub(' [Byt] ' . byt, ret, mask, disp_line)  | let disp_line += 1
    call s:sub_sub(' [Bit] ' . bit, ret, mask, disp_line)  | let disp_line += 1
    call s:sub_sub(' [Len] ' . dig, ret, mask, disp_line)  | let disp_line += 1

    let s:now_disp = 1

  elseif r.base == 10
    let hex = Dec2Hex(r.numstr)
    let bin = s:hex2bin(hex, v:true)
    let byt = float2nr(ceil(len(hex) / 2.0))
    let bit = len(substitute(bin, '^[ o]\+\| ', '', 'g'))
    call s:sub_sub(' [Hex] 0x' . hex, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [Bin] ' .   bin, ret, mask, disp_line) | let disp_line += 1
   "call s:sub_sub(' [byt] ' .   byt, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [Bit] ' .   bit, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [Len] ' .   dig, ret, mask, disp_line) | let disp_line += 1
    let s:now_disp = 1

  elseif r.base == 2
    let hex = Bin2Hex(r.numstr)
    let dec = Hex2Dec(hex)
    let byt = float2nr(ceil(len(r.numstr) / 8.0))
    let bit = len(substitute(r.numstr, '^0\+', '', ''))
    call s:sub_sub(' [Hex] 0x' . hex, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [Dec] '   . dec, ret, mask, disp_line) | let disp_line += 1
   "call s:sub_sub(' [byt] '   . byt, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [Bit] '   . bit, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [Len] '   . dig, ret, mask, disp_line) | let disp_line += 1
    let s:now_disp = 1

  elseif s:now_disp
    "echo ''
    let s:now_disp = 0
    let s:old_r_numstr = r.numstr
  endif

  "echo 'n' s:now_disp 'o' s:old_r_numstr 'r' r.numstr 
  "if s:now_disp && s:old_r_numstr != r.numstr
  "if s:now_disp && (s:old_r_numstr != r.numstr || popup_getpos(s:old_win_id) == {})
  if s:now_disp
    "echo 'DISP '
    "call popup_close(s:old_win_id) " with moved word
    let s:old_win_id = popup_create( ret, #{
          \ line: 'cursor+1',
          \ col: 'cursor',
	  \ flip: v:true,
          \ moved: 'any',
          \ minwidth: 0,
          \ time: a:time,
          \ tabpage: 0,
	  \ wrap: v:false,
          \ zindex: 200,
          \ drag: 1,
          \ highlight: 'NumbersHl',
          \ close: 'click',
          \ padding: [0, 0, 0, 0],
	  \ mask: mask
          \ })
          " mask: [[1, 1, 1, 1], [-1, -1, 1, 1], [1, 1, -1, -1], [-1, -1, -1, -1]]
    let s:old_r_numstr = r.numstr
  endif
  return
endfunction

function! s:EmDispPop(word, time = 4000)
  if !search('\%#\w', 'bcn')
    return
  endif
  let r = s:ana_numstr(a:word)

  let dig = len(r.numstr)

  let ret = []
  let mask = []
  let disp_line = 1

  let old_now_disp = s:now_disp

  if r.base == 16
    let dec = printf('%s', Hex2Dec(r.numstr))
    let bin = s:hex2bin(r.numstr, v:true)
    let byt = len(r.numstr) / 2
    let bit = len(substitute(bin, '^[ o]\+\| ', '', 'g'))

    call s:sub_sub(' [Bin] ' . bin, ret, mask, disp_line)  | let disp_line += 1
    call s:sub_sub(' [Dec] ' . dec, ret, mask, disp_line)  | let disp_line += 1
"   call s:sub_sub(' [Byt] ' . byt, ret, mask, disp_line)  | let disp_line += 1
    call s:sub_sub(' [Bit] ' . bit, ret, mask, disp_line)  | let disp_line += 1
    call s:sub_sub(' [Len] ' . dig, ret, mask, disp_line)  | let disp_line += 1

    let s:now_disp = 1

  elseif r.base == 10
    let hex = Dec2Hex(r.numstr)
    let bin = s:hex2bin(hex, v:true)
    let byt = float2nr(ceil(len(hex) / 2.0))
    let bit = len(substitute(bin, '^[ o]\+\| ', '', 'g'))
    call s:sub_sub(' [Bin] ' .   bin, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [Hex] 0x' . hex, ret, mask, disp_line) | let disp_line += 1
   "call s:sub_sub(' [byt] ' .   byt, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [Bit] ' .   bit, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [Len] ' .   dig, ret, mask, disp_line) | let disp_line += 1
    let s:now_disp = 1

  elseif r.base == 2
    let hex = Bin2Hex(r.numstr)
    let dec = Hex2Dec(hex)
    let byt = float2nr(ceil(len(r.numstr) / 8.0))
    let bit = len(substitute(r.numstr, '^0\+', '', ''))
    call s:sub_sub(' [Hex] 0x' . hex, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [Dec] '   . dec, ret, mask, disp_line) | let disp_line += 1
   "call s:sub_sub(' [byt] '   . byt, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [Bit] '   . bit, ret, mask, disp_line) | let disp_line += 1
    call s:sub_sub(' [Len] '   . dig, ret, mask, disp_line) | let disp_line += 1
    let s:now_disp = 1

  elseif s:now_disp
    "echo ''
    let s:now_disp = 0
    let s:old_r_numstr = r.numstr
  endif

  "echo 'n' s:now_disp 'o' s:old_r_numstr 'r' r.numstr 
  "if s:now_disp && s:old_r_numstr != r.numstr
  "if s:now_disp && (s:old_r_numstr != r.numstr || popup_getpos(s:old_win_id) == {})
  if s:now_disp
    "echo 'DISP '
    "call popup_close(s:old_win_id) " with moved word
    let s:win_id = popup_create( ret, #{
          \ line: 'cursor+2',
          \ col: 'cursor',
	  \ flip: v:true,
          \ moved: 'any',
          \ minwidth: 0,
          \ time: a:time,
          \ tabpage: 0,
	  \ wrap: v:false,
          \ zindex: 200,
          \ drag: 1,
          \ highlight: 'NumbersHl',
          \ close: 'click',
          \ padding: [0, 0, 0, 0],
	  \ mask: mask
          \ })
          " mask: [[1, 1, 1, 1], [-1, -1, 1, 1], [1, 1, -1, -1], [-1, -1, -1, -1]]
  endif
  return
endfunction

function! s:sub_sub(str, disp, mask, line)
    call add(a:disp, a:str)
    call add(a:mask, [ strdisplaywidth(a:str) + 2, -1, a:line, a:line])
endfunction


function! s:EmHighlight()
  hi NumbersHl	guifg=#d0bfb8	guibg=#000000
  hi NumbersHl	guifg=#cf302d	guibg=#000000
  hi NumbersHl	guifg=#cc9988	guibg=#000000
  hi NumbersHl	guifg=#85b0df	guibg=black	gui=none	ctermfg=184
endfunction

call s:EmHighlight()

endif


if s:GGG || v:version < 802
  command! EmDisp :call <SID>EmDisp(expand("<cword>"))
else
  command! EmDisp :call <SID>EmDispPop(expand("<cword>"))
endif



command! EmExtendTgl :let g:em_extend_bin = !g:em_extend_bin <Bar> let g:em_extend_dec = !g:em_extend_dec <Bar> let g:em_extend_hex = !g:em_extend_hex



function! s:EmAuto(set)
  augroup Numbers
    au!
    if a:set
      au CursorMoved,VimResized * EmDisp
      au CmdwinEnter * let <SID>now_disp = 0
    endif
    au ColorScheme * call <SID>EmHighlight()
  augroup end
  if !a:set
    call popup_close(s:win_id)
  endif
  let s:EmAutoState = a:set
endfunction

let s:EmAutoState = exists('g:EmAutoState') ? g:EmAutoState : v:true

call s:EmAuto(s:EmAutoState)

com! EmAuto call s:EmAuto(!s:EmAutoState)



inoremap <C-r><C-b><C-d> <C-r>=Bin2Dec('')<Left><Left>
inoremap <C-r><C-b><C-h> <C-r>=Bin2Hex('')<Left><Left>
inoremap <C-r><C-b><C-x> <C-r>=Bin2Hex('')<Left><Left>
inoremap <C-r><C-d><C-b> <C-r>=Dec2Bin('')<Left><Left>
inoremap <C-r><C-d><C-x> <C-r>=Dec2Hex('')<Left><Left>
inoremap <C-r><C-d><C-h> <C-r>=Dec2Hex('')<Left><Left>
inoremap <C-r><C-h><C-b> <C-r>=Hex2Bin('')<Left><Left>
inoremap <C-r><C-h><C-d> <C-r>=Hex2Dec('')<Left><Left>
inoremap <C-r><C-x><C-b> <C-r>=Hex2Bin('')<Left><Left>
inoremap <C-r><C-x><C-d> <C-r>=Hex2Dec('')<Left><Left>


function! s:cmd_driver(from, to, ...)
  let n = ( a:0 == 0 ? @" : a:1 )
  if n == ''
    echoerr 'no target.'
    return ''
  endif
  let n = substitute(n, '^0[bx]\|[lLuU\n]*$', '', '')
  let n = substitute(n, '[ ,_]', '', 'g')
  let m = {a:from . '2' . a:to}(n)
  let m = substitute(m, ' ', '', 'g')
  let m = (a:to == 'hex' ? '0x' : '') . m
  return m
endfunction


command! -nargs=? BD exe 'normal! ' . (search('^\%#$', 'cn') ? 'i' : 'ciw') . s:cmd_driver('Bin', 'Dec', <f-args>) . "\<Esc>"
command! -nargs=? BH exe 'normal! ' . (search('^\%#$', 'cn') ? 'i' : 'ciw') . s:cmd_driver('Bin', 'Hex', <f-args>) . "\<Esc>"
command! -nargs=? BX exe 'normal! ' . (search('^\%#$', 'cn') ? 'i' : 'ciw') . s:cmd_driver('Bin', 'Hex', <f-args>) . "\<Esc>"
command! -nargs=? DB exe 'normal! ' . (search('^\%#$', 'cn') ? 'i' : 'ciw') . s:cmd_driver('Dec', 'Bin', <f-args>) . "\<Esc>"
command! -nargs=? DH exe 'normal! ' . (search('^\%#$', 'cn') ? 'i' : 'ciw') . s:cmd_driver('Dec', 'Hex', <f-args>) . "\<Esc>"
command! -nargs=? DX exe 'normal! ' . (search('^\%#$', 'cn') ? 'i' : 'ciw') . s:cmd_driver('Dec', 'Hex', <f-args>) . "\<Esc>"
command! -nargs=? HB exe 'normal! ' . (search('^\%#$', 'cn') ? 'i' : 'ciw') . s:cmd_driver('Hex', 'Bin', <f-args>) . "\<Esc>"
command! -nargs=? XB exe 'normal! ' . (search('^\%#$', 'cn') ? 'i' : 'ciw') . s:cmd_driver('Hex', 'Bin', <f-args>) . "\<Esc>"
command! -nargs=? HD exe 'normal! ' . (search('^\%#$', 'cn') ? 'i' : 'ciw') . s:cmd_driver('Hex', 'Dec', <f-args>) . "\<Esc>"
command! -nargs=? XD exe 'normal! ' . (search('^\%#$', 'cn') ? 'i' : 'ciw') . s:cmd_driver('Hex', 'Dec', <f-args>) . "\<Esc>"


" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function! EmIsNum()
  return s:ana_numstr(expand("<cword>")).base != 0
endfunction

command! EmDispNoTimeOut call <SID>EmDispPop(expand("<cword>"), 0)

" ----------------------------------------------------------------------


"" Test

command! EmTestAnaNum :echo s:ana_numstr(expand("<cword>"))

" 0xaf45 0xf0 0b011100 0716 1234 65535 0xfdb97531 0xfdb97531ff 256 0b111111110000000011010000  0101111
" 0xaf45UL 0xf0ll 0b011100 0716 1234 65536 0xfdb97531 256a 0b111111110000000011010000  0101111
" 98,67878,2345 0b01011111000000001101_0000 0xffffffffffffffff 0xffffffffffffffffffffffffffffffff
" 0b11 993692464862809801080805478547854754953675 3 165535 18446744073709551606


"" TODO
"	シェル版の奇数変換コマンドの全てのオプションに対応


let &cpo = s:save_cpo
unlet s:save_cpo
"+++++ plugin/PrjTree.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim: set ts=8 sts=2 sw=2 tw=0 :

finish

if exists('loaded_PrjTree')
  "finish
endif
let loaded_PrjTree = v:true

let s:save_cpo = &cpo
set cpo&vim


let g:PrjTree_RootFile = get(g:, 'prj_root_file', '.git')


set autochdir


function! MyExplore()
  let g:filename = expand('%')
  let g:pwd = getcwd(win_getid())

  " search root dir
  let root = ''
  for i in range(6)
    if filereadable(g:PrjTree_RootFile) || isdirectory(g:PrjTree_RootFile)
      " root dir を記憶
      " win 2 unix
      let root = substitute(getcwd(), '\\', '/', 'g')
      break
    endif
    cd ..
  endfor

  exe 'cd ' . g:pwd
  let num = (root == '' ? 0 : i)

  NERDTree
  "exe 'cd ' . root

  if num > 0
    " NERDTreeのバッファのmapに展開する必要があるので、!は付けない。
    exe 'silent normal ' . repeat("U", num)
  endif

  " move cursor to org file
  call search('\%(' . repeat('  ', num + 1) . "\<C-g>" . '\)\@<=' . g:filename . '$', 'cW')
  normal! 0
endfunction

function! MyExplore()
  let g:filename = expand('%')

  " search root dir
  let PrjTree_RootFile = './' . g:PrjTree_RootFile
  let found = v:false
  for i in range(6)
    if filereadable(PrjTree_RootFile) || isdirectory(PrjTree_RootFile)
      let found = v:true
      break
    endif
    let PrjTree_RootFile = '../' . PrjTree_RootFile
  endfor

  let num = (found ? i : 0)

  NERDTree
  nunmap <buffer> f
  nunmap <buffer> F

  if num > 0
    " NERDTreeのバッファのmapに展開する必要があるので、!は付けない。
    exe 'silent normal ' . repeat("U", num)
  endif

  " move cursor to org file
  call search('\%(' . repeat('  ', num + 1) . "\<C-g>" . '\)\@<=' . g:filename . '$', 'cW')
  normal! 0
endfunction

function! MyExplore()
  let g:filename = expand('%')

  " search root dir
  let PrjTree_RootFile = './' . g:PrjTree_RootFile
  let num = 0
  for i in range(6)
    if filereadable(PrjTree_RootFile) || isdirectory(PrjTree_RootFile)
      let num = i
      break
    endif
    let PrjTree_RootFile = '../' . PrjTree_RootFile
  endfor

  NERDTree
  nunmap <buffer> J
  nunmap <buffer> K
  nunmap <buffer> f
  nunmap <buffer> F
  nunmap <buffer> m

  if num > 0
    " NERDTreeのバッファのmapに展開する必要があるので、!は付けない。
    exe 'silent normal ' . repeat("U", num)
  endif

  " move cursor to org file
  call search('\%(' . repeat('  ', num + 1) . "\<C-g>" . '\)\@<=' . g:filename . '$', 'cW')
  normal! 0

  call SetOptimalWinWidth()
endfunction


com! MyExplore call MyExplore()


nnoremap <silent> <Plug>(PrjTree-MyExplore) :<C-u>MyExplore<CR>
"nmap <leader>t <Plug>(PrjTree-MyExplore)


let &cpo = s:save_cpo
unlet s:save_cpo
"+++++ plugin/Search.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0 expandtab: (この行に関しては:help modelineを参照)

if exists('loaded_Search')
  "finish
  call MultiHighLight_Reset()
else
endif
let loaded_Search = v:true

let g:anzu_status_format = '/%p ( %i / %l )'
let g:anzu_status_format = ' ( %i / %l )'
let g:anzu_search_limit = 999

let g:SearchProcTopUnderScore = v:false
let g:SearchMultiHighLight = v:true


let g:MultiHighLightState = 0
"    0:初期値、multipleは未実施。または、/や*で再検索されリセットされた状態。
"    1:multipleによるハイライト中
"    2:EscEscでハイライトが中断された状態


let g:AnzuPopUpWinId = 0
let g:AnzuPopUpWinId2 = 0


let g:SearchCWordEchoFuncName = v:false


call EscEsc_Add('call MultiHighLight_Suspend()')
call EscEsc_Add('let g:MultiHighLightState = 2')
if v:version >= 802
  call EscEsc_Add('call popup_close(g:AnzuPopUpWinId)')
  call EscEsc_Add('call popup_close(g:AnzuPopUpWinId2)')
endif


function! s:SearchToggleProcTopUnderScore()
  let g:SearchProcTopUnderScore = !g:SearchProcTopUnderScore
  echo 'ProcTopUnderScore ' g:SearchProcTopUnderScore ? 'ON' : 'OFF'
endfunction


function! s:SearchToggleMultiHighLight()
  let g:SearchMultiHighLight = !g:SearchMultiHighLight
  if !g:SearchMultiHighLight
    call MultiHighLight_Reset()
  endif
  echo 'MultiHighLight ' g:SearchMultiHighLight ? 'ON' : 'OFF'
endfunction


function! s:SearchSlashCR()
  if g:SearchMultiHighLight
    "call MultiHighLight_Suspend()
    call MultiHighLight_Reset()
    let g:MultiHighLightState = 0
  endif
  call <SID>SearchPost()
endfunction


function! s:SearchN()
  if g:SearchMultiHighLight
    if g:MultiHighLightState == 2
      call MultiHighLight_Resume()
    endif
    let g:MultiHighLightState = 1
  endif
  call <SID>SearchPost()
endfunction


function! s:SearchCWord(add, aword, keep_pos, strict_case, proc_top_underscore)
  let search_str = expand('<cword>')

  if a:proc_top_underscore
    let search_str = ProcTopUnderScore(search_str)
  endif

  if a:aword
    let search_str = '\<' . search_str . '\>'
  endif

  if g:SearchMultiHighLight
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
    let @/ = (a:strict_case ? '\C' : '') . search_str
  endif

  "検索履歴に残すための処理
  call histadd('/', @/)

  let cursor_word = CursorWord()
  let old_cursor_pos = getpos('.')

  if 0
    " 単語のなかほどにあったカーソルが単語先頭へ動くのがよくない。
    " 画面が少しスクロールするのがよくない。

    try
      keepjumps normal! n
    catch
    endtry

    " ここの複雑な条件は、keep処理と、常にカーソルを単語の先頭に動かすための処理が合わさっているもの。
    let new_cursor_pos = getpos('.')
    if (a:keep_pos && (old_cursor_pos != new_cursor_pos && cursor_word != 0 || cursor_word == 1)) ||
          \ (!a:keep_pos && old_cursor_pos == new_cursor_pos && cursor_word == 1)
      try
        keepjumps normal! N
      catch
      endtry
    endif
  else

    call search('\%#\W*\w', 'cez')

  endif

  call s:SearchPost()
endfunction


function! s:SearchPost()
  normal! zv

  if v:version < 802
    AnzuUpdateSearchStatusOutput
    FuncNameStl
    call AddAltStatusline('      %<%#hl_func_name_stl#  %{anzu#search_status()} %##', 'l', 0)
  else
    if 0
      let g:anzu_status_format = '/%p ( %i / %l )'
      AnzuUpdateSearchStatusOutput
      let g:anzu_status_format = ' ( %i / %l )'
    endif
    AnzuUpdateSearchStatus
    if 1
      echo '  '
      echohl Search
     "echohl SLFileName
     "echon '  ' @/
      echon @/
     "echon '  '
      echohl None
    endif
   "call popup_create(anzu#search_status() . "\n" . cfi#format('%s ()', '... ()'), #{
   "call popup_create(anzu#search_status(), #{
   "let g:AnzuPopUpWinId = popup_create( [anzu#search_status(), cfi#format('%s ()', '...')], #{
    let anzu_search_status = anzu#search_status()
    if anzu_search_status != ''
      if 0
        let g:AnzuPopUpWinId = popup_create(anzu_search_status, #{
              \ line: 'cursor+3',
              \ col: 'cursor+2',
              \ moved: 'any',
              \ minwidth: 0,
              \ time: 2000,
              \ tabpage: 0,
              \ zindex: 300,
              \ drag: 1,
              \ highlight: 'hl_func_name_stl',
              \ close: 'click',
              \ padding: [1, 1, 1, 1],
              \ })
              " highlight: 'hl_func_name_stl',
              " pos: 'center',
              " mask: [[1, 2, 1, 1]]
      elseif 0
        let g:AnzuPopUpWinId = popup_create(anzu_search_status, #{
              \ line: 'cursor+3',
              \ col: 'cursor+2',
              \ moved: 'any',
              \ minwidth: 0,
              \ time: 2000,
              \ tabpage: 0,
              \ zindex: 300,
              \ drag: 1,
              \ highlight: 'AnzuPopWin',
              \ border: [1, 1, 1, 1],
              \ borderhighlight: ['NormalPop'],
              \ close: 'click',
              \ })
              " highlight: 'AnzuPopWin',
              " borderhighlight: ['AnzuPopWin'],
              " highlight: 'hl_func_name_stl',
              " borderhighlight: ['hl_func_name_stl'],
              " mask: [[1, 1, 1, 1], [-1, -1, 1, 1], [-1, -1, -1, -1], [1, 1, -1, -1]]
              " padding: [1, 1, 1, 1],
      elseif 0
        let g:AnzuPopUpWinId = popup_create(anzu_search_status, #{
              \ line: 'cursor+3',
              \ col: 'cursor+2',
              \ moved: 'any',
              \ minwidth: 0,
              \ time: 2000,
              \ tabpage: 0,
              \ zindex: 300,
              \ drag: 1,
              \ highlight: 'NormalPop',
              \ border: [1, 1, 1, 1],
              \ borderhighlight: ['AnzuPopWin'],
              \ close: 'click',
              \ })
              " highlight: 'AnzuPopWin',
              " borderhighlight: ['AnzuPopWin'],
              " highlight: 'hl_func_name_stl',
              " borderhighlight: ['hl_func_name_stl'],
              " mask: [[1, 1, 1, 1], [-1, -1, 1, 1], [-1, -1, -1, -1], [1, 1, -1, -1]]
              " padding: [1, 1, 1, 1],
      else
        let g:AnzuPopUpWinId = popup_create(anzu_search_status, #{
              \ line: 'cursor+3',
              \ col: 'cursor+2',
              \ moved: 'any',
              \ minwidth: 0,
              \ time: 2000,
              \ tabpage: 0,
              \ zindex: 300,
              \ drag: 1,
              \ highlight: 'AnzuPopWin',
              \ border: [1, 1, 1, 1],
              \ borderhighlight: ['AnzuPopWin'],
              \ close: 'click',
              \ })
              " fixed:  'FALSE',
              " posinvert:  'TRUE',
              " highlight: 'AnzuPopWin',
              " borderhighlight: ['AnzuPopWin'],
              " highlight: 'hl_func_name_stl',
              " borderhighlight: ['hl_func_name_stl'],
              " mask: [[1, 1, 1, 1], [-1, -1, 1, 1], [-1, -1, -1, -1], [1, 1, -1, -1]]
              " padding: [1, 1, 1, 1],
      endif
    endif
   "let cf = cfi#format('%s ()', '...')
    let cf = cfi#format('%s ()', '')
    if g:SearchCWordEchoFuncName && cf != ''
      let g:AnzuPopUpWinId2 = popup_create(cf, #{
            \ line: 'cursor+7',
            \ col: 'cursor+2',
            \ moved: 'any',
            \ minwidth: 0,
            \ time: 2000,
            \ tabpage: 0,
            \ zindex: 300,
            \ drag: 1,
            \ highlight: 'hl_func_name_stl',
            \ close: 'click',
            \ padding: [1, 1, 1, 1],
            \ })
            " mask: [[1, -1, 1, -1]]
    elseif 0
      FuncNameEchoColor
    endif
  endif

endfunction

hi FuncNameDDD	guifg=#cf302d	guibg=#000000

com! SearchToggleProcTopUnderScore * call <SID>SearchToggleProcTopUnderScore()
com! SearchToggleMultiHighLight    * call <SID>SearchToggleMultiHighLight()

com! SearchCWordEchoFuncName let g:SearchCWordEchoFuncName = !g:SearchCWordEchoFuncName
com! CWordEchoFuncName SearchCWordEchoFuncName


" CONST
"
unlockvar    s:SearchNew s:SearchAdd    s:MatchWord s:MatchPart    s:CaseIgnore s:CaseStrict s:CaseIgnore

let s:SearchNew = v:false
let s:SearchAdd = v:true

let s:MatchWord = v:true
let s:MatchPart = v:false

let s:CursorKeep = v:true
let s:CursorMove = v:false

"let s:CaseIgnore = -1
let s:CaseOption = 0
let s:CaseStrict = 1

lockvar    s:SearchNew s:SearchAdd    s:MatchWord s:MatchPart    s:CaseIgnore s:CaseStrict s:CaseIgnore


" com! SearchCWordNewWordMoveOption call <SID>SearchCWord( s:SearchNew, s:MatchWord, s:CursorMove, s:CaseOption, g:SearchProcTopUnderScore )  |  set hlsearch
" com! SearchCWordNewPartMoveOption call <SID>SearchCWord( s:SearchNew, s:MatchPart, s:CursorMove, s:CaseOption, g:SearchProcTopUnderScore )  |  set hlsearch
" com! SearchCWordAddWordMoveOption call <SID>SearchCWord( s:SearchAdd, s:MatchWord, s:CursorMove, s:CaseOption, g:SearchProcTopUnderScore )  |  set hlsearch
" com! SearchCWordAddPartMoveOption call <SID>SearchCWord( s:SearchAdd, s:MatchPart, s:CursorMove, s:CaseOption, g:SearchProcTopUnderScore )  |  set hlsearch

  com! SearchCWordNewWordKeepOption call <SID>SearchCWord( s:SearchNew, s:MatchWord, s:CursorKeep, s:CaseOption, g:SearchProcTopUnderScore )  |  set hlsearch
  com! SearchCWordNewPartKeepOption call <SID>SearchCWord( s:SearchNew, s:MatchPart, s:CursorKeep, s:CaseOption, g:SearchProcTopUnderScore )  |  set hlsearch
  com! SearchCWordAddWordKeepOption call <SID>SearchCWord( s:SearchAdd, s:MatchWord, s:CursorKeep, s:CaseOption, g:SearchProcTopUnderScore )  |  set hlsearch
  com! SearchCWordAddPartKeepOption call <SID>SearchCWord( s:SearchAdd, s:MatchPart, s:CursorKeep, s:CaseOption, g:SearchProcTopUnderScore )  |  set hlsearch

" com! SearchCWordNewWordMoveStrict call <SID>SearchCWord( s:SearchNew, s:MatchWord, s:CursorMove, s:CaseStrict, g:SearchProcTopUnderScore )  |  set hlsearch
" com! SearchCWordNewPartMoveStrict call <SID>SearchCWord( s:SearchNew, s:MatchPart, s:CursorMove, s:CaseStrict, g:SearchProcTopUnderScore )  |  set hlsearch
" com! SearchCWordAddWordMoveStrict call <SID>SearchCWord( s:SearchAdd, s:MatchWord, s:CursorMove, s:CaseStrict, g:SearchProcTopUnderScore )  |  set hlsearch
" com! SearchCWordAddPartMoveStrict call <SID>SearchCWord( s:SearchAdd, s:MatchPart, s:CursorMove, s:CaseStrict, g:SearchProcTopUnderScore )  |  set hlsearch

  com! SearchCWordNewWordKeepStrict call <SID>SearchCWord( s:SearchNew, s:MatchWord, s:CursorKeep, s:CaseStrict, g:SearchProcTopUnderScore )  |  set hlsearch
  com! SearchCWordNewPartKeepStrict call <SID>SearchCWord( s:SearchNew, s:MatchPart, s:CursorKeep, s:CaseStrict, g:SearchProcTopUnderScore )  |  set hlsearch
  com! SearchCWordAddWordKeepStrict call <SID>SearchCWord( s:SearchAdd, s:MatchWord, s:CursorKeep, s:CaseStrict, g:SearchProcTopUnderScore )  |  set hlsearch
  com! SearchCWordAddPartKeepStrict call <SID>SearchCWord( s:SearchAdd, s:MatchPart, s:CursorKeep, s:CaseStrict, g:SearchProcTopUnderScore )  |  set hlsearch

" com! SearchCWordNewWordMoveIgnore call <SID>SearchCWord( s:SearchNew, s:MatchWord, s:CursorMove, s:CaseIgnore, g:SearchProcTopUnderScore )  |  set hlsearch
" com! SearchCWordNewPartMoveIgnore call <SID>SearchCWord( s:SearchNew, s:MatchPart, s:CursorMove, s:CaseIgnore, g:SearchProcTopUnderScore )  |  set hlsearch
" com! SearchCWordAddWordMoveIgnore call <SID>SearchCWord( s:SearchAdd, s:MatchWord, s:CursorMove, s:CaseIgnore, g:SearchProcTopUnderScore )  |  set hlsearch
" com! SearchCWordAddPartMoveIgnore call <SID>SearchCWord( s:SearchAdd, s:MatchPart, s:CursorMove, s:CaseIgnore, g:SearchProcTopUnderScore )  |  set hlsearch

" com! SearchCWordNewWordKeepIgnore call <SID>SearchCWord( s:SearchNew, s:MatchWord, s:CursorKeep, s:CaseIgnore, g:SearchProcTopUnderScore )  |  set hlsearch
" com! SearchCWordNewPartKeepIgnore call <SID>SearchCWord( s:SearchNew, s:MatchPart, s:CursorKeep, s:CaseIgnore, g:SearchProcTopUnderScore )  |  set hlsearch
" com! SearchCWordAddWordKeepIgnore call <SID>SearchCWord( s:SearchAdd, s:MatchWord, s:CursorKeep, s:CaseIgnore, g:SearchProcTopUnderScore )  |  set hlsearch
" com! SearchCWordAddPartKeepIgnore call <SID>SearchCWord( s:SearchAdd, s:MatchPart, s:CursorKeep, s:CaseIgnore, g:SearchProcTopUnderScore )  |  set hlsearch




" Plug Mapping


" nnoremap <silent> <Plug>(Search-CWord-New-Word-Move-Option) :<C-u>SearchCWordNewWordMoveOption<CR>
" nnoremap <silent> <Plug>(Search-CWord-New-Part-Move-Option) :<C-u>SearchCWordNewPartMoveOption<CR>
" nnoremap <silent> <Plug>(Search-CWord-Add-Word-Move-Option) :<C-u>SearchCWordAddWordMoveOption<CR>
" nnoremap <silent> <Plug>(Search-CWord-Add-Part-Move-Option) :<C-u>SearchCWordAddPartMoveOption<CR>

  nnoremap <silent> <Plug>(Search-CWord-New-Word-Keep-Option) :<C-u>SearchCWordNewWordKeepOption<CR>
  nnoremap <silent> <Plug>(Search-CWord-New-Part-Keep-Option) :<C-u>SearchCWordNewPartKeepOption<CR>
  nnoremap <silent> <Plug>(Search-CWord-Add-Word-Keep-Option) :<C-u>SearchCWordAddWordKeepOption<CR>
  nnoremap <silent> <Plug>(Search-CWord-Add-Part-Keep-Option) :<C-u>SearchCWordAddPartKeepOption<CR>

" nnoremap <silent> <Plug>(Search-CWord-New-Word-Move-Strict) :<C-u>SearchCWordNewWordMoveStrict<CR>
" nnoremap <silent> <Plug>(Search-CWord-New-Part-Move-Strict) :<C-u>SearchCWordNewPartMoveStrict<CR>
" nnoremap <silent> <Plug>(Search-CWord-Add-Word-Move-Strict) :<C-u>SearchCWordAddWordMoveStrict<CR>
" nnoremap <silent> <Plug>(Search-CWord-Add-Part-Move-Strict) :<C-u>SearchCWordAddPartMoveStrict<CR>

  nnoremap <silent> <Plug>(Search-CWord-New-Word-Keep-Strict) :<C-u>SearchCWordNewWordKeepStrict<CR>
  nnoremap <silent> <Plug>(Search-CWord-New-Part-Keep-Strict) :<C-u>SearchCWordNewPartKeepStrict<CR>
  nnoremap <silent> <Plug>(Search-CWord-Add-Word-Keep-Strict) :<C-u>SearchCWordAddWordKeepStrict<CR>
  nnoremap <silent> <Plug>(Search-CWord-Add-Part-Keep-Strict) :<C-u>SearchCWordAddPartKeepStrict<CR>

" nnoremap <silent> <Plug>(Search-CWord-New-Word-Move-Ignore) :<C-u>SearchCWordNewWordMoveIgnore<CR>
" nnoremap <silent> <Plug>(Search-CWord-New-Part-Move-Ignore) :<C-u>SearchCWordNewPartMoveIgnore<CR>
" nnoremap <silent> <Plug>(Search-CWord-Add-Word-Move-Ignore) :<C-u>SearchCWordAddWordMoveIgnore<CR>
" nnoremap <silent> <Plug>(Search-CWord-Add-Part-Move-Ignore) :<C-u>SearchCWordAddPartMoveIgnore<CR>
" 
" nnoremap <silent> <Plug>(Search-CWord-New-Word-Keep-Ignore) :<C-u>SearchCWordNewWordKeepIgnore<CR>
" nnoremap <silent> <Plug>(Search-CWord-New-Part-Keep-Ignore) :<C-u>SearchCWordNewPartKeepIgnore<CR>
" nnoremap <silent> <Plug>(Search-CWord-Add-Word-Keep-Ignore) :<C-u>SearchCWordAddWordKeepIgnore<CR>
" nnoremap <silent> <Plug>(Search-CWord-Add-Part-Keep-Ignore) :<C-u>SearchCWordAddPartKeepIgnore<CR>



nnoremap <silent> <Plug>(Search-n) n:call <SID>SearchN()<CR>
nnoremap <silent> <Plug>(Search-N) N:call <SID>SearchN()<CR>

cnoremap <silent> <Plug>(Search-SlashCR) <CR>:call <SID>SearchSlashCR()<CR>


nnoremap <silent> <Plug>(Search-TopUnderScore)         :call <SID>SearchToggleProcTopUnderScore()<CR>
nnoremap <silent> <Plug>(SearchT-ToggleMultiHighLight) :call <SID>SearchToggleMultiHighLight()<CR>



" Test
com! TestProcTopUnderScore echo ProcTopUnderScore('word') | echo ProcTopUnderScore('_word') | echo ProcTopUnderScore('0word')
"+++++ plugin/Window.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0 expandtab :

if exists('loaded_Window')
  "finish
endif
let loaded_Window = v:true

let s:save_cpo = &cpo
set cpo&vim



"----------------------------------------------------------------------------------------
" Focus

" Basic
nnoremap <silent> <Plug>(Window-Focus-SkipTerm-Inc) <Esc>:exe Window#Focus#SkipTerm(+1) . ' wincmd w'<CR>
nnoremap <silent> <Plug>(Window-Focus-SkipTerm-Dec) <Esc>:exe Window#Focus#SkipTerm(-1) . ' wincmd w'<CR>

" Direction Focus
" Visual Mode でも使用するので、nnoremapではなく、noremap。
noremap <silent> <Plug>(Window-Focus-WrapMove-h) :<C-u>call Window#Focus#WinWrapMove('h')<CR>
noremap <silent> <Plug>(Window-Focus-WrapMove-j) :<C-u>call Window#Focus#WinWrapMove('j')<CR>
noremap <silent> <Plug>(Window-Focus-WrapMove-k) :<C-u>call Window#Focus#WinWrapMove('k')<CR>
noremap <silent> <Plug>(Window-Focus-WrapMove-l) :<C-u>call Window#Focus#WinWrapMove('l')<CR>



"----------------------------------------------------------------------------------------
" Resize

" Equal Only Height
com! WindowSizeEqualOnlyHeight call Window#Resize#EqualOnlyHeight()
nnoremap <silent> <Plug>(Window-Resize-EqualOnlyHeight) :<C-u>call Window#Resize#EqualOnlyHeight()<CR>

" Equal Only Width
com! WindowSizeEqualOnlyWidth call Window#Resize#EqualOnlyWidth()
nnoremap <silent> <Plug>(Window-Resize-EqualOnlyWidth) :<C-u>call Window#Resize#EqualOnlyWidth()<CR>

" Optimal Width
com! OptimalWindowWidth call Window#Resize#SetOptimalWidth()
nnoremap <silent> <Plug>(Window-Resize-OptimalWidth) :<C-u>call Window#Resize#SetOptimalWidth()<CR>

" Optimal Height
com! OptimalWindowHeight call Window#Resize#SetOptimalHeight()
nnoremap <silent> <Plug>(Window-Resize-OptimalHeight) :<C-u>call Window#Resize#SetOptimalHeight()<CR>



let &cpo = s:save_cpo
unlet s:save_cpo
"+++++ vimrc_local.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:

if !has('win32')
  finish
endif


" ファイル名の展開にスラッシュを使う
set shellslash

" Shellの設定 (cygwin64でも、なぜか設定しないとbashになる。)
set sh=C:/cygwin64/bin/zsh

let s:home = 'C:/cygwin64/home/' . $USERNAME

if substitute($HOME, '\', '/', 'g') == s:home
  " cygwin64から起動されたときの設定

  " $TMPを(cygwin64ではなく)Windowsのパスにそろえる。
  "let $TMP  = 'C:/Users/' . $USERNAME . '/AppData/Local/Temp'
  "let $TEMP = $TMP

  " cygwin64から起動されたときは、この後の設定を実施すると二重になる。
  finish
endif

" $HOMEの設定
if isdirectory(s:home)
  let $HOME=s:home
endif

let $LANG = 'ja_JP.UTF-8'

" PATHの追加
let $PATH = 'C:/cygwin64/bin;' . $PATH
let $PATH = $HOME . '/bin;' . $PATH

" ! や :! 等のコマンドを実行するためにシェルに渡されるフラグ。
" 末尾のスペースは必要!!
set shellcmdflag=-c\ 

" ! や :! 等のコマンドでコマンドをシェルに渡すときに、コマンドを囲む引用符(の列)。
set shellxquote=\"

" runtimepathの追加
exe 'set runtimepath+=C:/cygwin64/home/' . $USERNAME . '/vimfiles/'
exe 'set runtimepath+=C:/cygwin64/home/' . $USERNAME . '/vimfiles/after'

" packpathの追加
exe 'set packpath+=C:/cygwin64/home/' . $USERNAME . '/vimfiles/'
exe 'set packpath+=C:/cygwin64/home/' . $USERNAME . '/vimfiles/after'
"+++++ vim_collect ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#!/bin/sh

cd ~/vimfiles/

git config --global color.ui false

git status | sed -n '/Changes not staged for commit:/,/Untracked files:/p' | grep '^\s\+modified: ' | awk '$0 = $2' |
awk '4; END{
# print "ftplugin/sh.vim"
# print "vtags"
# print "win.vim"
# print "~/vimfiles/sands.ahk.old"
# print "~/vimfiles/sands.ahk.old2"
# print "~/vimfiles/sands.ahk.old3"
# print "~/vimfiles/sands.ahk.old4"
  print "vim_collect"
# print "colors/VVV.vim"
# print "colors/Vitamin.vim"
# print "colors/kin.vim"
# print "test_WinMove.vim"
# print "WinWrapMove.vim"
# print "test_WinMove.vim"
# print "win.vim"
# print "~/vimfiles/sands.ahk"
  print "~/vimfiles/startup_sands_ahk.bat"
# print "~/vimfiles/new.vim"
  print "~/vimfiles/plugin/PrjTree.vim"
  print "~/vimfiles/pack/mypackage/opt/nerdtree/nerdtree_plugin/vcs.vim"
# print "~/vimfiles/new.vim"
  print "~/vimfiles/plugin/toggle.vim"
  print "~/vimfiles/pack/mypackage/start/mru.vim-master/plugin/mru.vim"
  print "~/bin/vn"
  print "~/bin/vg"
  print "~/bin/vw"
  print "~/.ctags"
  print "~/vimfiles/ime.vim"
  print "~/vimfiles/pack/mypackage/start/tmp/plugin/test.vim"
  print "~/vimfiles/pack/mypackage/start/tmp/plugin/vim.vim"
  print "/cygdrive/c/Users/pk65278/bin/vim82-kaoriya-win64/vim82/pack/dist/opt/termdebug/plugin/termdebug.vim"
}' |
xargs -i echo 'echo "\"+++++ {} ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"; cat {}' | sh

echo '+++++++++++++++++++++' ~/vimfiles/pack/mypackage/start/ '+++++++++++++++++++++' 
ls -1 ~/vimfiles/pack/mypackage/start/
echo '+++++++++++++++++++++' ~/vimfiles/pack/mypackage/opt/ '+++++++++++++++++++++' 
ls -1 ~/vimfiles/pack/mypackage/opt/

git config --global color.ui true
"+++++ ~/vimfiles/startup_sands_ahk.bat ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@echo off

timeout 2

rem start /high explorer "C:\cygwin\home\%USERNAME%\vimfiles\SAndS.ahk"

rem start /high "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\cygwin\home\%USERNAME%\vimfiles\SAndS.ahk"

cmd /c start "" /high "C:\PROGRA~1\AutoHotkey\AutoHotkey.exe" "C:\cygwin64\home\%USERNAME%\vimfiles\SAndS.ahk"

exit

"+++++ ~/vimfiles/plugin/PrjTree.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim: set ts=8 sts=2 sw=2 tw=0 :

finish

if exists('loaded_PrjTree')
  "finish
endif
let loaded_PrjTree = v:true

let s:save_cpo = &cpo
set cpo&vim


let g:PrjTree_RootFile = get(g:, 'prj_root_file', '.git')


set autochdir


function! MyExplore()
  let g:filename = expand('%')
  let g:pwd = getcwd(win_getid())

  " search root dir
  let root = ''
  for i in range(6)
    if filereadable(g:PrjTree_RootFile) || isdirectory(g:PrjTree_RootFile)
      " root dir を記憶
      " win 2 unix
      let root = substitute(getcwd(), '\\', '/', 'g')
      break
    endif
    cd ..
  endfor

  exe 'cd ' . g:pwd
  let num = (root == '' ? 0 : i)

  NERDTree
  "exe 'cd ' . root

  if num > 0
    " NERDTreeのバッファのmapに展開する必要があるので、!は付けない。
    exe 'silent normal ' . repeat("U", num)
  endif

  " move cursor to org file
  call search('\%(' . repeat('  ', num + 1) . "\<C-g>" . '\)\@<=' . g:filename . '$', 'cW')
  normal! 0
endfunction

function! MyExplore()
  let g:filename = expand('%')

  " search root dir
  let PrjTree_RootFile = './' . g:PrjTree_RootFile
  let found = v:false
  for i in range(6)
    if filereadable(PrjTree_RootFile) || isdirectory(PrjTree_RootFile)
      let found = v:true
      break
    endif
    let PrjTree_RootFile = '../' . PrjTree_RootFile
  endfor

  let num = (found ? i : 0)

  NERDTree
  nunmap <buffer> f
  nunmap <buffer> F

  if num > 0
    " NERDTreeのバッファのmapに展開する必要があるので、!は付けない。
    exe 'silent normal ' . repeat("U", num)
  endif

  " move cursor to org file
  call search('\%(' . repeat('  ', num + 1) . "\<C-g>" . '\)\@<=' . g:filename . '$', 'cW')
  normal! 0
endfunction

function! MyExplore()
  let g:filename = expand('%')

  " search root dir
  let PrjTree_RootFile = './' . g:PrjTree_RootFile
  let num = 0
  for i in range(6)
    if filereadable(PrjTree_RootFile) || isdirectory(PrjTree_RootFile)
      let num = i
      break
    endif
    let PrjTree_RootFile = '../' . PrjTree_RootFile
  endfor

  NERDTree
  nunmap <buffer> J
  nunmap <buffer> K
  nunmap <buffer> f
  nunmap <buffer> F
  nunmap <buffer> m

  if num > 0
    " NERDTreeのバッファのmapに展開する必要があるので、!は付けない。
    exe 'silent normal ' . repeat("U", num)
  endif

  " move cursor to org file
  call search('\%(' . repeat('  ', num + 1) . "\<C-g>" . '\)\@<=' . g:filename . '$', 'cW')
  normal! 0

  call SetOptimalWinWidth()
endfunction


com! MyExplore call MyExplore()


nnoremap <silent> <Plug>(PrjTree-MyExplore) :<C-u>MyExplore<CR>
"nmap <leader>t <Plug>(PrjTree-MyExplore)


let &cpo = s:save_cpo
unlet s:save_cpo
"+++++ ~/vimfiles/pack/mypackage/opt/nerdtree/nerdtree_plugin/vcs.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" ============================================================================
" File:        vcs.vim
" Description: NERDTree plugin that provides a command to open on the root of
"              a version control system repository.
" Maintainer:  Phil Runninger
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" ============================================================================
command! -n=? -complete=dir -bar NERDTreeVCS :call <SID>CreateTabTreeVCS('<args>')

" FUNCTION: s:CreateTabTreeVCS(a:name) {{{1
function! s:CreateTabTreeVCS(name)
    let l:path = g:NERDTreeCreator._pathForString(a:name)
    let l:path = s:FindParentVCSRoot(l:path)
    call g:NERDTreeCreator.createTabTree(empty(l:path) ? "" : l:path._str())
endfunction

" FUNCTION: s:FindParentVCSRoot(a:path) {{{1
" Finds the root version control system folder of the given path. If a:path is
" not part of a repository, return the original path.
function! s:FindParentVCSRoot(path)
    let l:path = a:path
    while !empty(l:path) &&
        \ l:path._str() !~ '^\(\a:\\\|\a:/\|\/\)$' &&
        \ !isdirectory(l:path._str() . '/.git') &&
        \ !isdirectory(l:path._str() . '/.svn') &&
        \ !isdirectory(l:path._str() . '/.hg') &&
        \ !isdirectory(l:path._str() . '/.bzr') &&
        \ !isdirectory(l:path._str() . '/_darcs')
        let l:path = l:path.getParent()
    endwhile
    return (empty(l:path) || l:path._str() =~ '^\(\a:\\\|\a:/\|\/\)$') ? a:path : l:path
endfunction

"+++++ ~/vimfiles/plugin/toggle.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:
" (この行に関しては:help modelineを参照)


if !exists('g:Words')
  let g:Words = [ [ 'true', 'false' ] ]
endif


function! Tgl()
  let cursor_word = expand('<cWORD>')
  echo cursor_word
  if s:tgl_sub(cursor_word, g:Words) == 0
    return
  endif

  let cursor_word = expand('<cword>')
  echo cursor_word
  if s:tgl_sub(cursor_word, g:Words) == 0
    return
  endif

endfunction

function! s:tgl_sub(cursor_word, Words)
  for words in a:Words
   "echo words
    let n = match(words, a:cursor_word)
    "echo n
    if n >= 0
      let len = len(words)
      "echo len
      let after_word = words[(n + 1) % len]
      exe 'normal! ciw' . after_word . "\<Esc>"
      return 0
    endif
  endfor
  return 1
endfunction


com! TGL call Tgl()
nnoremap <silent> \t :<C-u>TGL<CR>
"+++++ ~/vimfiles/pack/mypackage/start/mru.vim-master/plugin/mru.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=4 tw=0:

" File: mru.vim
" Author: Yegappan Lakshmanan (yegappan AT yahoo DOT com)
" Version: 3.9
" Last Modified: Feb 3, 2015
" Copyright: Copyright (C) 2003-2015 Yegappan Lakshmanan
" License:   Permission is hereby granted to use and distribute this code,
"            with or without modifications, provided that this copyright
"            notice is copied with it. Like anything else that's free,
"            mru.vim is provided *as is* and comes with no warranty of any
"            kind, either expressed or implied. In no event will the copyright
"            holder be liable for any damages resulting from the use of this
"            software.
"
" Overview
" --------
" The Most Recently Used (MRU) plugin provides an easy access to a list of
" recently opened/edited files in Vim. This plugin automatically stores the
" file names as you open/edit them in Vim.
"
" This plugin will work on all the platforms where Vim is supported. This
" plugin will work in both console and GUI Vim. This version of the MRU
" plugin needs Vim 7.0 and above. If you are using an earlier version of
" Vim, then you should use an older version of the MRU plugin.
"
" The recently used filenames are stored in a file specified by the Vim
" MRU_File variable.
"
" The Github repository for the MRU plugin is available at:
"
"	http://github.com/yegappan/mru
"
" Installation
" ------------
" 1. Copy the mru.vim file to one of the following directories:
"       $HOME/.vim/plugin     - Unix like systems
"       $HOME/vimfiles/plugin - MS-Windows
"       $VIM:vimfiles:plugin  - Macintosh
"       $VIM/vimfiles/plugin  - All
" 2. Restart Vim.
" 3. You can use the ":MRU" command to list and edit the recently used files.
"    In GUI Vim, you can use the 'File->Recent Files' menu to access the
"    recently used files.
"
" To uninstall this plugin, remove this file (mru.vim) from the
" $HOME/.vim/plugin or $HOME/vimfiles/plugin or the $VIM/vimfile/plugin
" directory.
"
" Usage
" -----
" To list and edit files from the MRU list, you can use the ":MRU" command.
" The ":MRU" command displays the MRU file list in a temporary Vim window.  If
" the MRU window is already opened, then the MRU list displayed in the window
" is refreshed.
"
" If you are using GUI Vim, then the names of the recently edited files are
" added to the "File->Recent Files" menu. You can select the name of a file
" from this sub-menu to edit the file.
"
" You can use the normal Vim commands to move around in the MRU window. You
" cannot make changes in the MRU window.
"
" You can select a file name to edit by pressing the <Enter> key or by double
" clicking the left mouse button on a file name.  The selected file will be
" opened. If the file is already opened in a window, the cursor will be moved
" to that window. Otherwise, the file is opened in the previous window. If the
" previous window has a modified buffer or is the preview window or is used by
" some other plugin, then the file is opened in a new window.
"
" You can press the 'o' key to open the file name under the cursor in the
" MRU window in a new window. You can also press <Shift-Enter> instead of 'o'
" to open the file in a new window.
"
" To open a file from the MRU window in read-only mode (view), press the 'v'
" key.
"
" To open a file from the MRU window in a new tab, press the 't' key.  If the
" file is already opened in a window in the current or in another tab, then
" the cursor is moved to that tab. Otherwise, a new tab is opened.
"
" You can open multiple files from the MRU window by specifying a count before
" pressing '<Enter>' or 'v' or 'o' or 't'. You can also visually (using
" linewise visual mode) select multiple filenames and invoke the commands to
" open the files. Each selected file will be opened in a separate window or
" tab.
"
" You can press the 'u' key in the MRU window to update the file list. This is
" useful if you keep the MRU window open always.
"
" You can close the MRU window by pressing the 'q' key or the <Esc> key or
" using one of the Vim window commands.
"
" To display only files matching a pattern from the MRU list in the MRU
" window, you can specify a pattern to the ":MRU" command. For example, to
" display only file names matching "vim" in them, you can use the following
" command ":MRU vim".  When you specify a partial file name and only one
" matching filename is found, then the ":MRU" command will edit that file.
"
" The ":MRU" command supports command-line completion of file names from
" the MRU list. You can enter a partial file name and then press <Tab>
" or <Ctrl-D> to complete or list all the matching file names. Note that
" after typing the ":MRU" command, you have to enter a space before completing
" the file names with <Tab>.
"
" When a file supplied to the ":MRU" command is not present in the MRU list,
" but it is a readable file, then the file will be opened (even though it is
" not present in the MRU list). This is useful if you want to open a file
" present in the same directory as a file in the MRU list. You can use the
" command-line completion of the ":MRU" command to complete the full path of a
" file and then modify the path to open another file present in the same path.
"
" Whenever the MRU list changes, the MRU file is updated with the latest MRU
" list. When you have multiple instances of Vim running at the same time, the
" latest MRU list will show up in all the instances of Vim.
"
" The MRUFilename syntax group is used to highlight the file names in the MRU
" window. By default, this syntax group is linked to the Identifier highlight
" group. You can change the highlight group by adding the following line in
" your .vimrc:
"
"    highlight link MRUFileName LineNr
"
" The MRU buffer uses the 'mru file type. You can use this file type to add
" custom auto commands, syntax highlighting, etc.
"
" Configuration
" -------------
" By changing the following variables you can configure the behavior of this
" plugin. Set the following variables in your .vimrc file using the 'let'
" command.
"
" The list of recently edited file names is stored in the file specified by the
" MRU_File variable.  The default setting for this variable is
" $HOME/.vim_mru_files for Unix-like systems and $USERPROFILE/_vim_mru_files
" for MS-Windows systems. You can change this variable to point to a file by
" adding the following line to the .vimrc file:
"
"       let MRU_File = 'd:\myhome\_vim_mru_files'
"
" By default, the plugin will remember the names of the last 100 used files.
" As you edit more files, old file names will be removed from the MRU list.
" You can set the 'MRU_Max_Entries' variable to remember more file names. For
" example, to remember 1000 most recently used file names, you can use
"
"       let MRU_Max_Entries = 1000
"
" By default, all the edited file names will be added to the MRU list. If you
" want to exclude file names matching a list of patterns, you can set the
" MRU_Exclude_Files variable to a list of Vim regular expressions. By default,
" this variable is set to an empty string. For example, to not include files
" in the temporary (/tmp, /var/tmp and d:\temp) directories, you can set the
" MRU_Exclude_Files variable to
"
"       let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'  " For Unix
"       let MRU_Exclude_Files = '^c:\\temp\\.*'           " For MS-Windows
" 
" The specified pattern should be a Vim regular expression pattern.
"
" If you want to add only file names matching a set of patterns to the MRU
" list, then you can set the MRU_Include_Files variable. This variable should
" be set to a Vim regular expression pattern. For example, to add only .c and
" .h files to the MRU list, you can set this variable as below:
"
"       let MRU_Include_Files = '\.c$\|\.h$'
"
" By default, MRU_Include_Files is set to an empty string and all the edited
" filenames are added to the MRU list.
"
" The default height of the MRU window is 8. You can set the MRU_Window_Height
" variable to change the window height.
"
"       let MRU_Window_Height = 15
"
" By default, when the :MRU command is invoked, the MRU list will be displayed
" in a new window. Instead, if you want the MRU plugin to reuse the current
" window, then you can set the 'MRU_Use_Current_Window' variable to one.
"
"       let MRU_Use_Current_Window = 1
"
" The MRU plugin will reuse the current window. When a file name is selected,
" the file is also opened in the current window.
"
" When you select a file from the MRU window, the MRU window will be
" automatically closed and the selected file will be opened in the previous
" window. You can set the 'MRU_Auto_Close' variable to zero to keep the MRU
" window open.
"
"       let MRU_Auto_Close = 0
"
" In the MRU window, the filenames are displayed in two parts. The first part
" contains the file name without the path and the second part contains the
" full path to the file in parenthesis. This format is controlled by the
" MRU_Filename_Format variable. If you prefer to change this to some other
" format, then you can modify the MRU_Filename_Format variable. For example,
" to display the full path without splitting it, you can set this variable
" as shown below:
"
"       let MRU_Filename_Format =
"       \   {'formatter':'v:val', 'parser':'.*', 'syntax': '[^/\\]\+$'}
"
" ****************** Do not modify after this line ************************
if exists('loaded_mru')
    "finish
endif
let loaded_mru=1

" Line continuation used here
let s:cpo_save = &cpo
set cpo&vim

" MRU configuration variables {{{1
" Maximum number of entries allowed in the MRU list
if !exists('MRU_Max_Entries')
    let MRU_Max_Entries = 10000
endif

" Files to exclude from the MRU list
if !exists('MRU_Exclude_Files')
    let MRU_Exclude_Files = ''
endif

" Files to include in the MRU list
if !exists('MRU_Include_Files')
    let MRU_Include_Files = ''
endif

" Height of the MRU window
" Default height is 8
if !exists('MRU_Window_Height')
    let MRU_Window_Height = 25
endif

if !exists('MRU_Use_Current_Window')
    let MRU_Use_Current_Window = 0
endif

if !exists('MRU_Auto_Close')
    let MRU_Auto_Close = 1
endif

if !exists('MRU_File')
    if has('unix') || has('macunix')
        let MRU_File = $HOME . '/.vim_mru_files'
    else
        let MRU_File = $VIM . '/_vim_mru_files'
        if has('win32')
            " MS-Windows
            if $USERPROFILE != ''
                let MRU_File = $USERPROFILE . '\_vim_mru_files'
            endif
        endif
    endif
endif

" When only a single matching filename is found in the MRU list, the following
" option controls whether the file name is displayed in the MRU window or the
" file is directly opened. When this variable is set to 0 and a single
" matching file name is found, then the file is directly opened.
if !exists('MRU_Window_Open_Always')
    let MRU_Window_Open_Always = 0
endif

" When opening a file from the MRU list, the file is opened in the current
" tab. If the selected file has to be opened in a tab always, then set the
" following variable to 1. If the file is already opened in a tab, then the
" cursor will be moved to that tab.
if !exists('MRU_Open_File_Use_Tabs')
    let MRU_Open_File_Use_Tabs = 0
endif

" Format of the file names displayed in the MRU window.
" The default is to display the filename followed by the complete path to the
" file in parenthesis. This variable controls the expressions used to format
" and parse the path. This can be changed to display the filenames in a
" different format. The 'formatter' specifies how to split/format the filename
" and 'parser' specifies how to read the filename back; 'syntax' matches the
" part to be highlighted.
if !exists('MRU_Filename_Format')
    let MRU_Filename_Format = {
        \   'formatter': 'fnamemodify(v:val, ":t") . " (" . v:val . ")"',
        \   'parser': '(\zs.*\ze)',
        \   'syntax': '^.\{-}\ze('
        \}
endif

" Control to temporarily lock the MRU list. Used to prevent files from
" getting added to the MRU list when the ':vimgrep' command is executed.
let s:mru_list_locked = 0

" MRU_LoadList                          {{{1
" Loads the latest list of file names from the MRU file
function! s:MRU_LoadList()
    " If the MRU file is present, then load the list of filenames. Otherwise
    " start with an empty list.
    if filereadable(g:MRU_File)
        let s:MRU_files = readfile(g:MRU_File)
        if s:MRU_files[0] =~# '^\s*" Most recently edited files in Vim'
            " Generated by the previous version of the MRU plugin.
            " Discard the list.
            let s:MRU_files = []
        elseif s:MRU_files[0] =~# '^#'
            " Remove the comment line
            call remove(s:MRU_files, 0)
        else
            " Unsupported format
            let s:MRU_files = []
        endif
    else
        let s:MRU_files = []
    endif
endfunction

" MRU_SaveList                          {{{1
" Saves the MRU file names to the MRU file
function! s:MRU_SaveList()
    let l = []
    call add(l, '# Most recently edited files in Vim (version 3.0)')
    call extend(l, s:MRU_files)
    call writefile(l, g:MRU_File)
endfunction

" MRU_AddFile                           {{{1
" Adds a file to the MRU file list
"   acmd_bufnr - Buffer number of the file to add
function! s:MRU_AddFile(acmd_bufnr)
    if s:mru_list_locked
        " MRU list is currently locked
        return
    endif

    " Get the full path to the filename
    let fname = fnamemodify(bufname(a:acmd_bufnr + 0), ':p')
    if fname == ''
        return
    endif

    " Skip temporary buffers with buftype set. The buftype is set for buffers
    " used by plugins.
    if &buftype != ''
        return
    endif

    if g:MRU_Include_Files != ''
        " If MRU_Include_Files is set, include only files matching the
        " specified pattern
        if fname !~# g:MRU_Include_Files
            return
        endif
    endif

    if g:MRU_Exclude_Files != ''
        " Do not add files matching the pattern specified in the
        " MRU_Exclude_Files to the MRU list
        if fname =~# g:MRU_Exclude_Files
            return
        endif
    endif

    " If the filename is not already present in the MRU list and is not
    " readable then ignore it
    let idx = index(s:MRU_files, fname)
    if idx == -1
        if !filereadable(fname)
            " File is not readable and is not in the MRU list
            return
        endif
    endif

    " Load the latest MRU file list
    call s:MRU_LoadList()

    " Remove the new file name from the existing MRU list (if already present)
    call filter(s:MRU_files, 'v:val !=# fname')

    " Add the new file list to the beginning of the updated old file list
    call insert(s:MRU_files, fname, 0)

    " Trim the list
    if len(s:MRU_files) > g:MRU_Max_Entries
        call remove(s:MRU_files, g:MRU_Max_Entries, -1)
    endif

    " Save the updated MRU list
    call s:MRU_SaveList()

    " If the MRU window is open, update the displayed MRU list
    let bname = '__MRU_Files__'
    let winnum = bufwinnr(bname)
    if winnum != -1
        let cur_winnr = winnr()
        call s:MRU_Open_Window()
        if winnr() != cur_winnr
            exe cur_winnr . 'wincmd w'
        endif
    endif
endfunction

" MRU_escape_filename                   {{{1
" Escape special characters in a filename. Special characters in file names
" that should be escaped (for security reasons)
let s:esc_filename_chars = ' *?[{`$%#"|!<>();&' . "'\t\n"
function! s:MRU_escape_filename(fname)
    if exists("*fnameescape")
        return fnameescape(a:fname)
    else
        return escape(a:fname, s:esc_filename_chars)
    endif
endfunction

" MRU_Edit_File                         {{{1
" Edit the specified file
"   filename - Name of the file to edit
"   sanitized - Specifies whether the filename is already escaped for special
"   characters or not.
function! s:MRU_Edit_File(filename, sanitized)
    if !a:sanitized
	let esc_fname = s:MRU_escape_filename(a:filename)
    else
	let esc_fname = a:filename
    endif

    " If the user wants to always open the file in a tab, then open the file
    " in a tab. If it is already opened in a tab, then the cursor will be
    " moved to that tab.
    if g:MRU_Open_File_Use_Tabs
	call s:MRU_Open_File_In_Tab(a:filename, esc_fname)
	return
    endif

    " If the file is already open in one of the windows, jump to it
    let winnum = bufwinnr('^' . a:filename . '$')
    if winnum != -1
        if winnum != winnr()
            exe winnum . 'wincmd w'
        endif
    else
        if !&hidden && (&modified || &buftype != '' || &previewwindow)
            " Current buffer has unsaved changes or is a special buffer or is
            " the preview window.  The 'hidden' option is also not set.
            " So open the file in a new window.
            exe 'split ' . esc_fname
        else
            " The current file can be replaced with the selected file.
            exe 'edit ' . esc_fname
        endif
    endif
endfunction

" MRU_Open_File_In_Tab
" Open a file in a tab. If the file is already opened in a tab, jump to the
" tab. Otherwise, create a new tab and open the file.
"   fname     : Name of the file to open
"   esc_fname : File name with special characters escaped
function! s:MRU_Open_File_In_Tab(fname, esc_fname)
    " If the selected file is already open in the current tab or in
    " another tab, jump to it. Otherwise open it in a new tab
    if bufwinnr('^' . a:fname . '$') == -1
	let tabnum = -1
	let i = 1
	let bnum = bufnr('^' . a:fname . '$')
	while i <= tabpagenr('$')
	    if index(tabpagebuflist(i), bnum) != -1
		let tabnum = i
		break
	    endif
	    let i += 1
	endwhile

	if tabnum != -1
	    " Goto the tab containing the file
	    exe 'tabnext ' . i
	else
	    " Open a new tab as the last tab page
	    exe '$tabnew ' . a:esc_fname
	endif
    endif

    " Jump to the window containing the file
    let winnum = bufwinnr('^' . a:fname . '$')
    if winnum != winnr()
	exe winnum . 'wincmd w'
    endif
endfunction

" MRU_Window_Edit_File                  {{{1
"   fname     : Name of the file to edit. May specify single or multiple
"               files.
"   edit_type : Specifies how to edit the file. Can be one of 'edit' or 'view'.
"               'view' - Open the file as a read-only file
"               'edit' - Edit the file as a regular file
"   multi     : Specifies  whether a single file or multiple files need to be
"               opened.
"   open_type : Specifies where to open the file.
"               useopen - If the file is already present in a window, then
"                         jump to that window.  Otherwise, open the file in
"                         the previous window.
"               newwin_horiz - Open the file in a new horizontal window.
"               newwin_vert - Open the file in a new vertical window.
"               newtab  - Open the file in a new tab. If the file is already
"                         opened in a tab, then jump to that tab.
"               preview - Open the file in the preview window
function! s:MRU_Window_Edit_File(fname, multi, edit_type, open_type)
    let esc_fname = s:MRU_escape_filename(a:fname)

    if a:open_type ==# 'newwin_horiz'
        " Edit the file in a new horizontally split window above the previous
        " window
        wincmd p
        exe 'belowright new ' . esc_fname
    elseif a:open_type ==# 'newwin_vert'
        " Edit the file in a new vertically split window above the previous
        " window
        wincmd p
        exe 'belowright vnew ' . esc_fname
    elseif a:open_type ==# 'newtab' || g:MRU_Open_File_Use_Tabs
	call s:MRU_Open_File_In_Tab(a:fname, esc_fname)
    elseif a:open_type ==# 'preview'
        " Edit the file in the preview window
        exe 'topleft pedit ' . esc_fname
    else
        " If the selected file is already open in one of the windows,
        " jump to it
        let winnum = bufwinnr('^' . a:fname . '$')
        if winnum != -1
            exe winnum . 'wincmd w'
        else
            if g:MRU_Auto_Close == 1 && g:MRU_Use_Current_Window == 0
                " Jump to the window from which the MRU window was opened
                if exists('s:MRU_last_buffer')
                    let last_winnr = bufwinnr(s:MRU_last_buffer)
                    if last_winnr != -1 && last_winnr != winnr()
                        exe last_winnr . 'wincmd w'
                    endif
                endif
            else
                if g:MRU_Use_Current_Window == 0
                    " Goto the previous window
                    " If MRU_Use_Current_Window is set to one, then the
                    " current window is used to open the file
                    wincmd p
                endif
            endif

            let split_window = 0

            if (!&hidden && (&modified || &previewwindow)) || a:multi
                " Current buffer has unsaved changes or is the preview window
                " or the user is opening multiple files
                " So open the file in a new window
                let split_window = 1
            endif

            if &buftype != ''
                " Current buffer is a special buffer (maybe used by a plugin)
                if g:MRU_Use_Current_Window == 0 ||
                            \ bufnr('%') != bufnr('__MRU_Files__')
                    let split_window = 1
                endif
            endif

            " Edit the file
            if split_window
                " Current buffer has unsaved changes or is a special buffer or
                " is the preview window.  So open the file in a new window
                if a:edit_type ==# 'edit'
                    exe 'split ' . esc_fname
                else
                    exe 'sview ' . esc_fname
                endif
            else
                if a:edit_type ==# 'edit'
                    exe 'edit ' . esc_fname
                else
                    exe 'view ' . esc_fname
                endif
            endif
        endif
    endif
endfunction

" MRU_Select_File_Cmd                   {{{1
" Open a file selected from the MRU window
"
"   'opt' has two values separated by comma. The first value specifies how to
"   edit the file  and can be either 'edit' or 'view'. The second value
"   specifies where to open the file. It can take one of the following values:
"     'useopen' to open file in the previous window
"     'newwin_horiz' to open the file in a new horizontal split window
"     'newwin_vert' to open the file in a new vertical split window.
"     'newtab' to open the file in a new tab.
" If multiple file names are selected using visual mode, then open multiple
" files (either in split windows or tabs)
function! s:MRU_Select_File_Cmd(opt) range
    let [edit_type, open_type] = split(a:opt, ',')

    let fnames = getline(a:firstline, a:lastline)

    if g:MRU_Auto_Close == 1 && g:MRU_Use_Current_Window == 0
        " Automatically close the window if the file window is
        " not used to display the MRU list.
        silent! close
    endif

    let multi = 0

    for f in fnames
        if f == ''
            continue
        endif

        " The text in the MRU window contains the filename in parenthesis
        let file = matchstr(f, g:MRU_Filename_Format.parser)

        call s:MRU_Window_Edit_File(file, multi, edit_type, open_type)

        if a:firstline != a:lastline
            " Opening multiple files
            let multi = 1
        endif
    endfor
endfunction

" MRU_Warn_Msg                          {{{1
" Display a warning message
function! s:MRU_Warn_Msg(msg)
    echohl WarningMsg
    echo a:msg
    echohl None
endfunction

" MRU_Open_Window                       {{{1
" Display the Most Recently Used file list in a temporary window.
" If the optional argument is supplied, then it specifies the pattern of files
" to selectively display in the MRU window.
function! s:MRU_Open_Window(...)

    " Load the latest MRU file list
    call s:MRU_LoadList()

    " Check for empty MRU list
    if empty(s:MRU_files)
        call s:MRU_Warn_Msg('MRU file list is empty')
        return
    endif

    " Save the current buffer number. This is used later to open a file when a
    " entry is selected from the MRU window. The window number is not saved,
    " as the window number will change when new windows are opened.
    let s:MRU_last_buffer = bufnr('%')

    let bname = '__MRU_Files__'

    " If the window is already open, jump to it
    let winnum = bufwinnr(bname)
    if winnum != -1
        if winnr() != winnum
            " If not already in the window, jump to it
            exe winnum . 'wincmd w'
        endif

        setlocal modifiable

        " Delete the contents of the buffer to the black-hole register
        silent! %delete _
    else
        if g:MRU_Use_Current_Window
            " Reuse the current window
            "
            " If the __MRU_Files__ buffer exists, then reuse it. Otherwise open
            " a new buffer
            let bufnum = bufnr(bname)
            if bufnum == -1
                let cmd = 'edit ' . bname
            else
                let cmd = 'buffer ' . bufnum
            endif

            exe cmd

            if bufnr('%') != bufnr(bname)
                " Failed to edit the MRU buffer
                return
            endif
        else
            " Open a new window at the bottom

            " If the __MRU_Files__ buffer exists, then reuse it. Otherwise open
            " a new buffer
            let bufnum = bufnr(bname)
            if bufnum == -1
                let wcmd = bname
            else
                let wcmd = '+buffer' . bufnum
            endif

            exe 'silent! botright ' . g:MRU_Window_Height . 'split ' . wcmd
        endif
    endif

    setlocal modifiable

    " Mark the buffer as scratch
    setlocal buftype=nofile
    setlocal bufhidden=delete
    setlocal noswapfile
    setlocal nowrap
    setlocal nobuflisted
    " Set the 'filetype' to 'mru'. This allows the user to apply custom
    " syntax highlighting or other changes to the MRU bufer.
    setlocal filetype=mru
    " Use fixed height for the MRU window
    setlocal winfixheight

    " Setup the cpoptions properly for the maps to work
    let old_cpoptions = &cpoptions
    set cpoptions&vim

    " Create mappings to select and edit a file from the MRU list
    nnoremap <buffer> <silent> <CR>
                \ :call <SID>MRU_Select_File_Cmd('edit,useopen')<CR>
    vnoremap <buffer> <silent> <CR>
                \ :call <SID>MRU_Select_File_Cmd('edit,useopen')<CR>
    nnoremap <buffer> <silent> o
                \ :call <SID>MRU_Select_File_Cmd('edit,newwin_horiz')<CR>
    vnoremap <buffer> <silent> o
                \ :call <SID>MRU_Select_File_Cmd('edit,newwin_horiz')<CR>
    nnoremap <buffer> <silent> <S-CR>
                \ :call <SID>MRU_Select_File_Cmd('edit,newwin_horiz')<CR>
    vnoremap <buffer> <silent> <S-CR>
                \ :call <SID>MRU_Select_File_Cmd('edit,newwin_horiz')<CR>
    nnoremap <buffer> <silent> O
                \ :call <SID>MRU_Select_File_Cmd('edit,newwin_vert')<CR>
    vnoremap <buffer> <silent> O
                \ :call <SID>MRU_Select_File_Cmd('edit,newwin_vert')<CR>
    nnoremap <buffer> <silent> t
                \ :call <SID>MRU_Select_File_Cmd('edit,newtab')<CR>
    vnoremap <buffer> <silent> t
                \ :call <SID>MRU_Select_File_Cmd('edit,newtab')<CR>
    nnoremap <buffer> <silent> v
                \ :call <SID>MRU_Select_File_Cmd('view,useopen')<CR>
    nnoremap <buffer> <silent> p
                \ :call <SID>MRU_Select_File_Cmd('view,preview')<CR>
    vnoremap <buffer> <silent> p
                \ :<C-u>if line("'<") == line("'>")<Bar>
                \     call <SID>MRU_Select_File_Cmd('open,preview')<Bar>
                \ else<Bar>
                \     echoerr "Only a single file can be previewed"<Bar>
                \ endif<CR>
    nnoremap <buffer> <silent> u :MRU<CR>
    nnoremap <buffer> <silent> <2-LeftMouse>
                \ :call <SID>MRU_Select_File_Cmd('edit,useopen')<CR>
    nnoremap <buffer> <silent> q :close<CR>
    nnoremap <buffer> <silent> <Esc> :close<CR>

    " Restore the previous cpoptions settings
    let &cpoptions = old_cpoptions

    " Display the MRU list
    if a:0 == 0
        " No search pattern specified. Display the complete list
        let m = copy(s:MRU_files)
    else
        " Display only the entries matching the specified pattern
	" First try using it as a literal pattern
	let m = filter(copy(s:MRU_files), 'stridx(v:val, a:1) != -1')
	if len(m) == 0
	    " No match. Try using it as a regular expression
	    let m = filter(copy(s:MRU_files), 'v:val =~# a:1')
	endif
    endif

    " Get the tail part of the file name (without the directory) and display
    " it along with the full path in parenthesis.
    let  output = map(m, g:MRU_Filename_Format.formatter)
    silent! 0put =output

    " Delete the empty line at the end of the buffer
    silent! $delete _

    " Move the cursor to the beginning of the file
    normal! gg

    " Add syntax highlighting for the file names
    if has_key(g:MRU_Filename_Format, 'syntax')
        exe "syntax match MRUFileName '" . g:MRU_Filename_Format.syntax . "'"
        highlight default link MRUFileName Identifier
    endif

    setlocal nomodifiable
endfunction

" MRU_Complete                          {{{1
" Command-line completion function used by :MRU command
function! s:MRU_Complete(ArgLead, CmdLine, CursorPos)
    if a:ArgLead == ''
        " Return the complete list of MRU files
        return s:MRU_files
    else
        " Return only the files matching the specified pattern
        return filter(copy(s:MRU_files), 'v:val =~? a:ArgLead')
    endif
endfunction

" MRU_Cmd                               {{{1
" Function to handle the MRU command
"   pat - File name pattern passed to the MRU command
function! s:MRU_Cmd(pat)
    if a:pat == ''
        " No arguments specified. Open the MRU window
        call s:MRU_Open_Window()
        return
    endif

    let pat= '\c' . substitute(a:pat, ' \+', '.*', 'g')

    " Load the latest MRU file
    call s:MRU_LoadList()

    " Empty MRU list
    if empty(s:MRU_files)
        call s:MRU_Warn_Msg('MRU file list is empty')
        return
    endif

    " First use the specified string as a literal string and search for
    " filenames containing the string. If only one filename is found,
    " then edit it (unless the user wants to open the MRU window always)
    let m = filter(copy(s:MRU_files), 'stridx(v:val, pat) != -1')
    if len(m) > 0
	if len(m) == 1 && !g:MRU_Window_Open_Always
	    call s:MRU_Edit_File(m[0], 0)
	    return
	endif

	" More than one file matches. Try find an accurate match
	let new_m = filter(m, 'v:val ==# pat')
	if len(new_m) == 1 && !g:MRU_Window_Open_Always
	    call s:MRU_Edit_File(new_m[0], 0)
	    return
	endif

	" Couldn't find an exact match, open the MRU window with all the
        " files matching the pattern.
	call s:MRU_Open_Window(pat)
	return
    endif

    " Use the specified string as a regular expression pattern and search
    " for filenames matching the pattern
    let m = filter(copy(s:MRU_files), 'v:val =~? pat')

    if len(m) == 0
        " If an existing file (not present in the MRU list) is specified,
        " then open the file.
        if filereadable(pat)
            call s:MRU_Edit_File(pat, 0)
            return
        endif

        " No filenames matching the specified pattern are found
        call s:MRU_Warn_Msg("MRU file list doesn't contain " .
                    \ "files matching " . pat)
        return
    endif

    if len(m) == 1 && !g:MRU_Window_Open_Always
        call s:MRU_Edit_File(m[0], 0)
        return
    endif

    call s:MRU_Open_Window(pat)
endfunction

" Load the MRU list on plugin startup
call s:MRU_LoadList()

" MRU autocommands {{{1
" Autocommands to detect the most recently used files
autocmd BufRead * call s:MRU_AddFile(expand('<abuf>'))
autocmd BufNewFile * call s:MRU_AddFile(expand('<abuf>'))
autocmd BufWritePost * call s:MRU_AddFile(expand('<abuf>'))

" The ':vimgrep' command adds all the files searched to the buffer list.
" This also modifies the MRU list, even though the user didn't edit the
" files. Use the following autocmds to prevent this.
autocmd QuickFixCmdPre *vimgrep* let s:mru_list_locked = 1
autocmd QuickFixCmdPost *vimgrep* let s:mru_list_locked = 0

" Command to open the MRU window
command! -nargs=* -complete=customlist,s:MRU_Complete MRU call s:MRU_Cmd(<q-args>)
command! -nargs=* -complete=customlist,s:MRU_Complete Mru call s:MRU_Cmd(<q-args>)

" }}}

" restore 'cpo'
let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set foldenable foldmethod=marker:
"+++++ ~/bin/vn ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#!/bin/sh

LANG=C

( /cygdrive/c/Users/PK65278/bin/vim82-kaoriya-win64/gvim -O "$@" > /dev/null | iconv -f cp932 -t utf-8 ) &
"+++++ ~/bin/vg ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#!/bin/sh

#/cygdrive/c/Users/PK65278/bin/vim81-kaoriya-win64/gvim -O "$@" &
#/cygdrive/c/Users/PK65278/bin/vim81-kaoriya-win64/gvim -O --remote-tab-silent "$@" &
#/cygdrive/c/Users/PK65278/bin/vim81-kaoriya-win64/gvim --serverlist "$@" &
#echo `/cygdrive/c/Users/PK65278/bin/vim81-kaoriya-win64/vim --serverlist "$@"`

if [ \( $# -eq 0 \) -o \( "`/cygdrive/c/Users/PK65278/bin/vim82-kaoriya-win64/vim --serverlist`" = "" \) ] ; then
	( /cygdrive/c/Users/PK65278/bin/vim82-kaoriya-win64/gvim -O "$@" | iconv -f cp932 -t utf-8 ) &
else
	( /cygdrive/c/Users/PK65278/bin/vim82-kaoriya-win64/gvim --remote-tab-silent "$@" | iconv -f cp932 -t utf-8 ) &
fi
"+++++ ~/bin/vw ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#!/bin/sh

/cygdrive/c/Users/PK65278/bin/vim82-kaoriya-win64/gvim  $(cygpath -w "$@")
"+++++ ~/.ctags ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--langmap=Asm:+.xms

--langmap=C:+.h

--langmap=Vim:+.vimrc
--langmap=Vim:+.gvimrc

--exclude=file

##--langmap=Asm:+.xms

##--C-kinds=+l
##  c  classes
##  d  macro definitions
##  e  enumerators (values inside an enumeration)
##  f  function definitions
##  g  enumeration names
##  l  local variables [off]
##  m  class, struct, and union members
##  n  namespaces
##  p  function prototypes [off]
##  s  structure names
##  t  typedefs
##  u  union names
##  v  variable definitions
##  x  external and forward variable declarations [off]
"+++++ ~/vimfiles/ime.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set encoding=utf-8
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0 expandtab:
" (この行に関しては:help modelineを参照)

" Kana Compeete

so ~/vimfiles/hiragana2

set completefunc=Ime

"inoremap <C-u> <C-x><C-u>

" 第2引数により、そのまま選択する。
inoremap <expr> <C-u> TriggerComplete("\<C-x>\<C-u>", "\<C-n>")

inoremap <expr> <C-u> TriggerComplete("\<C-x>\<C-u>", '') . "\<C-n>\<C-n>"
inoremap <expr> <C-u> TriggerComplete("\<C-x>\<C-u>", '') . Selsel()

function! Selsel()
  call feedkeys("\<C-n>\<C-y>", 'n')
  return ''
endfunction

function! Ime(findstart, base)
  if a:findstart
    " 単語の始点を検索する
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\a'
      let start -= 1
    endwhile
    return start
  else
    let res = []
    let w = a:base
    for k in keys(g:Hiragana)
      let w = substitute(w, k, g:Hiragana[k], 'g')
    endfor
    for k in keys(g:Hiragana_Bo)
      let w = substitute(w, k, g:Hiragana_Bo[k], 'g')
    endfor
    call add(res, w)

    return res
  endif
endfunction


    " "a:base" にマッチする月を探す
    "for m in split("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec")
    "  if m =~ '^' . a:base
    "    call add(res, m)
    "  endif
    "endfor
"+++++ ~/vimfiles/pack/mypackage/start/tmp/plugin/test.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"+++++ ~/vimfiles/pack/mypackage/start/tmp/plugin/vim.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"+++++ /cygdrive/c/Users/pk65278/bin/vim82-kaoriya-win64/vim82/pack/dist/opt/termdebug/plugin/termdebug.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Debugger plugin using gdb.
"
" Author: Bram Moolenaar
" Copyright: Vim license applies, see ":help license"
" Last Change: 2019 Dec 11
"
" WORK IN PROGRESS - Only the basics work
" Note: On MS-Windows you need a recent version of gdb.  The one included with
" MingW is too old (7.6.1).
" I used version 7.12 from http://www.equation.com/servlet/equation.cmd?fa=gdb
"
" There are two ways to run gdb:
" - In a terminal window; used if possible, does not work on MS-Windows
"   Not used when g:termdebug_use_prompt is set to 1.
" - Using a "prompt" buffer; may use a terminal window for the program
"
" For both the current window is used to view source code and shows the
" current statement from gdb.
"
" USING A TERMINAL WINDOW
"
" Opens two visible terminal windows:
" 1. runs a pty for the debugged program, as with ":term NONE"
" 2. runs gdb, passing the pty of the debugged program
" A third terminal window is hidden, it is used for communication with gdb.
"
" USING A PROMPT BUFFER
"
" Opens a window with a prompt buffer to communicate with gdb.
" Gdb is run as a job with callbacks for I/O.
" On Unix another terminal window is opened to run the debugged program
" On MS-Windows a separate console is opened to run the debugged program
"
" The communication with gdb uses GDB/MI.  See:
" https://sourceware.org/gdb/current/onlinedocs/gdb/GDB_002fMI.html

" In case this gets sourced twice.
if exists(':Termdebug')
  "finish
endif

" Need either the +terminal feature or +channel and the prompt buffer.
" The terminal feature does not work with gdb on win32.
if has('terminal') && !has('win32')
  let s:way = 'terminal'
elseif has('channel') && exists('*prompt_setprompt')
  let s:way = 'prompt'
else
  if has('terminal')
    let s:err = 'Cannot debug, missing prompt buffer support'
  else
    let s:err = 'Cannot debug, +channel feature is not supported'
  endif
  command -nargs=* -complete=file -bang Termdebug echoerr s:err
  command -nargs=+ -complete=file -bang TermdebugCommand echoerr s:err
  finish
endif

let s:keepcpo = &cpo
set cpo&vim

" The command that starts debugging, e.g. ":Termdebug vim".
" To end type "quit" in the gdb window.
command -nargs=* -complete=file -bang Termdebug call s:StartDebug(<bang>0, <f-args>)
command -nargs=+ -complete=file -bang TermdebugCommand call s:StartDebugCommand(<bang>0, <f-args>)

" Name of the gdb command, defaults to "gdb".
if !exists('g:termdebugger')
  let g:termdebugger = 'gdb'
endif

let s:pc_id = 12
let s:break_id = 13  " breakpoint number is added to this
let s:stopped = 1

" Take a breakpoint number as used by GDB and turn it into an integer.
" The breakpoint may contain a dot: 123.4 -> 123004
" The main breakpoint has a zero subid.
func s:Breakpoint2SignNumber(id, subid)
  return s:break_id + a:id * 1000 + a:subid
endfunction

func s:Highlight(init, old, new)
  let default = a:init ? 'default ' : ''
  if a:new ==# 'light' && a:old !=# 'light'
    exe "hi " . default . "debugPC term=reverse ctermbg=lightblue guibg=lightblue"
  elseif a:new ==# 'dark' && a:old !=# 'dark'
    exe "hi " . default . "debugPC term=reverse ctermbg=darkblue guibg=darkblue"
  endif
endfunc

call s:Highlight(1, '', &background)
hi default debugBreakpoint term=reverse ctermbg=red guibg=red

func s:StartDebug(bang, ...)
  " First argument is the command to debug, second core file or process ID.
  call s:StartDebug_internal({'gdb_args': a:000, 'bang': a:bang})
endfunc

func s:StartDebugCommand(bang, ...)
  " First argument is the command to debug, rest are run arguments.
  call s:StartDebug_internal({'gdb_args': [a:1], 'proc_args': a:000[1:], 'bang': a:bang})
endfunc

func s:StartDebug_internal(dict)
  if exists('s:gdbwin')
    echoerr 'Terminal debugger already running, cannot run two'
    return
  endif
  if !executable(g:termdebugger)
    echoerr 'Cannot execute debugger program "' .. g:termdebugger .. '"'
    return
  endif

  let s:ptywin = 0
  let s:pid = 0

  " Uncomment this line to write logging in "debuglog".
  " call ch_logfile('debuglog', 'w')

  let s:sourcewin = win_getid(winnr())
  let s:startsigncolumn = &signcolumn

  let s:save_columns = 0
  let s:allleft = 0
  if exists('g:termdebug_wide')
    if &columns < g:termdebug_wide
      let s:save_columns = &columns
      let &columns = g:termdebug_wide
      " If we make the Vim window wider, use the whole left halve for the debug
      " windows.
      let s:allleft = 1
    endif
    let s:vertical = 1
  else
    let s:vertical = 0
  endif

  " Override using a terminal window by setting g:termdebug_use_prompt to 1.
  let use_prompt = exists('g:termdebug_use_prompt') && g:termdebug_use_prompt
  if has('terminal') && !has('win32') && !use_prompt
    let s:way = 'terminal'
  else
    let s:way = 'prompt'
  endif

  if s:way == 'prompt'
    call s:StartDebug_prompt(a:dict)
  else
    call s:StartDebug_term(a:dict)
  endif
endfunc

" Use when debugger didn't start or ended.
func s:CloseBuffers()
  exe 'bwipe! ' . s:ptybuf
  exe 'bwipe! ' . s:commbuf
  unlet! s:gdbwin
endfunc

func s:StartDebug_term(dict)
  " Open a terminal window without a job, to run the debugged program in.
  let s:ptybuf = term_start('NONE', {
	\ 'term_name': 'debugged program',
	\ 'vertical': s:vertical,
	\ })
  if s:ptybuf == 0
    echoerr 'Failed to open the program terminal window'
    return
  endif
  let pty = job_info(term_getjob(s:ptybuf))['tty_out']
  let s:ptywin = win_getid(winnr())
  if s:vertical
    " Assuming the source code window will get a signcolumn, use two more
    " columns for that, thus one less for the terminal window.
    exe (&columns / 2 - 1) . "wincmd |"
    if s:allleft
      " use the whole left column
      wincmd H
    endif
  endif

  " Create a hidden terminal window to communicate with gdb
  let s:commbuf = term_start('NONE', {
	\ 'term_name': 'gdb communication',
	\ 'out_cb': function('s:CommOutput'),
	\ 'hidden': 1,
	\ })
  if s:commbuf == 0
    echoerr 'Failed to open the communication terminal window'
    exe 'bwipe! ' . s:ptybuf
    return
  endif
  let commpty = job_info(term_getjob(s:commbuf))['tty_out']

  " Open a terminal window to run the debugger.
  " Add -quiet to avoid the intro message causing a hit-enter prompt.
  let gdb_args = get(a:dict, 'gdb_args', [])
  let proc_args = get(a:dict, 'proc_args', [])

  let cmd = [g:termdebugger, '-quiet', '-tty', pty] + gdb_args
  call ch_log('executing "' . join(cmd) . '"')
  let s:gdbbuf = term_start(cmd, {
	\ 'term_finish': 'close',
	\ })
  if s:gdbbuf == 0
    echoerr 'Failed to open the gdb terminal window'
    call s:CloseBuffers()
    return
  endif
  let s:gdbwin = win_getid(winnr())

  " Set arguments to be run
  if len(proc_args)
    call term_sendkeys(s:gdbbuf, 'set args ' . join(proc_args) . "\r")
  endif

  " Connect gdb to the communication pty, using the GDB/MI interface
  call term_sendkeys(s:gdbbuf, 'new-ui mi ' . commpty . "\r")

  " Wait for the response to show up, users may not notice the error and wonder
  " why the debugger doesn't work.
  let try_count = 0
  while 1
    let gdbproc = term_getjob(s:gdbbuf)
    if gdbproc == v:null || job_status(gdbproc) !=# 'run'
      echoerr string(g:termdebugger) . ' exited unexpectedly'
      call s:CloseBuffers()
      return
    endif

    let response = ''
    for lnum in range(1, 200)
      let line1 = term_getline(s:gdbbuf, lnum)
      let line2 = term_getline(s:gdbbuf, lnum + 1)
      if line1 =~ 'new-ui mi '
	" response can be in the same line or the next line
	let response = line1 . line2
	if response =~ 'Undefined command'
	  echoerr 'Sorry, your gdb is too old, gdb 7.12 is required'
	  call s:CloseBuffers()
	  return
	endif
	if response =~ 'New UI allocated'
	  " Success!
	  break
	endif
      elseif line1 =~ 'Reading symbols from' && line2 !~ 'new-ui mi '
	" Reading symbols might take a while, try more times
	let try_count -= 1
      endif
    endfor
    if response =~ 'New UI allocated'
      break
    endif
    let try_count += 1
    if try_count > 100
      echoerr 'Cannot check if your gdb works, continuing anyway'
      break
    endif
    sleep 10m
  endwhile

  " Interpret commands while the target is running.  This should usually only be
  " exec-interrupt, since many commands don't work properly while the target is
  " running.
  call s:SendCommand('-gdb-set mi-async on')
  " Older gdb uses a different command.
  call s:SendCommand('-gdb-set target-async on')

  " Disable pagination, it causes everything to stop at the gdb
  " "Type <return> to continue" prompt.
  call s:SendCommand('set pagination off')

  call job_setoptions(gdbproc, {'exit_cb': function('s:EndTermDebug')})
  call s:StartDebugCommon(a:dict)
endfunc

func s:StartDebug_prompt(dict)
  " Open a window with a prompt buffer to run gdb in.
  if s:vertical
    vertical new
  else
    new
  endif
  let s:gdbwin = win_getid(winnr())
  let s:promptbuf = bufnr('')
  call prompt_setprompt(s:promptbuf, 'gdb> ')
  set buftype=prompt
  file gdb
  call prompt_setcallback(s:promptbuf, function('s:PromptCallback'))
  call prompt_setinterrupt(s:promptbuf, function('s:PromptInterrupt'))

  if s:vertical
    " Assuming the source code window will get a signcolumn, use two more
    " columns for that, thus one less for the terminal window.
    exe (&columns / 2 - 1) . "wincmd |"
  endif

  " Add -quiet to avoid the intro message causing a hit-enter prompt.
  let gdb_args = get(a:dict, 'gdb_args', [])
  let proc_args = get(a:dict, 'proc_args', [])

  let cmd = [g:termdebugger, '-quiet', '--interpreter=mi2'] + gdb_args
  call ch_log('executing "' . join(cmd) . '"')

  let s:gdbjob = job_start(cmd, {
	\ 'exit_cb': function('s:EndPromptDebug'),
	\ 'out_cb': function('s:GdbOutCallback'),
	\ })
  if job_status(s:gdbjob) != "run"
    echoerr 'Failed to start gdb'
    exe 'bwipe! ' . s:promptbuf
    return
  endif
  " Mark the buffer modified so that it's not easy to close.
  set modified
  let s:gdb_channel = job_getchannel(s:gdbjob)  

  " Interpret commands while the target is running.  This should usually only
  " be exec-interrupt, since many commands don't work properly while the
  " target is running.
  call s:SendCommand('-gdb-set mi-async on')
  " Older gdb uses a different command.
  call s:SendCommand('-gdb-set target-async on')

  let s:ptybuf = 0
  if has('win32')
    " MS-Windows: run in a new console window for maximum compatibility
    call s:SendCommand('set new-console on')
  elseif has('terminal')
    " Unix: Run the debugged program in a terminal window.  Open it below the
    " gdb window.
    belowright let s:ptybuf = term_start('NONE', {
	  \ 'term_name': 'debugged program',
	  \ })
    if s:ptybuf == 0
      echoerr 'Failed to open the program terminal window'
      call job_stop(s:gdbjob)
      return
    endif
    let s:ptywin = win_getid(winnr())
    let pty = job_info(term_getjob(s:ptybuf))['tty_out']
    call s:SendCommand('tty ' . pty)

    " Since GDB runs in a prompt window, the environment has not been set to
    " match a terminal window, need to do that now.
    call s:SendCommand('set env TERM = xterm-color')
    call s:SendCommand('set env ROWS = ' . winheight(s:ptywin))
    call s:SendCommand('set env LINES = ' . winheight(s:ptywin))
    call s:SendCommand('set env COLUMNS = ' . winwidth(s:ptywin))
    call s:SendCommand('set env COLORS = ' . &t_Co)
    call s:SendCommand('set env VIM_TERMINAL = ' . v:version)
  else
    " TODO: open a new terminal get get the tty name, pass on to gdb
    call s:SendCommand('show inferior-tty')
  endif
  call s:SendCommand('set print pretty on')
  call s:SendCommand('set breakpoint pending on')
  " Disable pagination, it causes everything to stop at the gdb
  call s:SendCommand('set pagination off')

  " Set arguments to be run
  if len(proc_args)
    call s:SendCommand('set args ' . join(proc_args))
  endif

  call s:StartDebugCommon(a:dict)
  startinsert
endfunc

func s:StartDebugCommon(dict)
  " Sign used to highlight the line where the program has stopped.
  " There can be only one.
  sign define debugPC linehl=debugPC

  " Install debugger commands in the text window.
  call win_gotoid(s:sourcewin)
  call s:InstallCommands()
  call win_gotoid(s:gdbwin)

  " Enable showing a balloon with eval info
  if has("balloon_eval") || has("balloon_eval_term")
    set balloonexpr=TermDebugBalloonExpr()
    if has("balloon_eval")
      set ballooneval
    endif
    if has("balloon_eval_term")
      set balloonevalterm
    endif
  endif

  " Contains breakpoints that have been placed, key is a string with the GDB
  " breakpoint number.
  " Each entry is a dict, containing the sub-breakpoints.  Key is the subid.
  " For a breakpoint that is just a number the subid is zero.
  " For a breakpoint "123.4" the id is "123" and subid is "4".
  " Example, when breakpoint "44", "123", "123.1" and "123.2" exist:
  " {'44': {'0': entry}, '123': {'0': entry, '1': entry, '2': entry}}
  let s:breakpoints = {}

  " Contains breakpoints by file/lnum.  The key is "fname:lnum".
  " Each entry is a list of breakpoint IDs at that position.
  let s:breakpoint_locations = {}

  augroup TermDebug
    au BufRead * call s:BufRead()
    au BufUnload * call s:BufUnloaded()
    au OptionSet background call s:Highlight(0, v:option_old, v:option_new)
  augroup END

  " Run the command if the bang attribute was given and got to the debug
  " window.
  if get(a:dict, 'bang', 0)
    call s:SendCommand('-exec-run')
    call win_gotoid(s:ptywin)
  endif
endfunc

" Send a command to gdb.  "cmd" is the string without line terminator.
func s:SendCommand(cmd)
  call ch_log('sending to gdb: ' . a:cmd)
  if s:way == 'prompt'
    call ch_sendraw(s:gdb_channel, a:cmd . "\n")
  else
    call term_sendkeys(s:commbuf, a:cmd . "\r")
  endif
endfunc

" This is global so that a user can create their mappings with this.
func TermDebugSendCommand(cmd)
  if s:way == 'prompt'
    call ch_sendraw(s:gdb_channel, a:cmd . "\n")
  else
    let do_continue = 0
    if !s:stopped
      let do_continue = 1
      call s:SendCommand('-exec-interrupt')
      sleep 10m
    endif
    call term_sendkeys(s:gdbbuf, a:cmd . "\r")
    if do_continue
      Continue
    endif
  endif
endfunc

" Function called when entering a line in the prompt buffer.
func s:PromptCallback(text)
  call s:SendCommand(a:text)
endfunc

" Function called when pressing CTRL-C in the prompt buffer and when placing a
" breakpoint.
func s:PromptInterrupt()
  call ch_log('Interrupting gdb')
  if has('win32')
    " Using job_stop() does not work on MS-Windows, need to send SIGTRAP to
    " the debugger program so that gdb responds again.
    if s:pid == 0
      echoerr 'Cannot interrupt gdb, did not find a process ID'
    else
      call debugbreak(s:pid)
    endif
  else
    call job_stop(s:gdbjob, 'int')
  endif
endfunc

" Function called when gdb outputs text.
func s:GdbOutCallback(channel, text)
  call ch_log('received from gdb: ' . a:text)

  " Drop the gdb prompt, we have our own.
  " Drop status and echo'd commands.
  if a:text == '(gdb) ' || a:text == '^done' || a:text[0] == '&'
    return
  endif
  if a:text =~ '^^error,msg='
    let text = s:DecodeMessage(a:text[11:])
    if exists('s:evalexpr') && text =~ 'A syntax error in expression, near\|No symbol .* in current context'
      " Silently drop evaluation errors.
      unlet s:evalexpr
      return
    endif
  elseif a:text[0] == '~'
    let text = s:DecodeMessage(a:text[1:])
  else
    call s:CommOutput(a:channel, a:text)
    return
  endif

  let curwinid = win_getid(winnr())
  call win_gotoid(s:gdbwin)

  " Add the output above the current prompt.
  call append(line('$') - 1, text)
  set modified

  call win_gotoid(curwinid)
endfunc

" Decode a message from gdb.  quotedText starts with a ", return the text up
" to the next ", unescaping characters.
func s:DecodeMessage(quotedText)
  if a:quotedText[0] != '"'
    echoerr 'DecodeMessage(): missing quote in ' . a:quotedText
    return
  endif
  let result = ''
  let i = 1
  while a:quotedText[i] != '"' && i < len(a:quotedText)
    if a:quotedText[i] == '\'
      let i += 1
      if a:quotedText[i] == 'n'
	" drop \n
	let i += 1
	continue
      elseif a:quotedText[i] == 't'
	" append \t
	let i += 1
	let result .= "\t"
	continue
      endif
    endif
    let result .= a:quotedText[i]
    let i += 1
  endwhile
  return result
endfunc

" Extract the "name" value from a gdb message with fullname="name".
func s:GetFullname(msg)
  if a:msg !~ 'fullname'
    return ''
  endif
  let name = s:DecodeMessage(substitute(a:msg, '.*fullname=', '', ''))
  if has('win32') && name =~ ':\\\\'
    " sometimes the name arrives double-escaped
    let name = substitute(name, '\\\\', '\\', 'g')
  endif
  return name
endfunc

func s:EndTermDebug(job, status)
  exe 'bwipe! ' . s:commbuf
  unlet s:gdbwin

  call s:EndDebugCommon()
endfunc

func s:EndDebugCommon()
  let curwinid = win_getid(winnr())

  if exists('s:ptybuf') && s:ptybuf
    exe 'bwipe! ' . s:ptybuf
  endif

  call win_gotoid(s:sourcewin)
  let &signcolumn = s:startsigncolumn
  call s:DeleteCommands()

  call win_gotoid(curwinid)

  if s:save_columns > 0
    let &columns = s:save_columns
  endif

  if has("balloon_eval") || has("balloon_eval_term")
    set balloonexpr=
    if has("balloon_eval")
      set noballooneval
    endif
    if has("balloon_eval_term")
      set noballoonevalterm
    endif
  endif

  au! TermDebug
endfunc

func s:EndPromptDebug(job, status)
  let curwinid = win_getid(winnr())
  call win_gotoid(s:gdbwin)
  set nomodified
  close
  if curwinid != s:gdbwin
    call win_gotoid(curwinid)
  endif

  call s:EndDebugCommon()
  unlet s:gdbwin
  call ch_log("Returning from EndPromptDebug()")
endfunc

" Handle a message received from gdb on the GDB/MI interface.
func s:CommOutput(chan, msg)
  let msgs = split(a:msg, "\r")

  for msg in msgs
    " remove prefixed NL
    if msg[0] == "\n"
      let msg = msg[1:]
    endif
    if msg != ''
      if msg =~ '^\(\*stopped\|\*running\|=thread-selected\)'
	call s:HandleCursor(msg)
      elseif msg =~ '^\^done,bkpt=' || msg =~ '^=breakpoint-created,'
	call s:HandleNewBreakpoint(msg)
      elseif msg =~ '^=breakpoint-deleted,'
	call s:HandleBreakpointDelete(msg)
      elseif msg =~ '^=thread-group-started'
	call s:HandleProgramRun(msg)
      elseif msg =~ '^\^done,value='
	call s:HandleEvaluate(msg)
      elseif msg =~ '^\^error,msg='
	call s:HandleError(msg)
      endif
    endif
  endfor
endfunc

func s:GotoProgram()
  if has('win32')
    if executable('powershell')
      call system(printf('powershell -Command "add-type -AssemblyName microsoft.VisualBasic;[Microsoft.VisualBasic.Interaction]::AppActivate(%d);"', s:pid))
    endif
  else
    call win_gotoid(s:ptywin)
  endif
endfunc

" Install commands in the current window to control the debugger.
func s:InstallCommands()
  let save_cpo = &cpo
  set cpo&vim

  command -nargs=? Break call s:SetBreakpoint(<q-args>)
  command Clear call s:ClearBreakpoint()
  command Step call s:SendCommand('-exec-step')
  command Over call s:SendCommand('-exec-next')
  command Finish call s:SendCommand('-exec-finish')
  command -nargs=* Run call s:Run(<q-args>)
  command -nargs=* Arguments call s:SendCommand('-exec-arguments ' . <q-args>)
  command Stop call s:SendCommand('-exec-interrupt')

  " using -exec-continue results in CTRL-C in gdb window not working
  if s:way == 'prompt'
    command Continue call s:SendCommand('continue')
  else
    command Continue call term_sendkeys(s:gdbbuf, "continue\r")
  endif

  command -range -nargs=* Evaluate call s:Evaluate(<range>, <q-args>)
  command Gdb call win_gotoid(s:gdbwin)
  command Program call s:GotoProgram()
  command Source call s:GotoSourcewinOrCreateIt()
  command Winbar call s:InstallWinbar()

  " TODO: can the K mapping be restored?
  "nnoremap K :Evaluate<CR>

  if has('menu') && &mouse != ''
    call s:InstallWinbar()

    if !exists('g:termdebug_popup') || g:termdebug_popup != 0
      let s:saved_mousemodel = &mousemodel
      let &mousemodel = 'popup_setpos'
      an 1.200 PopUp.-SEP3-	<Nop>
      an 1.210 PopUp.Set\ breakpoint	:Break<CR>
      an 1.220 PopUp.Clear\ breakpoint	:Clear<CR>
      an 1.230 PopUp.Evaluate		:Evaluate<CR>
    endif
  endif

  let &cpo = save_cpo
endfunc

let s:winbar_winids = []

" Install the window toolbar in the current window.
func s:InstallWinbar()
  if has('menu') && &mouse != ''
    nnoremenu WinBar.Step   :Step<CR>
    nnoremenu WinBar.Next   :Over<CR>
    nnoremenu WinBar.Finish :Finish<CR>
    nnoremenu WinBar.Cont   :Continue<CR>
    nnoremenu WinBar.Stop   :Stop<CR>
    nnoremenu WinBar.Eval   :Evaluate<CR>
    call add(s:winbar_winids, win_getid(winnr()))
  endif
endfunc

" Delete installed debugger commands in the current window.
func s:DeleteCommands()
  delcommand Break
  delcommand Clear
  delcommand Step
  delcommand Over
  delcommand Finish
  delcommand Run
  delcommand Arguments
  delcommand Stop
  delcommand Continue
  delcommand Evaluate
  delcommand Gdb
  delcommand Program
  delcommand Source
  delcommand Winbar

  "nunmap K

  if has('menu')
    " Remove the WinBar entries from all windows where it was added.
    let curwinid = win_getid(winnr())
    for winid in s:winbar_winids
      if win_gotoid(winid)
	aunmenu WinBar.Step
	aunmenu WinBar.Next
	aunmenu WinBar.Finish
	aunmenu WinBar.Cont
	aunmenu WinBar.Stop
	aunmenu WinBar.Eval
      endif
    endfor
    call win_gotoid(curwinid)
    let s:winbar_winids = []

    if exists('s:saved_mousemodel')
      let &mousemodel = s:saved_mousemodel
      unlet s:saved_mousemodel
      aunmenu PopUp.-SEP3-
      aunmenu PopUp.Set\ breakpoint
      aunmenu PopUp.Clear\ breakpoint
      aunmenu PopUp.Evaluate
    endif
  endif

  exe 'sign unplace ' . s:pc_id
  for [id, entries] in items(s:breakpoints)
    for subid in keys(entries)
      exe 'sign unplace ' . s:Breakpoint2SignNumber(id, subid)
    endfor
  endfor
  unlet s:breakpoints
  unlet s:breakpoint_locations

  sign undefine debugPC
  for val in s:BreakpointSigns
    exe "sign undefine debugBreakpoint" . val
  endfor
  let s:BreakpointSigns = []
endfunc

" :Break - Set a breakpoint at the cursor position.
func s:SetBreakpoint(at)
  " Setting a breakpoint may not work while the program is running.
  " Interrupt to make it work.
  let do_continue = 0
  if !s:stopped
    let do_continue = 1
    if s:way == 'prompt'
      call s:PromptInterrupt()
    else
      call s:SendCommand('-exec-interrupt')
    endif
    sleep 10m
  endif

  " Use the fname:lnum format, older gdb can't handle --source.
  let at = empty(a:at) ?
        \ fnameescape(expand('%:p')) . ':' . line('.') : a:at
  call s:SendCommand('-break-insert ' . at)
  if do_continue
    call s:SendCommand('-exec-continue')
  endif
endfunc

" :Clear - Delete a breakpoint at the cursor position.
func s:ClearBreakpoint()
  let fname = fnameescape(expand('%:p'))
  let lnum = line('.')
  let bploc = printf('%s:%d', fname, lnum)
  if has_key(s:breakpoint_locations, bploc)
    let idx = 0
    for id in s:breakpoint_locations[bploc]
      if has_key(s:breakpoints, id)
	" Assume this always works, the reply is simply "^done".
	call s:SendCommand('-break-delete ' . id)
	for subid in keys(s:breakpoints[id])
	  exe 'sign unplace ' . s:Breakpoint2SignNumber(id, subid)
	endfor
	unlet s:breakpoints[id]
	unlet s:breakpoint_locations[bploc][idx]
	break
      else
	let idx += 1
      endif
    endfor
    if empty(s:breakpoint_locations[bploc])
      unlet s:breakpoint_locations[bploc]
    endif
  endif
endfunc

func s:Run(args)
  if a:args != ''
    call s:SendCommand('-exec-arguments ' . a:args)
  endif
  call s:SendCommand('-exec-run')
endfunc

func s:SendEval(expr)
  call s:SendCommand('-data-evaluate-expression "' . a:expr . '"')
  let s:evalexpr = a:expr
endfunc

" :Evaluate - evaluate what is under the cursor
func s:Evaluate(range, arg)
  if a:arg != ''
    let expr = a:arg
  elseif a:range == 2
    let pos = getcurpos()
    let reg = getreg('v', 1, 1)
    let regt = getregtype('v')
    normal! gv"vy
    let expr = @v
    call setpos('.', pos)
    call setreg('v', reg, regt)
  else
    let expr = expand('<cexpr>')
  endif
  let s:ignoreEvalError = 0
  call s:SendEval(expr)
endfunc

let s:ignoreEvalError = 0
let s:evalFromBalloonExpr = 0

" Handle the result of data-evaluate-expression
func s:HandleEvaluate(msg)
  let value = substitute(a:msg, '.*value="\(.*\)"', '\1', '')
  let value = substitute(value, '\\"', '"', 'g')
  if s:evalFromBalloonExpr
    if s:evalFromBalloonExprResult == ''
      let s:evalFromBalloonExprResult = s:evalexpr . ': ' . value
    else
      let s:evalFromBalloonExprResult .= ' = ' . value
    endif
    call balloon_show(s:evalFromBalloonExprResult)
  else
    echomsg '"' . s:evalexpr . '": ' . value
  endif

  if s:evalexpr[0] != '*' && value =~ '^0x' && value != '0x0' && value !~ '"$'
    " Looks like a pointer, also display what it points to.
    let s:ignoreEvalError = 1
    call s:SendEval('*' . s:evalexpr)
  else
    let s:evalFromBalloonExpr = 0
  endif
endfunc

" Show a balloon with information of the variable under the mouse pointer,
" if there is any.
func TermDebugBalloonExpr()
  if v:beval_winid != s:sourcewin
    return ''
  endif
  if !s:stopped
    " Only evaluate when stopped, otherwise setting a breakpoint using the
    " mouse triggers a balloon.
    return ''
  endif
  let s:evalFromBalloonExpr = 1
  let s:evalFromBalloonExprResult = ''
  let s:ignoreEvalError = 1
  call s:SendEval(v:beval_text)
  return ''
endfunc

" Handle an error.
func s:HandleError(msg)
  if s:ignoreEvalError
    " Result of s:SendEval() failed, ignore.
    let s:ignoreEvalError = 0
    let s:evalFromBalloonExpr = 0
    return
  endif
  echoerr substitute(a:msg, '.*msg="\(.*\)"', '\1', '')
endfunc

func s:GotoSourcewinOrCreateIt()
  if !win_gotoid(s:sourcewin)
    new
    let s:sourcewin = win_getid(winnr())
    call s:InstallWinbar()
  endif
endfunc

" Handle stopping and running message from gdb.
" Will update the sign that shows the current position.
func s:HandleCursor(msg)
  let wid = win_getid(winnr())

  if a:msg =~ '^\*stopped'
    call ch_log('program stopped')
    let s:stopped = 1
  elseif a:msg =~ '^\*running'
    call ch_log('program running')
    let s:stopped = 0
  endif

  if a:msg =~ 'fullname='
    let fname = s:GetFullname(a:msg)
  else
    let fname = ''
  endif
  if a:msg =~ '^\(\*stopped\|=thread-selected\)' && filereadable(fname)
    let lnum = substitute(a:msg, '.*line="\([^"]*\)".*', '\1', '')
    if lnum =~ '^[0-9]*$'
    call s:GotoSourcewinOrCreateIt()
      if expand('%:p') != fnamemodify(fname, ':p')
	if &modified
	  " TODO: find existing window
	  exe 'split ' . fnameescape(fname)
	  let s:sourcewin = win_getid(winnr())
	  call s:InstallWinbar()
	else
	  exe 'edit ' . fnameescape(fname)
	endif
      endif
      exe lnum
      exe 'sign unplace ' . s:pc_id
      exe 'sign place ' . s:pc_id . ' line=' . lnum . ' name=debugPC file=' . fname
      setlocal signcolumn=yes
    endif
  elseif !s:stopped || fname != ''
    exe 'sign unplace ' . s:pc_id
  endif

  call win_gotoid(wid)
endfunc

let s:BreakpointSigns = []

func s:CreateBreakpoint(id, subid)
  let nr = printf('%d.%d', a:id, a:subid)
  if index(s:BreakpointSigns, nr) == -1
    call add(s:BreakpointSigns, nr)
    exe "sign define debugBreakpoint" . nr . " text=" . substitute(nr, '\..*', '', '') . " texthl=debugBreakpoint"
  endif
endfunc

func! s:SplitMsg(s)
  return split(a:s, '{.\{-}}\zs')
endfunction

" Handle setting a breakpoint
" Will update the sign that shows the breakpoint
func s:HandleNewBreakpoint(msg)
  if a:msg !~ 'fullname='
    " a watch does not have a file name
    return
  endif
  for msg in s:SplitMsg(a:msg)
    let fname = s:GetFullname(msg)
    if empty(fname)
      continue
    endif
    let nr = substitute(msg, '.*number="\([0-9.]*\)\".*', '\1', '')
    if empty(nr)
      return
    endif

    " If "nr" is 123 it becomes "123.0" and subid is "0".
    " If "nr" is 123.4 it becomes "123.4.0" and subid is "4"; "0" is discarded.
    let [id, subid; _] = map(split(nr . '.0', '\.'), 'v:val + 0')
    call s:CreateBreakpoint(id, subid)

    if has_key(s:breakpoints, id)
      let entries = s:breakpoints[id]
    else
      let entries = {}
      let s:breakpoints[id] = entries
    endif
    if has_key(entries, subid)
      let entry = entries[subid]
    else
      let entry = {}
      let entries[subid] = entry
    endif

    let lnum = substitute(msg, '.*line="\([^"]*\)".*', '\1', '')
    let entry['fname'] = fname
    let entry['lnum'] = lnum

    let bploc = printf('%s:%d', fname, lnum)
    if !has_key(s:breakpoint_locations, bploc)
      let s:breakpoint_locations[bploc] = []
    endif
    let s:breakpoint_locations[bploc] += [id]

    if bufloaded(fname)
      call s:PlaceSign(id, subid, entry)
    endif
  endfor
endfunc

func s:PlaceSign(id, subid, entry)
  let nr = printf('%d.%d', a:id, a:subid)
  exe 'sign place ' . s:Breakpoint2SignNumber(a:id, a:subid) . ' line=' . a:entry['lnum'] . ' name=debugBreakpoint' . nr . ' file=' . a:entry['fname']
  let a:entry['placed'] = 1
endfunc

" Handle deleting a breakpoint
" Will remove the sign that shows the breakpoint
func s:HandleBreakpointDelete(msg)
  let id = substitute(a:msg, '.*id="\([0-9]*\)\".*', '\1', '') + 0
  if empty(id)
    return
  endif
  if has_key(s:breakpoints, id)
    for [subid, entry] in items(s:breakpoints[id])
      if has_key(entry, 'placed')
	exe 'sign unplace ' . s:Breakpoint2SignNumber(id, subid)
	unlet entry['placed']
      endif
    endfor
    unlet s:breakpoints[id]
  endif
endfunc

" Handle the debugged program starting to run.
" Will store the process ID in s:pid
func s:HandleProgramRun(msg)
  let nr = substitute(a:msg, '.*pid="\([0-9]*\)\".*', '\1', '') + 0
  if nr == 0
    return
  endif
  let s:pid = nr
  call ch_log('Detected process ID: ' . s:pid)
endfunc

" Handle a BufRead autocommand event: place any signs.
func s:BufRead()
  let fname = expand('<afile>:p')
  for [id, entries] in items(s:breakpoints)
    for [subid, entry] in items(entries)
      if entry['fname'] == fname
	call s:PlaceSign(id, subid, entry)
      endif
    endfor
  endfor
endfunc

" Handle a BufUnloaded autocommand event: unplace any signs.
func s:BufUnloaded()
  let fname = expand('<afile>:p')
  for [id, entries] in items(s:breakpoints)
    for [subid, entry] in items(entries)
      if entry['fname'] == fname
	let entry['placed'] = 0
      endif
    endfor
  endfor
endfunc

let &cpo = s:keepcpo
unlet s:keepcpo
+++++++++++++++++++++ /home/PK65278/vimfiles/pack/mypackage/start/ +++++++++++++++++++++
BlockDiff-master
CamelCaseMotion-master
clever-f.vim-master
comfortable-motion.vim-master
current-func-info.vim-master
mru.vim-master
rainbow_parentheses.vim-master
tags
tags-ja
tmp
vim-anzu-master
vim-easy-align
vim-fugitive-master
vim-prettyprint
vim-textobj-user-master
vim-textobj-variable-segment-master
+++++++++++++++++++++ /home/PK65278/vimfiles/pack/mypackage/opt/ +++++++++++++++++++++
Alduin-master
ctrlp.vim-master
nerdtree
tagbar-master
taglist
vim-commentary
vim-dirvish-master
vim-easymotion-master
vim-gitgutter-master
vim-minimap-master
vim-nefertiti-master
vim-submode
vim-trip-master
