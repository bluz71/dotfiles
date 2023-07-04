function history_truncate --description 'Truncate history'
    echo "Before: $(du -shL ~/.local/share/fish/fish_history)"
    history delete --prefix 'cd ' 'cp' 'fd ' 'mc ' 'mp' 'mv ' 'open ' 'qmv ' 'rg ' 'rm ' 'you' 'yt-dl'
    echo "After: $(du -shL ~/.local/share/fish/fish_history)"
end
