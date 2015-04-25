noremap <F1> :call Compile(20)<CR>
map! <F1> <ESC><F1>
noremap <S-F1> :call Compile(-1)<CR>
map! <S-F1> <ESC><F1>
noremap <F2> :call Execute<CR>
map! <F2> <ESC><F2>
noremap <F3> :call View(20)<CR>
map! <F3> <ESC><F3>
map <F4> <Leader>c<SPACE>
imap <F4> <ESC><F4>
noremap <silent> <F5> :call ReplacementManager(g:repMan, g:placeholder)<CR>
imap <silent> <F5> a<BS><C-o><ESC><ESC><F5>
noremap <silent> ш :call ReplacementManager(g:repMan, g:placeholder)<CR>
imap <silent> ш a<BS><C-o><ESC><ESC><F5>
noremap <F6> :call DeleteAllPlaceHolders(g:placeholders)<CR>
imap <F6> <ESC><F6>

noremap <F12> :call Template()<CR>
map! <F12> <ESC><F12>

noremap <S-CR> :call JumpToPlaceHolder(g:placeholders[0])<CR>
map! <S-CR> <ESC><ESC><S-CR>
noremap <C-CR> :call JumpToPlaceHolder(g:placeholders[1])<CR>
map! <C-CR> <ESC><ESC><C-CR>
