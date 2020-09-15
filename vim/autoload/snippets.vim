" Fill in the 'complete' popup with available snippets for the current filetype.
"
function! snippets#Complete() abort
    let l:wordToComplete = matchstr(strpart(getline('.'), 0, col('.') - 1), '\S\+$')
    let l:fromWhere      = col('.') - len(l:wordToComplete)
    let l:containWord    = 'stridx(v:val.word, l:wordToComplete)>=0'
    let l:candidates     = vsnip#get_complete_items(bufnr("%"))
    let l:matches        = map(filter(l:candidates, l:containWord),
                \  "{
                \      'word': v:val.word,
                \      'menu': v:val.kind,
                \      'dup' : 1,
                \   }")


    if !empty(l:matches)
        call complete(l:fromWhere, l:matches)
    endif

    return ''
endfunction
