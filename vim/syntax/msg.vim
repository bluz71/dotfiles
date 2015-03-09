" Vim syntax file.
"
" Language:     TeraText Error Message Files
" Maintaner:    Andrew Dunn
" Last change:  16 April 2014.


" Clear out previous syntax rules.
syn clear

syn match ttMsgSpace    ' ' contained
syn match ttMsgBadItem  '[EWM]\d\+ *' contains=ttMsgSpace
syn match ttMsgError    '^E\d\+\t' contained
syn match ttMsgWarning  '^W\d\+\t' contained
syn match ttMsgInfo     '^M\d\+\t' contained
syn match ttMsgEscape   '\\$' contained
syn match ttMsgSubId    '\$\d\+' contained
syn match ttMsgSubIdNum '\d\+' containedin=ttMsgSubId contained
syn match ttMsgKeyName  '[A-Za-z][A-Za-z0-9]\{-}' contained
syn match ttMsgSubKey   '\${[A-Za-z][A-Za-z0-9]\{-}\}' contains=ttMsgKeyName contained
syn match ttMsgText     '^[EWM]\d\+\t.*\%(\n\t.\+\)*' contains=ttMsgError,ttMsgWarning,ttMsgInfo,ttMsgEscape,ttMsgSubId,ttMsgSubKey
syn match ttMsgComment  '#.*$'
syn match ttMsgLead     '^\( \)\+'

let b:current_syntax = "msg"

hi def link ttMsgText     String
hi def link ttMsgComment  Comment
hi def link ttMsgId       Statement
hi def link ttMsgError    ttMsgId
hi def link ttMsgWarning  ttMsgId
hi def link ttMsgInfo     ttMsgId
hi def link ttMsgEscape   Special
hi def link ttMsgSubId    Special
hi def link ttMsgSubKey   Special
hi def link ttMsgSubIdNum Identifier
hi def link ttMsgKeyName  Keyword
hi          ttMsgSpace    ctermbg=1 guibg=#FF0000
hi def link ttMsgLead     ttMsgSpace

autocmd ColorScheme * hi ttMsgSpace ctermbg=1 guibg=#EE1111

syntax sync minlines=50
