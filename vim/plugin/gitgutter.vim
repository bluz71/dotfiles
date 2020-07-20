let g:gitgutter_grep                         = 'rg'
let g:gitgutter_map_keys                     = 0
let g:gitgutter_max_signs                    = 1000
let g:gitgutter_sign_added                   = '▎'
let g:gitgutter_sign_modified                = '▎'
if empty(eval('$VTE_VERSION'))
    let g:gitgutter_sign_removed             = '◢'
    let g:gitgutter_sign_removed_first_line  = '◥'
else " GNOME Terminal bug, see https://is.gd/5vTfFY
    let g:gitgutter_sign_removed             = '▎'
    let g:gitgutter_sign_removed_first_line  = '▎'
endif
let g:gitgutter_sign_modified_removed        = '▌'
let g:gitgutter_sign_removed_above_and_below = '▎'
let g:gitgutter_preview_win_floating         = 1

nmap [g       <Plug>(GitGutterPrevHunk)zz
nmap ]g       <Plug>(GitGutterNextHunk)zz
nmap <Space>+ <Plug>(GitGutterStageHunk)
nmap <Space>- <Plug>(GitGutterUndoHunk)
nmap <Space>p <Plug>(GitGutterPreviewHunk)
