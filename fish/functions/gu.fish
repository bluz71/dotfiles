function gu
    set -f changes (git diff --name-only --cached | fzf --ansi)
    if test -n "$changes"
        git unadd $changes
    end
end
