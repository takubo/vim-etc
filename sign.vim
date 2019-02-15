"sign define ss linehl=DiffAdd text=SS
sign define ss linehl=Search text=　
"sign place 1001 name=ss buffer=7 line=808


"exe 'sign place 3 line=' . line('.') . ' name=ss file=' .  expand("%:p")
"exe 'sign place ' . line('.') . ' line=' . line('.') . ' name=ss file=' .  expand("%:p")
com! Sing exe 'sign place ' . line('.') . ' line=' . line('.') . ' name=ss file=' .  expand("%:p")
nnoremap <F9> :<C-u>Sing<CR>
"sign unplace
com! Unsign sign unplace
nnoremap <F10> :<C-u>Unsign<CR>
