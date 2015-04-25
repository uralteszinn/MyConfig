set cindent

let compiler = "g++ -o %:r"
let compile_check = "main"
"noremap <F2> :!clear; ./%:r <CR>
"imap <F2> <ESC><F2>

noremap <F11> :call SaveCursor()<CR>:%s/ \+\([+-\/*%^&!=<>\|]\+\) \+/ \1 /g<CR> :call SetCursor()<CR>
imap <F11> <ESC><F11>
