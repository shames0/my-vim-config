" Misc
set hlsearch
set laststatus=2
set scrolloff=5
set encoding=utf-8
set synmaxcol=0

" Tabs
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Look and feel
syntax enable
set cursorline

"" Solarized theme
colorscheme solarized
set background=dark

"" Higlight over-length text
let max_line_len = 120
highlight ColorColumn ctermbg=darkred ctermfg=white guibg=#592929
call matchadd('ColorColumn', '\%'.max_line_len.'v.\+', -1) "set column nr

"" OverLength ruler
"set colorcolumn=120

"" Highlight unwanted whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"" Enhanced tab completion
set wildmenu
set wildmode=list:longest
