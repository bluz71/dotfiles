br() {
    f=$(mktemp)
    (
    set +e
    broot --outcmd "$f" "$@"
    code=$?
    if [ "$code" != 0 ]; then
        rm -f "$f"
        exit "$code"
    fi
    )
    code=$?
    if [ "$code" != 0 ]; then
        return "$code"
    fi
    cmd=$(<"$f")
    rm -f "$f"
    eval "$cmd"
}
