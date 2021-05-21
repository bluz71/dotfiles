" Don't load the Ruby provider since it needlessly slows down the loading of
" Ruby files into the editor. Also, we never need to run Ruby inside the editor
" now that LSP has matured.
let g:loaded_ruby_provider = 0

" Simple endwise-style close block helper.
inoremap <silent> <C-e> end<C-o>O
