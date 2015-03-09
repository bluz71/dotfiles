" Vim syntax file.
"
" Language:     DDM


" Clear out previous syntax rules.
syn clear


syn region  ddmString       start=+"+  end=+"+ skip=+\\\\\|\\"+
syn region  ddmString       start=+'+  end=+'+ skip=+\\\\\|\\'+
syn match   ddmComment      "#.*$"
syn match   ddmComment      '#.*$'
syn keyword ddmStatement    database databases entity field fields set sets
syn keyword ddmStatement    info operator operators trigger
syn keyword ddmStatement    local formatter client server load properties
syn keyword ddmStatement    index indexes structure structures
syn keyword ddmStatement    binding bindings
syn keyword ddmStorageClass start drop create drain schema modify
syn keyword ddmStructure    record query element
syn keyword ddmStructure    sort class inverted ccl default attribute
syn keyword ddmIdentifier   name description ace xpath
syn keyword ddmType         SgmlDocument SgmlNode UniSgmlDocument
syn keyword ddmType         UniSgmlNode String UniString DateTime Integer
syn keyword ddmType         Float Boolean Marc Recstruct
syn keyword ddmConstant     cwd
syn keyword ddmBoolean      true false
syn match   ddmNumber       "[+-]\=\<[0-9]\+\(\.[0-9]\+\(e[-+]\=[0-9]\+\)\=\)\="


syn sync lines=500


if !exists("did_ddm_syntax_inits")
  let did_ddm_syntax_inits = 1
  hi link ddmString       String
  hi link ddmStatement    Statement
  hi link ddmType         Type
  hi link ddmStructure    Structure
  hi link ddmStorageClass StorageClass
  hi link ddmBoolean      Boolean
  hi link ddmConstant     Constant
  hi link ddmNumber       Number
  hi link ddmComment      Comment
  hi link ddmIdentifier   Identifier
endif


let b:current_syntax = "ddm"


inoremap # X#
set shiftwidth=2


" vim: ts=8
