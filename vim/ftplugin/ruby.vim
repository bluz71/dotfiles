" Don't load the Ruby provider since it needlessly slows down the loading of
" Ruby files into the editor.
let g:loaded_ruby_provider = 0

" Simple endwise-style close block helper.
inoremap <buffer> <C-e> end<C-o>O
