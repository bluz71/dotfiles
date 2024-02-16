function ga --description 'fzf git add'
    set -f selections (
      git ls-files -m -o --exclude-standard | \
        fzf --ansi \
            --preview 'if git ls-files --error-unmatch {1} &>/dev/null
                         git diff --color=always {1} | delta
                       else
                         bat --color=always --line-range :500 {1}
                       end'
    )
    if test -n "$selections"
        git add --verbose (string split -- " " $selections)
    end
end
