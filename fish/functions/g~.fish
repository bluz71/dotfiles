function g~ --description 'Change to git home directory'
    cd (git rev-parse --show-toplevel)
end
