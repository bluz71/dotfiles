# Disk usage sorted by size.
#
function dus
    if test (count $argv) -eq 0
        du -sh * | sort -hr | less
    else
        du -sh $argv | sort -hr | less
    end
end
