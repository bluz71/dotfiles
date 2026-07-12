function abc --description 'Print a sequence of characters'
    set -l s (printf '%d' "'$argv[1]")
    set -l e (printf '%d' "'$argv[2]")
    for i in (seq $s $e)
        set -l oct (printf '%o' $i)
        printf "\\$oct\n"
    end
end
