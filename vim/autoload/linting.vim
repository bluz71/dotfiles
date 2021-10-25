let g:lintingActive = v:true

" Toggle ALE linting and LSP diagnostics.
"
function! linting#Toggle() abort
    if g:lintingActive == v:true
        :ALEDisable
        lua require('misc.diagnostic-display').disable()
        " Disable statusline indicators.
        let g:moonflyWithNvimLspIndicator = v:false
        let g:moonflyWithALEIndicator = v:false
        echo '(Linting) OFF'
        let g:lintingActive = v:false
    else
        :ALEEnable
        lua require('misc.diagnostic-display').enable()
        " Enable statusline indicators.
        let g:moonflyWithNvimLspIndicator = v:true
        let g:moonflyWithALEIndicator = v:true
        echo '(Linting) ON'
        let g:lintingActive = v:true
    endif
endfunction
