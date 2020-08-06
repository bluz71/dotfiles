" Fill in the 'complete' popup with available snippets for the current filetype.
"
function! snippets#Complete() abort
  let wordToComplete = matchstr(strpart(getline('.'), 0, col('.') - 1), '\S\+$')
  let fromWhere      = col('.') - len(wordToComplete)
  let containWord    = "stridx(v:val.word, wordToComplete)>=0"
  let candidates     = vsnip#get_complete_items(bufnr("%"))
  let matches        = map(filter(candidates, containWord),
              \  "{
              \      'word': v:val.word,
              \      'menu': v:val.kind[:-2],
              \      'dup' : 1,
              \   }")


  if !empty(matches)
    call complete(fromWhere, matches)
  endif

  return ""
endfunction
