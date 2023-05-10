# Automatically push to the directory stack when changing directories.
#
__zoxide_cd() {
    # Note, if the target directory is the same as the current directory
    # do nothing since we don't want to populate the directory stack
    # with consecutive repeated entries.
    if [[ "$@" != "$PWD" ]]; then
        builtin pushd "$@" 1> /dev/null
    fi
}
