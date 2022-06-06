let g:diagnosticsActive = v:true

" Toggle ALE diagnostics and LSP diagnostics.
"
function! diagnostics#Toggle() abort
    if g:diagnosticsActive == v:true
        lua vim.diagnostic.disable()
        " Disable statusline indicators.
        let g:mistflyWithNvimDiagnosticIndicator = v:false
        echo '(Diagnostics) OFF'
        let g:diagnosticsActive = v:false
    else
        lua vim.diagnostic.enable()
        " Enable statusline indicators.
        let g:mistflyWithNvimDiagnosticIndicator = v:true
        echo '(Diagnostics) ON'
        let g:diagnosticsActive = v:true
    endif
endfunction
