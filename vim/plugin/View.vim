function! View(minimalOutput)
    "Get Vim Variables
    let VimVars = GetVimVariablesFromFile(expand('%:p'))
    "Check if there is compile-information
    if has_key(VimVars, 'ViewCommand')
        echo "Viewing..."
        "execute extracted command
        silent let output = system(VimVars.ViewCommand)
        "on error display error message
        if v:shell_error
            let lines = split(output, '\n')
            "display as much lines of the error message as the screen can display or at
            "least the value of a:minimalOutput
            let nrLines = len(lines)
            let lower   = max([0, nrLines - max([a:minimalOutput, winheight(0)])])
            let upper   = nrLines - 1
            "show all output if minimalOutput is -1
            if a:minimalOutput ==-1
                let lower = 0
            endif
            "Put the lines out
            redraw
            echo join(lines[lower : upper],"\n")
        else
            redraw
            echo "Successfully viewed!"
        endif
    else
        echo 'No Configuration for Viewing found!'
    endif
endfunction
