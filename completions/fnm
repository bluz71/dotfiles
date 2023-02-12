_fnm() {
    local i cur prev opts cmds
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmd=""
    opts=""

    for i in ${COMP_WORDS[@]}
    do
        case "${i}" in
            "$1")
                cmd="fnm"
                ;;
            alias)
                cmd+="__alias"
                ;;
            completions)
                cmd+="__completions"
                ;;
            current)
                cmd+="__current"
                ;;
            default)
                cmd+="__default"
                ;;
            env)
                cmd+="__env"
                ;;
            exec)
                cmd+="__exec"
                ;;
            install)
                cmd+="__install"
                ;;
            list)
                cmd+="__list"
                ;;
            list-remote)
                cmd+="__list__remote"
                ;;
            unalias)
                cmd+="__unalias"
                ;;
            uninstall)
                cmd+="__uninstall"
                ;;
            use)
                cmd+="__use"
                ;;
            *)
                ;;
        esac
    done

    case "${cmd}" in
        fnm)
            opts="--help --version --node-dist-mirror --fnm-dir --multishell-path --log-level --arch --version-file-strategy list-remote list install use env completions alias unalias default current exec uninstall"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --node-dist-mirror)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fnm-dir)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --multishell-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "quiet info all error" -- "${cur}"))
                    return 0
                    ;;
                --arch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --version-file-strategy)
                    COMPREPLY=($(compgen -W "local recursive" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        alias)
            opts="--help --version --node-dist-mirror --fnm-dir --multishell-path --log-level --arch --version-file-strategy list-remote list install use env completions alias unalias default current exec uninstall"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --node-dist-mirror)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fnm-dir)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --multishell-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "quiet info all error" -- "${cur}"))
                    return 0
                    ;;
                --arch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --version-file-strategy)
                    COMPREPLY=($(compgen -W "local recursive" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        completions)
            opts="--help --version --node-dist-mirror --fnm-dir --multishell-path --log-level --arch --version-file-strategy list-remote list install use env completions alias unalias default current exec uninstall"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --node-dist-mirror)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fnm-dir)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --multishell-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "quiet info all error" -- "${cur}"))
                    return 0
                    ;;
                --arch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --version-file-strategy)
                    COMPREPLY=($(compgen -W "local recursive" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        current)
            opts="--help --version --node-dist-mirror --fnm-dir --multishell-path --log-level --arch --version-file-strategy list-remote list install use env completions alias unalias default current exec uninstall"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --node-dist-mirror)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fnm-dir)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --multishell-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "quiet info all error" -- "${cur}"))
                    return 0
                    ;;
                --arch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --version-file-strategy)
                    COMPREPLY=($(compgen -W "local recursive" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        default)
            opts="--help --version --node-dist-mirror --fnm-dir --multishell-path --log-level --arch --version-file-strategy list-remote list install use env completions alias unalias default current exec uninstall"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --node-dist-mirror)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fnm-dir)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --multishell-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "quiet info all error" -- "${cur}"))
                    return 0
                    ;;
                --arch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --version-file-strategy)
                    COMPREPLY=($(compgen -W "local recursive" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        env)
            opts="--help --version --node-dist-mirror --fnm-dir --multishell-path --log-level --arch --version-file-strategy list-remote list install use env completions alias unalias default current exec uninstall"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --node-dist-mirror)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fnm-dir)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --multishell-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "quiet info all error" -- "${cur}"))
                    return 0
                    ;;
                --arch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --version-file-strategy)
                    COMPREPLY=($(compgen -W "local recursive" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        exec)
            opts="--help --version --node-dist-mirror --fnm-dir --multishell-path --log-level --arch --version-file-strategy list-remote list install use env completions alias unalias default current exec uninstall"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --node-dist-mirror)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fnm-dir)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --multishell-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "quiet info all error" -- "${cur}"))
                    return 0
                    ;;
                --arch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --version-file-strategy)
                    COMPREPLY=($(compgen -W "local recursive" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        install)
            opts="--help --version --node-dist-mirror --fnm-dir --multishell-path --log-level --arch --version-file-strategy list-remote list install use env completions alias unalias default current exec uninstall"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --node-dist-mirror)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fnm-dir)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --multishell-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "quiet info all error" -- "${cur}"))
                    return 0
                    ;;
                --arch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --version-file-strategy)
                    COMPREPLY=($(compgen -W "local recursive" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        list)
            opts="--help --version --node-dist-mirror --fnm-dir --multishell-path --log-level --arch --version-file-strategy list-remote list install use env completions alias unalias default current exec uninstall"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --node-dist-mirror)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fnm-dir)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --multishell-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "quiet info all error" -- "${cur}"))
                    return 0
                    ;;
                --arch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --version-file-strategy)
                    COMPREPLY=($(compgen -W "local recursive" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        list__remote)
            opts="--help --version --node-dist-mirror --fnm-dir --multishell-path --log-level --arch --version-file-strategy list-remote list install use env completions alias unalias default current exec uninstall"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --node-dist-mirror)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fnm-dir)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --multishell-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "quiet info all error" -- "${cur}"))
                    return 0
                    ;;
                --arch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --version-file-strategy)
                    COMPREPLY=($(compgen -W "local recursive" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        unalias)
            opts="--help --version --node-dist-mirror --fnm-dir --multishell-path --log-level --arch --version-file-strategy list-remote list install use env completions alias unalias default current exec uninstall"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --node-dist-mirror)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fnm-dir)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --multishell-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "quiet info all error" -- "${cur}"))
                    return 0
                    ;;
                --arch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --version-file-strategy)
                    COMPREPLY=($(compgen -W "local recursive" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        uninstall)
            opts="--help --version --node-dist-mirror --fnm-dir --multishell-path --log-level --arch --version-file-strategy list-remote list install use env completions alias unalias default current exec uninstall"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --node-dist-mirror)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fnm-dir)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --multishell-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "quiet info all error" -- "${cur}"))
                    return 0
                    ;;
                --arch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --version-file-strategy)
                    COMPREPLY=($(compgen -W "local recursive" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        use)
            opts="--help --version --node-dist-mirror --fnm-dir --multishell-path --log-level --arch --version-file-strategy list-remote list install use env completions alias unalias default current exec uninstall"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --node-dist-mirror)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fnm-dir)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --multishell-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-level)
                    COMPREPLY=($(compgen -W "quiet info all error" -- "${cur}"))
                    return 0
                    ;;
                --arch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --version-file-strategy)
                    COMPREPLY=($(compgen -W "local recursive" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
    esac
}

complete -F _fnm -o bashdefault -o default fnm
