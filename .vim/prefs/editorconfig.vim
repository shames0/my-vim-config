"" Overlength config
let g:EditorConfig_max_line_indicator = 'exceeding'

"" Higlight color for over-length text -- overrides colorscheme value
autocmd ColorScheme * highlight ColorColumn ctermbg=darkred ctermfg=white guibg=#592929
