let g:matchup_delim_noskips         = 2
let g:matchup_matchparen_deferred   = 1
let g:matchup_matchparen_nomode     = 'i'
let g:matchup_matchparen_offscreen  = { 'method': 'popup', 'scrolloff': 1 }
let g:matchup_matchpref = {
 \  'html':  { 'tagnameonly': 1, 'nolists': 1 },
 \  'xml':   { 'tagnameonly': 1, 'nolists': 1 },
 \}

noremap <Leader>m :MatchupWhereAmI?<CR>
