let g:diagnosticsActive = v:true

" Toggle Neovim diagnostics.
"
function! diagnostics#Toggle() abort
    if !has('nvim')
        return
    endif

    if g:diagnosticsActive == v:true
        lua vim.diagnostic.disable()
        " Disable mistfly statusline diagnostic indicator.
        let g:mistflyWithNvimDiagnosticIndicator = 0
        echo '(Diagnostics) OFF'
        let g:diagnosticsActive = v:false
    else
        lua vim.diagnostic.enable()
        " Enable mistfly statusline diagnostic indicator.
        let g:mistflyWithNvimDiagnosticIndicator = 1
        echo '(Diagnostics) ON'
        let g:diagnosticsActive = v:true
    endif
endfunction
