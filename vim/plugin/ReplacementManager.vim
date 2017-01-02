" <<VIM:KEYWORD>>
" <<VIM:KEYWORD|Number|Prompt|Important|Optional Before|Optional After>>
" <<VIM:KEYWORD|Number>>     (if Number already occured, input is taken from there)
"
" <<VIM:NOWHITESPACEPART>    (if present removes the whitespacepart in this line)
" <<VIM:NOBEFOREPART>        (if present removes the beforepart in this line)
" <<VIM:NOAFTERPART>         (if present removes the afterpart in the firstline)
"
" <<VIM:TAB>                 (inserts a bunch of spaces)
" <<VIM:EMPTY>               (inserts nothing - in particularly usefull for empty lines)
" <<VIM:NAME>                (inserts the trigger word)
" <<VIM:RANDOM>              (inserts a random number)
" <<VIM:FILEPATH>            (insert current file path)
" <<VIM:FILENAME>            (insert current file name)
" <<VIM:FILENAMEEXTENSION>   (insert current file name extension)
" <<VIM:FILENAMENOEXTENSION> (insert current file name without extension)
" <<VIM:DIRPATH>             (insert containing directory path)
"
" <<VIM:INPUT|Number|Prompt|Optional Initial Text|Optional Before|Optional After>>
" <<VIM:FILEINPUT|Number|Prompt|Optional Intial Path|Optional Before|Optional After>>
" <<VIM:DIRINPUT|Number|Prompt|Optional Intial Path|Optional Before|Optional After>>
" <<VIM:CHOICE|Number|Prompt|Default,Alternative|Optional Before|Optional After>>
" <<VIM:OPTION|Number|Prompt|Option List Separated With Commas|Optional Before|Optional After|Optional Option Naming List Separated With Commas>>
"
" <++>                       (first occurence is the cursor position)
"
let g:repMan = {}
let g:repMan.delimL   = '<<VIM:'
let g:repMan.delimR   = '>>'
let g:repMan.sep      = '|'
let g:repMan.opsep    = ','

function! ReplacementManager(repMan,placeholder)
    set paste
    let saveCursor = getcurpos()
    let tsindent = repeat(" ", &tabstop)
    let currentLine = getline('.')
    let alternativePlaceholder = repeat(a:placeholder,2)
    try 
        call PutCursorOnAWordCharacter(-1)
        let boundries = GetColumnsOfSurroundingWord()
        if boundries[0] == 1
            let whitespacePart = ""
            let beforePart = ""
        else 
            let whitespacePart = matchstr(currentLine[:boundries[0]-2],'\v^\s*')
            let beforePart = currentLine[match(currentLine[:boundries[0]-2],'\V\S'):boundries[0]-2]
        end
        let namePart = currentLine[boundries[0]-1:boundries[1]-1]
        if boundries[1] == len(currentLine)
            let afterPart = ""
        else
            let afterPart = currentLine[boundries[1]:]
        end
    catch
        call setpos('.',saveCursor)
        let whitespacePart = matchstr(currentLine[:col('.')-1],'\v^\s*')
        if len(whitespacePart)!=len(currentLine[:col('.')-1])
            let beforePart = currentLine[match(currentLine[:col('.')],'\V\S'):col('.')-1]
        else
            let beforePart = ""
        end
        let namePart = "defaultNoName"
        let afterPart = currentLine[col('.'):]
    endtry
    let replacee = []
    let defaultReplacee = []
    let collectReplacee = 0
    let collectDefaultReplacee = 0
    let inputs = {}
    for line in readfile('/home/laurin/.vim/ftplugin/replacements/replacements.' . &filetype )
        if line =~# '\v^\s*$'
            let collectReplacee = 0
            let collectDefaultReplacee = 0
        end
        if collectReplacee || collectDefaultReplacee
            let tmpLine = line
            let tmpLine = substitute(tmpLine, a:placeholder, alternativePlaceholder, 'g')

            if line !~# RegEscape(a:repMan.delimL . 'NOAFTERPART' . a:repMan.delimR)
                if firstline
                    let tmpLine = tmpLine . afterPart
                end
            else 
                let tmpLine = substitute(tmpLine, RegEscape(a:repMan.delimL . 'NOAFTERPART' . a:repMan.delimR), SubEscape(''), 'g')
            end

            if line !~# RegEscape(a:repMan.delimL . 'NOBEFOREPART' . a:repMan.delimR)
                if firstline
                    let tmpLine = beforePart . tmpLine
                else
                    let tmpLine = repeat(" ", len(beforePart)) . tmpLine
                end
            else 
                let tmpLine = substitute(tmpLine, RegEscape(a:repMan.delimL . 'NOBEFOREPART' . a:repMan.delimR), SubEscape(''), 'g')
            end

            if line !~# RegEscape(a:repMan.delimL . 'NOWHITESPACEPART' . a:repMan.delimR)
                let tmpLine = whitespacePart . tmpLine
            else 
                let tmpLine = substitute(tmpLine, RegEscape(a:repMan.delimL . 'NOWHITESPACEPART' . a:repMan.delimR), SubEscape(''), 'g')
            end

            while tmpLine =~# RegEscape(a:repMan.delimL) . '\m.\{-}' . RegEscape(a:repMan.delimR)
                let matches = matchlist(tmpLine, RegEscape(a:repMan.delimL) . '\m\(.\{-}\)' . RegEscape(a:repMan.delimR))
                let splits = split(matches[1], SplitEscape(a:repMan.sep), 1)
                let substitutePatterns = []
                let substituteWith     = ''
                if empty(splits)
                    call add(substitutePatterns, RegEscape(matches[0])) 
                else    
                    if len(splits) == 1
                        call add(substitutePatterns, RegEscape(a:repMan.delimL . splits[0] . a:repMan.delimR))
                        if splits[0] == 'EMPTY'
                            let substituteWith = ''
                        elseif splits[0] == 'TAB'
                            let substituteWith = tsindent
                        elseif splits[0] == 'NAME'
                            let substituteWith = namePart
                        elseif splits[0] == 'RANDOM'
                            let substituteWith = RandomNumberString()
                        elseif splits[0] == 'FILEPATH'
                            let substituteWith = expand('%:p')
                        elseif splits[0] == 'FILENAME'
                            let substituteWith = expand('%:p:t')
                        elseif splits[0] == 'FILENAMENOEXTENSION'
                            let substituteWith = expand('%:p:t:r')
                        elseif splits[0] == 'FILENAMEEXTENSION'
                            let substituteWith = expand('%:p:e')
                        elseif splits[0] == 'DIRPATH'
                            let substituteWith = expand('%:p:h')
                        else
                            echoerr '(ERROR) No Keyword matches for "' . splits[0] . '"!'
                        end
                    else
                        call add(substitutePatterns, RegEscape(a:repMan.delimL . splits[0] . a:repMan.sep . splits[1] . a:repMan.delimR))
                        call add(substitutePatterns, RegEscape(a:repMan.delimL . splits[0] . a:repMan.sep . splits[1] . a:repMan.sep) . '\m.\{-}' . RegEscape(a:repMan.delimR))
                        if !has_key(inputs, splits[0])
                            let inputs[splits[0]] = {}
                        end
                        if has_key(inputs[splits[0]], splits[1])
                            let substituteWith = inputs[splits[0]][splits[1]]
                        else
                            if len(splits) == 2 
                                echoerr '(ERROR) No Prompt has been given'
                            end
                            if len(splits) == 3
                                call add(splits, '')
                            end
                            if splits[0] == 'INPUT'
                                let substituteWith = input(splits[2] . ': ', splits[3])
                            elseif splits[0] == 'FILEINPUT'
                                if splits[3] == ''
                                    let splits[3] == expand('%:p')
                                end
                                let substituteWith = input('(File completion: ON) ' . splits[2] . ': ', splits[3], 'file')
                            elseif splits[0] == 'DIRINPUT'
                                if splits[3] == ''
                                    let splits[3] == expand('%:p:h')
                                end
                                let substituteWith = input('(Directory completion: ON) ' . splits[2] . ': ', splits[3], 'dir')
                            elseif splits[0] == 'CHOICE'
                                let choices = split(splits[3], a:repMan.opsep, 1)
                                if len(choices) == 2
                                    if input(splits[2] . " [Y/n] ") !~? '\m\s*n\s*'
                                        let substituteWith = choices[0]
                                    else
                                        let substituteWith = choices[1]
                                    end
                                else
                                    echoerr '(ERROR) You have to provide exactly two choices separated by a comma. The first one is the default one and the second the alternative!'
                                end
                            elseif splits[0] == 'OPTION' || splits[0] == 'OPTIONINPUT'
                                let options = split(splits[3], a:repMan.opsep, 1)
                                let displayedOptions = copy(options)
                                if len(splits) == 7
                                    let displayedOptions = split(splits[6], a:repMan.opsep, 1)
                                end
                                if splits[0] == 'OPTION'
                                    let substituteWith = MyInputList(splits[2], options, displayedOptions, 0)
                                else
                                    let substituteWith = MyInputList(splits[2], options, displayedOptions, 1)
                                end
                            else
                                echoerr '(ERROR) No Keyword matches for "' . splits[0] . '"!' 
                            end
                            if substituteWith != ''
                                if len(splits) >= 5
                                    let substituteWith = splits[4] . substituteWith
                                end
                                if len(splits) >= 6
                                    let substituteWith = substituteWith . splits[5]
                                end
                            end
                            let inputs[splits[0]][splits[1]] = substituteWith
                        end
                    end
                end
                for pat in substitutePatterns
                    let tmpLine = substitute(tmpLine, pat, SubEscape(substituteWith), 'g')
                endfor
            endwhile

            if firstline
                let firstline = 0
            end
            if collectDefaultReplacee
                call add(defaultReplacee, tmpLine)
            elseif collectReplacee
                call add(replacee, tmpLine)
            end
        end
        if line =~# '\m^\s*::' . namePart . '\m::\s*$'
            let collectReplacee = 1
            let firstline = 1
        end
        if line =~# '\m::defaultName::'
            let collectDefaultReplacee = 1
            let firstline = 1
        end
    endfor
    if len(replacee)==0
        let replacee = defaultReplacee
    end
    if len(replacee)>0
        let CursorIndex = match(replacee, RegEscape(alternativePlaceholder))
        let CursorLine = 0
        let CursorCol = 0
        let appendStartInsert = 0
        if CursorIndex != -1
            let CursorLine = line('.') + CursorIndex
            let CursorCol = match(replacee[CursorIndex], RegEscape(alternativePlaceholder))+1
            if replacee[CursorIndex][CursorCol-1:] =~# '\m^' . RegEscape(alternativePlaceholder) . '\m\s*$'
                let appendStartInsert = 1
            end
            let replacee[CursorIndex] = substitute(replacee[CursorIndex], RegEscape(alternativePlaceholder), SubEscape(''), '' )
        end
        call map(replacee, 'substitute(v:val, alternativePlaceholder, a:placeholder, "g")')
        call setline('.',replacee[0])
        call append('.',replacee[1:])
        if CursorIndex != -1
            call cursor(CursorLine, CursorCol)
            if appendStartInsert
                startinsert!
            else
                startinsert
            end
        end
    else
        echoerr "(ERROR) No Replacee found"
    end
    set nopaste
endfunction
