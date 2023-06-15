function g --wraps git
    if test (count $argv) -eq 0
        git status -sb
    else
        git $argv
    end
end
