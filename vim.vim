scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0:
" (この行に関しては:help modelineを参照)



command! -nargs=* BUF exe 'browse filter %\c' . substitute(<q-args>, '[ *]', '.*', 'g') . '% ls' | call feedkeys(':b ', 'n')

nnoremap K :<C-u>BUF<Space>



iab <silent> inc  #include ""<Left><C-x><C-f><C-R>=Eatchar('\s')<CR>
iab <silent> inca #include ""<Left>src_a/<C-x><C-f><C-R>=Eatchar('\s')<CR>
iab <silent> inci #include ""<Left>inc/<C-x><C-f><C-R>=Eatchar('\s')<CR>



augroup MyVimrc_Stl
  au!
  " このイベントの必要性:
  " このイベントがないと、AltStlが設定されているWindowを分割して作ったWindowの&l:stlに、
  " (分割元Windowの)AltStlの内容が設定されっぱなしになってしまう。
  au WinEnter * let &l:stl = ''
  " call s:SetStatusline(stl = &i:stl, local = v:true, time = s:TimerUslの残り時間, no_save_lstl = v:true)
augroup end



nnoremap <silent> <Leader>O :<C-u>MyExplore<CR>



function! PyCyg()
python3 << PYCODE
import subprocess
subprocess.Popen(["C:/cygwin/bin/mintty.exe", "--title", "Vim Term", "--size", "160,50", "-o", "Locale=ja_JP", "-o", "Charset=UTF-8", "C:/cygwin/bin/zsh.exe"])  # , "-B", "frame"
PYCODE
endfunction
com! PyCyg call PyCyg()



function! L() range
  echo a:lastline - a:firstline + 1
endfunction
com! -range L <line1>, <line2> call L()
vnoremap <silent> L :L<CR>
nnoremap <Leader>l :<C-u>echo len("<C-r><C-w>")<CR>



function! TempHL()
  let w = expand("<cword>")
  let g:TagMatch0 = matchadd('TagMatch', '\<'.w.'\>')
  let g:TimerTagMatch0 = timer_start(1500, 'QQQQ')
  let g:TagMatchI[g:TimerTagMatch0] = g:TagMatch0
endfunction
"nnoremap <F5>  :<C-u>call TempHL()<CR>
"nnoremap <C-n> :<C-u>call TempHL()<CR>
nnoremap <silent> @ :<C-u>call TempHL()<CR>



nnoremap <silent> <C-z> :<C-u>SH2<CR>



" Git

function! TestGitFile()
  echo system("git ls-files")
endfunction
com! TGF call TestGitFile()

function! GetGitRoot()
  return system('git rev-parse --show-toplevel')
endfunction

function! TestGitCdRoot()
  exe 'cd ' . PyTestGitFile()
  pwd
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


