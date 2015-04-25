let compiler="pdflatex"
let compile_check="documentclass"
let viewer="evince"
let view_format="pdf"

"let g:replacementManagerSettings.leftDelimiter = '<'
"let g:replacementManagerSettings.rightDelimiter = '>'

noremap <F6> :call Environment()<CR>
imap <F6> a<BS><C-o><ESC><ESC><F6>

"noremap <F7> :call ReplacementManager()<CR>
"imap <F7> a<BS><C-o><ESC><ESC><F7>

"noremap <F7> bi\<ESC>e
"imap <F7> <ESC><F7>a
