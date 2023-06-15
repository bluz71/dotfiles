function llfs
    if test (count $argv) -eq 0
        echo "Usage: llfs <size> (e.g. 100k, +1M, +1G)"
    else
        find . -type f -size $argv -exec exa --long {} \;
    end
end
