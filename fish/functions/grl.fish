function grl --description 'fzf git reflog'
    set -f selection (
      git reflog --color=always $argv | \
        fzf --no-multi --ansi --no-sort --no-height \
            --preview 'git show --color=always {1} | delta'
    )
    if test -n "$selection"
        git show (echo $selection | awk '{print $1}')
    end
end
