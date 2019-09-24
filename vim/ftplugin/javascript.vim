" Various ALE + tsserver mappings.
"
" Manually invoke completion.
imap <buffer> <C-Space> <Plug>(ale_complete)
" Go to definition.
nmap <buffer> gd <Plug>(ale_go_to_definition)
" Hover details.
nmap <buffer> K <Plug>(ale_hover)
" 'Find references' toggle.
nmap <silent> gr :execute preview#Exists() ? 'pclose' : 'ALEFindReferences'<CR>
