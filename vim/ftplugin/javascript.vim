let b:vcm_tab_complete = "omni"

imap <C-Space> <Plug>(ale_complete)
nmap gd <Plug>(ale_go_to_definition)
nmap <Space>h <Plug>(ale_hover)
nmap <silent> <Space>r :exe preview#Exists() ? 'pclose' : 'ALEFindReferences'<CR>
