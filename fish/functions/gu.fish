function gu --description 'fzf git unadd'
    set -f changes (git diff --name-only --cached | fzf --ansi)
    if test -n "$changes"
        git unadd $changes
    end
end
