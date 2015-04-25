::template::
#include <iostream>
using namespace std;
<<VIM:EMPTY>>
int main() {
<<VIM:TAB>><++>
} 

::for::
for (<++>; <++>; <++>) {
<<VIM:TAB>><++>
} <++>

::if::
if (<++>) {
<<VIM:TAB>><++>
} <++>

::ifelse::
if (<++>) {
<<VIM:TAB>><++>
} else {
<<VIM:TAB>><++>
} <++>

::insertVIM::
// VIM: CompileDirectory = <<VIM:DIRPATH>>
// VIM: CompileCommand = g++ '<<VIM:FILEPATH>>'
