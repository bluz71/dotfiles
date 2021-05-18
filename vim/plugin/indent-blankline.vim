if &diff
    let g:indent_blankline_enabled = v:false
endif

let g:indent_blankline_char = '▏'
let g:indent_blankline_filetype_exclude = [
    \ 'cheat40', 'fern', 'help', 'text', 'undotree', 'yaml'
    \]
let g:indent_blankline_show_first_indent_level = v:false
let g:indent_blankline_show_trailing_blankline_indent = v:false
let g:indent_blankline_use_treesitter = v:true
