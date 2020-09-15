" Hot reload and restart are actions specific to Flutter projects.

function! s:FlutterHotReload() abort
    if isdirectory('ios/Flutter')
        silent execute '!kill -SIGUSR1 $(pgrep -f "[f]lutter_tool.*run") &> /dev/null'
    endif
endfunction

function! s:FlutterHotRestart() abort
    if isdirectory('ios/Flutter')
        silent execute '!kill -SIGUSR2 $(pgrep -f "[f]lutter_tool.*run") &> /dev/null'
    endif
endfunction

nnoremap <silent> <Space>r :call s:FlutterHotReload()<CR>:echo "Flutter reloaded"<CR>
nnoremap <silent> <Space>R :call s:FlutterHotRestart()<CR>:echo "Flutter restarted"<CR>

augroup DartTypeEvents
    autocmd!
    autocmd BufWritePost *.dart call s:FlutterHotReload()
augroup END
