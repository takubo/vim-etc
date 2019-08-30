"+++++ .vimrc ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:
" (縺薙・陦後↓髢｢縺励※縺ｯ:help modeline繧貞盾辣ｧ)


let mapleader = "'"


if !isdirectory($HOME . "/vim_buckup")
  call mkdir($HOME . "/vim_buckup")
endif

if !isdirectory($HOME . "/vim_swap")
  call mkdir($HOME . "/vim_swap")
endif

set autochdir
set autoindent
" 繝舌ャ繧ｯ繧ｹ繝壹・繧ｹ縺ｧ繧､繝ｳ繝・Φ繝医ｄ謾ｹ陦後ｒ蜑企勁縺ｧ縺阪ｋ繧医≧縺ｫ縺吶ｋ
set backspace=2
set backupdir=$HOME/vim_buckup
set directory=$HOME/vim_swap
set clipboard=unnamed
" 繧ｳ繝槭Φ繝峨Λ繧､繝ｳ縺ｮ鬮倥＆ (Windows逕ｨgvim菴ｿ逕ｨ譎ゅ・gvimrc繧堤ｷｨ髮・☆繧九％縺ｨ)
set cmdheight=2
set nocompatible
set cursorline
set cursorcolumn
set encoding=utf-8
" 繝・く繧ｹ繝域諺蜈･荳ｭ縺ｮ閾ｪ蜍墓釜繧願ｿ斐＠繧呈律譛ｬ隱槭↓蟇ｾ蠢懊＆縺帙ｋ
set formatoptions+=mM
set gp=grep\ -n
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,a:blinkon0
set hidden
if !&hlsearch
  " ReVimrc縺吶ｋ蠎ｦ縺ｫ繝上う繝ｩ繧､繝医＆繧後ｋ縺ｮ繧帝∩縺代ｋ縲・  set hlsearch
endif
set history=10000
" 讀懃ｴ｢譎ゅ↓螟ｧ譁・ｭ怜ｰ乗枚蟄励ｒ辟｡隕・(noignorecase:辟｡隕悶＠縺ｪ縺・
set ignorecase
" 螟ｧ譁・ｭ怜ｰ乗枚蟄励・荳｡譁ｹ縺悟性縺ｾ繧後※縺・ｋ蝣ｴ蜷医・螟ｧ譁・ｭ怜ｰ乗枚蟄励ｒ蛹ｺ蛻･
set smartcase
set tagcase=match
set incsearch
set mps+=<:>
set nowrapscan

set number
set norelativenumber
set numberwidth=3

" 蟶ｸ縺ｫ繧ｹ繝・・繧ｿ繧ｹ陦後ｒ陦ｨ遉ｺ
set laststatus=2
set list
"trail:譛ｫ蟆ｾ縺ｮ繧ｹ繝壹・繧ｹ, eol:謾ｹ陦・ extends:, precedes:, nbsp:
set listchars=tab:>_,trail:$,extends:>,precedes:< | ",eol:,extends:,precedes:,nbsp:
" 繧ｿ繧､繝医Ν繧定｡ｨ遉ｺ
set title
set shiftwidth=8
" 繧ｳ繝槭Φ繝峨ｒ繧ｹ繝・・繧ｿ繧ｹ陦後↓陦ｨ遉ｺ
set showcmd
" 諡ｬ蠑ｧ蜈･蜉帶凾縺ｫ蟇ｾ蠢懊☆繧区峡蠑ｧ繧定｡ｨ遉ｺ (noshowmatch:陦ｨ遉ｺ縺励↑縺・
set showmatch
set matchtime=2
" 繧ｪ繝ｳ縺ｮ縺ｨ縺阪√え繧｣繝ｳ繝峨え繧呈ｨｪ蛻・牡縺吶ｋ縺ｨ譁ｰ縺励＞繧ｦ繧｣繝ｳ繝峨え縺ｯ繧ｫ繝ｬ繝ｳ繝医え繧｣繝ｳ繝峨え縺ｮ荳九↓髢九°繧後ｋ縲・set splitbelow
" 繧ｪ繝ｳ縺ｮ縺ｨ縺阪√え繧｣繝ｳ繝峨え繧堤ｸｦ蛻・牡縺吶ｋ縺ｨ譁ｰ縺励＞繧ｦ繧｣繝ｳ繝峨え縺ｯ繧ｫ繝ｬ繝ｳ繝医え繧｣繝ｳ繝峨え縺ｮ蜿ｳ縺ｫ髢九°繧後ｋ縲・set splitright
"繝ｪ繝ｭ繝ｼ繝峨☆繧九→縺阪↓繧｢繝ｳ繝峨ぇ縺ｮ縺溘ａ縺ｫ繝舌ャ繝輔ぃ蜈ｨ菴薙ｒ菫晏ｭ倥☆繧・set undoreload=-1
"螳滄圀縺ｫ譁・ｭ励′縺ｪ縺・→縺薙ｍ縺ｫ繧ゅき繝ｼ繧ｽ繝ｫ繧堤ｽｮ縺代ｋ繧医≧縺ｫ縺吶ｋ
set virtualedit=block
set wildmenu
set wildmode=longest:full,full
" 髟ｷ縺・｡後ｒ謚倥ｊ霑斐＠縺ｦ陦ｨ遉ｺ (nowrap:謚倥ｊ霑斐＆縺ｪ縺・
set wrap
" 讀懃ｴ｢譎ゅ↓繝輔ぃ繧､繝ｫ縺ｮ譛蠕後∪縺ｧ陦後▲縺溘ｉ譛蛻昴↓謌ｻ繧・(nowrapscan:謌ｻ繧峨↑縺・
set nowrapscan
set noundofile
set nrformats=bin,hex
set shiftround
set fileformats=unix,dos,mac
" for 1st empty buffer
set fileformat=unix
"set tag+=;
set tags=./tags,./tags;
"grep繧ｳ繝槭Φ繝峨・蜃ｺ蜉帙ｒ蜿悶ｊ霎ｼ繧薙〒縲“f縺吶ｋ縺溘ａ縲・set isfname-=:

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

  " grep縺吶ｋ髫帙↓'|cw'繧剃ｻ倥￠縺ｪ縺上※繧ゅ＿uickfix縺ｫ邨先棡繧定｡ｨ遉ｺ縺吶ｋ
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

" 讀懃ｴ｢譎ゅ↓/, ?繧呈･ｽ縺ｫ蜈･蜉帙☆繧・cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

cnoremap (( \(
cnoremap )) \)
cnoremap << \<
cnoremap >> \>
cnoremap <Bar><Bar> \<Bar>

" 繧ｳ繝｡繝ｳ繝郁｡後・蠕後・譁ｰ隕剰｡後・閾ｪ蜍輔さ繝｡繝ｳ繝亥喧縺ｮON/OFF
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

set noshowcmd

nnoremap j  gj
nnoremap k  gk

vnoremap j  gj
vnoremap k  gk


"----------------------------------------------------------------------------------------
" Horizontal Move

" ^縺ｫ縲－縺ｮ讖溯・繧帝㍾逡ｳ
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
nnoremap <silent> <Plug>(ComfortableMotion-Flick-Down) :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * min([64, winheight(0)])     )<CR>
nnoremap <silent> <Plug>(ComfortableMotion-Flick-Up)   :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * min([64, winheight(0)]) * -1)<CR>

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
  " Quickfix縺ｧ縺ｯ縲√↑縺懊°WinNew縺檎匱轣ｫ縺励↑縺・・縺ｧ縲‘xists()縺ｧ螟画焚縺ｮ蟄伜惠繧堤｢ｺ隱阪○縺ｭ縺ｰ縺ｪ繧峨↑縺・・  let &l:scrolloff = (g:BrowsingScroll || (exists('w:BrowsingScroll') && w:BrowsingScroll)) ? 99999 : ( winheight(0) < 10 ? 0 : winheight(0) < 20 ? 2 : 5 )
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
  " -o, -O繧ｪ繝励す繝ｧ繝ｳ莉倥″縺ｧ襍ｷ蜍輔＠縺欷indow縺ｧ縺ｯ縲仝inNew, WinEnter縺檎匱轣ｫ縺励↑縺・・縺ｧ縲∝挨騾碑ｨｭ螳壹・  au VimEnter * call PushPos_All() | exe 'tabdo windo let w:BrowsingScroll = v:false | call <SID>best_scrolloff()' | call PopPos_All()
augroup end


" Cursor Move, CursorLine, CursorColumn, and Scroll }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Emacs {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
" 繧ｳ繝槭Φ繝峨Λ繧､繝ｳ縺ｧ縺ｮ繧ｭ繝ｼ繝舌う繝ｳ繝峨ｒ Emacs 繧ｹ繧ｿ繧､繝ｫ縺ｫ縺吶ｋ
" 陦碁ｭ縺ｸ遘ｻ蜍・cnoremap <C-a>		<Home>
" 荳譁・ｭ玲綾繧・cnoremap <C-b>		<Left>
" 繧ｫ繝ｼ繧ｽ繝ｫ縺ｮ荳九・譁・ｭ励ｒ蜑企勁
cnoremap <C-d>		<Del>
" 陦梧忰縺ｸ遘ｻ蜍・cnoremap <C-e>		<End>
" 荳譁・ｭ鈴ｲ繧
cnoremap <C-f>		<Right>
" 繧ｳ繝槭Φ繝峨Λ繧､繝ｳ螻･豁ｴ繧剃ｸ縺､騾ｲ繧
cnoremap <C-n>		<Down>
" 繧ｳ繝槭Φ繝峨Λ繧､繝ｳ螻･豁ｴ繧剃ｸ縺､謌ｻ繧・cnoremap <C-p>		<Up>
" Emacs Yank
cnoremap <C-y> <C-R><C-O>*
" 谺｡縺ｮ蜊倩ｪ槭∈遘ｻ蜍・cnoremap <A-f>		<S-Right>
"cnoremap <Esc>f		<S-Right>
" 蜑阪・蜊倩ｪ槭∈遘ｻ蜍・cnoremap <A-b>		<S-Left>
" 蜊倩ｪ槫炎髯､
"cnoremap <A-d>		TODO
" Emacs }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" EscEsc {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

nmap <Esc><Esc> <Plug>(EscEsc)

if !exists('s:EscEsc_Add_Done')
  " 縺翫°縺励￥縺ｪ縺｣縺溘→縺阪↓EscEsc縺ｧ蠕ｩ蟶ｰ縺ｧ縺阪ｋ繧医≧縺ｫ縲∝ｿｵ縺ｮ縺溘ａforce繧探rue縺ｫ縺励※蜻ｼ縺ｳ蜃ｺ縺吶・  call EscEsc_Add('call RestoreDefaultStatusline(v:true)')
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
" 譛ｫ蟆ｾ縺圭|縺ｧ縺ｪ縺・→縺阪□縺代―|繧定ｿｽ蜉縺励↑縺・→縲―|縺ｮ蠕後〒Esc縺ｧ繧ｭ繝｣繝ｳ繧ｻ繝ｫ縺吶ｋ縺ｨ縲―|縺梧ｺ懊∪縺｣縺ｦ縺・▲縺ｦ縺励∪縺・・"nnoremap ? /<C-p><C-\>e getcmdline() . ( match(getcmdline(), '\|$') == -1 ? '\\|' : '') <CR>
nnoremap ? /<C-p><C-r>=match(getcmdline(), '\|$') == -1 ? '\\|' : ''<CR>


"----------------------------------------------------------------------------------------
" CWord

nmap *  <Plug>(Search-CWord-New-Word-Keep)
nmap &  <Plug>(Search-CWord-Add-Word-Keep)
nmap #  <Plug>(Search-CWord-New-Part-Keep)
nmap @  <Plug>(Search-CWord-Add-Part-Keep)

nmap g* <Plug>(Search-CWord-New-Word-Move)
nmap g& <Plug>(Search-CWord-Add-Word-Move)
nmap g# <Plug>(Search-CWord-New-Part-Move)
nmap g@ <Plug>(Search-CWord-Add-Part-Move)

nmap g8 g*
nmap g7 g&
nmap g3 g#
nmap g2 g@

"nnoremap <Leader>& <Plug>(Search-TopUnderScore)
"nnoremap <Leader>@ <Plug>(MySearchT-ToggleMultiHighLight)

" clear status
"nmap <Esc><Esc> <Plug>(anzu-clear-search-status)


"----------------------------------------------------------------------------------------
" 陬懷─

nnoremap g9 g8


"----------------------------------------------------------------------------------------
" 陦梧､懃ｴ｢

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
    if glob(g:prj_root_file) != ''  " prj_root_file繝輔ぃ繧､繝ｫ縺ｮ蟄伜惠遒ｺ隱・      try
        if exists("*CS_Local")
          call CS_Local(a:str)
        else
          exe "silent grep! '" . a:str . "' **/*.c" . " **/*.h" . " **/*.s"
        endif
        call feedkeys("\<CR>:\<Esc>\<C-o>", "tn")  " 隕九▽縺九▲縺滓怙蛻昴∈遘ｻ蜍輔＆縺帙↑縺・・      finally
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

"萓句､悶ｒ繧ｭ繝｣繝・メ縺励↑縺・→縲∵怙蛻昴→譛蠕後・隕∫ｴ縺ｮ谺｡縺ｫ遘ｻ蜍輔＠繧医≧縺ｨ縺励※萓句､悶〒關ｽ縺｡繧九・nnoremap <silent> m         :<C-u>try <Bar> exe (c_jk_local ? ":lnext" : "cnext") <Bar> catch <Bar> endtry<CR>:FuncNameStl<CR>
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

" 陬懷─
noremap zh H
noremap zl L
"nnoremap zm M
"nnoremap <expr> zh &wrap ? 'H' : 'zh'
"nnoremap <expr> zl &wrap ? 'L' : 'zl'

" 陬懷─縺ｮ陬懷─
noremap <C-@> zh
noremap <C-^> zl

" ---------------
" Unified CR
"   謨ｰ蟄嶺ｻ倥″縺ｪ繧峨∬｡後∈繧ｸ繝｣繝ｳ繝・"   qf縺ｪ繧牙ｽ楢ｩｲ陦後∈繧ｸ繝｣繝ｳ繝・"   help縺ｪ繧牙ｽ楢ｩｲ陦後∈繧ｸ繝｣繝ｳ繝・"   縺昴ｌ莉･螟悶↑繧峨√ち繧ｰ繧ｸ繝｣繝ｳ繝・" ---------------
function! Unified_CR(mode)
  if v:prevcount
    " jump縺吶ｋ蜑阪↓逋ｻ骭ｲ縺励↑縺・→縲」:prevcount縺御ｸ頑嶌縺輔ｌ縺ｦ縺励∪縺・・    call histadd('cmd', v:prevcount)
    " jumplist縺ｫ谿九☆縺溘ａ縺ｫ縲；繧剃ｽｿ逕ｨ縲・    exe 'normal! ' . v:prevcount . 'G'
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
    "縺薙％縺ｧreturn縺励↑縺・→縲√％縺ｮ荳九・if譁・〒g:TimerTagMatch縺梧悴螳夂ｾｩ繧ｨ繝ｩ繝ｼ縺ｫ縺ｪ繧九・    return
  endif
  if a:dummy == g:TimerTagMatch
    au! ZZZZ
    return
  endif
endfunction

let g:TagMatchI = {}
let s:TagHighlightTime = 1500  " [ms]

" TODO
"   繝ｩ繝吶Ν縺ｪ繧映:b
"   螟画焚縺ｪ繧峨√せ繧ｯ繝ｭ繝ｼ繝ｫ縺励↑縺・"   蠑墓焚縺ｮ繧ｿ繧ｰ
"   asm縺ｮ繧ｿ繧ｰ
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
      " 陦ｨ遉ｺ遽・峇繧呈怙驕ｩ蛹・      exe "normal! z\<CR>" . (winheight(0)/4) . "\<C-y>"
      " 繧ｫ繝ｼ繧ｽ繝ｫ菴咲ｽｮ繧定ｪｿ謨ｴ (C蟆ら畑)
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
	" 蜈・・讀懃ｴ｢隱槭・"_"蟋九∪繧・	let w = substitute(w0, '^_', '', '')
      else
	" 蜈・・讀懃ｴ｢隱槭・"_"蟋九∪繧翫〒縺ｪ縺・	let w = '_' . w0
      endif
      if i == 0
	" 繧ｨ繝ｩ繝ｼ繝｡繝・そ繝ｼ繧ｸ陦ｨ遉ｺ逕ｨ縺ｫ繧ｪ繝ｪ繧ｸ繝翫Ν蜊倩ｪ槭〒縺ｮ繧ｨ繝ｩ繝ｼ譁・ｭ怜・繧剃ｿ晏ｭ・      let exception = v:exception
      endif
    catch /:E433:/
      echohl ErrorMsg | echo matchstr(v:exception, 'E\d\+:.*') | echohl None
      return 1
    endtry
  endfor
  echohl ErrorMsg | echo matchstr(exception, 'E\d\+:.*') | echohl None
  return 1
endfunction

" 繧ｫ繝ｼ繧ｽ繝ｫ菴咲ｽｮ繧定ｪｿ謨ｴ (C蟆ら畑)
function! PostTagJumpCursor_C()
  if search('\%##define\s\+\k\+(', 'bcn')
  "髢｢謨ｰ蠖｢蠑上・繧ｯ繝ｭ
    normal! ww
  elseif search('\%##define\s\+\k\+\s\+', 'bcn')
  "螳壽焚繝槭け繝ｭ
    normal! ww
  elseif search('\%#.\+;', 'bcn')
  "螟画焚
    normal! f;b
  else
    "髢｢謨ｰ
    normal! $F(b
  endif
endfunction

" 蟇ｾ雎｡
"   繧ｫ繝ｼ繧ｽ繝ｫ荳・ ->  Normal mode 繝・ヵ繧ｩ繝ｫ繝・"   Visual      ->  Visual mode 繝・ヵ繧ｩ繝ｫ繝・"   (蜈･蜉・      ->  蟇ｾ蠢懊↑縺・
" 繧ｿ繧ｰ蜍穂ｽ・"   逶ｴ謗･繧ｸ繝｣繝ｳ繝・-> 縺ｪ縺・"   繧医″縺ｫ險医ｉ縺・繧ｿ繧ｰ縺ｮ謨ｰ谺｡隨ｬ縺ｧ) -> 繝・ヵ繧ｩ繝ｫ繝医→縺吶ｋ
"   蠑ｷ蛻ｶ驕ｸ謚・
" 繧ｦ繧｣繝ｳ繝峨え
"   縺昴・縺ｾ縺ｾ
"   蛻･繧ｦ繧｣繝ｳ繝峨え
"   繝励Ξ繝薙Η繝ｼ

" mode
"   s:select
"   p:preview
"   w:蛻･繧ｦ繧｣繝ｳ繝峨え
"
" 譛蛻昴・<Esc>縺後↑縺・→縲｝revcount繧偵≧縺ｾ縺丞・逅・〒縺阪↑縺・・nnoremap <silent> <CR>         <Esc>:call Unified_CR('')<CR>
nnoremap <silent> g<CR>        <Esc>:call Unified_CR('p')<CR>
nnoremap <silent> <Leader><CR> <Esc>:call Unified_CR('w')<CR>
nnoremap <silent> <C-CR>       <Esc>:call Unified_CR('s')<CR>
nnoremap <silent> <S-CR>       <Esc>:call Unified_CR('sp')<CR>
nnoremap <silent> <C-S-CR>     <Esc>:call Unified_CR('sw')<CR>
nnoremap          <C-S-CR>     <Esc>:tags<CR>;pop

nmap     <silent> <BS><CR>     <Leader><Leader><CR>
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

" diff accept (obtain and next, obtain and previouse) (dot縺ｯ縲〉epeat'.')
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

" 譛蛻昴↓ gg , G , [c , ]c 縺吶ｋ縺ｨ縲：uncNameStl縺悟ｮ溯｡後＆繧後↑縺・ｸ榊・蜷医≠繧翫ょｯｾ遲悶→縺励※縲》,T繧地map縲・
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
nnoremap <expr> d<CR> ':<C-u>' . ( winnr('$') > 1 ? 'tab split<CR>:' : '' ) . 'Gdiffsplit<CR>'

" Diff }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Window {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

set noequalalways

"----------------------------------------------------------------------------------------
" Window Ratio
"
"   豁｣譁ｹ蠖｢ w:h = 178:78
"   讓ｪ髟ｷ縺ｪ縺ｻ縺ｩ縲∝､ｧ縺阪＞蛟､縺瑚ｿ斐ｋ縲・function! s:WindowRatio()
  let h = winheight(0) + 0.0
  let w = winwidth(0) + 0.0
  return (w / h - 178.0 / 78.0)
endfunction

"----------------------------------------------------------------------------------------
" Skip Terminal

function! s:SkipTerm(direction)
  "Window逡ｪ蜿ｷ繧呈欠螳壹＆繧後※繧峨√◎縺ｮWindow縺ｸ遘ｻ蜍輔・  if v:prevcount | return v:prevcount | endif

  "window縺・縺､縺励°縺ｪ縺・↑繧峨√ｂ縺・ｸ譁ｹ縺ｸ遘ｻ蜍輔☆繧九％縺ｨ縺ｯ閾ｪ譏弱↑縺ｮ縺ｧ縲》erminal縺ｧ縺ゅ▲縺ｦ繧らｧｻ蜍輔ｒ險ｱ縺吶・  if winnr('$') == 2 | return winnr() == 1 ? 2 : 1 | endif

  let terms = term_list()
  let next_win = winnr()

  for i in range(winnr('$'))
    if a:direction >= 0
      let next_win = ( next_win == winnr('$') ? 1 : next_win + 1 )  "鬆・婿蜷・    else
      let next_win = ( next_win == 1 ? winnr('$') : next_win - 1 )  "騾・婿蜷・    endif
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
nnoremap <silent> <expr> <Leader><Leader> ( <SID>WindowRatio() <  0 ? "\<C-w>v" : "\<C-w>s" ) . ':diffoff<CR>'
nnoremap <silent> <expr> <BS><BS>         ( <SID>WindowRatio() >= 0 ? "\<C-w>v" : "\<C-w>s" ) . ':diffoff<CR>'
" Tag, Jump, and Unified CR 繧貞盾辣ｧ縲・
" Manual
nnoremap <silent> _                <C-w>s:setl noscrollbind<CR>
nnoremap <silent> g_               <C-w>n
nnoremap <silent> U                :<C-u>new<CR>
nnoremap <silent> <Bar>            <C-w>v:setl noscrollbind<CR>
nnoremap <silent> g<Bar>           :<C-u>vnew<CR>

"----------------------------------------------------------------------------------------
" Close

nnoremap <silent> q         <C-w><C-c>
nnoremap <silent> <Leader>q :<C-u>q<CR>

" 陬懷─
nnoremap <silent> <C-q>; q:
nnoremap <silent> <C-q>/ q/
nnoremap <silent> <C-q>? q?

" 繧ｦ繧｣繝ｳ繝峨え繝ｬ繧､繧｢繧ｦ繝医ｒ蟠ｩ縺輔↑縺・〒繝舌ャ繝輔ぃ繧帝哩縺倥ｋ   (http://nanasi.jp/articles/vim/kwbd_vim.html)
com! CloseWindow let s:kwbd_bn = bufnr('%') | enew | exe 'bdel '. s:kwbd_bn | unlet s:kwbd_bn
nnoremap <silent> <C-q><C-q> :<C-u>CloseWindow<CR>

"----------------------------------------------------------------------------------------
" Focus

" Basic
nnoremap <silent> <Plug>(MyVimrc-SkipTerm-Inc) <Esc>:exe <SID>SkipTerm(+1) . ' wincmd w'<CR>
nnoremap <silent> <Plug>(MyVimrc-SkipTerm-Dec) <Esc>:exe <SID>SkipTerm(-1) . ' wincmd w'<CR>
" Unified_Space繧貞盾辣ｧ縲・
" Move
nnoremap <silent> <Left>  <C-w>h
nnoremap <silent> <Down>  <C-w>j
nnoremap <silent> <Up>    <C-w>k
nnoremap <silent> <Right> <C-w>l

" Terminal Window縺九ｉ謚懊￠繧九・(Window縺鯉ｼ代▽縺励°縺ｪ縺・↑繧峨ゝab繧呈栢縺代ｋ縲・
tnoremap <expr> <C-Tab> winnr('$') == 1 ? '<C-w>:tabNext<CR>' : '<C-w>p'

"----------------------------------------------------------------------------------------
" Resize

" 貍ｸ谺｡
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

" 陬懷─
nnoremap <silent> <A-o> <C-l>

" 譛蟆丞喧繝ｻ譛螟ｧ蛹・nnoremap <silent> g<C-j> <esc><C-w>_:<C-u>call <SID>best_scrolloff()<CR>
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
" TODO diff縺ｮ繝舌ャ繝輔ぃ繧ょ・迴ｾ縺吶ｋ縲・
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
  let sep = '%#SLFileName# | '  " 繧ｿ繝夜俣縺ｮ蛹ｺ蛻・ｊ
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
  let sep = '%#SLFileName# | '  " 繧ｿ繝夜俣縺ｮ蛹ｺ蛻・ｊ
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

  return left . '%#SLFileName#    %<' . tabpages . '%#SLFileName#%=  ' . right
  return left . '%##%<' . tabpages . '%=  ' . right
endfunction


"----------------------------------------------------------------------------------------
" Make TabLabel

function! s:make_tabpage_label(n)
  " 繧ｫ繝ｬ繝ｳ繝医ち繝悶・繝ｼ繧ｸ縺九←縺・°縺ｧ繝上う繝ｩ繧､繝医ｒ蛻・ｊ譖ｿ縺医ｋ
  "let hi = a:n is tabpagenr() ? '%#Directory#' : '%#TabLine#'
  let hi = a:n is tabpagenr() ? '%#SLFileName#' : '%#TabLine#'

  if s:TablineStatus == 1 | return hi . ' [ ' . a:n . ' ] %#TabLineFill#' | endif

  " 繧ｿ繝門・縺ｮ繝舌ャ繝輔ぃ縺ｮ繝ｪ繧ｹ繝・  let bufnrs = tabpagebuflist(a:n)

  " 繧ｿ繝門・縺ｫ螟画峩縺ゅｊ縺ｮ繝舌ャ繝輔ぃ縺後≠縺｣縺溘ｉ '+' 繧剃ｻ倥￠繧・  let mod = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ? ' +' : ''

  " 繝舌ャ繝輔ぃ謨ｰ
  let num = '(' . len(bufnrs) . ')'

  if s:TablineStatus == 2 | return hi . ' [ ' . a:n . ' ' . num . mod . ' ] %#TabLineFill#' | endif

  " 繧ｿ繝也分蜿ｷ
  let no = '[' . a:n . ']'

  " 繧ｫ繝ｬ繝ｳ繝医ヰ繝・ヵ繧｡
  let curbufnr = bufnrs[tabpagewinnr(a:n) - 1]  " tabpagewinnr() 縺ｯ 1 origin
  let buf_name = ( s:TablineStatus =~ '[345]' ? expand('#' . curbufnr . ':t') : pathshorten(bufname(curbufnr)) )  " let buf_name = pathshorten(expand('#' . curbufnr . ':p'))
  let buf_name = buf_name == '' ? 'No Name' : buf_name  " 辟｡蜷阪ヰ繝・ヵ繧｡縺ｯ縲√ヰ繝・ヵ繧｡蜷阪′蜃ｺ縺ｪ縺・・
  " 譛邨ら噪縺ｪ繝ｩ繝吶Ν
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

" 譌ｧ繧ｿ繧､繝槭・蜑企勁  vimrc繧貞・隱ｭ縺ｿ霎ｼ縺ｿ縺吶ｋ髫帙∝商縺・ち繧､繝槭ｒ蜑企勁縺励↑縺・→縲√←繧薙←繧楢ｲｯ縺ｾ縺｣縺ｦ縺・▲縺ｦ縺励∪縺・・if exists('TimerTabline') | call timer_stop(TimerTabline) | endif

let s:UpdateTablineInterval = 1000
let TimerTabline = timer_start(s:UpdateTablineInterval, 'UpdateTabline', {'repeat': -1})


"----------------------------------------------------------------------------------------
" Initial Setting

" 0
" 1  繧ｿ繝也分蜿ｷ
" 2  繧ｿ繝也分蜿ｷ 繝舌ャ繝輔ぃ謨ｰ Mod
" 3  繧ｿ繝也分蜿ｷ                繝舌ャ繝輔ぃ蜷・" 4  繧ｿ繝也分蜿ｷ 繝舌ャ繝輔ぃ謨ｰ     繝舌ャ繝輔ぃ蜷・" 5  繧ｿ繝也分蜿ｷ 繝舌ャ繝輔ぃ謨ｰ Mod 繝舌ャ繝輔ぃ蜷・" 6  繧ｿ繝也分蜿ｷ 繝舌ャ繝輔ぃ謨ｰ     繝輔Ν繝舌ャ繝輔ぃ蜷・" 7  繧ｿ繝也分蜿ｷ 繝舌ャ繝輔ぃ謨ｰ Mod 繝輔Ν繝舌ャ繝輔ぃ蜷・let s:TablineStatusNum = 8

" 蛻晄悄險ｭ螳・silent call <SID>ToggleTabline(3)


" Tabline }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Statusline {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{


"----------------------------------------------------------------------------------------
" Battery (Battery.vim縺悟ｭ伜惠縺励↑縺・ｴ蜷医↓蛯吶∴縺ｦ縲・
let g:BatteryInfo = '? ---% [--:--:--]'


"----------------------------------------------------------------------------------------
" Alt Statusline

function! s:SetStatusline(stl, local, time)
  " 譌ｧ繧ｿ繧､繝槭・蜑企勁
  if a:time > 0 && exists('s:TimerUsl') | call timer_stop(s:TimerUsl) | unlet s:TimerUsl | endif

  " Local Statusline 縺ｮ菫晏ｭ倥ゅ♀繧医・縲仝inLeave繧､繝吶Φ繝医・險ｭ螳壹・  if a:local == 'l'
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

  " Statusline 縺ｮ險ｭ螳・  exe 'set' . a:local . ' stl=' . substitute(a:stl, ' ', '\\ ', 'g')

  " 繧ｿ繧､繝槭せ繧ｿ繝ｼ繝・  if a:time > 0 | let s:TimerUsl = timer_start(a:time, 'RestoreDefaultStatusline', {'repeat': v:false}) | endif
endfunction

function! RestoreDefaultStatusline(force)
  " AltStl縺ｫ縺ｪ縺｣縺ｦ縺・↑縺・→縺阪・縲∝ｼｷ蛻ｶ繝輔Λ繧ｰ縺檎ｫ九▲縺ｦ縺・↑縺・剞繧灰efault縺ｸ謌ｻ縺輔↑縺・・  if !exists('s:TimerUsl') && !a:force | return | endif

  " 譌ｧ繧ｿ繧､繝槭・蜑企勁
  if exists('s:TimerUsl') | call timer_stop(s:TimerUsl) | unlet s:TimerUsl | endif

  " TODO 縺薙ｌ縺ｮ蜻ｼ縺ｳ蜃ｺ縺玲э蝗ｳ遒ｺ隱・  call s:SetStatusline(s:stl, '', -1)

  let save_cur_win = winnr()

  " Local縺励°險ｭ螳壹＠縺ｦ縺ｪ縺・→縺阪・縲∝・Window縺ｮStl繧貞・險ｭ螳壹☆繧九ｈ繧翫（f exists縺ｮ譁ｹ縺碁溘＞縺具ｼ・  "windo let &l:stl = getwinvar(winnr(), 'stl', '')
  windo if exists('w:stl') | let &l:stl = w:stl | unlet w:stl | endif

  silent exe save_cur_win . 'wincmd w'
endfunction

augroup MyVimrc_Stl
  au!
  " 縺薙・繧､繝吶Φ繝医′縺ｪ縺・→縲、ltStl縺瑚ｨｭ螳壹＆繧後※縺・ｋWindow繧貞・蜑ｲ縺励※菴懊▲縺欷indow縺ｮ&l:stl縺ｫ縲・  " 蛻・牡蜈ジindow縺ｮAltStl縺ｮ蜀・ｮｹ縺瑚ｨｭ螳壹＆繧後▲縺ｱ縺ｪ縺励↓縺ｪ縺｣縺ｦ縺励∪縺・・  au WinEnter * let &l:stl = ''
augroup end


"----------------------------------------------------------------------------------------
" Make Default Statusline

function! s:SetDefaultStatusline(statusline_contents)

  let s:stl = "  "
  let s:stl .= "%#SLFileName#[ %{winnr()} ]%## ( %n ) "
  let s:stl .= "%##%m%r%{(!&autoread&&!&l:autoread)?'[AR]':''}%h%w "

  let g:MyStlFugitive = a:statusline_contents['GitBranch'] ? ' [fugitive]' : ' fugitive'
  let s:stl .= "%#hl_func_name_stl#%{bufname('') =~ '^fugitive' ? g:MyStlFugitive : ''}"
  let s:stl .= "%#hl_func_name_stl#%{&filetype == 'fugitive' ? g:MyStlFugitive : ''}"

  if a:statusline_contents['GitBranch']
    let s:stl .= "%#hl_func_name_stl# %{FugitiveHead(7)}"
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
  let s:stl .= "%#SLNoNameDir#%{ bufname('') == '' ? getcwd(winnr()) : '' }"
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
    let s:stl .= "%## %-3{ &ft == '' ? '    ' : &ft }  %-5{ &fenc == '' ? '     ' : &fenc }  %4{ &ff } "
  else
    let s:stl .= "%## %-3{ &ft == '' ? '    ' : &ft } "
    let s:stl .= "%## %-5{ &fenc == '' ? '     ' : &fenc } "
    let s:stl .= "%## %4{ &ff } "
  endif

  let s:stl .= "%#SLFileName# %{&l:scrollbind?'$':'@'} "
  let s:stl .= "%1{ c_jk_local != 0 ? 'L' : 'G' } %1{ &l:wrap ? '==' : '>>' } %{g:clever_f_use_migemo?'(M)':'(F)'} %4{ &iminsert ? 'Jpn' : 'Code' } "

  let s:stl .= "%#SLFileName#  %{repeat(' ',winwidth(0)-178)}"

  let s:stl .= "%## %3p%% [%4L] "

  if a:statusline_contents['LineColumn']
    let s:stl .= "%## %4lL, %3c(%3v)C "
  elseif a:statusline_contents['Column']
    let s:stl .= "%## %3c,%3v "
  endif

  if a:statusline_contents['TabStop']
    let s:stl .= "%## %{&l:tabstop} "
  endif

  call RestoreDefaultStatusline(v:true)
endfunction


"----------------------------------------------------------------------------------------
" Switch Statusline Contents

let g:StatuslineContents = {}

let g:StatuslineContents['Column'] = v:true
let g:StatuslineContents['GitBranch'] = v:false
let g:StatuslineContents['FuncName'] = v:false
let g:StatuslineContents['Keywords'] = v:false
let g:StatuslineContents['LineColumn'] = v:false
let g:StatuslineContents['Path'] = v:false
let g:StatuslineContents['TabStop'] = v:false

function! CompletionStlContents(ArgLead, CmdLine, CusorPos)
  return join(keys(g:StatuslineContents),"\n")
endfunction
com! -nargs=1 -complete=custom,CompletionStlContents Stl let g:StatuslineContents['<args>'] = !g:StatuslineContents['<args>'] | call <SID>SetDefaultStatusline(g:StatuslineContents)

nnoremap <silent> <Leader>_ :<C-u>Stl Column<CR>
nnoremap <silent> <Leader>. :<C-u>Stl GitBranch<CR>
nnoremap <silent> <Leader>, :<C-u>Stl FuncName<CR>
nnoremap <silent> <Leader>- :<C-u>Stl Path<CR>


"----------------------------------------------------------------------------------------
" Initialize Statusline

" 蛻晄悄險ｭ螳壹・縺溘ａ縺ｫ1蝗槭・蜻ｼ縺ｳ蜃ｺ縺吶・call s:SetDefaultStatusline(g:StatuslineContents)


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

" Mru }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Completion {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

set complete=.,w,b,u,i,t
set completeopt=menuone,preview
set pumheight=25


" 蜈ｨ譁・ｭ励く繝ｼ縺ｸ縺ｮ陬懷ｮ碁幕蟋九ヨ繝ｪ繧ｬ縺ｮ蜑ｲ繧雁ｽ薙※
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
  au CompleteDone * inoremap <silent> <expr> jj pumvisible() ? '<C-N><C-N>' : s:esc_and_write

  au InsertCharPre * try | iunmap gg | catch | finally

  au TextChangedI * exe pumvisible() ? "" : "inoremap <silent> <expr> jj pumvisible() ? '<C-N><C-N>' : " . s:esc_and_write_quoted
  au TextChangedI * exe pumvisible() ? "" : "try | iunmap gg | catch | finally"

  au InsertLeave * try | iunmap gg | catch | finally
  au InsertLeave * inoremap <silent> <expr> jj pumvisible() ? '<C-N><C-N>' : s:esc_and_write

  au InsertCharPre * exe ( pumvisible() || v:char != "j" ) ? ( "" ) : ( "inoremap <silent> <expr> jj pumvisible() ? '<C-N><C-N>' : " . s:esc_and_write_quoted )
  au InsertCharPre * exe pumvisible() ? "" : "try | iunmap gg | catch | finally"

augroup end

" 陬懷ｮ後ｒ髢句ｧ九☆繧・function! TrigCompl(key)
  try
    iunmap jj
  catch
    inoremap <expr> gg pumvisible() ? '<C-Y><Esc>:<C-u>w<CR>' : 'gg'
  finally
  endtry
  call feedkeys("\<C-n>\<C-p>", 'n')
  return a:key
endfunc

" 陬懷ｮ御ｸｭ縺ｮj,k繧ｭ繝ｼ縺ｮ蜃ｦ逅・ｒ陦後≧
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

inoremap <silent> <expr> jj pumvisible() ? '<C-N><C-N>' : s:esc_and_write
inoremap          <expr> jj pumvisible() ? '<C-N><C-N>' : s:esc_and_write
inoremap <expr> j pumvisible() ? Cmpl_jk("\<C-n>") : TrigCompl('j')
inoremap <expr> k pumvisible() ? Cmpl_jk("\<C-p>") : TrigCompl('k')
inoremap <expr> <C-j> pumvisible() ? 'j' : '<C-n>'
inoremap <expr> <C-k> pumvisible() ? 'k' : '<Esc>'

inoremap <expr> <CR>  pumvisible() ? '<C-y>' : '<C-]><C-G>u<CR>'
inoremap <expr> <Esc> pumvisible() ? '<C-e>' : '<Esc>'

inoremap <expr> gg ( pumvisible() ? '<C-Y>' : '' ) . s:esc_and_write

let s:esc_and_write =  '<Esc>:<C-u>w<CR>'
let s:esc_and_write_quoted = "'" . s:esc_and_write . "'"

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

nnoremap <silent><expr> gl &l:wrap ? ':setl nowrap<CR>' : ':setl wrap<CR>'

nnoremap gG G

nnoremap <silent> gf :<C-u>aboveleft sp<CR>gF

" Other Key-Maps }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}



" Clever-f {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

let g:clever_f_smart_case=1			"
let g:clever_f_use_migemo=1			"
"let g:clever_f_fix_key_direction=1		"
let g:clever_f_chars_match_any_signs = '\\'	" 莉ｻ諢上・險伜捷縺ｫ繝槭ャ繝√☆繧区枚蟄励ｒ險ｭ螳壹☆繧・"let g:clever_f_chars_match_any_signs = ';'	" 莉ｻ諢上・險伜捷縺ｫ繝槭ャ繝√☆繧区枚蟄励ｒ險ｭ螳壹☆繧・"let g:clever_f_chars_match_any_signs = ';'	" 莉ｻ諢上・險伜捷縺ｫ繝槭ャ繝√☆繧区枚蟄励ｒ險ｭ螳壹☆繧・if 1
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
nnoremap <silent><expr> <PageDown> ':<C-u>se transparency=' . max([&transparency - 1,   1]) . '<Bar> Transparency <CR>'   | " transparency縺ｯ縲・莉･荳九ｒ險ｭ螳壹☆繧九→255縺ｫ縺ｪ縺｣縺ｦ縺励∪縺・・
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


" 髢｢謨ｰ蜷崎｡ｨ遉ｺ
nnoremap <silent> , :<C-u>FuncName<CR>


" Command Line 縺ｧ縺ｮ髢｢謨ｰ蜷肴諺蜈･
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


" 謨ｰ蛟､豈碑ｼ・畑縺ｮ髢｢謨ｰ lhs 縺ｮ縺ｻ縺・′螟ｧ縺阪￠繧後・豁｣謨ｰ・悟ｰ上＆縺代ｌ縺ｰ雋謨ｰ・畦hs 縺ｨ rhs 縺檎ｭ峨＠縺代ｌ縺ｰ 0 繧定ｿ斐☆
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
"萓・iabbr <silent> if if ()<Left><C-R>=Eatchar('\s')<CR>


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


" 霑斐ｊ蛟､
"   Cursor縺係ord縺ｮ荳・       豁｣謨ｴ謨ｰ
"   Cursor縺係ord縺ｮ荳翫〒縺ｪ縺・ 0
function! IsCursorOnWord()
  return search('\%#\k', 'cnz')
endfunction


" 霑斐ｊ蛟､
"   Cursor縺係ord縺ｮ蜈磯ｭ:             -1
"   Cursor縺係ord縺ｮ荳・蜈磯ｭ縺ｧ縺ｪ縺ｯ縺・:  1
"   Cursor縺係ord縺ｮ荳翫〒縺ｪ縺・          0
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


com! AR :setl autoread!


com! Tab2Space setlocal   expandtab | retab<CR>
com! Space2Tab setlocal noexpandtab | retab!<CR>
com! T2S Tab2Space
com! S2T Space2Tab


com! FL help function-list<CR>


com! -nargs=1 Unicode exe 'normal! o<C-v>u' . tolower('<args>') . '<Esc>'


com! XMLShape :%s/></>\r</g | filetype indent on | setf xml | normal gg=G


" Windows縺ｧ縺ｮ險ｭ螳壻ｾ九〒縺吶ゆｻ悶・蝣ｴ蜷医・螟夜Κ繧ｳ繝槭Φ繝蛾Κ蛻・ｒ隱ｭ縺ｿ譖ｿ縺医※縺上□縺輔＞縲・au FileType plantuml com! OpenUml :!/cygdrive/c/Program\ Files/Google/Chrome/Application/chrome.exe %


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
nnoremap        g<Space> :<C-u>let &iminsert = (&iminsert ? 0 : 2) <Bar> exe "colorscheme " . (&iminsert ? "Asche" : "Rimpa") <CR>

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
" 繧ｫ繝ｼ繧ｽ繝ｫ荳九・highlight諠・ｱ繧定｡ｨ遉ｺ縺吶ｋ {{{
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
nmap m <Plug>(ComfortableMotion-Flick-Down)
nmap M <Plug>(ComfortableMotion-Flick-Up)



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
" 譌ｧ繧ｿ繧､繝槭・蜑企勁  vimrc繧貞・隱ｭ縺ｿ霎ｼ縺ｿ縺吶ｋ髫帙∝商縺・ち繧､繝槭ｒ蜑企勁縺励↑縺・→縲√←繧薙←繧楢ｲｯ縺ｾ縺｣縺ｦ縺・▲縺ｦ縺励∪縺・・if exists('TimerLLL') | call timer_stop(TimerLLL) | endif

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
" BrowserJump  Org縺ｸ縺ｮ繧ｸ繝｣繝ｳ繝励ｂ繧ｭ繝ｼ繝舌う繝ｳ繝峨ｒ謠蝉ｾ帙☆繧・

set complete=.,w,b,u,i

function! RefRef()
  let srch = @/
  let word = expand('<cword>')

  call PushPos()

  " 2j縺ｯ縲・未謨ｰ縺ｮ蜈磯ｭ縺ｫ螻・◆譎ら畑
  " 2k縺ｯ縲・未謨ｰ螳夂ｾｩ陦後ｒ蜷ｫ繧縺溘ａ
  " 縺・★繧後ｂ證ｫ螳・  keepjumps normal! 2j[[2k
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

nnoremap H <C-w><
nnoremap J <C-w>+
nnoremap K <C-w>-
nnoremap L <C-w>>

"nmap <C-h> H
"nmap <C-j> J
"nmap <C-k> K
"nmap <C-l> L

nmap <silent> <C-h> <Plug>(BrowserJump-Back)
nmap <silent> <C-l> <Plug>(BrowserJump-Foward)

nnoremap <C-l> <C-l>

"nnoremap <Leader>j J
"nnoremap : J
nnoremap <C-j> J
nnoremap g<C-j> gJ

nnoremap <C-k> :<C-u>ls <CR>:b<Space>


"nmap <C-a> <Plug>(trip-increment-ignore-minus)
"nmap <C-x> <Plug>(trip-decrement-ignore-minus)


"螳滄圀縺ｫ譁・ｭ励′縺ｪ縺・→縺薙ｍ縺ｫ繧ゅき繝ｼ繧ｽ繝ｫ繧堤ｽｮ縺代ｋ繧医≧縺ｫ縺吶ｋ
"set virtualedit=all







nmap J <Plug>(MyVimrc-SkipTerm-Inc)
nmap K <Plug>(MyVimrc-SkipTerm-Dec)

so ~/vimfiles/win.vim

" Thinkpad
com! Thinkpad set lines=75 columns=267



packadd vim-submode-master
call submode#enter_with('winsize', 'n', '', '<Space>l', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<Space>h', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<Space>j', '<C-w>+')
call submode#enter_with('winsize', 'n', '', '<Space>k', '<C-w>-')
call submode#map(       'winsize', 'n', '', 'l', '<C-w>>')
call submode#map(       'winsize', 'n', '', 'h', '<C-w><')
call submode#map(       'winsize', 'n', '', 'j', '<C-w>+')
call submode#map(       'winsize', 'n', '', 'k', '<C-w>-')

let g:submode_timeoutlen = 5000


nnoremap <Space>w :<C-u>w<CR>
nnoremap <Space>o :<C-u>MRU<Space>

nmap <silent> H         <Plug>(BrowserJump-Back)
nmap <silent> L         <Plug>(BrowserJump-Foward)

nmap <Space>v <Leader>v
nmap <Space>V <Leader>V

nmap <Space>e <Leader>e

nmap <Space><Space> <Leader><Space>

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
"+++++ colors/Rimpa.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=8 sw=2 tw=0: (縺薙・陦後↓髢｢縺励※縺ｯ:help modeline繧貞盾辣ｧ)

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
hi NonText	guifg=#808080	guibg=#303030	gui=none	ctermfg=242	ctermbg=237
"hi Visual	gui=reverse
"hi Visual	guifg=#ffffd7	guibg=#444444	gui=none	ctermfg=186	ctermbg=238
hi Visual	guifg=NONE	guibg=#444444	gui=none	ctermfg=186	ctermbg=238
hi FoldColumn	guifg=#ff5d28	guibg=#444444
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
hi Search	guifg=white	guibg=#b7282e
hi MatchParen	guifg=#f6f3e8	guibg=#857b6f	gui=bold	ctermbg=59
hi Title	guifg=#f6f3e8	guibg=NONE	gui=bold


" For Completion Menu
hi Pmenu	guifg=#dcda8f	guibg=black	ctermfg=239	ctermbg=232
hi PmenuSel 	guifg=#000000	guibg=#c0504d	ctermfg=0	ctermbg=184
hi PmenuSbar 	guifg=#000000	guibg=black	ctermfg=0	ctermbg=184
hi PmenuThumb 	guifg=#000000	guibg=white	ctermfg=0	ctermbg=184


" For Statusline
hi StatusLine		guifg=#ff6666	guibg=#7f1f1a	gui=none
hi StatusLine		guifg=#efd3b8	guibg=#7f1f1a	gui=none
hi StatusLine		guifg=#efd3b8	guibg=#bb3333	gui=none
hi StatusLineNC		guifg=#5c5a4f	guibg=#300a03	gui=none
hi StatusLineNC		guifg=#5c5a4f	guibg=#101010	gui=none
hi SLNoNameDir		guifg=#5c5a4f	guibg=#000000	gui=none
hi SLFileName		guifg=#cf302d	guibg=#000000

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
  hi LineNr	guifg=#5c5a4f	guibg=#282828	gui=none
  hi LineNr	guifg=#7c7a6f	guibg=#282828	gui=none
  hi VertSplit	guifg=#282828	guibg=#121212	gui=none
  hi VertSplit	guifg=#282828	guibg=#000000	gui=none
 "hi VertSplit	guifg=#121212	guibg=#282828	gui=none

 "hi LineNr	guifg=#7c7a6f	guibg=#282828	gui=none
 "hi VertSplit	guifg=#000000	guibg=#282828	gui=bold
endif


hi TabLine		guifg=#eeddcc	guibg=black	gui=none
hi TabLine		guifg=#eeddcc	guibg=black	gui=underline
hi TabLineSel		guifg=#efd3b8	guibg=#7f1f1a	gui=none
hi TabLineSel		guifg=#a63318	guibg=#111111	gui=underline
hi TabLineSel		guifg=#a63318	guibg=#111111	gui=none
hi TabLineSel		guifg=indianred
hi TabLineFill		guifg=#343434	guibg=black
hi TabLineDate		guifg=#efd3b8	guibg=#7f1f1a	gui=none

" func_name
hi hl_func_name		guifg=#cdd129			gui=none	ctermfg=184
hi hl_func_name_stl	guifg=#85b0df	guibg=black	gui=none	ctermfg=184
hi hl_buf_name_stl	guifg=#ff5d28	guibg=black	gui=none	ctermfg=202

" Syntax highlighting
hi Comment 	guifg=#808080			ctermfg=244	| " gui=italic
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
hi String 	guifg=#acf0f2	gui=none	ctermfg=159
hi Number	guifg=#ff8f6f	gui=none	ctermfg=184	" Vim
hi Number	guifg=#ff9777	gui=none	ctermfg=184	" Vim
hi Number	guifg=#f08060	gui=none	ctermfg=184	" Vim
hi Number	guifg=#ff9797	gui=none	ctermfg=184	" C
"hi String 	guifg=#ffa678	gui=none	ctermfg=184
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


" File Tree
hi Directory	guifg=#ff2222	guibg=NONE
hi Directory	guifg=#ff4444	guibg=NONE
hi Directory	guifg=#ff6666	guibg=NONE




"""""""""""""""""""""""""""""""謖ｿ蜈･繝｢繝ｼ繝画凾縲√せ繝・・繧ｿ繧ｹ繝ｩ繧､繝ｳ縺ｮ濶ｲ繧貞､画峩""""""""""""""""""""""""""""""

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
set transparency=244
set transparency=235




"""""""""""""""""""""""""""""""繝輔か繝ｳ繝医し繧､繧ｺ""""""""""""""""""""""""""""""

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
  else	" 繝・ヵ繧ｩ繝ｫ繝医し繧､繧ｺ縺ｫ謌ｻ縺・    let s:CurFontHeight = s:FontHeight
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


"+++++ plugin/PrjTree.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim: set ts=8 sts=2 sw=2 tw=0 :

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
      " root dir 繧定ｨ俶・
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
    " NERDTree縺ｮ繝舌ャ繝輔ぃ縺ｮmap縺ｫ螻暮幕縺吶ｋ蠢・ｦ√′縺ゅｋ縺ｮ縺ｧ縲・縺ｯ莉倥￠縺ｪ縺・・    exe 'silent normal ' . repeat("U", num)
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

  if num > 0
    " NERDTree縺ｮ繝舌ャ繝輔ぃ縺ｮmap縺ｫ螻暮幕縺吶ｋ蠢・ｦ√′縺ゅｋ縺ｮ縺ｧ縲・縺ｯ莉倥￠縺ｪ縺・・    exe 'silent normal ' . repeat("U", num)
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

  if num > 0
    " NERDTree縺ｮ繝舌ャ繝輔ぃ縺ｮmap縺ｫ螻暮幕縺吶ｋ蠢・ｦ√′縺ゅｋ縺ｮ縺ｧ縲・縺ｯ莉倥￠縺ｪ縺・・    exe 'silent normal ' . repeat("U", num)
  endif

  " move cursor to org file
  call search('\%(' . repeat('  ', num + 1) . "\<C-g>" . '\)\@<=' . g:filename . '$', 'cW')
  normal! 0

  call SetOptimalWinWidth()
endfunction


com! MyExplore call MyExplore()


nnoremap <silent> <Plug>(PrjTree-MyExplore) :<C-u>MyExplore<CR>
nmap <leader>t <Plug>(PrjTree-MyExplore)


let &cpo = s:save_cpo
unlet s:save_cpo
"+++++ sands.ahk ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;"C:\Program Files\AutoHotkey\AutoHotkey.exe" "D:\Dropbox\autohotkey.ahk"
; Ctrl + Alt + E 縺ｧ繧ｹ繧ｯ繝ｪ繝励ヨ繧堤ｷｨ髮・
;^!e::Edit
; Ctrl + Alt + R 縺ｧ繧ｹ繧ｯ繝ｪ繝励ヨ繧貞・隱ｭ縺ｿ霎ｼ縺ｿ.
^!r::Reload


;https://edvakf.hatenadiary.org/entry/20101027/1288168554


Space::
SendInput {RShift Down}
If SandS_SpaceDown = 1
{
	Return
}
SandS_SpaceDown := 1
SandS_SpaceDownTime := A_TickCount ; milliseconds after computer is booted http://www.autohotkey.com/docs/Variables.htm
SandS_AnyKeyPressed := 0
; watch for the next single key, http://www.autohotkey.com/docs/commands/Input.htm
Input, SandS_AnyKey, L1 V,{LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{Capslock}{Numlock}{PrintScreen}{Pause}
SandS_AnyKeyPressed := 1
Return


Space Up::
SendInput {RShift Up}
SandS_SpaceDown := 0
If SandS_AnyKeyPressed = 0
{
	If A_TickCount - SandS_SpaceDownTime < 200
	{
		;If takubo = 0
		;{
		;	SendInput {Space}
		;} Else {
		;	SendInput ^{Space}
		;}
		SendInput {Space}
	}
	; Send EndKey of the "Input" command above
	; You must use Send here since SendInput is ignored by "Input"
	Send {RShift}
}
Return


RControl::Space


LShift::Escape


RShift::RCtrl





; RControl:: SendInput {Space}
; 
; LShift:: SendInput {Escape}
; 
; 
; ;RShift:: SendInput {CtrlDown}
; 
; ;RShift Up:: SendInput {CtrlUp}
; 
; RShift::
; 	takubo := 1
; 	SendInput {CtrlDown}
; 	Return
; 
; 
; RShift Up::
; 	takubo := 0
; 	SendInput {CtrlUp}
; 	Return
"+++++ win.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:
" (縺薙・陦後↓髢｢縺励※縺ｯ:help modeline繧貞盾辣ｧ)


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
"+++++ ~/vimfiles/sands.ahk.old ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;https://edvakf.hatenadiary.org/entry/20101027/1288168554


Space::
SendInput {RShift Down}
If SandS_SpaceDown = 1
{
	Return
}
SandS_SpaceDown := 1
SandS_SpaceDownTime := A_TickCount ; milliseconds after computer is booted http://www.autohotkey.com/docs/Variables.htm
SandS_AnyKeyPressed := 0
; watch for the next single key, http://www.autohotkey.com/docs/commands/Input.htm
Input, SandS_AnyKey, L1 V,{LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{Capslock}{Numlock}{PrintScreen}{Pause}
SandS_AnyKeyPressed := 1
Return


Space Up::
SendInput {RShift Up}
SandS_SpaceDown := 0
If SandS_AnyKeyPressed = 0
{
	If A_TickCount - SandS_SpaceDownTime < 200
	{
		SendInput {Space}
	}
	; Send EndKey of the "Input" command above
	; You must use Send here since SendInput is ignored by "Input"
	Send {RShift}
}
Return
"+++++ ~/vimfiles/sands.ahk.old2 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;"C:\Program Files\AutoHotkey\AutoHotkey.exe" "D:\Dropbox\autohotkey.ahk"
; Ctrl + Alt + E 縺ｧ繧ｹ繧ｯ繝ｪ繝励ヨ繧堤ｷｨ髮・
;^!e::Edit
; Ctrl + Alt + R 縺ｧ繧ｹ繧ｯ繝ｪ繝励ヨ繧貞・隱ｭ縺ｿ霎ｼ縺ｿ.
^!r::Reload


;https://edvakf.hatenadiary.org/entry/20101027/1288168554


Space::
SendInput {RShift Down}
If SandS_SpaceDown = 1
{
	Return
}
SandS_SpaceDown := 1
SandS_SpaceDownTime := A_TickCount ; milliseconds after computer is booted http://www.autohotkey.com/docs/Variables.htm
SandS_AnyKeyPressed := 0
; watch for the next single key, http://www.autohotkey.com/docs/commands/Input.htm
Input, SandS_AnyKey, L1 V,{LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{Capslock}{Numlock}{PrintScreen}{Pause}
SandS_AnyKeyPressed := 1
Return


Space Up::
SendInput {RShift Up}
SandS_SpaceDown := 0
If SandS_AnyKeyPressed = 0
{
	If A_TickCount - SandS_SpaceDownTime < 200
	{
		If takubo = 0
		{
			SendInput {Space}
		} Else {
			SendInput +{Space}
		}
	}
	; Send EndKey of the "Input" command above
	; You must use Send here since SendInput is ignored by "Input"
	Send {RShift}
}
Return


LShift:: SendInput {Space}
;LShift:: Send +{Space}


RShift::
	takubo := 1
	SendInput {CtrlDown}
	Return


RShift Up::
	takubo := 0
	SendInput {CtrlUp}
	Return
"+++++ ~/vimfiles/sands.ahk.old3 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;"C:\Program Files\AutoHotkey\AutoHotkey.exe" "D:\Dropbox\autohotkey.ahk"
; Ctrl + Alt + E 縺ｧ繧ｹ繧ｯ繝ｪ繝励ヨ繧堤ｷｨ髮・
;^!e::Edit
; Ctrl + Alt + R 縺ｧ繧ｹ繧ｯ繝ｪ繝励ヨ繧貞・隱ｭ縺ｿ霎ｼ縺ｿ.
^!r::Reload


;https://edvakf.hatenadiary.org/entry/20101027/1288168554


Space::
SendInput {RShift Down}
If SandS_SpaceDown = 1
{
	Return
}
SandS_SpaceDown := 1
SandS_SpaceDownTime := A_TickCount ; milliseconds after computer is booted http://www.autohotkey.com/docs/Variables.htm
SandS_AnyKeyPressed := 0
; watch for the next single key, http://www.autohotkey.com/docs/commands/Input.htm
Input, SandS_AnyKey, L1 V,{LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{Capslock}{Numlock}{PrintScreen}{Pause}
SandS_AnyKeyPressed := 1
Return


Space Up::
SendInput {RShift Up}
SandS_SpaceDown := 0
If SandS_AnyKeyPressed = 0
{
	If A_TickCount - SandS_SpaceDownTime < 200
	{
		If takubo = 0
		{
			SendInput {Space}
		} Else {
			SendInput +{Space}
		}
	}
	; Send EndKey of the "Input" command above
	; You must use Send here since SendInput is ignored by "Input"
	Send {RShift}
}
Return


RControl:: SendInput {Space}

LShift:: SendInput {Escape}

RShift::
	takubo := 1
	SendInput {CtrlDown}
	Return


RShift Up::
	takubo := 0
	SendInput {CtrlUp}
	Return
"+++++ ~/vimfiles/sands.ahk.old4 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;"C:\Program Files\AutoHotkey\AutoHotkey.exe" "D:\Dropbox\autohotkey.ahk"
; Ctrl + Alt + E 縺ｧ繧ｹ繧ｯ繝ｪ繝励ヨ繧堤ｷｨ髮・
;^!e::Edit
; Ctrl + Alt + R 縺ｧ繧ｹ繧ｯ繝ｪ繝励ヨ繧貞・隱ｭ縺ｿ霎ｼ縺ｿ.
^!r::Reload


;https://edvakf.hatenadiary.org/entry/20101027/1288168554


Space::
SendInput {RShift Down}
If SandS_SpaceDown = 1
{
	Return
}
SandS_SpaceDown := 1
SandS_SpaceDownTime := A_TickCount ; milliseconds after computer is booted http://www.autohotkey.com/docs/Variables.htm
SandS_AnyKeyPressed := 0
; watch for the next single key, http://www.autohotkey.com/docs/commands/Input.htm
Input, SandS_AnyKey, L1 V,{LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{Capslock}{Numlock}{PrintScreen}{Pause}
SandS_AnyKeyPressed := 1
Return


Space Up::
SendInput {RShift Up}
SandS_SpaceDown := 0
If SandS_AnyKeyPressed = 0
{
	If A_TickCount - SandS_SpaceDownTime < 200
	{
		If takubo = 0
		{
			SendInput {Space}
		} Else {
			SendInput ^{Space}
		}
	}
	; Send EndKey of the "Input" command above
	; You must use Send here since SendInput is ignored by "Input"
	Send {RShift}
}
Return


RControl:: SendInput {Space}

LShift:: SendInput {Escape}


;RShift:: SendInput {CtrlDown}

;RShift Up:: SendInput {CtrlUp}

RShift::
	takubo := 1
	SendInput {CtrlDown}
	Return


RShift Up::
	takubo := 0
	SendInput {CtrlUp}
	Return
"+++++ ~/vimfiles/sands.ahk ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;"C:\Program Files\AutoHotkey\AutoHotkey.exe" "D:\Dropbox\autohotkey.ahk"
; Ctrl + Alt + E 縺ｧ繧ｹ繧ｯ繝ｪ繝励ヨ繧堤ｷｨ髮・
;^!e::Edit
; Ctrl + Alt + R 縺ｧ繧ｹ繧ｯ繝ｪ繝励ヨ繧貞・隱ｭ縺ｿ霎ｼ縺ｿ.
^!r::Reload


;https://edvakf.hatenadiary.org/entry/20101027/1288168554


Space::
SendInput {RShift Down}
If SandS_SpaceDown = 1
{
	Return
}
SandS_SpaceDown := 1
SandS_SpaceDownTime := A_TickCount ; milliseconds after computer is booted http://www.autohotkey.com/docs/Variables.htm
SandS_AnyKeyPressed := 0
; watch for the next single key, http://www.autohotkey.com/docs/commands/Input.htm
Input, SandS_AnyKey, L1 V,{LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{Capslock}{Numlock}{PrintScreen}{Pause}
SandS_AnyKeyPressed := 1
Return


Space Up::
SendInput {RShift Up}
SandS_SpaceDown := 0
If SandS_AnyKeyPressed = 0
{
	If A_TickCount - SandS_SpaceDownTime < 200
	{
		;If takubo = 0
		;{
		;	SendInput {Space}
		;} Else {
		;	SendInput ^{Space}
		;}
		SendInput {Space}
	}
	; Send EndKey of the "Input" command above
	; You must use Send here since SendInput is ignored by "Input"
	Send {RShift}
}
Return


RControl::Space


LShift::Escape


RShift::RCtrl





; RControl:: SendInput {Space}
; 
; LShift:: SendInput {Escape}
; 
; 
; ;RShift:: SendInput {CtrlDown}
; 
; ;RShift Up:: SendInput {CtrlUp}
; 
; RShift::
; 	takubo := 1
; 	SendInput {CtrlDown}
; 	Return
; 
; 
; RShift Up::
; 	takubo := 0
; 	SendInput {CtrlUp}
; 	Return
+++++++++++++++++++++ /home/PK65278/vimfiles/pack/mypackage/start/ +++++++++++++++++++++
BlockDiff-master
clever-f.vim-master
comfortable-motion.vim-master
current-func-info.vim-master
mru.vim-master
nerdtree-master
tmp
vim-anzu-master
vim-fugitive-master
vim-textobj-user-master
vim-textobj-variable-segment-master
+++++++++++++++++++++ /home/PK65278/vimfiles/pack/mypackage/opt/ +++++++++++++++++++++
Alduin-master
tagbar-master
vim-dirvish-master
vim-gitgutter-master
vim-minimap-master
vim-nefertiti-master
vim-submode-master
vim-trip-master
