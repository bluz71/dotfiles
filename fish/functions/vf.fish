function vf --description 'fzf find and edit file'
    set -f file (
      fzf --query="$argv" --no-multi --select-1 --exit-0 \
          --preview 'bat --color=always --line-range :500 {}'
      )
    if test -n "$file"
        v "$file"
    end
end
