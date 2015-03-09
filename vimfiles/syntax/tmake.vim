" Vim syntax file.
"
" Language:     tmake


" Clear out previous syntax rules.
syn clear


" Directives.
syn match tmakePreCondit "^\s*\(ifset\>\|elifset\>\|elifdef\>\|else\>\|endif\>\|ifnset\>\|ifdef\>\|ifndef\)"
syn match tmakeInclude   "^\s*include"
syn match tmakeStatement "^\s*set"
syn match tmakeStatement "^\s*for"
syn match tmakeStatement "^\s*define"
syn match tmakeStatement "^\s*enddef"
syn match tmakeStatement "^\s*{"
syn match tmakeStatement "^\s*}"
syn match tmakeOverride  "^\s*override"
hi link tmakeOverride tmakeStatement


" Targets.
syn match tmakeSpecTarget "^\.SUFFIXES"
syn match tmakeSpecTarget "^\.PHONY"
syn match tmakeSpecTarget "^\.DEFAULT"
syn match tmakeSpecTarget "^\.PRECIOUS"
syn match tmakeSpecTarget "^\.IGNORE"
syn match tmakeSpecTarget "^\.SILENT"
syn match tmakeSpecTarget "^\.EXPORT_ALL_VARIABLES"
syn match tmakeSpecTarget "^\.KEEP_STATE"
syn match tmakeImplicit   "^\.\w*\.\w*\s*:[^=]"me=e-2
syn match tmakeImplicit   "^\.\w*\.\w*\s*:$"me=e-1
syn match tmakeTarget     "^\w[A-Za-z0-9_./\t ]*:[^=]"me=e-2
syn match tmakeTarget     "^\w[A-Za-z0-9_./\t ]*:$"me=e-1


" Special characters.
syn match tmakeSpecial    "^\s*[@-][@-]*"
syn match tmakeNextLine   "\\$"

" Identifiers.
syn match tmakeIdent      "<[A-Za-z0-9_]*>" contains=tmakeStatement
syn match tmakeIdent      "\$([^)]*)" contains=tmakeStatement
syn match tmakeIdent      "\$\$[A-Za-z0-9_]*"
syn match tmakeIdent      "\$[^({]"
syn match tmakeIdent      "\${[^}]*}"
syn match tmakeIdent      "[A-Za-z][A-Za-z0-9_]*[ \t]*[:+?!]="me=e-2
syn match tmakeIdent      "[A-Za-z][A-Za-z0-9_]*[ \t]*="me=e-1
syn match tmakeIdent      "%"
syn match tmakeMacro      "[A-Za-z][A-Za-z0-9_]*("me=e-1

" Comment.
syn match  tmakeComment   "#.*$"

" Match escaped quotes, $ and any other escaped character
" The escaped char is not highlightet currently
syn match tmakeEscapedChar      "\\."

syn region  tmakeDString start=+"+  skip=+\\"+  end=+"+  contains=tmakeIdent
syn region  tmakeSString start=+'+  skip=+\\'+  end=+'+  contains=tmakeIdent
syn region  tmakeBString start=+`+  skip=+\\`+  end=+`+  contains=tmakeIdent,tmakeSString,tmakeDString,tmakeNextLine


if !exists("did_tmakefile_syntax_inits")
    let did_tmakefile_syntax_inits = 1
    hi link tmakeNextLine   tmakeSpecial
    hi link tmakeSpecTarget Statement
    hi link tmakeImplicit   Function
    hi link tmakeTarget     Function
    hi link tmakeInclude    Include
    hi link tmakePreCondit  PreCondit
    hi link tmakeStatement  Statement
    hi link tmakeIdent      Identifier
    hi link tmakeSpecial    Special
    hi link tmakeComment    Comment
    hi link tmakeDString    String
    hi link tmakeSString    String
    hi link tmakeBString    Function
    hi link tmakeMacro      Function
endif


let b:current_syntax = "tmake"


" vim: ts=8
