__zoxide_cd() {
    # Note, if the target directory is the same as the current directory
    # do nothing since we don't want to needlessly populate the directory stack
    # with repeated entries.
    if [[ "$@" != "$PWD" ]]; then
        \builtin pushd "$@" 1> /dev/null
    fi
}
