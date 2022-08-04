let g:tmux_navigator_no_mappings = 1

if exists('$TMUX')
    " Seamless Alt-h/j/k/l navigation between Vim splits  and tmux panes.
    " Note, only set up mappings if running inside tmux.
    nnoremap <silent> h :TmuxNavigateLeft<cr>
    nnoremap <silent> j :TmuxNavigateDown<cr>
    nnoremap <silent> k :TmuxNavigateUp<cr>
    nnoremap <silent> l :TmuxNavigateRight<cr>
endif
