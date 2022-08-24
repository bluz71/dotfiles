function! snippet#Complete() abort
    let l:word_to_complete = matchstr(strpart(getline('.'), 0, col('.') - 1), '\S\+$')
    let l:contain_word = 'stridx(v:val.word, l:word_to_complete) >= 0'
    let l:candidates = vsnip#get_complete_items(bufnr('%'))
    let l:candidates = map(filter(l:candidates, l:contain_word),
                  \  "{
                  \      'word': v:val.word,
                  \      'menu': v:val.kind,
                  \      'dup' : 1,
                  \   }")
    let l:from_where = col('.') - len(l:word_to_complete)
    if !empty(l:candidates)
        call complete(l:from_where, l:candidates)
    endif

    return ''
endfunction
