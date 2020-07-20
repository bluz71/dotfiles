let g:vimfiler_as_default_explorer        = 1
let g:vimfiler_expand_jump_to_first_child = 0
let g:vimfiler_no_default_key_mappings    = 1
let g:vimfiler_safe_mode_by_default       = 0
let g:vimfiler_marked_file_icon           = '●'
let g:vimfiler_readonly_file_icon         = ''
let g:vimfiler_tree_closed_icon           = '▷'
let g:vimfiler_tree_leaf_icon             = ' '
if empty(eval('$VTE_VERSION'))
    let g:vimfiler_tree_opened_icon       = "◢"
else " GNOME Terminal bug, see https://is.gd/5vTfFY
    let g:vimfiler_tree_opened_icon       = '▼'
endif

noremap <silent> <Leader>n :VimFilerExplorer -toggle<CR> <C-w>=
noremap <silent> <Leader>f :VimFilerExplorer -find<CR>   <C-w>=
