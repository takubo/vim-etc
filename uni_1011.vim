"+++++ .vimrc ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:
" (この行に関しては:help modelineを参照)


"let mapleader = "'"


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
set tagcase=match
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

set display+=lastline

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
ru macros/EscEsc.vim
packadd vim-submode-master



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

" 検索時に/, ?を楽に入力する
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

cnoremap (( \(
cnoremap )) \)
cnoremap << \<
cnoremap >> \>
cnoremap <Bar><Bar> \<Bar>

" コメント行の後の新規行の自動コメント化のON/OFF
nnoremap <expr> <Leader># &formatoptions =~# 'o' ? ':<C-u>set formatoptions-=o<CR>:set formatoptions-=r<CR>' : ':<C-u>set formatoptions+=o<CR>:set formatoptions+=r<CR>'
nmap <Leader>3 <Leader>#

nnoremap <silent> <Leader>@ :<C-u>call <SID>ToggleLineNumber()<CR>
nmap <Leader>2 <Leader>@

function! s:ToggleLineNumber()
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

"set noshowcmd

nnoremap j  gj
nnoremap k  gk

vnoremap j  gj
vnoremap k  gk


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
 "call submode#map(       'HorizScroll', 'n', '', 'l' , ':set virtualedit=all<CR>zl:set virtualedit=block<CR>')
 "call submode#map(       'HorizScroll', 'n', '', 'l' , ':set sidescrolloff=0<CR>zl:set sidescrolloff=5<CR>')
 "call submode#map(       'HorizScroll', 'n', '', 'h' , 'zh')
endif
set sidescrolloff=0

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



" EscEsc {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

nmap <Esc><Esc> <Plug>(EscEsc)

if !exists('s:EscEsc_Add_Done')
  " おかしくなったときにEscEscで復帰できるように、念のためforceをTrueにして呼び出す。
  call EscEsc_Add('call RestoreDefaultStatusline(v:true)')
  call EscEsc_Add('call clever_f#reset()')
endif
let s:EscEsc_Add_Done = v:true

" EscEsc }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Search {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


"----------------------------------------------------------------------------------------
" General Mapping

cmap <expr> <CR> ( getcmdtype() == '/' ) ?
               \ ( '<Plug>(Search-SlashCR)' ) :
               \ ( '<CR>' )

nmap n  <Plug>(Search-n)
nmap N  <Plug>(Search-N)

"nnoremap ? /<C-p>\<Bar>
" 末尾が\|でないときだけ、\|を追加しないと、\|の後でEscでキャンセルすると、\|が溜まっていってしまう。
"nnoremap ? /<C-p><C-\>e getcmdline() . ( match(getcmdline(), '\|$') == -1 ? '\\|' : '') <CR>
nnoremap ? /<C-p><C-r>=match(getcmdline(), '\|$') == -1 ? '\\|' : ''<CR>


"----------------------------------------------------------------------------------------
" CWord

nmap *  <Plug>(Search-CWord-New-Word-Keep-Strict)
nmap &  <Plug>(Search-CWord-Add-Word-Keep)
nmap #  <Plug>(Search-CWord-New-Part-Keep)
"nmap @  <Plug>(Search-CWord-Add-Part-Keep)

"nmap g* <Plug>(Search-CWord-New-Word-Move)
"nmap g& <Plug>(Search-CWord-Add-Word-Move)
"nmap g# <Plug>(Search-CWord-New-Part-Move)
"nmap g@ <Plug>(Search-CWord-Add-Part-Move)

nmap g8 g*
nmap g7 g&
nmap g3 g#
"nmap g2 g@

"nnoremap <Leader>& <Plug>(Search-TopUnderScore)
"nnoremap <Leader>@ <Plug>(MySearchT-ToggleMultiHighLight)

" clear status
"nmap <Esc><Esc> <Plug>(anzu-clear-search-status)

nmap g3 yiv/<C-r>"<CR>
nmap g# g3


"----------------------------------------------------------------------------------------
" 検討

"nmap g8 :<C-u>setl isk-=_<CR>#:setl isk+=_<CR>
"nnoremap g8 :<C-u>setl isk-=_<CR>:setl isk+=_<CR>
"nnoremap g8 :<C-u>setl isk-=_<CR>:let @/=expand("<cword>")<CR>:set hlsearch<CR>:setl isk+=_<CR>
"nnoremap g8 :<C-u>setl isk-=_<CR>/<C-r><C-w><CR>:setl isk+=_<CR>
nnoremap g8 :<C-u>setl isk-=_ <Bar> let @/=expand("<cword>") <Bar> set hlsearch <Bar> setl isk+=_<CR>

nmap g&  <Plug>(Search-CWord-Add-Part-Keep)

nmap z* <Plug>(Search-CWord-New-Word-Keep)
nmap z8 z*

"----------------------------------------------------------------------------------------
" 補償

nnoremap g9 g8


"----------------------------------------------------------------------------------------
" 行検索

nnoremap <Leader>* ^y$:let lstmp = @"<CR>/\C\V<C-r>=escape(lstmp, '/\|\\')<CR><CR>
"nmap            z* <Leader>*
"nmap            z8 <Leader>*
nmap            z# <Leader>*
nmap            z3 <Leader>*
"vnoremap <Leader>*   y:let lstmp = @"<CR>/\C\V<C-r>=escape(lstmp, '/\|\\')<CR><CR>
"vnoremap         *   y:let lstmp = @"<CR>/\C\V<C-r>=escape(lstmp, '/\|\\')<CR><CR>
vnoremap <Leader>#   y:let lstmp = @"<CR>/\C\V<C-r>=escape(lstmp, '/\|\\')<CR><CR>
vnoremap         #   y:let lstmp = @"<CR>/\C\V<C-r>=escape(lstmp, '/\|\\')<CR><CR>


" Search }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Substitute {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

nnoremap <C-s>           :<C-u>g$.$s    %%<Left>
nnoremap S               :<C-u>g$.$s    %<C-R>/%%g<Left><Left>
nnoremap gs              :<C-u>g$.$s    %<C-R><C-W>%%g<Left><Left>
nnoremap gS              :<C-u>g$.$s    %<C-R><C-W>%<C-R><C-W>%g<Left><Left>
nnoremap <Leader>s           :<C-u>s    %%%g<Left><Left><Left>

vnoremap <C-s>                    :s    %%<Left>
vnoremap S                        :s    %<C-R>/%%g<Left><Left>
vnoremap gs                       :s    %<C-R>/%<C-R><C-W>%g

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
nnoremap <silent> <C-g> :<C-u>grep '\<<C-R><C-W>\>'<CR>
nnoremap <silent> <C-g> :<C-u>grep '\<<C-R><C-W>\>' -- ':!.svn/' ':!tags' ':!report_flgRH850E1L-BIOS-01'<CR>

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
if 1
 "nmap <silent> <BS>H     <BS><BS><C-w>p<Plug>(BrowserJump-Back)
 "nmap <silent> <BS>L     <BS><BS><C-w>p<Plug>(BrowserJump-Foward)
 "nmap <silent> <BS>H     <Plug>(MyVimrc-WindowSplitAuto)<C-w>p<Plug>(BrowserJump-Back)
 "nmap <silent> <BS>L     <Plug>(MyVimrc-WindowSplitAuto)<C-w>p<Plug>(BrowserJump-Foward)
  nnoremap <Plug>(MyVimrc-WinCmd-p) <C-w>p
  nmap <silent> <BS>H     <Plug>(MyVimrc-WindowSplitAuto)<Plug>(MyVimrc-WinCmd-p)<Plug>(BrowserJump-Back)
  nmap <silent> <BS>L     <Plug>(MyVimrc-WindowSplitAuto)<Plug>(MyVimrc-WinCmd-p)<Plug>(BrowserJump-Foward)
else
  nmap <silent> <BS>H     <Plug>(MyVimrc-WindowSplitAuto):wincmd p<CR><Plug>(BrowserJump-Back)
  nmap <silent> <BS>L     <Plug>(MyVimrc-WindowSplitAuto):wincmd p<CR><Plug>(BrowserJump-Foward)
endif


" 補償
"noremap zh H
"noremap zl L
"nnoremap zm M
"nnoremap <expr> zh &wrap ? 'H' : 'zh'
"nnoremap <expr> zl &wrap ? 'L' : 'zl'
" HorizScroll  noremap zk H
" HorizScroll  noremap zj L

" 補償の補償
"noremap <C-@> zh
"noremap <C-^> zl

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
    " jumplistに残すために、Gを使用。
    exe 'normal! ' . v:prevcount . 'G'
    return
  elseif &ft == 'qf'
    call feedkeys("\<CR>:FF2\<CR>", 'nt')
    return
  elseif &ft == 'help'
    call feedkeys("\<C-]>", 'nt')
    return
  else
    let ret = JumpToDefine(a:mode)
    if ret > 0
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

	catch
	  "keeppatterns normal! gd
	  return
	endtry
      endif
      keeppatterns normal! gd
    endif
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

nmap     <silent> <BS><CR>     <BS><BS><CR>
nmap     <silent> <Leader><CR> <BS><BS><CR>

" Tag, Jump, and Unified CR }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Diff {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

"set diffopt+=iwhite
set diffopt=filler,iwhite

" diff Close
nnoremap dc    :<C-u>diffoff<CR>
nnoremap d<BS> :<C-u>diffoff<CR>

" diff (all window) Quit
nnoremap <silent> dq :<C-u>call PushPos_All() <Bar> exe 'windo diffoff' <Bar> call PopPos_All() <Bar> echo 'windo diffoff'<CR>

" diff (all window and buffer) Quit
nnoremap <silent> dQ :<C-u>call PushPos_All() <Bar> exe 'bufdo diffoff' <Bar> exe 'windo diffoff' <Bar> call PopPos_All()<CR>:echo 'bufdo diffoff <Bar> windo diffoff'<CR>

" Toggle Scrollbind
nnoremap dx :<C-u>setl scrollbind!<CR>

" diff update
nmap du d<Space>

" diff toggle ignorecase
nnoremap <expr> dl match(&diffopt, 'icase' ) < 0 ? ':<C-u>set diffopt+=icase<CR>'  : ':<C-u>set diffopt-=icase<CR>'

" diff Y(whi)tespace
nnoremap <expr> dy match(&diffopt, 'iwhite') < 0 ? ':<C-u>set diffopt+=iwhite<CR>' : ':<C-u>set diffopt-=iwhite<CR>'

" diff off
nnoremap d<S-Space> :<C-u>diffoff<CR>

" diff accept (obtain and next, obtain and previouse) (dotは、repeat'.')
nnoremap d. do1gs]c^
nnoremap d, do1gs[c^
nnoremap dO do1gs]c^
nnoremap dP do1gs[c^

" Next Hunk
"nnoremap <silent> t ]c^zz:FuncNameStl<CR>
nnoremap <silent> t ]c^:FuncNameStl<CR>

" Previouse Hunk
"nnoremap <silent> T [c^zz:FuncNameStl<CR>
nnoremap <silent> T [c^:FuncNameStl<CR>

" 最初に gg , G , [c , ]c すると、FuncNameStlが実行されない不具合あり。対策として、t,Tをnmap。

" Top Hunk
"nmap      <silent> <Leader>t ggtT
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

nnoremap d<CR> :<C-u>tab split<CR>:Gdiffsplit<CR>
" 最後は<C-w>pだと、なぜかフォーカスがfugitive側に残ったままとなる。
" Gdiffsplit後にはタブ内にウィンドウは2つしかないはずなので、<C-w>wでも一応は意図通りとなる。
nnoremap <expr> d<CR> ':<C-u>' . ( winnr('$') > 1 ? 'tab split<CR>:' : '' ) . 'Gdiffsplit<CR>' . ':wincmd w'
nnoremap d<CR> :<C-u>exe ( winnr('$') > 1 ? 'tab split' : '' ) <Bar> Gdiffsplit <Bar> call feedkeys('<C-w>w', 'nt')
nnoremap d<CR> :<C-u>exe ( winnr('$') > 1 ? 'tab split' : '' ) <Bar> Gdiffsplit <Bar> call feedkeys(":wincmd w\<CR>", 'nt') <Bar> call feedkeys(":wincmd w\<CR>", 'nt')<CR>
nnoremap d<CR> :<C-u>exe ( winnr('$') > 1 ? 'tab split' : '' ) <Bar> Gdiffsplit<CR>:wincmd p<CR>
nnoremap d<CR> :<C-u>exe ( winnr('$') > 1 ? 'tab split' : '' ) <Bar> Gdiffsplit<CR>:wincmd w<CR>

nnoremap <expr> d<CR> ':<C-u>' . ( winnr('$') > 1 ? 'tab split<CR>:' : '' ) . 'Gdiffsplit<CR>'
nnoremap d<CR> :<C-u>exe ( winnr('$') > 1 ? 'tab split' : '' ) <Bar> Gdiffsplit <Bar> call feedkeys('<C-v><C-w>w', 'nt')<CR>

" なぜかfeedkeysにしないと、ウィンドウ移動できない。マップ中にウィンドウを作成すると、それを認識できないようだ。
nnoremap d<CR> :<C-u>exe ( winnr('$') > 1 ? 'tab split' : '' ) <Bar> Gdiffsplit <Bar> call feedkeys('<C-v><C-w>p', 'nt')<CR>
" Gdiffsplit実行中は、コマンドラインにGdiffsplitが見えるようにする。
nnoremap d<CR> :<C-u>exe ( winnr('$') > 1 ? 'tab split' : '' )<CR>:Gdiffsplit<CR>:call feedkeys('<C-v><C-w>p', 'nt')<CR>

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

nmap <BS> <C-w>

"----------------------------------------------------------------------------------------
" Split

" Auto
nnoremap <silent> <expr> <Leader><Leader> ( <SID>WindowRatio() <  0 ? "\<C-w>v" : "\<C-w>s" ) . ':diffoff<CR>'
"nnoremap <silent> <expr> <BS><BS>         ( <SID>WindowRatio() >= 0 ? "\<C-w>v" : "\<C-w>s" ) . ':diffoff<CR>'
nnoremap <silent> <expr> <Plug>(MyVimrc-WindowSplitAuto)         ( <SID>WindowRatio() >= 0 ? "\<C-w>v" : "\<C-w>s" ) . ':diffoff<CR>'
nmap <BS><BS> <Plug>(MyVimrc-WindowSplitAuto)
" Tag, Jump, and Unified CR を参照。

" Manual
nnoremap <silent> _                <C-w>s:setl noscrollbind<CR>
nnoremap <silent> g_               <C-w>n
nnoremap <silent> U                :<C-u>new<CR>
nnoremap <silent> <Bar>            <C-w>v:setl noscrollbind<CR>
nnoremap <silent> g<Bar>           :<C-u>vnew<CR>

" Auto New
nnoremap <silent> <expr> <Plug>(MyVimrc-Window-AutoNew) ( winwidth(0) > (&columns * 7 / 10) && <SID>WindowRatio() >=  0 ) ? ':<C-u>vnew<CR>' : '<C-w>n'
"nmap M <Plug>(MyVimrc-Window-AutoNew)

"----------------------------------------------------------------------------------------
" Close

nnoremap <silent> q         <C-w><C-c>
nnoremap <silent> <Leader>q :<C-u>q<CR>

" 補償
nnoremap <silent> <C-q>; q:
nnoremap <silent> <C-q>/ q/
nnoremap <silent> <C-q>? q?

" ウィンドウレイアウトを崩さないでバッファを閉じる   (http://nanasi.jp/articles/vim/kwbd_vim.html)
com! CloseWindow let s:kwbd_bn = bufnr('%') | enew | exe 'bdel '. s:kwbd_bn | unlet s:kwbd_bn
nnoremap <silent> <C-q><C-q> :<C-u>CloseWindow<CR>

"----------------------------------------------------------------------------------------
" Focus

" Basic
nnoremap <silent> <Plug>(MyVimrc-SkipTerm-Inc) <Esc>:exe <SID>SkipTerm(+1) . ' wincmd w'<CR>
nnoremap <silent> <Plug>(MyVimrc-SkipTerm-Dec) <Esc>:exe <SID>SkipTerm(-1) . ' wincmd w'<CR>
" Unified_Spaceを参照。

" Move
nnoremap <silent> <Left>  <C-w>h
nnoremap <silent> <Down>  <C-w>j
nnoremap <silent> <Up>    <C-w>k
nnoremap <silent> <Right> <C-w>l

" Terminal Windowから抜ける。 (Windowが１つしかないなら、Tabを抜ける。)
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
" Window Move

nnoremap <silent> <A-h> <C-w>H:<C-u>call		<SID>best_scrolloff()<CR>
nnoremap <silent> <A-j> <C-w>J:<C-u>call		<SID>best_scrolloff()<CR>
nnoremap <silent> <A-k> <C-w>K:<C-u>call		<SID>best_scrolloff()<CR>
nnoremap <silent> <A-l> <C-w>L:<C-u>call		<SID>best_scrolloff()<CR>

tnoremap <silent> <A-left>  <C-w>H:<C-u>call		<SID>best_scrolloff()<CR>
tnoremap <silent> <A-down>  <C-w>J:<C-u>call		<SID>best_scrolloff()<CR>
tnoremap <silent> <A-up>    <C-w>K:<C-u>call		<SID>best_scrolloff()<CR>
tnoremap <silent> <A-right> <C-w>L:<C-u>call		<SID>best_scrolloff()<CR>

"----------------------------------------------------------------------------------------
" Reopen as Tab
" TODO diffのバッファも再現する。

nnoremap <C-o>      :<C-u>tab split<CR>
nnoremap <C-w><C-w> <C-w>T
nnoremap <C-w><C-w> :<C-u>tab split<CR>
nnoremap <C-w><C-t> <C-w>T

tnoremap <C-w><C-t> <C-w>T

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
    exe "normal! \<C-w>p"
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

nnoremap <silent> <C-t>  :<C-u>tabnew<CR>
nnoremap <silent> g<C-t> :<C-u>tabnew<Space>

nnoremap <silent> <C-f> gt
nnoremap <silent> <C-b> gT

nnoremap <silent> <A-f> :exe tabpagenr() == tabpagenr('$') ? 'tabmove 0' : 'tabmove +1'<CR>
nnoremap <silent> <A-b> :exe tabpagenr() == 1              ? 'tabmove $' : 'tabmove -1'<CR>

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
    let left .= '%#TabLineDate#  ' . strftime('%X') . ' '
  endif
  let left .= '%#SLFileName#  ' . g:BatteryInfo . '  '
  let left .= '%#TabLineDate#    '

  " Right
  let right = ''
  let right .= "%#TabLineDate#  "
 "let right .= "%#SLFileName# %{'[ '. substitute(&diffopt, ',', ', ', 'g') . ' ]'} "
  let right .= '%#TabLineDate#  ' . s:TablineStatus . '/' . (s:TablineStatusNum - 1)
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
  let hi = a:n is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'

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
com! -nargs=1 Tabline call <SID>ToggleTabline(<args>)


"----------------------------------------------------------------------------------------
" TabLine Timer

function! UpdateTabline(dummy)
  set tabline=%!TabLineStr()
endfunction

" 旧タイマの削除  vimrcを再読み込みする際、古いタイマを削除しないと、どんどん貯まっていってしまう。
if exists('TimerTabline') | call timer_stop(TimerTabline) | endif

let s:UpdateTablineInterval = 1000
let TimerTabline = timer_start(s:UpdateTablineInterval, 'UpdateTabline', {'repeat': -1})


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
silent call <SID>ToggleTabline(3)


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

  let s:stl = "  "

 "let s:stl .= "%#SLFileName#[ %{winnr()} ]%## ( %n ) "
 "let s:stl .= "%##%m%r%{(!&autoread&&!&l:autoread)?'[AR]':''}%h%w "

 "let s:stl .= "%#SLFileName#[ %{winnr()} ] %#VertSplit# ( %n ) "
 "let s:stl .= "%##%m%r%{(!&autoread&&!&l:autoread)?'[AR]':''}%h%w"

  let s:stl .= "%#SLFileName# [ %{winnr()} ] %#VertSplit# ( %n ) "
  let s:stl .= "%#VertSplit#%m%r%{(!&l:autoread\\\<Bar>\\\<Bar>(&l:autoread==-1&&!&autoread))?'':'[AR]'}%h%w"

  let g:MyStlFugitive = a:statusline_contents['Branch'] ? ' [fugitive]' : ' fugitive'
  let s:stl .= "%#hl_func_name_stl#%{bufname('') =~ '^fugitive' ? g:MyStlFugitive : ''}"
  let s:stl .= "%#hl_func_name_stl#%{&filetype == 'fugitive' ? g:MyStlFugitive : ''}"

  if a:statusline_contents['Branch']
   "let s:stl .= "%#hl_func_name_stl# %{FugitiveHead(7)}"
   "let s:stl .= "%#hl_func_name_stl# [%{FugitiveHead(7)}]"
   "let s:stl .= "%#hl_func_name_stl#%{bufname('')!='' ? (' ['.FugitiveHead(7).']') : ''}"
   "let s:stl .= "%#hl_func_name_stl#%{(bufname('')!='' && bufname('')!~'^NERD_tree') ? (' ['.FugitiveHead(7).']') : ''}"
    let s:stl .= "%#hl_func_name_stl#%{(FugitiveHead(7)!=''&& bufname('')!~'^NERD_tree') ? (' ['.FugitiveHead(7).']') : ''}"
  endif

  if a:statusline_contents['Path']
    let s:stl .= "%<"
    let s:stl .= "%##%#SLFileName# %F "
  else
    let s:stl .= "%##%#SLFileName# %t "
    let s:stl .= "%<"
  endif
 "let s:stl .= "%#hl_func_name_stl#%{ bufname('') == '' ? getcwd(winnr()) : '' }"
 "let s:stl .= "%#SLFileName#%{ bufname('') == '' ? getcwd(winnr()) : '' }"
 if a:statusline_contents['ShadowPath'] && !a:statusline_contents['Path']
   if 0
    "let s:stl .= " %#SLNoNameDir#%{ getcwd(winnr()) }    "
     let s:stl .= " %#SLNoNameDir#%F    "
   else
     let s:stl .= " %#SLNoNameDir#%F"
     let s:stl .= "%{bufname('')=='' ? ' '.getcwd(winnr()) : ''}"
     let s:stl .= "    "
   endif
 else
   " 無名レジスタなら、常にcwdを表示。
   let s:stl .= "%#SLNoNameDir#%{ bufname('') == '' ? getcwd(winnr()) : '' }"
 endif
 "let s:stl .= "%#SLNoNameDir#%{  getcwd(winnr())  }"

  if a:statusline_contents['FuncName']
    let s:stl .= "%#hl_func_name_stl# %{cfi#format('%s()', '')}"
  endif


  " ===== Separate Left Right =====
  let s:stl .= "%#SLFileName#%="
  " ===== Separate Left Right =====

  if a:statusline_contents['Keywords']
   "let s:stl .= " %1{stridx(&isk,'.')<0?' ':'.'} %1{stridx(&isk,'_')<0?' ':'_'} "
   "let s:stl .= " %{&isk} "
   "let s:stl .= " %{substitute(substitute(&isk, '\\\\d\\\\+-\\\\d\\\\+', '', 'g'), ',,\\\\+', ',', 'g')} "
    let s:stl .= " %{substitute(substitute(&isk, '\\\\d\\\\+-\\\\d\\\\+', '', 'g'), ',\\\\+', ' ', 'g')} "
  endif

  if 1
   "let s:stl .= "%## %-3{ &ft == '' ? '    ' : &ft }  %-5{ &fenc == '' ? '     ' : &fenc }  %4{ &ff } "
   "let s:stl .= "%## %-3{ &ft == '' ? '    ' : &ft }  %-5{ &fenc == '' ? 'ascii' : &fenc }  %4{ &ff } "
    let s:stl .= "%## %-3{ &ft == '' ? '?  ' : TitleCase(&ft) }  %-5{ &fenc == '' ?  &enc   : TitleCase(&fenc) }  %4{ TitleCase(&ff) } "
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
    let s:stl .= " %3c,%3v "
  endif

  if a:statusline_contents['TabStop']
    let s:stl .= " %{&l:tabstop} "
  endif

  call RestoreDefaultStatusline(v:true)
endfunction


"----------------------------------------------------------------------------------------
" Switch Statusline Contents

let g:StatuslineContents = {}

let g:StatuslineContents['Column'] = v:true
let g:StatuslineContents['Branch'] = v:false
let g:StatuslineContents['FuncName'] = v:false
let g:StatuslineContents['Keywords'] = v:false
let g:StatuslineContents['Line'] = v:false
let g:StatuslineContents['LineColumn'] = v:false
let g:StatuslineContents['Path'] = v:false
let g:StatuslineContents['ShadowPath'] = v:true
let g:StatuslineContents['TabStop'] = v:false

function! CompletionStlContents(ArgLead, CmdLine, CusorPos)
  return join(keys(g:StatuslineContents),"\n")
endfunction
com! -nargs=1 -complete=custom,CompletionStlContents Stl let g:StatuslineContents['<args>'] = !g:StatuslineContents['<args>'] | call <SID>SetDefaultStatusline(g:StatuslineContents)

nnoremap <silent> <Leader>_ :<C-u>Stl Column<CR>
nnoremap <silent> <Leader>. :<C-u>Stl Branch<CR>
nnoremap <silent> <Leader>, :<C-u>Stl FuncName<CR>
nnoremap <silent> <Leader>+ :<C-u>Stl Line<CR>
nnoremap <silent> <Leader>- :<C-u>Stl Path<CR>


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


"----------------------------------------------------------------------------------------
" Alt Statusline Enter Visual Mode (TODO)
nnoremap <silent> v     :<C-u>call RestoreDefaultStatusline(v:false)<CR><C-v>
nnoremap <silent> V     :<C-u>call RestoreDefaultStatusline(v:false)<CR>V
nnoremap <silent> <C-v> :<C-u>call RestoreDefaultStatusline(v:false)<CR>v


" Statusline }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Unified_Space {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
"
nmap <expr> <Space>   winnr('$') == 1 ? '<Plug>(ComfortableMotion-Flick-Down)' : '<Plug>(MyVimrc-SkipTerm-Inc)'
nmap <expr> <S-Space> winnr('$') == 1 ? '<Plug>(ComfortableMotion-Flick-Up)'   : '<Plug>(MyVimrc-SkipTerm-Dec)'

" Unified_Space }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Mru {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

augroup MyVimrc_MRU
  au!
  au VimEnter,VimResized * let MRU_Window_Height = max([8, &lines / 3 ])
augroup end

nnoremap <Leader>o :<C-u>MRU<Space>
nnoremap go :<C-u>MRU<Space>
nnoremap gO :<C-u>MRU<CR>

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
  au CompleteDone * inoremap <silent> <expr> jj pumvisible() ? '<C-N><C-N>' : InsertLast() . s:esc_and_write

  au InsertCharPre * try | iunmap gg | catch | finally

  au TextChangedI * exe pumvisible() ? "" : "inoremap <silent> <expr> jj pumvisible() ? '<C-N><C-N>' : " . s:esc_and_write_quoted
  au TextChangedI * exe pumvisible() ? "" : "try | iunmap gg | catch | finally"

  au InsertLeave * try | iunmap gg | catch | finally
  au InsertLeave * inoremap <silent> <expr> jj pumvisible() ? '<C-N><C-N>' : InsertLast() . s:esc_and_write

  au InsertCharPre * exe ( pumvisible() || v:char != "j" ) ? ( "" ) : ( "inoremap <silent> <expr> jj pumvisible() ? '<C-N><C-N>' : " . s:esc_and_write_quoted )
  au InsertCharPre * exe pumvisible() ? "" : "try | iunmap gg | catch | finally"

augroup end

" 補完を開始する
function! TrigCompl(key)
  try
    iunmap jj
  catch
    inoremap <expr> gg pumvisible() ? '<C-Y>' . Semicolon_plus() . '<Esc>:<C-u>w<CR>' : 'gg'
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
  inoremap <expr> gg pumvisible() ? '<C-Y>' . Semicolon_plus() . '<Esc>:<C-u>w<CR>' : 'gg'
  endtry
  call feedkeys(a:key, 'n')
  return ''
endfunction

"inoremap <silent> <expr> jj pumvisible() ? '<C-N><C-N>' : InsertLast() . s:esc_and_write
inoremap          <expr> jj pumvisible() ? '<C-N><C-N>' : InsertLast() . s:esc_and_write

inoremap <expr> j pumvisible() ? Cmpl_jk("\<C-n>") : TrigCompl('j')
inoremap <expr> k pumvisible() ? Cmpl_jk("\<C-p>") : TrigCompl('k')

inoremap <expr> <C-j> pumvisible() ? 'j' : '<C-n>'
inoremap <expr> <C-k> pumvisible() ? 'k' : '<Esc>'

inoremap <expr> <CR>  pumvisible() ? '<C-y>' : '<C-]><C-G>u<CR>'
inoremap <expr> <Esc> pumvisible() ? '<C-e>' : '<Esc>'

inoremap <expr> gg ( pumvisible() ? '<C-y>' : '' ) . InsertLast() . s:esc_and_write

let s:esc_and_write =  '<Esc>:w<CR>'
let s:esc_and_write_quoted = "InsertLast() . '" . s:esc_and_write . "'"

function! InsertLast()
  if &ft == 'c' || &ft == 'cpp'
    return Semicolon_plus()
  else
    return ''
  endif
endfunction
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
com! VIMRC   :exe IsEmptyBuf() ? ':EVIMRC' : <SID>WindowRatio() >= 0 ? 'VVIMRC' : 'SVIMRC'
com! Vimrc   :VIMRC

com! EGVIMRC :exe 'e      ' . g:gvimrc_path
com! SGVIMRC :exe 'sp     ' . g:gvimrc_path
com! TGVIMRC :exe 'tabnew ' . g:gvimrc_path
com! VGVIMRC :exe 'vs     ' . g:gvimrc_path
com! GVIMRC  :exe IsEmptyBuf() ? ':EGVIMRC' : <SID>WindowRatio() >= 0 ? 'VGVIMRC' : 'SGVIMRC'
com! Gvimrc  :Gvimrc

com! EEditColor :exe 'e      ' . g:colors_dir . g:colors_name . '.vim'
com! SEditColor :exe 'sp     ' . g:colors_dir . g:colors_name . '.vim'
com! TEditColor :exe 'tabnew ' . g:colors_dir . g:colors_name . '.vim'
com! VEditColor :exe 'vs     ' . g:colors_dir . g:colors_name . '.vim'
com! EditColor  :exe IsEmptyBuf() ? ':EEditColor' : <SID>WindowRatio() >= 0 ? 'VEditColor' : 'SEditColor'


let g:vimrc_buf_name  = '^' . g:vimrc_path
let g:gvimrc_buf_name = '^' . g:gvimrc_path

nnoremap <expr> <silent> <Leader>v
	\ ( len(win_findbuf(bufnr(g:vimrc_buf_name))) > 0 ) && ( win_id2win(reverse(win_findbuf(bufnr(g:vimrc_buf_name)))[0]) > 0 ) ?
	\  ( win_id2win(reverse(win_findbuf(bufnr(g:vimrc_buf_name)))[0]) . '<C-w><C-w>' ) : ':VIMRC<CR>'

nnoremap <expr> <silent> <Leader><C-v>
	\  ( len(win_findbuf(bufnr(g:gvimrc_buf_name))) > 0 ) && ( win_id2win(reverse(win_findbuf(bufnr(g:gvimrc_buf_name)))[0]) > 0 ) ?
	\  ( win_id2win(reverse(win_findbuf(bufnr(g:gvimrc_buf_name)))[0]) . '<C-w><C-w>' ) : ':GVIMRC<CR>'

nnoremap <expr> <silent> <Leader>V
	\ ( len(win_findbuf(bufnr(g:colors_dir . g:colors_name . '.vim$'))) > 0 ) && ( win_id2win(reverse(win_findbuf(bufnr(g:colors_dir . g:colors_name . '.vim$')))[0]) > 0 ) ?
	\  ( win_id2win(win_findbuf(bufnr(g:colors_dir . g:colors_name . '.vim$'))[0]) . '<C-w><C-w>' ) : ':EditColor<CR>'


" Configuration }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Swap Exists {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

let s:swap_select = v:false

augroup MyVimrc_SwapExists
  au!
  au SwapExists * if s:swap_select | let v:swapchoice = '' | else | let v:swapchoice = 'o' | endif
augroup END

function! s:swap_select()
  let s:swap_select = v:true
  edit %
  let s:swap_select = v:false
endfunction

com! SwapSelect call s:swap_select()

" Swap Exists }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Other Key-Maps {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

nnoremap <leader>w :<C-u>w<CR>
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

" Other Key-Maps }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Clever-f {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

let g:clever_f_smart_case = 1

let g:clever_f_use_migemo = 1
com! CleverfUseMigemoToggle let g:clever_f_use_migemo = !g:clever_f_use_migemo | echo g:clever_f_use_migemo ? 'clever-f Use Migemo' : 'clever-f No Migemo'

" fは必ず右方向に移動，Fは必ず左方向に移動する
"let g:clever_f_fix_key_direction = 1

" 任意の記号にマッチする文字を設定する
let g:clever_f_chars_match_any_signs = '\\'

" 過去の入力の再利用
"let g:clever_f_repeat_last_char_inputs = ["\<CR>"]	" ["\<CR>", "\<Tab>"]

" タイムアウト
let g:clever_f_timeout_ms = 3000

if 1
  hi My_cleverf_Cursor guifg=yellow guibg=black
  hi My_cleverf_Char   guifg=#ff4123 guibg=black
 "hi My_cleverf_Cursor guifg=cyan guibg=black
 "hi My_cleverf_Char   guifg=yellow guibg=black
  augroup My_cleverf
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
endif

"function! s:clever_f_use_migemo_toggle()
"  let g:clever_f_use_migemo = !g:clever_f_use_migemo
"  echo g:clever_f_use_migemo ? 'clever_f_use_migemo' : 'No clever_f_use_migemo'
"endfunction
"nnoremap <Leader>k :<C-u>call <SID>clever_f_use_migemo_toggle()<CR>

" Clever-f }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Transparency {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

let g:my_transparency = 229
let g:my_transparency = 227
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
nnoremap <silent> <A-PageUp>   :<C-u>ScreenMode 5<CR>:Thinkpad<CR>
nnoremap <silent> <A-PageDown> :<C-u>ScreenMode 4<CR>:Thinkpad<CR>


nnoremap <silent><expr> <PageUp>   ':<C-u>se transparency=' .    ( &transparency + 1      ) . '<Bar> Transparency <CR>'
nnoremap <silent><expr> <PageDown> ':<C-u>se transparency=' . max([&transparency - 1,   1]) . '<Bar> Transparency <CR>'   | " transparencyは、0以下を設定すると255になってしまう。

nnoremap <silent>       <C-PageUp>   :exe 'se transparency=' . (&transparency == g:my_transparency ? 255 : g:my_transparency) <Bar> Transparency <CR>
nnoremap <silent>       <C-PageDown> :exe 'se transparency=' . (&transparency == g:my_transparency ?  50 : g:my_transparency) <Bar> Transparency <CR>

com! Transparency echo printf(' Transparency = %4.1f%%', &transparency * 100 / 255.0)

exe 'set transparency=' . g:my_transparency


" Transparency }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



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

function! CursorWord()
  return search('\<\%#\k', 'cnz') ? -1 : search('\%#\k', 'cnz') ? 1 : 0
endfunction

" TODO rename CursorWord() -> CursorOnWord()

" Util Funtions }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Util Commands {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


"com! AR setl autoread!
com! AR let &l:autoread = !&l:autoread


com! Tab2Space setlocal   expandtab | retab<CR>
com! Space2Tab setlocal noexpandtab | retab!<CR>
com! T2S Tab2Space
com! S2T Space2Tab


com! FL help function-list<CR>


com! -nargs=1 Unicode exe 'normal! o<C-v>u' . tolower('<args>') . '<Esc>'


com! XMLShape :%s/></>\r</g | filetype indent on | setf xml | normal gg=G


" Windowsでの設定例です。他の場合は外部コマンド部分を読み替えてください。
au FileType plantuml com! OpenUml :!/cygdrive/c/Program\ Files/Google/Chrome/Application/chrome.exe %


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



nnoremap <Leader><Space> :<C-u>let &iminsert = (&iminsert ? 0 : 2) <Bar> exe "colorscheme " . (&iminsert ? "Asche" : "Rimpa") <CR>
nnoremap <Leader>j       :<C-u>let &iminsert = (&iminsert ? 0 : 2) <Bar> exe "colorscheme " . (&iminsert ? "Asche" : "Rimpa") <CR>
"nnoremap        g<Space> :<C-u>let &iminsert = (&iminsert ? 0 : 2) <Bar> exe "colorscheme " . (&iminsert ? "Asche" : "Rimpa") <CR>

" Refactoring
"nnorema <silent> <Leader>d :<C-u>PushPos<CR>:g$.$s    /<C-r>//<C-r><C-w>/g<CR>:PopPos<CR>:let @/='<C-r><C-w>'<CR>
nnorema <silent> <Leader>D :<C-u>PushPos<CR>:g$.$s    /<C-r>//<C-r><C-w>/g<CR>:PopPos<CR>:let @/='<C-r><C-w>'<CR>

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

nnoremap <silent> <C-u> :<C-u>new<CR>
nnoremap <silent> <C-d> :<C-u>vnew<CR>

nnoremap ( zh
nnoremap ) zl
nnoremap g4 g$
nnoremap g6 g^


function! ZZ()
  let n = 25
  for i in range(n)
    execute "normal! " . g:comfortable_motion_scroll_down_key
    redraw
  endfor
endfunction

let plugin_dicwin_disable = v:true

ru! ftplugin/man.vim


nmap gt ggt
nmap gT GT

"nnoremap <C-d> :<C-u>terminal<CR><C-w>p
nnoremap <C-d> :<C-u>call OpenTerm()<CR>


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


nmap <Tab>   <Plug>(ComfortableMotion-Flick-Down)
nmap <S-Tab> <Plug>(ComfortableMotion-Flick-Up)
"nmap m <Plug>(ComfortableMotion-Flick-Down)
"nmap M <Plug>(ComfortableMotion-Flick-Up)



nnoremap <Leader>4 :<C-u>setl noscrollbind<CR>
nnoremap <Leader>4 :<C-u>setl scrollbind!<CR>



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








" Line
" 	1080
" 	90
" 
" 	768
" 	64
" 
" Col
" 	1920
" 	320
" 
" 	1024
" 	170.666667
" 
" set lines=64 columns0171
com! XGA set lines=64 columns=171


"au CursorHold * normal! 

function! LLL(d)
  normal! 
endfunction
" 旧タイマの削除  vimrcを再読み込みする際、古いタイマを削除しないと、どんどん貯まっていってしまう。
if exists('TimerLLL') | call timer_stop(TimerLLL) | endif

"let TimerLLL = timer_start(1000, 'LLL', {'repeat': -1})



" Move
nnoremap <silent> (     <C-w>h
nnoremap <silent> )     <C-w>l

nnoremap <silent> <C-i> <C-w>h
nnoremap <silent> <C-o> <C-w>l

nnoremap <silent> <C-p> <C-w>k
nnoremap <silent> <C-n> <C-w>j



"set grepprg=git\ grep\ -I\ --line-number


" TODO 
" BrowserJump  Orgへのジャンプもキーバインドを提供する


set complete=.,w,b,u,i

function! RefRef()
  let srch = @/
  let word = expand('<cword>')

  call PushPos()

  " 2jは、関数の先頭に居た時用
  " 2kは、関数定義行を含むため
  " いずれも暫定
  keepjumps normal! 2j[[2k
  let fl = line('.')
  keepjumps normal! ][
  let ll = line('.')

  let c_l = fl . ',' . ll
  "echo c_l

  let c_c = 's/' . srch . '/' . word . '/g'
  "echo c_c

  let c_u = c_l . c_c
  "echo c_u
  exe c_u

  call PopPos()
endfunction

nnoremap <silent> <Leader>d :<C-u>call RefRef()<CR>


nnoremap gw :<C-u>w<CR>


nnoremap <silent> <Leader>U :<C-u>vnew<CR>


""" SandS

"nnoremap <Tab>   <C-w>w
"nnoremap <S-Tab> <C-w>W

" nnoremap H <C-w><
" nnoremap J <C-w>+
" nnoremap K <C-w>-
" nnoremap L <C-w>>

"nmap <C-h> H
"nmap <C-j> J
"nmap <C-k> K
"nmap <C-l> L

nnoremap <C-l> <C-l>

"nnoremap <Leader>j J
"nnoremap : J
nnoremap <C-j> J
nnoremap g<C-j> gJ

nnoremap <C-k> :<C-u>ls <CR>:b<Space>


"nmap <C-a> <Plug>(trip-increment-ignore-minus)
"nmap <C-x> <Plug>(trip-decrement-ignore-minus)


"実際に文字がないところにもカーソルを置けるようにする
"set virtualedit=all







"nmap J <Plug>(MyVimrc-SkipTerm-Inc)
"nmap K <Plug>(MyVimrc-SkipTerm-Dec)

so ~/vimfiles/win.vim

" Thinkpad
com! Thinkpad set lines=75 columns=267 | winpos 150 110


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

if 1
  call submode#enter_with('WinSize', 'n', '', '<C-w>>', '<C-w>>')
  call submode#enter_with('WinSize', 'n', '', '<C-w><', '<C-w><')
  call submode#enter_with('WinSize', 'n', '', '<C-w>+', '<C-w>+')
  call submode#enter_with('WinSize', 'n', '', '<C-w>-', '<C-w>-')
  call submode#map(       'WinSize', 'n', '', '>', '<C-w>>')
  call submode#map(       'WinSize', 'n', '', '<', '<C-w><')
  call submode#map(       'WinSize', 'n', '', '+', '<C-w>+')
  call submode#map(       'WinSize', 'n', '', '=', '<C-w>+') " Typo対策
  call submode#map(       'WinSize', 'n', '', '-', '<C-w>-')
  if 0
    call submode#map(       'WinSize', 'n', '', 'h', '<C-w>h')
    call submode#map(       'WinSize', 'n', '', 'j', '<C-w>j')
    call submode#map(       'WinSize', 'n', '', 'k', '<C-w>k')
    call submode#map(       'WinSize', 'n', '', 'l', '<C-w>l')
  else
    call submode#enter_with('WinSize2', 'n', '', '<C-w>l', '<C-w>>')
    call submode#enter_with('WinSize2', 'n', '', '<C-w>h', '<C-w><')
    call submode#enter_with('WinSize2', 'n', '', '<C-w>j', '<C-w>+')
    call submode#enter_with('WinSize2', 'n', '', '<C-w>k', '<C-w>-')
    call submode#map(       'WinSize2', 'n', '', 'h', '<C-w><')
    call submode#map(       'WinSize2', 'n', '', 'j', '<C-w>+')
    call submode#map(       'WinSize2', 'n', '', 'k', '<C-w>-')
    call submode#map(       'WinSize2', 'n', '', 'l', '<C-w>>')
  endif

  let g:submode_timeoutlen = 5000
endif



"call submode#enter_with('WinFocus', 'n', '', '<Space>h', '<C-w>h')
"call submode#enter_with('WinFocus', 'n', '', '<Space>j', '<C-w>j')
"call submode#enter_with('WinFocus', 'n', '', '<Space>k', '<C-w>k')
"call submode#enter_with('WinFocus', 'n', '', '<Space>l', '<C-w>l')
"call submode#map(       'WinFocus', 'n', '', 'h', '<C-w>h')
"call submode#map(       'WinFocus', 'n', '', 'j', '<C-w>j')
"call submode#map(       'WinFocus', 'n', '', 'k', '<C-w>k')
"call submode#map(       'WinFocus', 'n', '', 'l', '<C-w>l')

"call submode#enter_with('WinFocus2', 'n', '', '<Space>h', '<Plug>(WinWrapMove-H)')
"call submode#enter_with('WinFocus2', 'n', '', '<Space>j', '<Plug>(WinWrapMove-J)')
"call submode#enter_with('WinFocus2', 'n', '', '<Space>k', '<Plug>(WinWrapMove-K)')
"call submode#enter_with('WinFocus2', 'n', '', '<Space>l', '<Plug>(WinWrapMove-L)')
"call submode#map(       'WinFocus2', 'n', '', 'h', '<Plug>(WinWrapMove-H)')
"call submode#map(       'WinFocus2', 'n', '', 'j', '<Plug>(WinWrapMove-J)')
"call submode#map(       'WinFocus2', 'n', '', 'k', '<Plug>(WinWrapMove-K)')
"call submode#map(       'WinFocus2', 'n', '', 'l', '<Plug>(WinWrapMove-L)')

"call submode#enter_with('WinFocus2', 'n', 's', '<Space>h', ':<C-u>call WinWrapMove("h")<CR>')
"call submode#enter_with('WinFocus2', 'n', 's', '<Space>j', ':<C-u>call WinWrapMove("j")<CR>')
"call submode#enter_with('WinFocus2', 'n', 's', '<Space>k', ':<C-u>call WinWrapMove("k")<CR>')
"call submode#enter_with('WinFocus2', 'n', 's', '<Space>l', ':<C-u>call WinWrapMove("l")<CR>')
"call submode#map(       'WinFocus2', 'n', 's', 'h', ':<C-u>call WinWrapMove("h")<CR>')
"call submode#map(       'WinFocus2', 'n', 's', 'j', ':<C-u>call WinWrapMove("j")<CR>')
"call submode#map(       'WinFocus2', 'n', 's', 'k', ':<C-u>call WinWrapMove("k")<CR>')
"call submode#map(       'WinFocus2', 'n', 's', 'l', ':<C-u>call WinWrapMove("l")<CR>')
"nunmap <Space>h
"nunmap <Space>j
"nunmap <Space>k
"nunmap <Space>l



if 0

  nnoremap <Space>w :<C-u>w<CR>
  nnoremap <Space>o :<C-u>MRU<Space>

  nmap <silent> H         <Plug>(BrowserJump-Back)
  nmap <silent> L         <Plug>(BrowserJump-Foward)

  nmap <Space>v <Leader>v
  nmap <Space>V <Leader>V

  "nnoremap <leader>w :<C-u>w<CR>
  nmap <Leader>e <Nop>
  nmap <silent> <Space>e <Leader>e
  nmap <Space>- <Leader>-
  nmap <Space>_ <Leader>_
  nmap <Space>t <Leader>t

  nmap <Space><Space> <Leader><Space>

  nmap <Space>J <Plug>(easymotion-j)
  nmap <Space>K <Plug>(easymotion-k)

endif

"nnoremap M J
"nnoremap T J

"nmap m <Plug>(MyVimrc-SkipTerm-Inc)
"nmap M <Plug>(MyVimrc-SkipTerm-Dec)
nmap t <Plug>(MyVimrc-SkipTerm-Inc)
nmap T <Plug>(MyVimrc-SkipTerm-Dec)


"nmap f <Plug>(MyVimrc-SkipTerm-Inc)
"nmap F <Plug>(MyVimrc-SkipTerm-Dec)

"nunmap J


function! BlocBrace() range
" echo a:firstline a:lastline
" red
" sleep 2
  exe a:lastline
  normal! o}
  exe a:firstline
  normal! O{
  normal! j>i{>a{
endfunction


com! -range Brace <line1>,<line2>call BlocBrace()
vnoremap J :Brace<CR>




let g:NERDTreeMapActivateNode = ''
let g:NERDTreeMapOpenInTab = 'o'
let NERDTreeShowHidden = 1



" smartcase
let g:EasyMotion_smartcase = 1

let g:EasyMotion_use_migemo = 1

let g:EasyMotion_do_shade = 1
let g:EasyMotion_do_shade = 0

if 0
nmap <tab> <Plug>(easymotion-overwin-line)
"nmap <Space><Space> <Plug>(easymotion-overwin-f2)
"nmap M <Plug>(easymotion-overwin-f2)
nmap <tab> <Plug>(easymotion-overwin-f2)
nmap <tab> <Plug>(easymotion-overwin-w)
endif



augroup ttttt
  au!
  au CursorHold  * setl nocursorcolumn
  au CursorMoved * setl cursorcolumn
augroup end

so ~/vimfiles/test_WinMove.vim



nnoremap ]3 ]#
nnoremap [3 [#

nnoremap ]8 ]*
nnoremap [8 [*




" ifdefを閉じる
com! FoldIfdef setl foldmarker=#if,#endif | setl foldmethod=marker | normal! zM



"例外をキャッチしないと、最初と最後の要素の次に移動しようとして例外で落ちる。
nnoremap <silent> <C-n>         :<C-u>try <Bar> exe (c_jk_local ? ":lnext" : "cnext") <Bar> catch <Bar> endtry<CR>:FuncNameStl<CR>
nnoremap <silent> <C-p>         :<C-u>try <Bar> exe (c_jk_local ? ":lprev" : "cprev") <Bar> catch <Bar> endtry<CR>:FuncNameStl<CR>



nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j





nmap <silent> W <Plug>CamelCaseMotion_w
nmap <silent> B <Plug>CamelCaseMotion_b
"nmap <silent> e <Plug>CamelCaseMotion_e
"nmap <silent> ge <Plug>CamelCaseMotion_ge
nnoremap E ge




com! -nargs=1 MyLineSearch let @m=<q-args> | call search('^\s*'. @m)
com! -nargs=1 MyLineBackSearch let @m=<q-args> | call search('^\s*'. @m, 'b')
nnoremap ,f :MyLineSearch<Space>
nnoremap ,F :MyLineBackSearch<Space>
nnoremap <C-p> :MyLineBackSearch<Space>
nnoremap <C-n> :MyLineSearch<Space>


set mouse=n


com! Branch echo FugitiveHead(7)



nmap <silent> g<C-t>  <C-w><C-w>
nnoremap <silent> <C-t>  :<C-u>tabnew<CR>



nnoremap <C-i> g;
nnoremap <C-o> g,

nnoremap ( <C-w><
nnoremap ) <C-w>>
nnoremap <C-n> <C-w>+
nnoremap <C-p> <C-w>-


"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

"nnoremap <silent> H <C-w>h
"nnoremap <silent> J <C-w>j
"nnoremap <silent> K <C-w>k
"nnoremap <silent> L <C-w>l
so ~/vimfiles/WinWrapMove.vim
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

com! Type normal! /[su]\(char\|short\|long\)<CR>


"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if 0

nmap <silent> <A-Left>         <Plug>(BrowserJump-Back)
nmap <silent> <A-Right>        <Plug>(BrowserJump-Foward)
nmap <silent> <C-p>         <Plug>(BrowserJump-Back)
nmap <silent> <C-n>        <Plug>(BrowserJump-Foward)
" nmap <silent> <BS>H     <Plug>(MyVimrc-WindowSplitAuto)<Plug>(MyVimrc-WinCmd-p)<Plug>(BrowserJump-Back)
" nmap <silent> <BS>L     <Plug>(MyVimrc-WindowSplitAuto)<Plug>(MyVimrc-WinCmd-p)<Plug>(BrowserJump-Foward)
nnoremap H <C-w>+
nnoremap L <C-w>-

endif
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


" Visual_Mode {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

vnoremap <nowait> <silent> <Plug>(Visual-I) <Esc>:call feedkeys('gv' . ( line("'<") != line("'>") ? 'I' : 'i'), 'nt')<CR>
vnoremap <nowait> <Plug>(Visual-i) i

vnoremap <silent> <Plug>(Visual-A) <Esc>:call feedkeys('gv' . ( line("'<") != line("'>") ? 'A' : 'a'), 'nt')<CR>
vnoremap <Plug>(Visual-a) a

if 0
  vmap <expr> <nowait> i mode() == "\<C-v>" ? "<Plug>(Visual-I)" : "<Plug>(Visual-i)"
  vmap <expr> <nowait> a mode() == "\<C-v>" ? "<Plug>(Visual-A)" : "<Plug>(Visual-a)"
elseif 0
  augroup MyVimrc_VVV
    au!
    au BufNew * vmap <expr> <buffer> <nowait> i mode() == "\<C-v>" ? "<Plug>(Visual-I)" : "<Plug>(Visual-i)"
    au BufNew * vmap <expr> <buffer> <nowait> a mode() == "\<C-v>" ? "<Plug>(Visual-A)" : "<Plug>(Visual-a)"
  augroup end
else
"elseif 0
  vnoremap <nowait> <silent> <Plug>(Visual-I) <Esc>:vunmap <buffer> i<CR>:call feedkeys('gv' . ( line("'<") != line("'>") ? 'I' : 'i'), 't')<CR>
  vnoremap <nowait> <silent> <Plug>(Visual-A) <Esc>:vunmap <buffer> a<CR>:call feedkeys('gv' . ( line("'<") != line("'>") ? 'A' : 'a'), 't')<CR>
  " 22 は、<C-v>
  " <buffer>と<nowait>により、各omapより優先させる。
 "nnoremap v     :<C-u>call RestoreDefaultStatusline(v:false)<CR>:vmap <expr> <buffer> <nowait> i mode() == nr2char(22) ? "<Plug>(Visual-I)" : "<Plug>(Visual-i)"<CR><C-v>
  nnoremap <silent> v     :<C-u>call RestoreDefaultStatusline(v:false)<CR>:vmap <expr> <buffer> <nowait> i mode() == nr2char(22) ? "<Plug>(Visual-I)" : "<Plug>(Visual-i)"<CR>:vmap <expr> <buffer> <nowait> a mode() == nr2char(22) ? "<Plug>(Visual-A)" : "<Plug>(Visual-a)"<CR><C-v>
 "nnoremap v     :<C-u>call RestoreDefaultStatusline(v:false)<CR>:vmap <buffer> <nowait> i <Plug>(Visual-I)<CR><C-v>
  if 0
    "vnoremap <nowait> <Plug>(Visual-I) <Esc>:echo 90<CR>
    "vnoremap <nowait> <Plug>(Visual-i) <Esc>:echo 80<CR>
    "nnoremap v     :<C-u>call RestoreDefaultStatusline(v:false)<CR>:vmap <expr> <buffer> <nowait> i mode() == "<C-v><C-v>" ? "<Plug>(Visual-I)" : "<Plug>(Visual-i)"<CR><C-v>
    "nnoremap @     :nnoremap <expr> ! ":echo '00<CR>'"<CR>
    "nnoremap @     :nnoremap <expr> ! ":echo '<C-v><C-v>'"
    echo nr2char(22)
  endif
endif

" Visual_Mode }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



"nnoremap <silent> <C-p> :<C-u>pop<CR>
"nnoremap <silent> <C-n> :<C-u>tag<CR>

nmap <silent> <C-p>         <Plug>(BrowserJump-Back)
nmap <silent> <C-n>         <Plug>(BrowserJump-Foward)

nmap <silent> <BS><C-p>     <Plug>(MyVimrc-WindowSplitAuto)<Plug>(MyVimrc-WinCmd-p)<C-p>
nmap <silent> <BS><C-n>     <Plug>(MyVimrc-WindowSplitAuto)<Plug>(MyVimrc-WinCmd-p)<C-n>




"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Next Hunk
"nnoremap <silent> <C-i> ]c^zz:FuncNameStl<CR>
nnoremap <silent> <C-i> ]c^:FuncNameStl<CR>

" Previouse Hunk
"nnoremap <silent> <C-o> [c^zz:FuncNameStl<CR>
nnoremap <silent> <C-o> [c^:FuncNameStl<CR>
nnoremap <silent> <S-Tab> [c^:FuncNameStl<CR>
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

if 0
packadd vim-easymotion-master
nmap <C-j> <Plug>(easymotion-overwin-w)
nmap <Space> <Plug>(easymotion-overwin-w)
endif

"set whichwrap+=hl




" Text_Objects {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" nnoremap cr caw
" nnoremap dr daw
" nnoremap yr yiw
" 
" nnoremap cs ciw
" nnoremap ds diw
" nnoremap ys yaw

nnoremap cr ciw
nnoremap dr daw
nnoremap yr yiw

nnoremap cs ciw
nnoremap ds daw
nnoremap ys yiw

nnoremap cu ciw
"nnoremap du daw
nnoremap yu yiw

" 括弧(Kakko)
onoremap ik i(
onoremap ak a(

" Double Quote
onoremap id i"
onoremap ad a"

" Text_Objects }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}
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
hi Normal	guifg=#f6f3f0	guibg=#282828	gui=none	ctermfg=254	ctermbg=235
"hi Normal	guifg=#f6f3f0	guibg=#0A0017	gui=none	ctermfg=254	ctermbg=235
"hi Normal	guifg=#f6f3f0	guibg=#170A00	gui=none	ctermfg=254	ctermbg=235
"hi Normal	guifg=#f6f3f0	guibg=#d0c589	gui=none	ctermfg=254	ctermbg=235	" 金箔背景
hi NonText	guifg=#808080	guibg=#303030	gui=none	ctermfg=242	ctermbg=237
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
hi Cursor	guifg=NONE	guibg=NONE	gui=reverse			ctermbg=0x241
hi CursorLine	guifg=NONE	guibg=NONE	gui=underline			ctermbg=NONE	cterm=underline
hi CursorColumn	guifg=NONE	guibg=#121212	gui=NONE			ctermbg=236
hi CursorColumn	guifg=NONE	guibg=#202020	gui=NONE			ctermbg=236
hi CursorColumn	guifg=NONE	guibg=#1A1A1A	gui=NONE			ctermbg=236
"hi CursorLineNr	guifg=#ffffff	guibg=#000000	gui=NONE	ctermfg=yellow			cterm=bold,underline
"hi CursorLineNr	guifg=#ffffff	guibg=#121212	gui=NONE	ctermfg=yellow			cterm=bold,underline
hi LineNr	guifg=#5c5a4f	guibg=#121212	gui=none	ctermfg=239	ctermbg=232
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
hi CursorLineNr		guifg=#efd3b8	guibg=#bb3333	gui=none
"hi CursorLineNr		guifg=#d0c589	guibg=#bb3333	gui=none
hi Search	guifg=white	guibg=#b7282e
hi MatchParen	guifg=#f6f3e8	guibg=#857b6f	gui=bold	ctermbg=59
hi Title	guifg=#f6f3e8	guibg=NONE	gui=bold


" For Completion Menu
hi Pmenu	guifg=#dcda8f	guibg=black	ctermfg=239	ctermbg=232
hi PmenuSel 	guifg=#000000	guibg=#c0504d	ctermfg=0	ctermbg=184
hi PmenuSbar 	guifg=#000000	guibg=black	ctermfg=0	ctermbg=184
hi PmenuThumb 	guifg=#000000	guibg=white	ctermfg=0	ctermbg=184


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

"hi VertSplit		guifg=#121212	guibg=#300a03	gui=none
"hi VertSplit		guifg=#7f1f1a	guibg=black	gui=none
"hi VertSplit		guifg=#7f1f1a	guibg=#121212	gui=none
"hi VertSplit		guifg=#7f1f1a	guibg=#282828	gui=none
"hi VertSplit		guifg=#282828	guibg=#282828	gui=none	ctermfg=254	ctermbg=235
hi VertSplit		guifg=#121212	guibg=#121212	gui=none
"hi VertSplit		guifg=#282828	guibg=#282828	gui=none


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
endif
"hi VertSplit		guifg=#d0c589	guibg=#d0c589	gui=none
"hi VertSplit		guifg=#1a1aaa	guibg=#efdf89	gui=none	" guibgは色を錯覚するので#d0c589から補正	fg青にした間違い
hi VertSplit		guifg=#1a1a1a	guibg=#d0c589	gui=none	" guibgは色を錯覚するので#d0c589から補正
hi VertSplit		guifg=#dfc3a8	guibg=#d0c589	gui=none	" guibgは色を錯覚するので#d0c589から補正
hi VertSplit		guifg=#7f1f1a	guibg=#d0c589	gui=none	" guibgは色を錯覚するので#d0c589から補正

hi StlGold		guifg=#1a1a1a	guibg=#d0c589	gui=none

hi TabLine		guifg=#eeddcc	guibg=black	gui=none
hi TabLine		guifg=#eeddcc	guibg=black	gui=underline
hi TabLineSel		guifg=#efd3b8	guibg=#7f1f1a	gui=none
hi TabLineSel		guifg=#a63318	guibg=#111111	gui=underline
hi TabLineSel		guifg=#a63318	guibg=#111111	gui=none
hi TabLineSel		guifg=indianred
hi TabLineSel		guifg=red
hi TabLineSel		guifg=#EF4123
hi TabLineSel		guifg=#bb3333
hi TabLineSel		guifg=#cc1f1a
hi TabLineSel		guifg=#cc3333
hi TabLineFill		guifg=#343434	guibg=black
hi TabLineDate		guifg=#efd3b8	guibg=#bb3333	gui=none
hi TabLineDate		guifg=#efd3b8	guibg=#7f1f1a	gui=none
hi TabLineFill		guifg=#d0c589	guibg=#d0c589
hi TabLineSep		guifg=black	guibg=#d0c589	gui=none
hi TabLineSep		guifg=#d0c589	guibg=black	gui=underline
hi TabLineSep		guifg=#d0c589	guibg=#d0c589	gui=none
hi TabLineSep		guifg=#d0c5b9	guibg=black	gui=underline	" 錯覚のため、微調整。


" func_name
hi hl_func_name		guifg=#cdd129			gui=none	ctermfg=184
hi hl_func_name_stl	guifg=#85b0df	guibg=black	gui=none	ctermfg=184
hi hl_buf_name_stl	guifg=#ff5d28	guibg=black	gui=none	ctermfg=202

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
  au InsertEnter * call s:SetStatusLineColor('Insert')
  au InsertLeave * call s:SetStatusLineColor('Normal')
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
    silent highlight	CursorLineNr	guifg=#aaccff	guibg=#0000ff	gui=NONE	ctermfg=Blue			cterm=bold,underline
    "silent highlight	CursorLineNr	guifg=#b8d3ef	guibg=#4444ee	gui=NONE	ctermfg=Blue			cterm=bold,underline
  else
    highlight clear CursorLineNr
    silent exec s:slhlcmdd
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

silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')

silent! let s:slhlcmdd = 'highlight ' . s:GetHighlight('CursorLineNr')




" gui cursor
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,a:blinkon0
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,a:blinkon0
set guicursor=n-v-c:ver10-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,a:blinkon0






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


" 琳派
" Thinkpad
" Modern Red (Windows XP Zune)
" Zplus
"
" (Star Saver)
" (Comboy)


" kinaka 金赤	#EF4123	#ef4123

"+++++ ftplugin/c.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:


let s:clv_path = './c_local.vim'
let s:clv_path = '~/vimfiles/pack/mypackage/start/tmp/plugin/customer.vim'
if filereadable(s:clv_path)
  exe 'so ' . s:clv_path
endif


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



""""" Grep
if 0
  noremap <buffer> <leader>r :vimgrep 
  noremap <buffer> <leader>g :set nocursorline<CR>:vimgrep /\C\<<C-r><C-w>\>/j *c *.h *.s *.S<CR>:set cursorline<CR>
  noremap <buffer> <leader>G :set nocursorline<CR>:grep "\C\<<C-r><C-w>\>" *c *.h *.s *.S<CR>:set cursorline<CR>
  noremap <buffer> <leader>w :vimgrep <C-r><C-w>
  noremap <buffer> <leader>i :vimgrep /<S-Insert>/j *c *.h *.s *.S<CR>
endif


"finish



""""" 演算子の間に空白を入れる

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



" if/switch/for/while文直後の(は自動で間に空白を入れる
"iunmap <buffer> ((
inoremap <buffer><expr> ( search('\<\(if\\|switch\\|for\\|while\)\%#', 'bcn') ? ' (' : '('



""""" セミコロンの自動挿入

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

""""" Snipet

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


""""" 補完

"so $HOME/.vim/macros/complete.vim
"inoremap <buffer><expr> . pumvisible() ? "\<C-E>.\<C-X>\<C-O>\<C-N>" : ".\<C-X>\<C-O>\<C-N>"



""""" in_str()

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

"TODO case行でコロンの自動付加
"TODO 単独elseの後に；を付加しないようにする。
"so $VIMRUNTIME/pack/takubo/start/tmp/plugin/test.vim



" inoremap <buffer> .. ->
inoremap <expr> <buffer> .. (<SID>in_str() != 0) ? '..' : '->'


setl nowrap
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
subprocess.Popen(["C:/cygwin/bin/mintty.exe", "--title", "Vim Term", "--size", "160,50", "-o", "Locale=ja_JP", "-o", "Charset=UTF-8", "C:/cygwin/bin/zsh.exe"])  # , "-B", "frame"
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
endfun


command! EmDisp :call <SID>EmDisp(expand("<cword>"))

command! EmExtendTgl :let g:em_extend_bin = !g:em_extend_bin <Bar> let g:em_extend_dec = !g:em_extend_dec <Bar> let g:em_extend_hex = !g:em_extend_hex

augroup Numbers
  au!
  au CursorMoved,VimResized * EmDisp
  au CmdwinEnter * let <SID>now_disp = 0
augroup end


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
"+++++ plugin/Search.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0 expandtab: (この行に関しては:help modelineを参照)

if exists('loaded_Search')
  "finish
  call MultiHighLight_Reset()
else
  call EscEsc_Add('call MultiHighLight_Suspend()')
  call EscEsc_Add('let g:MultiHighLightState = 2')
endif
let loaded_Search = v:true

let g:anzu_status_format = '/%p ( %i / %l )'
let g:anzu_search_limit = 999

let g:SearchProcTopUnderScore = v:false
let g:SearchMultiHighLight = v:true


let g:MultiHighLightState = 0
"    0:初期値、multipleは未実施。または、/や*で再検索されリセットされた状態。
"    1:multipleによるハイライト中
"    2:EscEscでハイライトが中断された状態


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


function! s:SearchCWord(add, proc_top_underscore, aword, keep_pos, strict_case)
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
  AnzuUpdateSearchStatusOutput
  FuncNameStl
  call AddAltStatusline('      %<%#hl_func_name_stl#  %{anzu#search_status()} %##', 'l', 0)
endfunction


com! SearchToggleProcTopUnderScore * call <SID>SearchToggleProcTopUnderScore()
com! SearchToggleMultiHighLight    * call <SID>SearchToggleMultiHighLight()


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

com! SearchCWordNewWordMove call <SID>SearchCWord(s:SearchNew, g:SearchProcTopUnderScore, s:MatchWord, s:CursorMove, v:false) | set hlsearch
com! SearchCWordNewPartMove call <SID>SearchCWord(s:SearchNew, g:SearchProcTopUnderScore, s:MatchPart, s:CursorMove, v:false) | set hlsearch
com! SearchCWordAddWordMove call <SID>SearchCWord(s:SearchAdd, g:SearchProcTopUnderScore, s:MatchWord, s:CursorMove, v:false) | set hlsearch
com! SearchCWordAddPartMove call <SID>SearchCWord(s:SearchAdd, g:SearchProcTopUnderScore, s:MatchPart, s:CursorMove, v:false) | set hlsearch

com! SearchCWordNewWordKeep call <SID>SearchCWord(s:SearchNew, g:SearchProcTopUnderScore, s:MatchWord, s:CursorKeep, v:false) | set hlsearch
com! SearchCWordNewPartKeep call <SID>SearchCWord(s:SearchNew, g:SearchProcTopUnderScore, s:MatchPart, s:CursorKeep, v:false) | set hlsearch
com! SearchCWordAddWordKeep call <SID>SearchCWord(s:SearchAdd, g:SearchProcTopUnderScore, s:MatchWord, s:CursorKeep, v:false) | set hlsearch
com! SearchCWordAddPartKeep call <SID>SearchCWord(s:SearchAdd, g:SearchProcTopUnderScore, s:MatchPart, s:CursorKeep, v:false) | set hlsearch

com! SearchCWordNewWordKeepStrict call <SID>SearchCWord(s:SearchNew, g:SearchProcTopUnderScore, s:MatchWord, s:CursorKeep, v:true) | set hlsearch
com! SearchCWordNewPartKeepStrict call <SID>SearchCWord(s:SearchNew, g:SearchProcTopUnderScore, s:MatchPart, s:CursorKeep, v:true) | set hlsearch
"com! SearchCWordAddWordKeepStrict call <SID>SearchCWord(s:SearchAdd, g:SearchProcTopUnderScore, s:MatchWord, s:CursorKeep, v:true) | set hlsearch
"com! SearchCWordAddPartKeepStrict call <SID>SearchCWord(s:SearchAdd, g:SearchProcTopUnderScore, s:MatchPart, s:CursorKeep, v:true) | set hlsearch




" Plug Mapping

nnoremap <silent> <Plug>(Search-CWord-New-Word-Move) :<C-u>SearchCWordNewWordMove<CR>
nnoremap <silent> <Plug>(Search-CWord-New-Part-Move) :<C-u>SearchCWordNewPartMove<CR>
nnoremap <silent> <Plug>(Search-CWord-Add-Word-Move) :<C-u>SearchCWordAddWordMove<CR>
nnoremap <silent> <Plug>(Search-CWord-Add-Part-Move) :<C-u>SearchCWordAddPartMove<CR>

nnoremap <silent> <Plug>(Search-CWord-New-Word-Keep) :<C-u>SearchCWordNewWordKeep<CR>
nnoremap <silent> <Plug>(Search-CWord-New-Part-Keep) :<C-u>SearchCWordNewPartKeep<CR>
nnoremap <silent> <Plug>(Search-CWord-Add-Word-Keep) :<C-u>SearchCWordAddWordKeep<CR>
nnoremap <silent> <Plug>(Search-CWord-Add-Part-Keep) :<C-u>SearchCWordAddPartKeep<CR>

nnoremap <silent> <Plug>(Search-CWord-New-Word-Keep-Strict) :<C-u>SearchCWordNewWordKeepStrict<CR>
nnoremap <silent> <Plug>(Search-CWord-New-Part-Keep-Strict) :<C-u>SearchCWordNewPartKeepStrict<CR>
"nnoremap <silent> <Plug>(Search-CWord-Add-Word-Keep-Strict) :<C-u>SearchCWordAddWordKeepStrict<CR>
"nnoremap <silent> <Plug>(Search-CWord-Add-Part-Keep-Strict) :<C-u>SearchCWordAddPartKeepStrict<CR>

nnoremap <silent> <Plug>(Search-n) n:call <SID>SearchN()<CR>
nnoremap <silent> <Plug>(Search-N) N:call <SID>SearchN()<CR>

cnoremap <silent> <Plug>(Search-SlashCR) <CR>:call <SID>SearchSlashCR()<CR>

nnoremap <silent> <Plug>(Search-TopUnderScore)         :call <SID>SearchToggleProcTopUnderScore()<CR>
nnoremap <silent> <Plug>(SearchT-ToggleMultiHighLight) :call <SID>SearchToggleMultiHighLight()<CR>


" Test
com! TestProcTopUnderScore echo ProcTopUnderScore('word') | echo ProcTopUnderScore('_word') | echo ProcTopUnderScore('0word')

"+++++ test_WinMove.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
nnoremap go :MRU 
nnoremap gw :<C-u>w<CR>
nmap ge <Leader>e
nmap gt <Plug>(PrjTree-MyExplore)



"nmap m <Plug>(MyVimrc-SkipTerm-Inc)
"nmap M <Plug>(MyVimrc-SkipTerm-Dec)

"nmap f <Plug>(MyVimrc-SkipTerm-Inc)
"nmap F <Plug>(MyVimrc-SkipTerm-Dec)

"x nmap J <Plug>(MyVimrc-SkipTerm-Inc)
"x nmap K <Plug>(MyVimrc-SkipTerm-Dec)

"nmap L <Plug>(MyVimrc-SkipTerm-Inc)
"nmap H <Plug>(MyVimrc-SkipTerm-Dec)

"nmap <Space> <Plug>(MyVimrc-SkipTerm-Inc)
"nmap K       <Plug>(MyVimrc-SkipTerm-Dec)

"nnoremap K :<C-u>ls <CR>:b<Space>

"x nmap <C-n> <Plug>(MyVimrc-SkipTerm-Inc)
"x nmap <C-p> <Plug>(MyVimrc-SkipTerm-Dec)

"nmap l <Plug>(MyVimrc-SkipTerm-Inc)
"nmap h <Plug>(MyVimrc-SkipTerm-Dec)


"nnoremap gl l
"nnoremap gh h

let g:submode_timeoutlen = 5000

"call submode#enter_with('cursor', 'n', '', 'gh', 'h')
"call submode#enter_with('cursor', 'n', '', 'gj', 'j')
"call submode#enter_with('cursor', 'n', '', 'gk', 'k')
"call submode#enter_with('cursor', 'n', '', 'gl', 'l')
"call submode#map('cursor', 'n', '', 'h', 'h')
"call submode#map('cursor', 'n', '', 'j', 'j')
"call submode#map('cursor', 'n', '', 'k', 'k')
"call submode#map('cursor', 'n', '', 'l', 'l')


"nnoremap w w
"nnoremap W b
"nnoremap e e
"nnoremap E ge




nnoremap gM M
nnoremap gH H
nnoremap gL L



nmap ' \



"nmap m <Plug>(clever-f-f)
"nmap M <Plug>(clever-f-F)
"nmap f <Plug>(clever-f-repeat-forward)
"nmap F <Plug>(clever-f-repeat-back)

"call submode#enter_with('cleverf', 'n', '', 'm', '<Plug>(clever-f-f)')
"call submode#enter_with('cleverf', 'n', '', 'f', '<Plug>(clever-f-repeat-forward)')
"call submode#map('cleverf', 'n', '', 'f', '<Plug>(clever-f-repeat-forward)')



"nmap <silent> H         <Plug>(BrowserJump-Back)
"nmap <silent> L         <Plug>(BrowserJump-Foward)
"+++++ WinWrapMove.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:
" (この行に関しては:help modelineを参照)

function! WinWrapMove(m)
  let cur = winnr()
  exe 'wincmd ' . a:m

  if cur == winnr()
    let rev = {'h' : 'l', 'j' : 'k', 'k' : 'j', 'l' : 'h'}
    while 1
      let cur = winnr()
      exe 'wincmd ' . rev[a:m]
      if cur == winnr()
	break
      endif
    endwhile
  endif
endfunction


if 1
 "nmap <silent> <C-h> <Plug>(BrowserJump-Back)
 "nmap <silent> <C-l> <Plug>(BrowserJump-Foward)
  nmap <silent> <C-h> <C-w>+
  nmap <silent> <C-l> <C-w>-
  nnoremap <C-k>     :<C-u>ls <CR>:b<Space>
 "nnoremap <C-j>     J

  nnoremap m     J
  nnoremap gm    gJ
  vnoremap m     J
  vnoremap gm    gJ


if 0
  nnoremap M     J
  nnoremap gM    gJ
  vnoremap M     J
  vnoremap gM    gJ
else
  nnoremap M <C-w>n
  nmap U *
  nmap M <Plug>(MyVimrc-Window-AutoNew)
endif

  nnoremap <silent> H :<C-u>call WinWrapMove('h')<CR>
  nnoremap <silent> J :<C-u>call WinWrapMove('j')<CR>
  nnoremap <silent> K :<C-u>call WinWrapMove('k')<CR>
  nnoremap <silent> L :<C-u>call WinWrapMove('l')<CR>
else
  nnoremap <silent> <C-h> :<C-u>call WinWrapMove('h')<CR>
  nnoremap <silent> <C-j> :<C-u>call WinWrapMove('j')<CR>
  nnoremap <silent> <C-k> :<C-u>call WinWrapMove('k')<CR>
  nnoremap <silent> <C-l> :<C-u>call WinWrapMove('l')<CR>
endif

" nnoremap <silent> T :<C-u>call WinWrapMove('h')<CR>
" nnoremap <silent> m :<C-u>call WinWrapMove('j')<CR>
" nnoremap <silent> M :<C-u>call WinWrapMove('k')<CR>
" nnoremap <silent> t :<C-u>call WinWrapMove('l')<CR>
" 
" nnoremap <silent> <Tab>   :<C-u>call WinWrapMove('h')<CR>
" nnoremap <silent> <Space> :<C-u>call WinWrapMove('j')<CR>
" nnoremap <silent> m       :<C-u>call WinWrapMove('k')<CR>
" nnoremap <silent> t       :<C-u>call WinWrapMove('l')<CR>
" 
" nnoremap <Plug>(WinWrapMove-H) :<C-u>call WinWrapMove('h')<CR>
" nnoremap <Plug>(WinWrapMove-J) :<C-u>call WinWrapMove('j')<CR>
" nnoremap <Plug>(WinWrapMove-K) :<C-u>call WinWrapMove('k')<CR>
" nnoremap <Plug>(WinWrapMove-L) :<C-u>call WinWrapMove('l')<CR>


function! Tate()
  windo let w:cur_fix_width = &l:winfixwidth
  windo let &l:winfixwidth = 1
  wincmd =
  windo let &l:winfixwidth = w:cur_fix_width
endfunction
nnoremap <silent> @ :<C-u>call Tate()<CR>
"+++++ test_WinMove.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
nnoremap go :MRU 
nnoremap gw :<C-u>w<CR>
nmap ge <Leader>e
nmap gt <Plug>(PrjTree-MyExplore)



"nmap m <Plug>(MyVimrc-SkipTerm-Inc)
"nmap M <Plug>(MyVimrc-SkipTerm-Dec)

"nmap f <Plug>(MyVimrc-SkipTerm-Inc)
"nmap F <Plug>(MyVimrc-SkipTerm-Dec)

"x nmap J <Plug>(MyVimrc-SkipTerm-Inc)
"x nmap K <Plug>(MyVimrc-SkipTerm-Dec)

"nmap L <Plug>(MyVimrc-SkipTerm-Inc)
"nmap H <Plug>(MyVimrc-SkipTerm-Dec)

"nmap <Space> <Plug>(MyVimrc-SkipTerm-Inc)
"nmap K       <Plug>(MyVimrc-SkipTerm-Dec)

"nnoremap K :<C-u>ls <CR>:b<Space>

"x nmap <C-n> <Plug>(MyVimrc-SkipTerm-Inc)
"x nmap <C-p> <Plug>(MyVimrc-SkipTerm-Dec)

"nmap l <Plug>(MyVimrc-SkipTerm-Inc)
"nmap h <Plug>(MyVimrc-SkipTerm-Dec)


"nnoremap gl l
"nnoremap gh h

let g:submode_timeoutlen = 5000

"call submode#enter_with('cursor', 'n', '', 'gh', 'h')
"call submode#enter_with('cursor', 'n', '', 'gj', 'j')
"call submode#enter_with('cursor', 'n', '', 'gk', 'k')
"call submode#enter_with('cursor', 'n', '', 'gl', 'l')
"call submode#map('cursor', 'n', '', 'h', 'h')
"call submode#map('cursor', 'n', '', 'j', 'j')
"call submode#map('cursor', 'n', '', 'k', 'k')
"call submode#map('cursor', 'n', '', 'l', 'l')


"nnoremap w w
"nnoremap W b
"nnoremap e e
"nnoremap E ge




nnoremap gM M
nnoremap gH H
nnoremap gL L



nmap ' \



"nmap m <Plug>(clever-f-f)
"nmap M <Plug>(clever-f-F)
"nmap f <Plug>(clever-f-repeat-forward)
"nmap F <Plug>(clever-f-repeat-back)

"call submode#enter_with('cleverf', 'n', '', 'm', '<Plug>(clever-f-f)')
"call submode#enter_with('cleverf', 'n', '', 'f', '<Plug>(clever-f-repeat-forward)')
"call submode#map('cleverf', 'n', '', 'f', '<Plug>(clever-f-repeat-forward)')



"nmap <silent> H         <Plug>(BrowserJump-Back)
"nmap <silent> L         <Plug>(BrowserJump-Foward)
"+++++ win.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:
" (この行に関しては:help modelineを参照)


function! WWW(c, k)

  if 0
    let cnt = ''
    let c = getchar()
    let k = nr2char(c)
  else
    let c = a:c
    let k = a:k
    let cnt = v:prevcount
  endif

  while 1
    if k =~ '\d'
      let cnt .= k
      echo cnt
      let c = getchar()
      let k = nr2char(c)
      continue
    elseif k == 'h'
      wincmd <
    elseif k == 'j'
      wincmd +
    elseif k == 'k'
      wincmd -
    elseif k == 'l'
      wincmd >
    "elseif k == "\<Space>"
    "  let cmd = cnt . 'wincmd w'
    "  exe cmd
    "elseif c == "\<S-Space>"
    "  let cmd = cnt . 'wincmd W'
    "  exe cmd
    elseif k == '='
      wincmd =
    else
      if k != 'g'
	"call feedkeys(k, 'm')
      endif
      break
    endif
    let cnt = ''
    redraw
    let c = getchar()
    let k = nr2char(c)
  endwhile
endfunction



if 0
nnoremap <silent> <Leader>h :<C-u>call WWW(0, 'h')<CR>
nnoremap <silent> <Leader>j :<C-u>call WWW(0, 'j')<CR>
nnoremap <silent> <Leader>k :<C-u>call WWW(0, 'k')<CR>
nnoremap <silent> <Leader>l :<C-u>call WWW(0, 'l')<CR>

nnoremap <silent> <Space>h :<C-u>call WWW(0, 'h')<CR>
nnoremap <silent> <Space>j :<C-u>call WWW(0, 'j')<CR>
nnoremap <silent> <Space>k :<C-u>call WWW(0, 'k')<CR>
nnoremap <silent> <Space>l :<C-u>call WWW(0, 'l')<CR>
endif

"if s:mode
  "ReVimrc
  "nnoremap gh <Esc>:<C-u>call WWW(0, 'h')<CR>
"else
  "nnoremap gh <Esc>:<C-u>call WWW(0, 'h')<CR>
  "nnoremap gj <Esc>:<C-u>call WWW(0, 'j')<CR>
  "nnoremap gk <Esc>:<C-u>call WWW(0, 'k')<CR>
  "nnoremap gl <Esc>:<C-u>call WWW(0, 'l')<CR>

  "nnoremap <silent><expr> gH &l:wrap ? ':setl nowrap<CR>' : ':setl wrap<CR>'

  "nnoremap <silent> g<Space>   :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0)     )<CR>
  "nnoremap <silent> g<S-Space> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -1)<CR>

  "nnoremap <silent> <C-j> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0)     )<CR>
  "nnoremap <silent> <C-k> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -1)<CR>
"endif

"cnoremap <C-j> <Down>
"cnoremap <C-k> <Up>
"cnoremap <C-h> <S-Tab>
"cnoremap <C-l> <Tab>

function! SetOptimalWinWidth()
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

  exe max + (&number || &l:number || &relativenumber || &l:relativenumber ? 5 : 0) . ' wincmd |'
endfunction

nnoremap <silent> <Leader><Space> :<C-u>call SetOptimalWinWidth()<CR>
nnoremap <silent> <Leader><Leader> :<C-u>call SetOptimalWinWidth()<CR>
nnoremap <silent> <BS><Leader> :<C-u>call SetOptimalWinWidth()<CR>
+++++++++++++++++++++ /home/PK65278/vimfiles/pack/mypackage/start/ +++++++++++++++++++++
BlockDiff-master
CamelCaseMotion-master
clever-f.vim-master
comfortable-motion.vim-master
current-func-info.vim-master
mru.vim-master
nerdtree-master
tags
tags-ja
tmp
vim-anzu-master
vim-fugitive-master
vim-textobj-user-master
vim-textobj-variable-segment-master
+++++++++++++++++++++ /home/PK65278/vimfiles/pack/mypackage/opt/ +++++++++++++++++++++
Alduin-master
tagbar-master
vim-dirvish-master
vim-easymotion-master
vim-gitgutter-master
vim-minimap-master
vim-nefertiti-master
vim-submode-master
vim-trip-master
