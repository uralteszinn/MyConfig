function! Environment()
    set paste

    let line = getline(".")
    let indent = matchstr(line, "^ *")
    let tsindent = repeat(" ", &tabstop)
    let name = matchstr(line, "[^ ].*$")

    let lineNr = line(".")

    let setCursor = 1

    if name == "" || name == "align*"
        call setline(lineNr, indent . '\begin{align*}')
        call append(lineNr, indent . tsindent)
        call append(lineNr+1, indent . '\end{align*}<++>' )
    elseif name == "description"
        call setline(lineNr, indent . '\begin{description}')
        call append(lineNr, indent . tsindent . '\item[] <++>')
        call append(lineNr+1, indent . '\end{description}<++>' )
        let setCursor = 0
        call cursor(lineNr+1, len(indent)+&tabstop+7)
        startinsert
    elseif name == "itemize" || name == "enumerate"
        call setline(lineNr, indent . '\begin{' . name . '}')
        call append(lineNr, indent . tsindent . '\item ')
        call append(lineNr+1, indent . '\end{' . name . '}<++>' )
    elseif name == 'part' || name == 'chapter' || name == 'section' || name == 'subsection' || name == 'subsubsection' || name == 'paragraph' || name == 'subparagraph'
        let text = input(name . " text: ")
        call setline(lineNr, indent . '\' . name . '{' . text . '}')
        let setCursor = 0
        call cursor(lineNr, len(indent)+len(name)+len(text)+4)
        startinsert!
    else
        let opts = input("Options: ")
        call setline(lineNr, indent . '\begin{' . name . '}' . opts)
        call append(lineNr, indent . tsindent)
        call append(lineNr+1, indent . '\end{' . name . '}<++>' )
    end

    if setCursor
        call cursor(lineNr+1, len(getline(".")))
        startinsert!
    end

    set nopaste
endfunction

function! InlineEnvironment()
    set paste

    let saveCursorOriginal = getcurpos()
    let 

    "let saveCursorOriginal = getcurpos()
    "let charUnderCursor = matchstr(getline('.'), '\%' . col('.') . 'c.')
    "while line(".")>1 && col(".")>1 && charUnderCursor !~? '\a'
        "execute "normal b"
        "let charUnderCursor = matchstr(getline('.'), '\%' . col('.') . 'c.')
    "endwhile
    "if charUnderCursor !~? '\a'
        "call setpos('.', saveCursorOriginal)
        "echo "Which word do you mean? Reposition the Cursor please!"
    "else
        "let name = expand("<cword>")
        "let oldCol = col(".")
        "let oldLine = line(".")
        "execute "normal b"
        "if name != expand("<cword>") || line(".") != oldLine ||  oldCol-col(".")>len(name)
            "execute "normal w"
        "end
        "execute "normal ia"
    "end


    "if name =~? '\a\+'
        "let continue = 1
    "else
        "execute "normal b"
        "let name = expand("<cword>")
        "echo name
        "if name =~? '\a\+'
            "let text = input("Do you want to expand '" . name . "': (Y/n)")
            "if text != "n"
                "let continue = 1
            "end
        "end
    "end
    "if continue == 0
        "call setpos('.', saveCursor)
        "echo "Which word do you mean? Reposition the Cursor please!"
    "else
        "echo name
    "end
    set nopaste
endfunction

