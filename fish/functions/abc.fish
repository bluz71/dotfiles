function abc --description 'Print a sequence of characters'
    # Default to 'a' start character when only one end character is given.
    set -l args $argv
    if test (count $argv) -eq 1
        set args a $argv
    end

    if test (count $args) -gt 2
        echo "abc: too many arguments (expected 1 or 2 characters)" >&2
        return 1
    end

    # Convert characters to ASCII codes.
    set -l nums
    for c in $args
        set -a nums (printf '%d' "'"(string sub -l 1 $c))
    end

    # Convert ASCII codes back to characters.
    for i in (seq $nums)
        printf "\\$(printf '%o' $i)\n"
    end
end
