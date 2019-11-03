nnoremap <silent> <Space>r :execute 'silent !kill -SIGUSR1 $(pgrep -f "[f]lutter_tool.*run") &> /dev/null'<CR>:echo "Flutter reloaded"<CR>
nnoremap <silent> <Space>R :execute 'silent !kill -SIGUSR2 $(pgrep -f "[f]lutter_tool.*run") &> /dev/null'<CR>:echo "Flutter restarted"<CR>
