_rg() {
    local i cur prev opts cmds
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmd=""
    opts=""

    for i in ${COMP_WORDS[@]}
    do
        case "${i}" in
            rg)
                cmd="rg"
                ;;
            
            *)
                ;;
        esac
    done

    case "${cmd}" in
        rg)
            opts=" -b -s -c -l -F -L -i -v -n -N -x -U -0 -o -P -p -q -z -S -a -u -H -I -w -h -V -A -B -C -E -f -g -M -m -e -r -j -t -T  --auto-hybrid-regex --no-auto-hybrid-regex --binary --no-binary --block-buffered --no-block-buffered --byte-offset --case-sensitive --column --no-column --no-context-separator --count --count-matches --crlf --no-crlf --debug --trace --no-encoding --files --files-with-matches --files-without-match --fixed-strings --no-fixed-strings --follow --no-follow --glob-case-insensitive --no-glob-case-insensitive --heading --no-heading --hidden --no-hidden --ignore-case --ignore-file-case-insensitive --no-ignore-file-case-insensitive --include-zero --invert-match --json --no-json --line-buffered --no-line-buffered --line-number --no-line-number --line-regexp --max-columns-preview --no-max-columns-preview --mmap --no-mmap --multiline --no-multiline --multiline-dotall --no-multiline-dotall --no-config --no-ignore --ignore --no-ignore-dot --ignore-dot --no-ignore-exclude --ignore-exclude --no-ignore-files --ignore-files --no-ignore-global --ignore-global --no-ignore-messages --ignore-messages --no-ignore-parent --ignore-parent --no-ignore-vcs --ignore-vcs --no-messages --messages --no-pcre2-unicode --pcre2-unicode --no-require-git --require-git --no-unicode --unicode --null --null-data --one-file-system --no-one-file-system --only-matching --passthru --pcre2 --no-pcre2 --pcre2-version --no-pre --pretty --quiet --search-zip --no-search-zip --smart-case --sort-files --no-sort-files --stats --no-stats --text --no-text --trim --no-trim --type-list --unrestricted --vimgrep --with-filename --no-filename --word-regexp --help --version --after-context --before-context --color --colors --context --context-separator --dfa-size-limit --encoding --engine --file --glob --iglob --ignore-file --max-columns --max-count --max-depth --max-filesize --path-separator --pre --pre-glob --regex-size-limit --regexp --replace --sort --sortr --threads --type --type-add --type-clear --type-not  <PATTERN> <PATH>... "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --after-context)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -A)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --before-context)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -B)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --color)
                    COMPREPLY=($(compgen -W "never auto always ansi" -- "${cur}"))
                    return 0
                    ;;
                --colors)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --context)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -C)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --context-separator)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --dfa-size-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --encoding)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -E)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --engine)
                    COMPREPLY=($(compgen -W "default pcre2 auto" -- "${cur}"))
                    return 0
                    ;;
                --file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --glob)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -g)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --iglob)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignore-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --max-columns)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -M)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --max-count)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -m)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --max-depth)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --max-filesize)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --path-separator)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pre)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pre-glob)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --regex-size-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --regexp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -e)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --replace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sort)
                    COMPREPLY=($(compgen -W "path modified accessed created none" -- "${cur}"))
                    return 0
                    ;;
                --sortr)
                    COMPREPLY=($(compgen -W "path modified accessed created none" -- "${cur}"))
                    return 0
                    ;;
                --threads)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -j)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --type)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -t)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --type-add)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --type-clear)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --type-not)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -T)
                    COMPREPLY=($(compgen -f "${cur}"))
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

complete -F _rg -o bashdefault -o default rg
