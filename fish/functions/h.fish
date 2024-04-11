function h --description 'Navi help'
    set -f navi_command 'navi --print --fzf-overrides "--no-multi --no-height --no-sort"'
    if test (count $argv) -eq 0
        eval $navi_command
    else
        eval $navi_command --query $argv
    end
end
