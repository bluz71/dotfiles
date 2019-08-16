" Setup indent markers for tab-indented Go code. Note, the IndentLine
" plugin will not show markers for tab formatted code, so we need to mimic
setlocal list listchars=tab:\┊\ ,trail:-
highlight! link SpecialKey Conceal
