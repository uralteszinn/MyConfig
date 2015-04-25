colorscheme mine
set guioptions-=m
set guioptions-=T
set guioptions-=r
set gfn=BitStream\ Vera\ Sans\ Mono\ 10

syntax enable

"Line Numbers
set number

"Beeping
set visualbell t_vb=

"Indentation
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set scrolloff=12
set showbreak=~~~>\ 

"Search
set nohlsearch
set incsearch
set smartcase
set ignorecase

let mapleader="ә"

"Dictionary
set dictionary+=/home/laurin/.vim/dictionaries/tex.dict

"Filetype Plugin
filetype on
filetype plugin on
filetype indent on
let g:tex_flavor='latex'

"Tab Completion
"set complete+=k
"set completeopt+=longest
set completeopt-=menu

let g:vimDirectory = expand('%:p:h') . '/.vim'

let g:SuperTabDefaultCompletionType = "context"

let g:placeholders = [ "<++>" , '\[++\]' ]
let g:placeholder = '<++>'

noremap gi gt
noremap gh gT

function! IndentAdjustment()
    set paste
    let oldTabstop = input("Old Tabstop Length: ")
    let newTabstop = input("New Tabstop Length: ")
    let nrOfLines = line('$')
    let lineNr = 0

    while lineNr < nrOfLines
        let lineNr += 1
        let line = getline(lineNr)
        let indent = matchstr(line, "^ *")
        let indentLength = strlen(indent)
        let rest = line[indentLength :]
        call setline(lineNr, repeat(" ",indentLength / oldTabstop * newTabstop) . rest)
    endwhile
    set nopaste
endfunction
