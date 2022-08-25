function __zoxide_cd() {
    \builtin pushd -n $(\builtin pwd) 1> /dev/null && \builtin cd -- "$@"
}
