inoremap () ()<++><ESC>?(<CR>a
inoremap [] []<++><ESC>?[<CR>a
inoremap {} {}<++><ESC>?{<CR>a
inoremap {<CR> {<CR><++><CR>} <++><ESC>k^c$

inoremap `f<CR> for(  ; <++> ; <++> ) {<CR><++><CR><ESC><<i}<++><ESC>?  ;<CR>a
inoremap `f<SPACE> for(  ; <++> ; <++> ) { <++> }<++><ESC>?  ;<CR>a
inoremap `w<CR> while(  ) {<CR><++><CR><ESC><<i}<++><ESC>?  )<CR>a
inoremap `w<SPACE> while(  ) { <++> }<++><ESC>?  )<CR>a
inoremap `d<CR> do {<CR><CR><ESC><<i} while( <++> );<++><ESC>kA  
inoremap `d<SPACE> do {  } while( <++> );<++><ESC>?  }<CR>a
inoremap `i<CR> if(  ) {<CR><++><CR><ESC><<i}<++><ESC>?  )<CR>a
inoremap `i<SPACE> if(  ) <++>;<++><ESC>?  )<CR>a
inoremap `ei<CR> <SPACE>else if(  ) {<CR><++><CR><ESC><<i}<++><ESC>?  )<CR>a
inoremap `ei<SPACE> <SPACE>else if(  ) <++>;<++><ESC>?  )<CR>a
inoremap `ee<CR> <SPACE>else {<CR><CR><ESC><<i}<++><ESC>kA  
inoremap `ee<SPACE> <SPACE>else ;<++><ESC>? ;<CR>a
inoremap `s switch(  ) {<CR>case <++>:<CR><++><CR>default:<CR><++><ESC><<A<CR><ESC><<i} <++><ESC>?  )<CR>a
inoremap `c <CR>case wc:<CR><++><ESC>? wc:<CR>l2xi

"inoremap = <SPACE>=<SPACE>
"inoremap + <SPACE>+<SPACE>
"inoremap - <SPACE>-<SPACE>
"inoremap * <SPACE>*<SPACE>
"inoremap / <SPACE>/<SPACE>
"inoremap % <SPACE>%<SPACE>

"inoremap < <SPACE><<SPACE>
"inoremap > <SPACE>><SPACE>
"inoremap == <SPACE>==<SPACE>
"inoremap <= <SPACE><=<SPACE>
"inoremap >= <SPACE>>=<SPACE>
"inoremap != <SPACE>!=<SPACE>

"inoremap & <SPACE>&<SPACE>
"inoremap \| <SPACE>\|<SPACE>
"inoremap ^ <SPACE>^<SPACE>
"inoremap << <SPACE><<<SPACE>
"inoremap >> <SPACE>>><SPACE>
"inoremap && <SPACE>&&<SPACE>
"inoremap \|\| <SPACE>\|\|<SPACE>

"inoremap ++ ++
"inoremap -- --
"inoremap += <SPACE>+=<SPACE>
"inoremap -= <SPACE>-=<SPACE>
"inoremap *= <SPACE>*=<SPACE>
"inoremap /= <SPACE>/=<SPACE>
"inoremap %= <SPACE>%=<SPACE>

"inoremap <<= <SPACE><<=<SPACE>
"inoremap >>= <SPACE>>>=<SPACE>
"inoremap &= <SPACE>&=<SPACE>
"inoremap \|= <SPACE>\|=<SPACE>
"inoremap ^= <SPACE>^=<SPACE>
