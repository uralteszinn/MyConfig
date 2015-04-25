function! Execute()
    "Get Vim Variables
    let VimVars = GetVimVariablesFromFile(expand('%:p'))
    "Check if there is compile-information
    if has_key(VimVars, 'ExecuteCommand')
        echo "Executing..."
        "change directory
        if has_key(VimVars, 'ExecuteDirectory')
            silent execute 'cd' fnameescape(VimVars.ExecuteDirectory)
        end
        "execute extracted command
        execute '!' . VimVars.ExecuteCommand 
        "Go back to the previous current working directory
        if has_key(VimVars, 'ExecuteDirectory')
            silent execute 'cd -'
        end
    else
        echo 'No Configuration for Executing found!'
    endif
endfunction
