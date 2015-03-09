" Vim syntax file.
"
" Language:     Ace


" Clear out previous syntax rules.
syn clear

" Matchit support.
if exists("loaded_matchit") && !exists("b:match_words")
    let b:match_ignorecase = 0
    let b:match_words = '\<\%(begin\|class\|struct\|if\|for\|foreach\|case\|while\|try\|repeat\)\>'
    let b:match_words .= ':\<\%(elif\|else\|when\|catch\|finally\)\>:\<\%(end\|until\)\>'
endif

syn keyword aceStatement    begin break interface end return unset
syn keyword aceException    catch throw try finally
syn keyword aceStorageClass var private public static protected final pure
syn keyword aceStorageClass virtual inline
syn keyword aceStructure    struct class enum T property
syn keyword aceRepeat       for foreach in repeat until while do
syn keyword aceConditional  if elif else then case of when
syn keyword aceOperator     is isnot isa isnota new operator and or not
syn region  aceString       start=+"+  end=+"+ skip=+\\\\\|\\"+ contains=aceStringToken
syn region  aceString       start=+"""+  end=+"*"""+ skip=+\\\\\|\\"+ contains=aceStringToken
syn region  aceRawString    start=+r"+  end=+"+ contains=aceStringToken
syn region  aceRawString    start=+r"""+  end=+"*"""+ contains=aceStringToken
syn match   aceStringToken  contained "$\([0-9]\|{[0-9][0-9]*}\)"
syn match   aceStringToken  contained "<<[^>]*>>"
syn match   aceStringToken  contained "\\[0-7][0-7][0-7]\=\|\\x..\|\\u....\|\\w........\|\\."
syn keyword aceFunction     function procedure
syn keyword aceInclude      autoimport import global
syn keyword aceBoolean      true false
syn keyword aceConstant     null
syn match   aceComment      "#.*$" contains=aceTodo
syn region  aceComment      start="(\*"  end="\*)" contains=aceTodo
syn keyword aceTodo         contained TODO FIXME XXX HERE
syn match   aceNumber       "[+-]\=\<[0-9]\+\(\.[0-9]\+\(e[-+]\=[0-9]\+\)\=\)\="
syn match   aceNumber       "[+-]\=\<0x[0-9a-fA-F]\+"
syn match   aceType         "\<[A-Z][a-zA-Z0-9_]*\>"
syn match   aceFunction     "\<[a-z][a-zA-Z0-9_]*\>("me=e-1

" Ace documentation rules.
syn region  aceDoc          start="(\*@"  end="\*)" contains=aceTodo,aceDocKeyword,aceDocSpecial,aceDocError
syn match   aceDocKeyword   contained "@[a-zA-Z0-9_]\+\(:[^ ]\+\)\="
syn region  aceDocKeyword   contained start="@[a-zA-Z0-9_]\+(" skip="@[()]\|()" end=")" contains=aceDocKeyword,aceDocSpecial,aceDocError
syn match   aceDocSpecial   contained "@("
syn match   aceDocSpecial   contained "@)"
syn match   aceDocSpecial   contained "@@"
syn match   aceDocError     contained "@[^a-zA-Z0-0_()@]"me=e-1

" Catch errors caused by wrong parenthesis (modified from c.vim)
syn region aceParen             transparent start='(' end=')' contains=ALLBUT,aceParenError,aceTodo,aceStringToken
syn match aceParenError         ")"


syn sync lines=500


if !exists("did_ace_syntax_inits")
    let did_ace_syntax_inits = 1
    hi link aceString       String
    hi link aceStringToken  String
    hi link aceStatement    Statement
    hi link aceException    Exception
    hi link aceType         Type
    hi link aceStorageClass StorageClass
    hi link aceConditional  Conditional
    hi link aceRepeat       Repeat
    hi link aceRawString    String
    hi link aceOperator     Operator
    hi link aceFunction     Function
    hi link aceStructure    Structure
    hi link aceInclude      Include
    hi link aceBoolean      Boolean
    hi link aceConstant     Constant
    hi link aceNumber       Number
    hi link aceComment      Comment
    hi link aceIdentifier   Identifier
    hi link aceTodo         Todo
    hi link aceError        Error
    hi link aceParenError   aceError
    hi link aceDoc          String
    hi link aceDocKeyword   Comment
    hi link aceDocSpecial   Comment
    hi link aceDocError     Error
endif


let b:current_syntax = "ace"


" [[ and ]] for Ace
map [[ ?^\(begin\\|class\\|struct\\|interface\)<CR>
map ]] /^\(begin\\|class\\|struct\\|interface\)<CR>
map [] ?^end<CR>
set keywordprg=ttace\ -i\ AllLibraries\ -k
set smartindent
set cinwords=begin,catch,class,elif,else,finally,for,foreach,if,struct,try,while
set cinoptions=(0u0
set comments+=b:#!
inoremap # X#


" vim: ts=8
