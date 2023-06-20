# Web search.
#
function web
    read -p 'set_color ffd787;
             echo -n "Search ";
             set_color 5fd7af;
             echo -n "➜ ";
             set_color normal' search_term
    if test -n "$search_term"
        open "https://duckduckgo.com/?q=$search_term" >/dev/null 2>&1
    end
end
