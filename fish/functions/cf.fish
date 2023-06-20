# fzf change directory.
#
function cf
    set -f directory (
      fd --type d |
        fzf --query="$argv" --no-multi --select-1 --exit-0 \
            --preview 'tree -C {} | head -100'
      )
    if test -n "$directory"
        cd "$directory"
    end
end
