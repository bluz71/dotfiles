# Grep and edit files.
#
function vg
    if test (count $argv) -eq 0
        echo 'Usage: vg <search-term>'
        return
    end
    $EDITOR (rg -l $argv)
end
