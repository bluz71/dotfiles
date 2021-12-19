let g:diagnosticsActive = v:true

" Toggle ALE diagnostics and LSP diagnostics.
"
function! diagnostics#Toggle() abort
    if g:diagnosticsActive == v:true
        lua require('util.diagnostic-display').disable()
        " Disable statusline indicators.
        let g:moonflyWithNvimDiagnosticIndicator = v:false
        echo '(Diagnostics) OFF'
        let g:diagnosticsActive = v:false
    else
        lua require('util.diagnostic-display').enable()
        " Enable statusline indicators.
        let g:moonflyWithNvimDiagnosticIndicator = v:true
        echo '(Diagnostics) ON'
        let g:diagnosticsActive = v:true
    endif
endfunction
