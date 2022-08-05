let g:tmux_navigator_no_mappings = 1

if exists('$TMUX')
    " Seamless Alt-h/j/k/l navigation between Vim splits  and tmux panes.
    " Note, only set up mappings if running inside tmux.
    nnoremap <silent> h :TmuxNavigateLeft<CR>
    nnoremap <silent> j :TmuxNavigateDown<CR>
    nnoremap <silent> k :TmuxNavigateUp<CR>
    nnoremap <silent> l :TmuxNavigateRight<CR>
endif
