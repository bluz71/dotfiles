function vg --description 'Grep and edit files'
    if test (count $argv) -eq 0
        echo 'Usage: vg <search-term>'
        return
    end
    $EDITOR (rg -l $argv)
end
