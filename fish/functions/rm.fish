function rm --description 'Interactive remove'
    # Skip interactive mode if being called on an 'scp' Fish temp file as
    # created when executing an 'scp' tab-completion.
    if string match -q '/tmp/fish-scp.*' -- $argv[1]
        command /bin/rm $argv
    else
        command /bin/rm -i $argv
    end
end
