let g:UltiSnipsExpandTrigger       = "<C-j>"
let g:UltiSnipsJumpForwardTrigger  = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

" Insert mode snippet completion mapping - '<Control-s>'
inoremap <silent> <C-s> <C-r>=snippets#Complete()<cr>

