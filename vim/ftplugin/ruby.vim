function! Environment()
    set paste

    let line = getline(".")
    let indent = matchstr(line, "^ *")
    let tsindent = repeat(" ", &tabstop)
    let name = matchstr(line, "[^ ].*$")

    let lineNr = line(".")

    let setCursor = 1

    if name == "" 
        "call setline(lineNr, indent . '\begin{align*}')
        "call append(lineNr, indent . tsindent)
        "call append(lineNr+1, indent . '\end{align*}<++>' )
    elseif name == "describe"
        call setline(lineNr, indent . 'describe "" do')
        call append(lineNr, indent . tsindent . '<++>')
        call append(lineNr+1, indent . 'end<++>' )
        call cursor(lineNr, len(indent)+len('describe "')+1)
        startinsert
    elseif name == "let"
        call setline(lineNr, indent . 'let(:) { <++> }<++>')
        call cursor(lineNr, len(indent)+len("let(:")+1)
        startinsert
    elseif name == "it {"
        call setline(lineNr, indent . 'it {  }<++>')
        call cursor(lineNr, len(indent)+len("it { ")+1)
        startinsert
    elseif name == "it do"
        call setline(lineNr, indent . 'it "" do')
        call append(lineNr, indent . tsindent . '<++>')
        call append(lineNr+1, indent . 'end<++>' )
        call cursor(lineNr, len(indent)+len('it "')+1)
        startinsert
    else
        let opts = input("Variable: ")
        call setline(lineNr, indent .  name . ' do ' . opts)
        call append(lineNr, indent . tsindent)
        call append(lineNr+1, indent . 'end<++>' )
        call cursor(lineNr+1, len(getline(".")))
        startinsert!
    end

    set nopaste
endfunction


noremap <F5> :call Environment()<CR>
imap <F5> a<BS><C-o><ESC><ESC><F5>
