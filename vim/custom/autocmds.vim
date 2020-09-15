augroup CustomEvents
    " Note, 'autocmd!' is used to clear out any existing definitions in
    " this auto-group. This prevents duplicate entries upon a live ~/vimrc
    " reload.
    autocmd!

    " Style customizations.
    autocmd VimEnter * windo call diff#Styling()
    autocmd WinEnter * call window_traits#Activity(v:true)
    autocmd WinLeave * call window_traits#Activity(v:false)

    " Restore default Enter/Return behaviour for the command line window.
    autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>

    " Automatically equalize window splits.
    autocmd VimResized * wincmd =

    " Syntax highlight a minimum of 2,000 lines. This greatly helps scroll
    " performance.
    autocmd Syntax * syntax sync minlines=2000

    " Language, by extension, customizations.
    autocmd BufEnter *.icc      set filetype=cpp
    autocmd BufEnter *.html.erb set omnifunc=htmlcomplete#CompleteTags

    " Auto-read external file changes, compliments the vim-auto-save plugin.
    autocmd CursorHold * silent! checktime

    " Auto-load session if it exists.
    autocmd VimEnter * nested
      \ if argc() == 0 && filereadable('Session.vim')|
      \     source Session.vim|
      \ endif

    " Neovim terminal tweaks.
    if has('nvim')
        autocmd TermOpen *        setlocal conceallevel=0 colorcolumn=0
        autocmd TermOpen *        startinsert
        autocmd BufEnter term://* startinsert
    endif

    " Disable sign-creating plugins for larger than 200K files.
    autocmd BufReadPre *
      \ if getfsize(expand('%')) > 200000|
      \     call signs#Disable()|
      \ endif
augroup END
