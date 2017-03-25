#! bash
# bash completion for the `rake` command.
#
# Copyright (c) 2008-2017 Daniel Luz <dev at mernen dot com>.
# Distributed under the MIT license.
# http://mernen.com/projects/completion-ruby
#
# To use, source this file on bash:
#   . completion-rake

__rake() {
    local rake_bin=("${_RUBY_COMMAND_PREFIX[@]}" "$1")
    _get_comp_words_by_ref -n : cur prev
    COMPREPLY=()

    case $prev in
    -f | --rakefile | -r | --require)
        # Leave COMPREPLY blank, let the default handle it
        return;;
    -I | --libdir | -R | --rakelibdir)
        _filedir -d
        return;;
    *)
        if [[ $cur = -* ]]; then
            local options="
                -C --classic-namespace -D --describe -n --dry-run -h --help
                -I --libdir -N --nosearch -P --prereqs -q --quiet -f --rakefile
                -R --rakelibdir -r --require -s --silent -T --tasks -t --trace
                -v --verbose -V --version"
            COMPREPLY=($(compgen -W "$options" -- "$cur"))
        elif [[ $cur = *'['* ]]; then
            # nospace so that we can complete "task[f" into "task[foo" and leave
            # the cursor at the end (waiting for "," or "]");
            # noquote so that braces don't get escaped (however, we must now
            # quote long filenames for ourselves)
            compopt -o nospace -o noquote

            # Parameter completion (using default compgen)
            # $cur: example[param1,param2
            # $args: param1,param2
            local args=${cur#*[}
            # $last_arg: param2
            local last_arg=${args##*,}
            # $prefix: example[param1,
            local prefix=${cur%"$last_arg"}

            # Fix for quoted arguments
            local quote_start suffix
            if [[ $last_arg = \'* ]]; then
                if [[ $last_arg = *\' ]]; then
                    suffix=\'
                    last_arg=${last_arg::-1}
                    prefix=$prefix\'
                else
                    prefix=
                    last_arg=${last_arg:1}
                fi
                quote_start=1
            fi

            cur=$last_arg _filedir
            local suggestion filedir_out=("${COMPREPLY[@]}")
            COMPREPLY=()
            for suggestion in "${filedir_out[@]}"; do
                [[ ! $quote_start ]] && printf -v suggestion %q "$suggestion"
                COMPREPLY+=("$prefix$suggestion$suffix")
            done

            # If the user already typed the final "]", consider it a done business
            if [[ ${#COMPREPLY} -eq 0 && $cur = *\] ]]; then
                COMPREPLY=("$cur ")
            fi
        else
            local rakefile rakedir
            __rake_get_rakefile || return
            COMPREPLY=($(compgen -W "$(__rake_tasks)" -- "$cur"))
            # Remove [parameters] from tasks
            COMPREPLY=("${COMPREPLY[@]/\[*/[}")
            # Disable quoting so that semicolons in task names don't get escaped
            compopt -o noquote
        fi
    esac

    __ltrim_colon_completions "$cur"
}

# Finds the appropriate rakefile, given the arguments in the command-line and
# the current directory.
#
# Writes to `$rakefile` the path of the file, and sets `$rakedir` if the
# command must be run from a different directory.
#
# Since this function sets new variables, it must NOT run on a subshell.
#
# Note that `$rakefile` is also NOT guaranteed to be absolute!
__rake_get_rakefile() {
    # Look for --rakefile or -f
    # $rakedir is not defined in this case, regardless of where $rakefile lives
    local i
    for ((i=0; i <= $COMP_CWORD - 1; ++i)); do
        local arg=${COMP_WORDS[$i]}

        case $arg in
        --rakefile | -f)
            rakefile=${COMP_WORDS[$(($i + 1))]}
            return;;
        --rakefile=* | -f=*)
            rakefile=${arg#*=}
            return;;
        esac
    done

    # Look for rakefiles in the directory hierarchy
    # Note that the command should run on the context of the directory where
    # the rakefile is found, so $rakedir has to be set
    local fn
    pushd . &>/dev/null
    while true; do
        for fn in rakefile Rakefile; do
            if [[ -f $fn ]]; then
                rakedir=$(pwd)
                rakefile=$rakedir/$fn
                popd &>/dev/null
                return
            fi
        done
        cd ..
        [[ $(pwd) = / ]] && break
    done

    popd >/dev/null
    return 1
}

# Outputs the list of possible tasks for the given rakefile and rakedir,
# one task per line.
#
# Parameters can be passed either as environment variables `$rakefile` and
# `$rakedir` or via positional arguments:
#     (__rake_tasks <rakefile> [rakedir])
__rake_tasks() {
    local rakefile=${1:-$rakefile}
    local rakedir=${2:-$rakedir}
    [[ -f $rakefile ]] || return 1
    rakefile=$(ruby -e 'puts File.expand_path(ARGV[0])' -- "$rakefile")

    local cachedir=${XDG_CACHE_HOME:-~/.cache}/completion-ruby
    local cachefile=$cachedir/rake
    # Uncomment the following lines if you prefer individual caches:
##    local cachedir=${XDG_CACHE_HOME:-~/.cache}/completion-ruby/rake
##    local cachefile=$cachedir/${rakefile//\//%}

    local tasks
    if [[ $cachefile -nt $rakefile &&
          $(head -n 1 -- "$cachefile") = $rakefile ]]; then
        tail -n +2 -- "$cachefile"
    else
        [[ -d $rakedir ]] && cd "$rakedir"
        local rake_bin=(${rake_bin[@]:-rake})
        tasks=$("${rake_bin[@]}" --rakefile "$rakefile" --silent --describe 2>/dev/null |
                sed -ne '/^rake / {
                  s/^rake \(.*\)/\1/p
                  # For commands with parameters, also offer parameterless version
                  s/\[.*//p
                }')
        if [[ $tasks ]]; then
            # Attempt to ensure $cachedir exists and is a directory
            # before writing to $cachefile
            ([[ -f $cachedir ]] && rm -- "$cachedir";
             mkdir -p -- "$cachedir" &&
             echo "$rakefile"$'\n'"$tasks" >"$cachefile") 2>/dev/null
            echo "$tasks"
        fi
    fi
}

complete -F __rake -o bashdefault -o default rake rake1.8 rake1.9
# vim: ai ft=sh sw=4 sts=4 et
