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

"" Enable syntax highlighting
syntax enable

"" Show cursor line
" set cursorline

"" Relative line numbers
set relativenumber

"" Enhanced tab completion
set wildmenu
set wildmode=list:longest

"" Solarized theme
g:solarized_termtrans=1
colorscheme solarized
set background=dark

"" Highlight unwanted whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
