nmap <buffer><expr>
      \ <Plug>(fern-my-open-expand-collapse)
      \ fern#smart#leaf(
      \   "\<Plug>(fern-action-open:select)",
      \   "\<Plug>(fern-action-expand)",
      \   "\<Plug>(fern-action-collapse)",
      \ )
nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
nmap <buffer> N <Plug>(fern-action-new-file)
nmap <buffer> K <Plug>(fern-action-new-dir)
nmap <buffer> D <Plug>(fern-action-remove)
nmap <buffer> H <Plug>(fern-action-hidden-toggle)j
nmap <buffer> R <Plug>(fern-action-reload)
nmap <buffer> M <Plug>(fern-action-move)
nmap <buffer> m <Plug>(fern-action-mark-toggle)j
nmap <buffer> s <Plug>(fern-action-open:split)
nmap <buffer> v <Plug>(fern-action-open:vsplit)
nmap <buffer><nowait> < <Plug>(fern-action-leave)
nmap <buffer><nowait> > <Plug>(fern-action-enter)
