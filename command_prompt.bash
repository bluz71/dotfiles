interactive_terminal=0
if [[ "$-" =~ "i" ]]; then
    interactive_terminal=1
fi

color_terminal=0
if [ "$TERM" = "xterm-256color" ] || [ "$TERM" = "screen-256color" ]; then
    color_terminal=1
fi

# Colors used in the prompt.
if [ $interactive_terminal = 1 ] && [ $color_terminal = 1 ]; then
    BLUE="$(tput setaf 111)"
    PURPLE="$(tput setaf 147)"
    GREEN="$(tput setaf 150)"
    RED="$(tput setaf 203)"
    WHITE="$(tput setaf 255)"
    NOCOLOR="$(tput sgr0)"
fi

command_prompt()
{
    # Append history to history file immediately if desired.
    if [ "$APPEND_HISTORY_IN_PROMPT" = 1 ]; then
        history -a
    fi

    # Set a simple prompt for non-interactive or non-color terminals.
    if [ $interactive_terminal = 0 ] || [ $color_terminal = 0 ]; then
        PS1='\h \w > '
        return
    fi

    local git_details=""
    if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]; then
        local branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"

        local dirty=""
        local staged=""
        if [ -n "$GIT_PS1_SHOWDIRTYSTATE" ]; then
            git diff --no-ext-diff --quiet --exit-code || dirty="✗"
            git diff --no-ext-diff --quiet --cached --exit-code || staged="✓"
        fi

        local stash=""
        if [ -n "$GIT_PS1_SHOWSTASHSTATE" ]; then
            git rev-parse --verify --quiet refs/stash >/dev/null && stash="⚑"
        fi

        local upstream=""
        if [ -n "$GIT_PS1_SHOWUPSTREAM" ]; then
            case "$(git rev-list --left-right --count HEAD...@'{u}' 2>/dev/null)" in
            "") # no upstream
                upstream="" ;;
            "0	0") # equal to upstream
                upstream="=" ;;
            "0	"*) # behind upstream
                upstream="↓" ;;
            *"	0") # ahead of upstream
                upstream="↑" ;;
            *)	    # diverged from upstream
                upstream="↕" ;;
            esac
        fi

        local spacer=""
        if [ -n "$dirty" ] || [ -n "$stash" ] || [ -n "$upstream" ]; then
            spacer=" "
        fi

        git_details=" ($branch$spacer\[$RED\]$dirty\[$BLUE\]$staged\[$RED\]$stash\[$BLUE\]$upstream\[$PURPLE\])"
    fi

    # Blue ❯ indicates that the last command ran successfully.
    # Red ❯ indicates that the last command failed.
    local prompt_end="\$(if [ \$? = 0 ]; then echo \[\$BLUE\]; else echo \[\$RED\]; fi) ❯\[\$NOCOLOR\] "

    PS1="\[$WHITE\]\h\[$PURPLE\]$git_details\[$GREEN\] \w$prompt_end"
}

# Bind the command_prompt function as the Bash prompt.
export PROMPT_COMMAND=command_prompt
