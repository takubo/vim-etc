"+++++ ~/vimfiles/startup_sands_ahk.bat ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@echo off

timeout 5

rem start /high explorer "C:\cygwin\home\%USERNAME%\vimfiles\SAndS.ahk"

rem start /high "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\cygwin\home\%USERNAME%\vimfiles\SAndS.ahk"

cmd /c start "" /high "C:\PROGRA~1\AutoHotkey\AutoHotkey.exe" "C:\cygwin\home\%USERNAME%\vimfiles\SAndS.ahk"

exit

"+++++ ~/vimfiles/new.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:
" (この行に関しては:help modelineを参照)


com! -nargs=1 -complete=custom,VimrcContents VRJ silent 1 <Bar> call search(<q-args> . ' {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{', 'cW')

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




" ------------------------------------------------------------------------------------------------------------------------------



" diff Special
"
function! Kari()
  let nw = []
  windo if KariSub() | call add(nw, winnr()) | endif
  if len(nw) == 2
    return v:true
  else
    return v:false
  endif
endfunction

" Diff Specialの判定では、NERDTreeのWindowを無視して、2個ならDiffするようにする。おなじくTerminalも。Quickfix, Locationlistも。
function! KariSub()
  let buftype = &buftype
  let bufname = bufname(0)
  if buftype =~ 'quickfix' || buftype =~ 'help' || buftype =~ 'terminal'
    return v:false
  elseif bufname =~ '^NERD_tree_'
    return v:false
  endif
  return v:true
endfunction

nnoremap <expr> d<Space>
        \ &diff ? ':<C-u>diffupdate<CR>' :
        \ Kari() ? ':<C-u>call PushPos_All() <Bar> exe "windo diffthis" <Bar> call PopPos_All()<CR>' :
        \ ':<C-u>diffthis<CR>'




" ------------------------------------------------------------------------------------------------------------------------------



" diff Special

nnoremap d<Space> :<C-u>call DiffSpecial()<CR>

function! DiffSpecial()
  if &diff
    diffupdate
    return
  endif

  if Kari()
    call PushPos_All()
    for i in [0, 1]
      exe s:nw[i] 'wincmd w'
      diffthis
    endfor
    call PopPos_All()
    echo s:nw
  else
    diffthis
  endif

endfunction

function! Kari()
  let nw = []

  for w in range(1, winnr('$'))
    if KariSub(w)
      call add(nw, w)
    endif
  endfor

  if len(nw) == 2
    let s:nw = nw
    return v:true
  else
    return v:false
  endif
endfunction

" Diff Specialの判定では、NERDTreeのWindowを無視して、2個ならDiffするようにする。おなじくTerminalも。Quickfix, Locationlistも。
function! KariSub(winnr)
  let bufnr = winbufnr(a:winnr)

  let buftype = getbufvar(bufnr, '&buftype')
  let bufname = bufname(bufnr)

  "echo a:winnr bufnr buftype bufname

  if buftype =~ 'quickfix' || buftype =~ 'help' || buftype =~ 'terminal'
    return v:false
  elseif bufname =~ '^NERD_tree_'
    return v:false
  endif
  return v:true
endfunction

function! KariD()
  echo KariSub(winnr())
endfunction




" ------------------------------------------------------------------------------------------------------------------------------




augroup MyVimrc_NERDTree
  au!
  "au WinNew NERD_tree_* setl winfixwidth
augroup end




" ------------------------------------------------------------------------------------------------------------------------------




" DOS環境で、set shellslash が有効なとき、NERDTreeVCSが無限ループに陥る。

" nnoremap <silent> gt :<C-u>NERDTreeVCS<CR><C-w>p:NERDTreeFind<CR>

nnoremap <silent> gt :<C-u>exe 'NERDTreeVCS <Bar> NERDTreeFind' expand('%:p')<CR>
      \:nunmap <buffer> J<CR>
      \:nunmap <buffer> K<CR>
      \:nunmap <buffer> f<CR>
      \:nunmap <buffer> F<CR>
      \:nunmap <buffer> m<CR>



" ------------------------------------------------------------------------------------------------------------------------------




"+++++ ~/vimfiles/plugin/PrjTree.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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
nmap <leader>t <Plug>(PrjTree-MyExplore)


let &cpo = s:save_cpo
unlet s:save_cpo
"+++++ ~/vimfiles/pack/mypackage/start/nerdtree-master/nerdtree_plugin/vcs.vim ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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
vim-submode
vim-trip-master
