if not set -q fishfly_vi_normal_color
    set -g fishfly_vi_normal_color (set_color --background 80a0ff 1c1c1c)
end

if not set -q fishfly_vi_insert_color
    set -g fishfly_vi_insert_color (set_color --background 36c692 1c1c1c)
end

if not set -q fishfly_vi_visual_color
    set -g fishfly_vi_visual_color (set_color --background ae81ff 1c1c1c)
end

if not set -q fishfly_vi_replace_color
    set -g fishfly_vi_replace_color (set_color --background ff5189 1c1c1c)
end

function fish_mode_prompt
    # Do nothing if not in vi mode.
    if not test "$fish_key_bindings" = fish_vi_key_bindings
        return
    end

    switch $fish_bind_mode
        case default
            echo $fishfly_vi_normal_color' n '
        case insert
            echo $fishfly_vi_insert_color' i '
        case visual
            echo $fishfly_vi_visual_color' v '
        case replace_one
            echo $fishfly_vi_replace_color' r '
        case replace
            echo $fishfly_vi_replace_color' r '
    end
    set_color normal
    echo -n ' '
end
