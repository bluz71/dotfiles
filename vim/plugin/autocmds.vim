augroup PersonalAutocmds
    " Note, 'autocmd!' is used to clear out any existing definitions in
    " this auto-group. This prevents duplicate entries upon a live ~/vimrc
    " reload.
    autocmd!

    " Style customizations.
    autocmd VimEnter * windo call diff#Styling()
    autocmd WinEnter * call relative_number#Activity("active")
    autocmd WinLeave * call relative_number#Activity("inactive")

    " Restore default Enter/Return behaviour for the command line window.
    autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>

    " Automatically equalize window splits.
    autocmd VimResized * wincmd =

    " Syntax highlight a minimum of 2,000 lines. This greatly helps scroll
    " performance.
    autocmd Syntax * syntax sync minlines=2000

    " Language, by extension, customizations.
    autocmd BufEnter *.{hh,cc,icc,tcc} set filetype=cxx
    autocmd BufEnter *.html.erb        set omnifunc=htmlcomplete#CompleteTags

    " Auto-read external file changes, compliments the vim-auto-save plugin.
    autocmd CursorHold * silent! checktime

    " Auto-load session if it exists.
    autocmd VimEnter * nested
      \ if argc() == 0 && filereadable('Session.vim')|
      \     source Session.vim|
      \ endif

    " Neovim terminal tweaks.
    if has("nvim")
        autocmd TermOpen *        setlocal conceallevel=0 colorcolumn=0
        autocmd TermOpen *        startinsert
        autocmd BufEnter term://* startinsert
    endif
augroup END
