nnoremap go :MRU<CR>
nnoremap gw :<C-u>w<CR>
nnoremap gt :<C-u>PrjTree


nmap m <Plug>(MyVimrc-SkipTerm-Inc)
nmap M <Plug>(MyVimrc-SkipTerm-Dec)

"x nmap J <Plug>(MyVimrc-SkipTerm-Inc)
"x nmap K <Plug>(MyVimrc-SkipTerm-Dec)

nmap L <Plug>(MyVimrc-SkipTerm-Inc)
nmap H <Plug>(MyVimrc-SkipTerm-Dec)

"x nmap <Space> <Plug>(MyVimrc-SkipTerm-Inc)
"x nmap K       <Plug>(MyVimrc-SkipTerm-Dec)

"x nmap <C-n> <Plug>(MyVimrc-SkipTerm-Inc)
"x nmap <C-p> <Plug>(MyVimrc-SkipTerm-Dec)

nmap l <Plug>(MyVimrc-SkipTerm-Inc)
nmap h <Plug>(MyVimrc-SkipTerm-Dec)


nnoremap gl l
nnoremap gh h

let g:submode_timeoutlen = 5000

call submode#enter_with('cursor', 'n', '', 'gh', 'h')
"call submode#enter_with('cursor', 'n', '', 'gj', 'j')
"call submode#enter_with('cursor', 'n', '', 'gk', 'k')
call submode#enter_with('cursor', 'n', '', 'gl', 'l')
call submode#map('cursor', 'n', '', 'h', 'h')
"call submode#map('cursor', 'n', '', 'j', 'j')
"call submode#map('cursor', 'n', '', 'k', 'k')
call submode#map('cursor', 'n', '', 'l', 'l')


"nnoremap w w
"nnoremap W b
"nnoremap e e
"nnoremap E ge




nnoremap gM M
nnoremap gH H
nnoremap gL L
