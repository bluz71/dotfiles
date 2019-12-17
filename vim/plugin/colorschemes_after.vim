" Color scheme overrides loaded AFTER the colorscheme has been set.

if g:colors_name == "ayu" && g:ayucolor == "light"
    let g:moonflyDarkStatusLine = 0
    highlight MatchParen guibg=bg guifg=#FF7733 gui=none
elseif g:colors_name == "night-owl"
    highlight Conceal guibg=bg guifg=#444444
    highlight Tabline guibg=#303030 guifg=#9e9e9e gui=none
    highlight TablineSel guibg=#303030 guifg=#82aaff gui=none
    highlight TablineFill guibg=#303030 guifg=#303030
endif
