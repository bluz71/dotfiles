setlocal nocindent
setlocal cinoptions=
setlocal indentexpr=CustomDartIndent()

if exists("*CustomDartIndent")
  finish
endif

function! CustomDartIndent()
  " CUSTOM: Default to indent in most cases (not cindent)
  let indentTo = indent(v:lnum)

  let previousLine = getline(prevnonblank(v:lnum - 1))
  let currentLine = getline(v:lnum)

  " Don't indent after an annotation
  if previousLine =~# '^\s*@.*$'
    let indentTo = indent(v:lnum - 1)
  endif

  " Indent after opening List literal
  if previousLine =~# '\[$' && !(currentLine =~# '^\s*\]')
    let indentTo = indent(v:lnum - 1) + &shiftwidth
  endif

  " CUSTOM: Previous line opened a block
  if previousLine =~ '[({]\s*$'
    let indentTo += shiftwidth()
  endif

  " CUSTOM: This line closes a block
  if currentLine =~ '^\s*[)}]'
    let indentTo -= shiftwidth()
  endif

  return indentTo
endfunction
