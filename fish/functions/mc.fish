# Make, and then change into, directory.
#
function mc
    mkdir -p $argv && cd $argv
end
