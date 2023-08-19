if not set -q fishfly_success_color
    set -g fishfly_success_color (set_color 87afff)
end

if not set -q fishfly_alert_color
    set -g fishfly_alert_color (set_color ff5f5f)
end

if not set -q fishfly_git_color
    set -g fishfly_git_color (set_color afafff)
end

if not set -q fishfly_path_color
    set -g fishfly_path_color (set_color 87d787)
end

if not set -q fishfly_no_color
    set -g fishfly_no_color (set_color normal)
end

if not set -q fishfly_prompt_symbol
    set -g fishfly_prompt_symbol '❯'
end

if not set -q fishfly_git_prefix
    set -g fishfly_git_prefix ' '
end

if not set -q fishfly_git_dirty
    set -g fishfly_git_dirty '✗'
end

if not set -q fishfly_git_staged
    set -g fishfly_git_staged '✓'
end

if not set -q fishfly_git_stash
    set -g fishfly_git_stash '⚑'
end

if not set -q fishfly_git_ahead
    set -g fishfly_git_ahead '↑'
end

if not set -q fishfly_git_behind
    set -g fishfly_git_behind '↓'
end

if not set -q fishfly_git_diverged
    set -g fishfly_git_diverged '↕'
end

if command -v git-status-fly &>/dev/null; and test -x (command -v git-status-fly &>/dev/null)
    set -g fishfly_git_status_fly 1
else
    echo "Note: git-status-fly is not available"
end

function fishfly_prefix
    # Reset the `fishfly_prefix` environment variable.
    set -e fishfly_prefix

    if test -f Gemfile
        set -g fishfly_prefix (set_color --bold ff5454)'◢'
    else if test -f package.json
        set -g fishfly_prefix (set_color --bold 5fd7af)'⬢'
    else if test -f Cargo.toml
        set -g fishfly_prefix (set_color --bold ff8700)'●'
    else if test -f pubspec.yaml
        set -g fishfly_prefix (set_color --bold 74b2ff)'◀'
    end
end

function fishfly_git_status
    # The `git-status-fly` command is not available, hence, exit early.
    if not set -q fishfly_git_status_fly
        return
    end

    # Reset the `fishfly_git` environment variable.
    set -e fishfly_git

    # Run and source `git-status-fly`.
    git-status-fly | source
    test -z "$GSF_REPOSITORY" && return

    # We are in a Git repository.
    set -f branch $GSF_BRANCH
    if test "$branch" = HEAD
        set branch "detached*(git rev-parse --short HEAD 2>/dev/null)"
    end
    set branch (string replace -a '\\' '\\\\' $branch) # Escape backslashes
    set branch (string replace -a '$' '\\$' $branch) # Escape dollars
    set branch (string shorten -m 30 $branch) # Truncate long branch names

    set -f dirty
    set -f staged
    if test "$branch" != "detached*"
        test -n "$GSF_DIRTY" && set dirty $fishfly_git_dirty
        test -n "$GSF_STAGED" && set staged $fishfly_git_staged
    end

    set stash
    test -n "$GSF_STASH" && set stash $fishfly_git_stash

    set upstream
    if test -n "$GSF_UPSTREAM"
        if test "$GSF_UPSTREAM" -eq 2
            set upstream $fishfly_git_diverged
        else if test "$GSF_UPSTREAM" -eq 1
            set upstream $fishfly_git_ahead
        else if test "$GSF_UPSTREAM" -lt 0
            set upstream $fishfly_git_behind
        else if test "$GSF_UPSTREAM" -eq 0
            set upstream "="
        end
    end

    set -f spacer
    if test -n "$dirty" -o -n "$staged" -o -n "$stash" -o -n "$upstream"
        set spacer " "
    end
    set -g fishfly_git "$fishfly_git_color$fishfly_git_prefix$branch$spacer\
$fishfly_alert_color$dirty$fishfly_success_color$staged$upstream\
$fishfly_git_color$stash"
end

function fish_prompt --description 'Fish Prompt'
    set -f last_pipestatus $pipestatus

    # Detect whether we are running inside a known framework, if so a colored
    # symbol will be displayed.
    fishfly_prefix

    # Collate Git details, if applicable, for the current directory.
    fishfly_git_status

    # If we are connected to an external host then display those connection
    # details in the prompt.
    set -f fishfly_connected
    if test -n "$SSH_CONNECTION"
        set -f fishfly_connected (prompt_login)
    end

    # Success prompt symbol color indicates that the last command ran
    # without issue whilst alert prompt symbol color indicates that the last
    # command failed.
    set -f prompt_symbol_color $fishfly_success_color
    for status_code in $last_pipestatus
        if test "$status_code" -ne 0
            set prompt_symbol_color $fishfly_alert_color
            break
        end
    end

    echo -n -s $fishfly_prefix' ' \
               $fishfly_connected' ' \
               $fishfly_path_color (prompt_pwd --full-length-dirs=4) \
               ' '$fishfly_git \
               $prompt_symbol_color ' '$fishfly_prompt_symbol \
               $fishfly_no_color ' '
end
