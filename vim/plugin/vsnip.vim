let g:vsnip_snippet_dir = expand('~/dotfiles/vim/vsnip')

imap <expr> <C-j> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : "<C-j>"
imap <expr> <C-k> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)'      : "<C-k>"

" Insert mode snippet completion mapping - '<Control-s>'
inoremap <silent> <C-s> <C-r>=snippets#Complete()<CR>
