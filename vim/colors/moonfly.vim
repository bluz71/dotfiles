" Vim color file
"
" Note: Inspiration taken from: monokai, molokai, slate2, sunburst, twilight
" and xoria256 themes.

let s:black       = "#080808"
let s:white       = "#d0d0d0"
let s:pale_white  = "#c6c6c6"
let s:light_gray  = "#9e9e9e"
let s:dim_gray    = "#373c40"
let s:medium_gray = "#303030"
let s:gray        = "#444444"
let s:dark_gray   = "#1c1c1c"
let s:wheat       = "#e9d4ab"
let s:khaki       = "#dcd08c"
let s:orange      = "#de935f"
let s:coral       = "#f09479"
let s:light_green = "#85dc85"
let s:green       = "#89bb25"
let s:emerald     = "#42cf89"
let s:blue        = "#80a0ff"
let s:sky_blue    = "#87afff"
let s:light_blue  = "#89d2ef"
let s:turquoise   = "#7ee0ce"
let s:purple      = "#ae81ff"
let s:violet      = "#e2637f"
let s:magenta     = "#ee82ee"
let s:crimson     = "#ed246c"
let s:red         = "#ff5454"

" For 256-color terminal colors.
"
" .Xdefaults need to be setup with the following definitions; then launch
" xterm via 'xterm -name xterm-moonfly':
"
" xterm-moonfly*color0: #373c40
" xterm-moonfly*color1: #ff5454
" xterm-moonfly*color2: #89bb25
" xterm-moonfly*color3: #dcd08c
" xterm-moonfly*color4: #80a0ff
" xterm-moonfly*color5: #ee82ee
" xterm-moonfly*color6: #7ee0ce
" xterm-moonfly*color7: #de935f
" xterm-moonfly*color8: #f09479
" xterm-moonfly*color9: #ed246c
" xterm-moonfly*color10: #42cf89
" xterm-moonfly*color11: #e9d4ab
" xterm-moonfly*color12: #89d2ef
" xterm-moonfly*color13: #ae81ff
" xterm-moonfly*color14: #85dc85
" xterm-moonfly*color15: #e2637f
"
" black       = 232
" white       = 252
" pale_white  = 251
" light_gray  = 247
" dim_gray    = 0
" medium_gray = 236
" gray        = 238
" dark_gray   = 234
" wheat       = 11
" khaki       = 3
" orange      = 7
" coral       = 8
" light_green = 14
" green       = 2
" emerald     = 10
" blue        = 4
" sky_blue    = 111
" light_blue  = 12
" turquoise   = 6
" purple      = 13
" violet      = 15
" magenta     = 5
" crimson     = 9
" red         = 1


highlight clear
set background=dark
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="moonfly"


" Background and text.
exec "highlight Normal ctermbg=232 guibg=" . s:black . "  ctermfg=252 guifg=" . s:white

" Color of mode text, -- INSERT --
exec "highlight ModeMsg ctermfg=247 guifg=" . s:light_gray . " gui=none"

" Comments.
exec "highlight Comment ctermfg=247 guifg=" . s:light_gray

" Functions.
exec "highlight Function ctermfg=12 guifg=" . s:light_blue

" Strings.
exec "highlight String ctermfg=11 guifg=" . s:wheat

" Identifiers.
exec "highlight Identifier ctermfg=116 guifg=" . s:turquoise

" Color of titles, e.g in HTML files and Tagbar.
exec "highlight Title ctermfg=7 guifg=" . s:orange . " gui=none"

" const, static.
exec "highlight StorageClass ctermfg=8 guifg=" . s:coral

" void, intptr_t.
exec "highlight Type ctermfg=10 guifg=" . s:emerald . " gui=none"

" Numbers.
exec "highlight Constant ctermfg=13 guifg=" . s:purple

" ifdef/endif.
exec "highlight PreProc ctermfg=15 guifg=" . s:violet

" Status and split lines.
exec "highlight StatusLine ctermbg=8 guibg=" . s:medium_gray . " ctermfg=236 guifg=" . s:coral . " gui=none"
exec "highlight User1 ctermbg=4 guibg=" . s:blue . " ctermfg=234 guifg=" . s:dark_gray
exec "highlight User2 ctermbg=10 guibg=" . s:emerald . " ctermfg=234 guifg=" . s:dark_gray
exec "highlight User3 ctermbg=13 guibg=" . s:purple . " ctermfg=234 guifg=" . s:dark_gray
exec "highlight User4 ctermbg=236 guibg=" . s:medium_gray . " ctermfg=10 guifg=" . s:emerald . " gui=none"
exec "highlight User5 ctermbg=236 guibg=" . s:medium_gray . " ctermfg=251 guifg=" . s:pale_white . " gui=none"
exec "highlight User6 ctermbg=236 guibg=" . s:medium_gray . " ctermfg=111 guifg=" . s:sky_blue . " gui=none"
exec "highlight User7 ctermbg=236 guibg=" . s:medium_gray . " ctermfg=2 guifg=" . s:green . " gui=none"
exec "highlight StatusLineNC ctermbg=247 guibg=" . s:medium_gray . " ctermfg=236 guifg=" . s:light_gray . " gui=none"
exec "highlight VertSplit ctermbg=236 guibg=" . s:medium_gray . " ctermfg=236 guifg=" . s:medium_gray

" case in switch statement.
exec "highlight Label ctermfg=6 guifg=" . s:turquoise

" end-of-line '$', end-of-file '~'
exec "highlight NonText ctermfg=7 guifg=" . s:orange . " gui=none"

" sizeof
exec "highlight Operator ctermfg=15 guifg=" . s:violet

" for, while.
exec "highlight Repeat ctermfg=7 guifg=" . s:orange

" Search.
exec "highlight Search ctermbg=7 guibg=" . s:orange . " ctermfg=bg guifg=bg"
exec "highlight IncSearch ctermbg=bg guibg=bg ctermfg=3 guifg=" . s:khaki

" '\n' sequences.
exec "highlight Special ctermfg=15 guifg=" . s:violet

" if, else.
exec "highlight Statement ctermfg=5 guifg=" . s:magenta . " gui=none"

" Visual selection.
exec "highlight Visual ctermbg=0 guibg=" . s:dim_gray
exec "highlight VisualNOS ctermbg=9 guibg=" . s:dim_gray . " ctermfg=fg guifg=fg gui=none"

" Exceptions.
exec "highlight Exception ctermfg=14 guifg=" . s:light_green

" Errors, warnings and whitespace-eol.
exec "highlight Error ctermbg=bg guibg=bg ctermfg=1 guifg=" . s:red
exec "highlight ErrorMsg ctermbg=bg guibg=bg ctermfg=1 guifg=" . s:red
exec "highlight WarningMsg ctermbg=bg guibg=bg ctermfg=7 guifg=" . s:orange

" struct, union, enum, typedef.
exec "highlight Structure ctermfg=10 guifg=" . s:emerald

" Auto-text-completion menu.
exec "highlight Pmenu ctermbg=236 guibg=" . s:medium_gray . " ctermfg=fg guifg=fg"
exec "highlight PmenuSel ctermbg=7 guibg=" . s:orange . " ctermfg=236 guifg=" . s:medium_gray

" Spelling errors.
exec "highlight SpellBad ctermbg=1 guibg=" . s:red . " ctermfg=236 guifg=" . s:medium_gray . " gui=none"
exec "highlight SpellCap ctermbg=4 guibg=" . s:blue . " ctermfg=236 guifg=" . s:medium_gray . " gui=none"
exec "highlight SpellRare ctermbg=15 guibg=" . s:violet . " ctermfg=236 guifg=" . s:medium_gray . " gui=none"
exec "highlight SpellLocal ctermbg=12 guibg=" . s:light_blue . " ctermfg=236 guifg=" . s:medium_gray . " gui=none"

" Misc.
exec "highlight Question ctermfg=14 guifg=" . s:light_green . " gui=none"
exec "highlight MoreMsg ctermfg=1 guifg=" . s:red . " gui=none"
exec "highlight LineNr ctermbg=234 guibg=" . s:dark_gray . " ctermfg=247 guifg=" . s:light_gray
exec "highlight Cursor guifg=bg guibg=" . s:pale_white
exec "highlight lCursor guifg=bg guibg=" . s:pale_white
exec "highlight CursorLineNr ctermbg=234 guibg=" . s:dark_gray . " ctermfg=247 guifg=" . s:light_gray . " gui=none"
exec "highlight CursorLine ctermbg=238 guibg=" . s:gray . " cterm=none"
exec "highlight Folded ctermbg=234 guibg=" . s:dark_gray . " ctermfg=14 guifg=". s:light_green
exec "highlight FoldColumn ctermbg=236 guibg=" . s:medium_gray . " ctermfg=14 guifg=" . s:light_green
exec "highlight SignColumn ctermbg=236 guibg=" . s:medium_gray . " ctermfg=14 guifg=" . s:light_green
exec "highlight Todo ctermbg=3 guibg=" . s:khaki . " ctermfg=bg guifg=bg"
exec "highlight SpecialKey ctermbg=bg guibg=bg ctermfg=12 guifg=" . s:light_blue
exec "highlight MatchParen ctermbg=31"

" Color column (after line 80).
exec "highlight ColorColumn ctermbg=234 guibg=" . s:dark_gray

" For C/C++.
"
" goto, break, return, continue.
exec "highlight cStatement ctermfg=6 guifg=" . s:turquoise
" new, delete, this, using.
exec "highlight cppStatement ctermfg=9 guifg=" . s:crimson
" [static/const/dynamic]_cast.
exec "highlight cppCast ctermfg=10 guifg=" . s:emerald
" public, private.
exec "highlight cppAccess ctermfg=14 guifg=" . s:light_green
" operator.
exec "highlight cppOperator ctermfg=2 guifg=" . s:green
" inline, virtual, explicit, export, bool.
exec "highlight cppType ctermfg=3 guifg=" . s:khaki
" class, typename, template, namespace.
exec "highlight cppStructure ctermfg=4 guifg=" . s:blue
" true or false.
exec "highlight cppBoolean ctermfg=13 guifg=" . s:purple

" For shell scripts.
exec "highlight shStatement ctermfg=fg guifg=fg"
exec "highlight shCommandSub ctermfg=fg guifg=fg"
exec "highlight shSet ctermfg=14 guifg=" . s:light_green
exec "highlight shShellVariables ctermfg=8 guifg=" . s:coral
exec "highlight shVariable ctermfg=6 guifg=" . s:turquoise
exec "highlight shAlias ctermfg=6 guifg=" . s:turquoise
exec "highlight shSetList ctermfg=6 guifg=" . s:turquoise

" For Python.
exec "highlight pythonBuiltin ctermfg=4 guifg=" . s:blue
exec "highlight pythonException ctermfg=9 guifg=" . s:crimson
exec "highlight pythonRepeat ctermfg=7 guifg=" . s:orange
exec "highlight pythonStatement ctermfg=14 guifg=" s:light_green

" For Ruby.
exec "highlight rubyAccess ctermfg=3 guifg=" . s:khaki
exec "highlight rubyAttribute ctermfg=3 guifg=" . s:khaki
exec "highlight rubyBlockParameter ctermfg=2 guifg=" . s:green
exec "highlight rubyBoolean ctermfg=6 guifg=" . s:turquoise
exec "highlight rubyClass ctermfg=7 guifg=" . s:orange
exec "highlight rubyControl ctermfg=8 guifg=" . s:coral
exec "highlight rubyException ctermfg=9 guifg=" . s:crimson
exec "highlight rubyExceptional ctermfg=8 guifg=" . s:coral
exec "highlight rubyInstanceVariable ctermfg=14 guifg=" . s:light_green
exec "highlight rubyModule ctermfg=4 guifg=" . s:blue
exec "highlight rubySharpBang ctermfg=247 guifg=" . s:light_gray

" For Go.
exec "highlight goBuiltins ctermfg=9 guifg=" . s:crimson
exec "highlight goConditional ctermfg=5 guifg=" . s:magenta
exec "highlight goDeclaration ctermfg=14 guifg=" . s:light_green
exec "highlight goDeclType ctermfg=2 guifg=" . s:green
exec "highlight goDirective ctermfg=15 guifg=" . s:violet
exec "highlight goFloats ctermfg=13 guifg=" . s:purple
exec "highlight goFunction ctermfg=4 guifg=" . s:blue
exec "highlight goLabel ctermfg=3 guifg=" . s:khaki
exec "highlight goMethod ctermfg=12 guifg=" . s:light_blue
exec "highlight goRepeat ctermfg=7 guifg=" . s:orange
exec "highlight goSignedInts ctermfg=13 guifg=" . s:purple
exec "highlight goStatement ctermfg=6 guifg=" . s:turquoise
exec "highlight goStruct ctermfg=8 guifg=" . s:coral
exec "highlight goStructDef ctermfg=8 guifg=" . s:coral
exec "highlight goUnsignedInts ctermfg=13 guifg=" . s:purple
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" For Rust.
exec "highlight rustCommentBlockDoc ctermfg=247 guifg=" . s:light_gray
exec "highlight rustCommentLineDoc ctermfg=247 guifg=" . s:light_gray
exec "highlight rustConstant ctermfg=7 guifg=" . s:orange
exec "highlight rustFuncName ctermfg=4 guifg=" . s:blue
exec "highlight rustKeyword ctermfg=14 guifg=" . s:light_green
exec "highlight rustLifetime ctermfg=2 guifg=" . s:green
exec "highlight rustMacro ctermfg=12 guifg=" . s:light_blue
exec "highlight rustSelf ctermfg=9 guifg=" . s:crimson
exec "highlight rustTrait ctermfg=10 guifg=" . s:emerald
exec "highlight rustType ctermfg=8 guifg=" . s:coral

" For Java.
exec "highlight javaBraces ctermfg=252 guifg=" . s:white
exec "highlight javaClassDecl ctermfg=10 guifg=" . s:emerald
exec "highlight javaCommentTitle ctermfg=247 guifg=" . s:light_gray
exec "highlight javaConstant ctermfg=12 guifg=" . s:light_blue
exec "highlight javaDebug ctermfg=12 guifg=" . s:light_blue
exec "highlight javaMethodDecl ctermfg=3 guifg=" . s:khaki
exec "highlight javaOperator ctermfg=9 guifg=" . s:crimson
exec "highlight javaScopeDecl ctermfg=4 guifg=" . s:blue
exec "highlight javaStatement ctermfg=6 guifg=" . s:turquoise
let java_highlight_java_lang_ids = 1
let java_highlight_debug = 1

" For vimdiff.
exec "highlight DiffAdd ctermbg=10 guibg=" . s:emerald . " ctermfg=bg guifg=bg"
exec "highlight DiffChange ctermbg=236 guibg=" . s:medium_gray
exec "highlight DiffDelete ctermbg=236 guibg=" . s:medium_gray . " ctermfg=252 guifg=fg gui=none"
exec "highlight DiffText ctermbg=4 guibg=" . s:blue . " ctermfg=bg guifg=bg gui=none"

" For vim files.
exec "highlight vimCommand ctermfg=7 guifg=" . s:orange
exec "highlight vimOption ctermfg=14 guifg=" . s:light_green

" For Tagbar.
exec "highlight TagbarFoldIcon ctermfg=247 guifg=" . s:light_gray
exec "highlight TagbarVisibilityPublic ctermfg=14 guifg=" . s:light_green
exec "highlight TagbarVisibilityProtected ctermfg=14 guifg=" . s:light_green
exec "highlight TagbarVisibilityPrivate ctermfg=14 guifg=" . s:light_green
exec "highlight TagbarKind ctermfg=10 guifg=" . s:emerald

" For NERDTree
exec "highlight NERDTreePart ctermfg=0 guifg=" . s:dim_gray
exec "highlight NERDTreePartFile ctermfg=0 guifg=" . s:dim_gray
exec "highlight NERDTreeDir ctermfg=12 guifg=" . s:light_blue
exec "highlight NERDTreeUp ctermfg=8 guifg=" . s:coral
exec "highlight NERDTreeLinkFile ctermfg=4 guifg=" . s:blue
exec "highlight NERDTreeLinkDir ctermfg=4 guifg=" . s:blue
exec "highlight NERDTreeExecFile ctermfg=11 guifg=" . s:wheat
exec "highlight NERDTreeOpenable ctermfg=2 guifg=" . s:green
exec "highlight NERDTreeClosable ctermfg=8 guifg=" . s:coral
exec "highlight NERDTreeCWD ctermfg=14 guifg=" . s:light_green
exec "highlight NERDTreeHelp ctermfg=247 guifg=" . s:light_gray

" Misc.
exec "highlight Directory ctermfg=10 guifg=" . s:emerald
exec "highlight CtrlPMatch ctermfg=13 guifg=" . s:purple
exec "highlight tagName ctermfg=6 guifg=" . s:turquoise
exec "highlight xmlEndTag ctermfg=6 guifg=" . s:turquoise
