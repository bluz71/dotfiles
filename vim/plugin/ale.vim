" Do NOT initiate ALE when doing short-lived diffs.
if &diff
    finish
endif

let g:ale_fixers = {
 \  'css':        ['prettier'],
 \  'dart':       ['dartfmt'],
 \  'javascript': ['prettier-standard'],
 \  'json':       ['prettier'],
 \  'ruby':       ['standardrb'],
 \  'scss':       ['prettier'],
 \  'yml':        ['prettier'],
 \}
let g:ale_linters = {
 \  'css':        ['csslint'],
 \  'eruby':      ['erb'],
 \  'javascript': ['standard'],
 \  'json':       ['jsonlint'],
 \  'markdown':   ['mdl'],
 \  'ruby':       ['standardrb'],
 \  'scss':       ['sasslint'],
 \  'yaml':       ['yamllint'],
 \}
let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 0
let g:ale_hover_cursor = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters_explicit = 1
let g:ale_open_list = 0
let g:ale_sign_error = '▶'
let g:ale_sign_warning = '▶'
let g:ale_sign_info = '▶'
let g:ale_sign_priority = 9
if has("nvim")
    let g:ale_echo_cursor = 0
    let g:ale_virtualtext_cursor = 1
    let g:ale_virtualtext_prefix = ' ▶ '
endif

" ALE fix and toggle mappings.
nmap <Space>f <Plug>(ale_fix)
nmap <Space>a <Plug>(ale_toggle_buffer)
nmap <Space>A <Plug>(ale_toggle)
" Navigate errors and warnings using unimpaired-style mappings.
nmap [w <Plug>(ale_previous)zz
nmap ]w <Plug>(ale_next)zz
nmap [W <Plug>(ale_first)zz
nmap ]W <Plug>(ale_last)zz
" Toggle location list.
nnoremap <silent> <Leader>l :call location_list#Toggle()<CR>
