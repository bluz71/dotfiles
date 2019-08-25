imap <buffer> <C-Space> <Plug>(ale_complete)
nmap <buffer> gd        <Plug>(ale_go_to_definition)
nmap <buffer> <Space>h  <Plug>(ale_hover)
" Make 'find references' a toggle.
nmap <silent> <Space>r :execute preview#Exists() ? 'pclose' : 'ALEFindReferences'<CR>
