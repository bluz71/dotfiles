function glS --description 'fzf git log pickaxe'
    if test (count $argv) -eq 0
        echo 'Usage: glS <search-term>'
        return
    end
    set -f selection (
      git log --oneline --color=always -S $argv | \
        fzf --no-multi --ansi --no-sort --no-height \
            --preview 'git show --color=always {1} | delta'
    )
    if test -n "$selection"
        set -l commit (echo "$selection" | awk '{print $1}' | tr -d '\n')
        git show $commit
    end
end
