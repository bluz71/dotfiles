" Vim syntax file.
"
" Language: C++
"
" Add highlighting for functions and certain TeraText specific scalar types.

runtime! syntax/cpp.vim


syn match cppCustomParen   "(" contains=cParen contains=cCppParen
syn match cppCustomFunc    "\w\+\s*(" contains=cppCustomParen
syn match cppCustomScope   "::"
syn match cppCustomClass   "\w\+\s*::" contains=cppCustomScope

hi def link cppCustomFunc  Function
hi def link cppCustomClass cppStructure

syn keyword cType          byte int8 uint8 int16 uint16 int32 uint32
syn keyword cType          int64 uint64
