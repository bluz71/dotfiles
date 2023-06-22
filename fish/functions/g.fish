function g --wraps git --description 'git alias'
    if test (count $argv) -eq 0
        git status -sb
    else
        git $argv
    end
end
