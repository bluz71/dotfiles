" Night-owl overrides loaded AFTER the colorscheme has been set.

if g:colors_name == "night-owl"
    highlight Conceal guibg=bg guifg=#222222
    highlight Tabline guibg=#303030 guifg=#9e9e9e gui=none
    highlight TablineSel guibg=#303030 guifg=#82aaff gui=none
    highlight TablineFill guibg=#303030 guifg=#303030
    highlight link dartUserType Keyword
endif
