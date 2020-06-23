:IndentLinesDisable

nmap <buffer> <2-LeftMouse> <Plug>(vimfiler_smart_l)
nmap <buffer> <CR>          <Plug>(vimfiler_smart_l)
nmap <buffer> <Tab>         <Plug>(vimfiler_switch_to_other_window)
nmap <buffer> N             <Plug>(vimfiler_new_file)
nmap <buffer> K             <Plug>(vimfiler_make_directory)
nmap <buffer> D             <Plug>(vimfiler_delete_file)
nmap <buffer> m             <Plug>(vimfiler_toggle_mark_current_line)
nmap <buffer> .             <Plug>(vimfiler_cd_or_edit)
nmap <buffer> -             <Plug>(vimfiler_switch_to_parent_directory)
nmap <buffer> ~             <Plug>(vimfiler_switch_to_project_directory)
nmap <buffer> v             <Plug>(vimfiler_split_edit_file)
nmap <buffer> r             <Plug>(vimfiler_redraw_screen)
nmap <buffer> <Esc>         <Plug>(vimfiler_close)

" Manually add open-in-a-horizontal-split mapping which is not provided as
" <Plug>able mapping.
nnoremap <silent> <buffer> <expr> s vimfiler#do_switch_action('split')
