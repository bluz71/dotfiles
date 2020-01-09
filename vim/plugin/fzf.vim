let g:fzf_layout = { "window": "silent botright 16split enew" }
let g:fzf_commits_log_options = '--graph --color=always
 \ --date=human --format="%C(#e3c78a)%h%C(#ff5454)%d%C(reset)
 \ - %C(#42cf89)(%ad)%C(reset) %s %C(#80a0ff){%an}%C(reset)"'

nnoremap <silent> <Space><Space> :Files<CR>
nnoremap <silent> <Space>.       :Files <C-r>=expand("%:h")<CR>/<CR>
nnoremap <silent> <Space>,       :Buffers<CR>
nnoremap <silent> <Space><BS>    :BDelete<CR>
nnoremap <silent> <Space>]       :Tags<CR>
nnoremap <silent> <Space>[       :BTags<CR>
nnoremap <silent> <Space>c       :BCommits<CR>
nnoremap <silent> <Space>g       :GFiles?<CR>
nnoremap <silent> <Space>s       :call FzfLoadUltiSnipsAndFuzzySearch()<CR>
nnoremap <silent> <Space>h       :Helptags<CR>
" Project-wide search for the supplied term.
noremap <Space>/ :Rg<Space>
" Mapping selections for various modes.
nmap <Space>? <Plug>(fzf-maps-n)
omap <Space>? <Plug>(fzf-maps-o)
xmap <Space>? <Plug>(fzf-maps-x)
imap <C-x>?   <Plug>(fzf-maps-i)

if filereadable('config/routes.rb')
    " This looks like a Rails app.
    nnoremap <silent> <Space>ec :Files app/controllers<CR>
    nnoremap <silent> <Space>eh :Files app/helpers<CR>
    nnoremap <silent> <Space>em :Files app/models<CR>
    nnoremap <silent> <Space>es :Files app/assets/stylesheets<CR>
    nnoremap <silent> <Space>et :Files spec<CR>
    nnoremap <silent> <Space>ev :Files app/views<CR>
elseif filereadable('src/index.js')
    " This looks like a React app.
    nnoremap <silent> <Space>ec :Files src/components<CR>
    nnoremap <silent> <Space>es :Files src/styles<CR>
    nnoremap <silent> <Space>et :Files src/__tests__/components<CR>
endif

" Display fzf in a floating window when run in Neovim.
if has('nvim')
    function! FloatingFZF()
        let width = float2nr(&columns * 0.85)
        let height = float2nr(&lines * 0.70)
        let opts = { 'relative': 'editor',
                    \ 'row': (&lines - height) / 2,
                    \ 'col': (&columns - width) / 2,
                    \ 'width': width,
                    \ 'height': height,
                    \ 'style': 'minimal'}

        let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    endfunction

    let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

" UltiSnips is a slow plugin to load, hence, only load it on demand once fuzzy
" snippet searching has been selected.
"
function! FzfLoadUltiSnipsAndFuzzySearch()
    let l:curpos = getcurpos()
    execute plug#load('ultisnips')
    call cursor(l:curpos[1], l:curpos[2])
    :Snippets
    return ""
endfunction

" Return the source list of open buffers for the custom :BDelete command.
"
function! FzfListBuffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

" Slightly change the :BCommits command to use the reverse layout.
command! -bar -bang BCommits
 \ call fzf#vim#buffer_commits({'options': '--reverse'}, <bang>0)

" New :BDelete command, similar to :Buffers, but will close the selected
" buffers.
command! BDelete call fzf#run(fzf#wrap({
 \  'source': FzfListBuffers(),
 \  'sink*': { lines -> execute('bwipeout '.join(map(lines, {_, line -> split(line)[0]}))) },
 \  'options': '--multi --prompt "BDelete> "'
 \}))
