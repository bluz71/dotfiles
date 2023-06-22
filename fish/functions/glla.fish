function glla --description 'fzf git log all'
    set -f selection (
      git lla --color=always $argv | \
        fzf --no-multi --ansi --no-sort --no-height \
            --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 |
                       xargs -I@ sh -c 'git show --color=always @' |
                       delta"
      )
    if test -n "$selection"
        set -l commit (echo "$selection" | sed 's/^[* |]*//' | awk '{print $1}' | tr -d '\n')
        git show $commit
    end
end
