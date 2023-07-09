function history_truncate --description 'Truncate history'
    set -f before "Before: $(du -shL ~/.local/share/fish/fish_history)"
    history delete --prefix 'cd ' 'cp' 'echo ' 'fd ' 'mc ' 'mp' 'mv ' 'open ' 'qmv ' 'rg ' 'rm ' 'you' 'yt-dl'
    echo $before
    echo "After: $(du -shL ~/.local/share/fish/fish_history)"
end
