" Setup indent markers for tab-indented Go code. Note, the IndentLine plugin
" will not show markers for tab formatted code, so we need to mimic what that
" plugin does using standard Vim options.
setlocal list
setlocal listchars=tab:\┊\ ,trail:-
highlight! link SpecialKey Conceal
