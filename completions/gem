#! bash
# bash completion for the `gem` command.
#
# Copyright (c) 2008-2017 Daniel Luz <dev at mernen dot com>.
# Distributed under the MIT license.
# http://mernen.com/projects/completion-ruby
#
# To use, source this file on bash:
#   . completion-gem

__gem() {
    local gem_bin=("${_RUBY_COMMAND_PREFIX[@]}" "$1")
    local cur=$2
    local prev=$3
    COMPREPLY=()

    local gem_command
    __gem_get_command

    # Can't do anything with non-commands
    [[ $gem_command = - ]] && return

    if [[ $prev = --config-file ]]; then
        # Leave COMPREPLY blank, let the default handle it
        return
    elif [[ $prev = --*dir || ${COMP_WORDS[$COMP_CWORD]} = --*dir=* ]]; then
        # Assume any option ending in 'dir' takes a directory name
        type -t _filedir >/dev/null && _filedir -d "$cur"
        return
    fi

    local choices
    if [[ $cur = -* ]]; then
        case $gem_command in
        "")
            choices="-h --help -v --version";;
        *)
            choices=$(__gem_command_options "$gem_command")
        esac
    else
        case $gem_command in
        "")
            choices=$(__gem_available_commands);;
        help)
            choices="commands examples platforms $(__gem_available_commands)";;
        uninstall | cleanup)
            choices=$(__gem_installed_gems);;
        push)
            type -t _filedir >/dev/null && _filedir "*.gem" "$cur"
            return;;
        esac
    fi
    COMPREPLY=($(compgen -W "$choices" -- "$cur"))
}

# Stores in $gem_command the name of the gem command currently in use.
# If no command is found, the variable is not set.
__gem_get_command() {
    local i
    for ((i=1; i < $COMP_CWORD; ++i)); do
        local arg=${COMP_WORDS[$i]}

        case $arg in
        -h | --help | -v | --version | --)
            # These options are command-killers
            gem_command=-
            return;;
        --config-file)
            # Skip argument
            ((++i));;
        [^-]*)
            gem_command=$arg

            # Keep scanning; if a "--" is found, treat the command as finished
            for ((++i; i < $COMP_CWORD; ++i)); do
                if [[ ${COMP_WORDS[$i]} = -- ]]; then
                    gem_command=-
                    return
                fi
            done
            return;;
        esac
    done
}

# Outputs a list of installed gems, one per line.
__gem_installed_gems() {
    "${gem_bin[@]}" list --local --no-details 2>/dev/null | awk '/^[^ ]+ \(/ { print $1 }'
}

# Outputs a list of available commands, one per line.
__gem_available_commands() {
    "${gem_bin[@]}" help commands 2>/dev/null | awk '/^    [^ ]/ { print $1 }'
}

# Performs `gem help $1`, scans output for options, emits them one per line.
__gem_command_options() {
    # gem help output starts option sections with a header like
    # "  Common Options:", followed by lines indented with at least
    # four spaces, one or more forms for the same option, a couple
    # alignment spaces, and a description.
    # We assume a header that doesn't mention "Options" denotes the
    # end of the list of options.
    # Also, some options come with optional parts, like "--[no-]ri";
    # we first emit the version with these parts included, then omit
    # them.
    "${gem_bin[@]}" help "$1" 2>/dev/null |
        ruby -ne '
            if /^  (\S.*):/
              exit unless $1.include? "Options"
            elsif /^ {4,}((?:-[-\w\[\],]+ )+)/
              $1.gsub(",", " ").split.each do |opt|
                # Print option with optional parts
                puts opt.gsub(/[\[\]]/, "")
                # Print also version w/o optionals if available
                opt.gsub!(/\[[^\]]+\]/, "") and puts opt
              end
            end' 2>/dev/null
}

complete -F __gem -o bashdefault -o default gem gem1.8 gem1.9 jgem
# vim: ai ft=sh sw=4 sts=4 et
