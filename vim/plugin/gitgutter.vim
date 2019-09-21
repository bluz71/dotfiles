let g:gitgutter_grep                    = 'rg'
let g:gitgutter_map_keys                = 0
let g:gitgutter_sign_added              = '▎'
let g:gitgutter_sign_modified           = '▎'
let g:gitgutter_sign_removed            ='◢'
let g:gitgutter_sign_removed_first_line ='◥'
let g:gitgutter_sign_modified_removed   ='◢'

nmap [g       <Plug>(GitGutterPrevHunk)zz
nmap ]g       <Plug>(GitGutterNextHunk)zz
nmap <Space>+ <Plug>(GitGutterStageHunk)
nmap <Space>- <Plug>(GitGutterUndoHunk)
" Make GitGutter previewing a toggle.
nmap <silent> <Space>p :execute preview#Exists() ? 'pclose' : 'GitGutterPreviewHunk'<CR>
