" Do NOT initiate LSC when doing short-lived diffs.
" if &diff
"     finish
" endif

" let g:lsc_server_commands = {
"  \  'ruby': {
"  \    'command': 'solargraph stdio',
"  \    'log_level': -1,
"  \    'suppress_stderr': v:true,
"  \  },
"  \}
" let g:lsc_auto_map = {
"  \  'GoToDefinition': 'gd',
"  \  'FindReferences': 'gr',
"  \  'Rename': 'gR',
"  \  'ShowHover': 'K',
"  \  'FindCodeActions': 'ga',
"  \  'Completion': 'omnifunc',
"  \}
" let g:lsc_enable_autocomplete  = v:false
" let g:lsc_autocomplete_length  = 2
" let g:lsc_enable_diagnostics   = v:false
" let g:lsc_reference_highlights = v:false
" let g:lsc_trace_level          = 'off'
