# fzf git add.
#
function ga
    set -f selections (
      git status --porcelain | \
        fzf --ansi \
            --preview 'if git ls-files --error-unmatch {2} &>/dev/null
                         git diff --color=always {2} | delta
                       else
                         bat --color=always --line-range :500 {2}
                       end'
    )
    if test -n "$selections"
        set -l additions (string replace --all ' M ' '' $selections)
        git add --verbose (string split -- " " $additions)
    end
end
