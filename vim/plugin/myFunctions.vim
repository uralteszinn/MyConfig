"command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
"function! s:RunShellCommand(cmdline)
  ""echo a:cmdline
  "let expanded_cmdline = a:cmdline
  "for part in split(a:cmdline, ' ')
     "if part[0] =~ '\v[%#<]'
        "let expanded_part = fnameescape(expand(part))
        "let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     "endif
  "endfor
  "botright new
  "setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  "call setline(1, 'You entered:    ' . a:cmdline)
  "call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  "call setline(3,substitute(getline(2),'.','=','g'))
  "execute '$read !'. expanded_cmdline
  "setlocal nomodifiable
  "1
"endfunction

function! JumpToPlaceHolder(placeholder)
    "Find the next placeholder
    let pos = search(a:placeholder)
    let column = col(".")
    if pos == 0 
        "If not found
        startinsert!
    else
        "If found
        let line = getline(pos)
        "Problem at the end of the line with the insert mode
        if column + len(a:placeholder) - 1 == len(line)
            startinsert!
        else
            startinsert
        endif
        "Remove placeholder
        call setline(pos, substitute(line, '\%>' . (column-1) . 'c' . a:placeholder, '', ''))
    endif
endfunction

function! DeleteAllPlaceHolders(placeholders)
    let l = line("$")
    "Iterate over all lines
    for i in range(1,l)
        "Get line
        let line = getline(i)
        "Remove all placeholders
        for placeholder in a:placeholders
            let line = substitute(line, placeholder, '', 'g')
        endfor
        "Set modified line
        call setline(i, line)
    endfor
    echo "All placeholders removed!"
endfunction


function! GetVimVariablesFromFile(path)
    let path = a:path
    if a:path == ''
        let path = expand('%:p')
    end
    let vars = {}
    for line in readfile(path)
        if line =~# '\m^\A*VIM:\s*\a*\s*=\s*\S'
            let matches = matchlist(line, '\m^\A*VIM:\s*\(\a*\)\s*=\s*\(\S.\{-}\)\s*$')
            call extend(vars, {matches[1]:matches[2]})
        end
    endfor
    return vars
endfunction

function! Template()
    if findfile("template." . &filetype, "/home/laurin/.vim/ftplugin/templates/") == ""
        echo "There is no template for this filetype!"
    else
        let saveCursor=getpos(".")
        execute "r /home/laurin/.vim/ftplugin/templates/template." . &filetype
        call setpos('.', saveCursor)
        normal dd
    endif
endfunction

function! CharacterUnderCursor(offset)
    if col('.')+a:offset >= 1 && col('.')+a:offset <= len(getline('.'))
        return matchstr(getline('.'), '\%' . (col('.')+a:offset) . 'c.')
    else
        echoerr "Offset to big!"
    end
endfunction

function! GetColumnsOfSurroundingWord()
    if CharacterUnderCursor(0) !~? '\w'
        echoerr "No Surrounding Word: Reposition the Cursor!"
    end
    let saveCursor = getcurpos()
    let lineLength = len(getline('.'))
    while col('.')!= 1 && CharacterUnderCursor(-1) =~? '\w'
        call cursor(line("."),col(".")-1)
    endwhile
    let colStart = col('.')
    call setpos('.', saveCursor)
    while col('.')!= lineLength && CharacterUnderCursor(1) =~? '\w'
        call cursor(line("."),col(".")+1)
    endwhile
    let colEnd = col('.')
    call setpos('.', saveCursor)
    return [colStart,colEnd]
endfunction

function! PutCursorOnAWordCharacter(direction)
    "direction: 1=forwards, -1=backwards
    if a:direction == 1
        let boundry = len(getline('.'))
    elseif a:direction == -1
        let boundry = 1
    else
        echoerr "Direction Variable has to be 1 or -1!"
    end
    while col('.') != boundry && CharacterUnderCursor(0) !~? '\w'
        call cursor(line("."),col(".")+a:direction)
    endwhile
endfunction

"returns the option, not index
function! MyInputList(prompt, options, displayedOptions, optionalInput)
    let displayedOptions = a:displayedOptions
    let res = ''
    if empty(displayedOptions)
        let displayedOptions = copy(a:options)
    end

    if len(a:options) != len(displayedOptions)
        echoerr '(ERROR) "options" and "displayedOptions" must have the same length!'
    else
        let displayedOptions = map(displayedOptions, '(v:key+1) . " -> " . v:val')
        call insert(displayedOptions, a:prompt . ':')
        let optionIndex = inputlist(displayedOptions)
        while optionIndex < 0 || optionIndex > len(a:options)+1
            redraw
            let optionIndex = inputlist(displayedOptions)
        endwhile
        if optionIndex == 0 || optionIndex == len(a:options)+1
            if a:optionalInput
                let res = input( '(CUSTOM INPUT) ' . a:prompt . ': ')
            end
        elseif optionIndex >= 1 && optionIndex <= len(a:options)
            let res = a:options[optionIndex-1]
        end
    end
    redraw
    return res
endfunction

function! Debug(str)
    let str = a:str
    if str =~ '^\s*$'
        let str = 'NO INPUT GIVEN (EMPTY STRING)'
    end
    call system('Xdialog --msgbox ''' . str . ''' 20 100')
endfunction

function! RegEscape(str)
    return '\V' . escape(a:str, '\')
endfunction

function! SubEscape(str)
    return escape(a:str, '~&\')
endfunction

function! SplitEscape(str)
    return escape(a:str, '\')
endfunction

function! RandomNumberString()
    return substitute(reltimestr(reltime()), '\.', '', '')
endfunction
