" Don't load the Ruby provider since it needlessly slows down the loading of
" Ruby files into the editor.
let g:loaded_ruby_provider = 1

" Simple endwise-style insert mode close block completion.
inoremap <buffer> <C-c> end<C-o>O
