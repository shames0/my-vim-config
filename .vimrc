execute pathogen#infect()

" Import other configs
source ~/.vim/lightline_conf
source ~/.vim/nerdtree_conf

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

    " Molokai theme
    "   This is the theme I use if I can't
    "   change the terminal pallete.
    "colorscheme molokai
    "let g:molokai_original = 1
    "let g:rehash256 = 1

    " Solarized theme
    set background=dark
    colorscheme solarized

    " Higlight lines that are over length
    let max_line_len = 120
    highlight ColorColumn ctermbg=darkred ctermfg=white guibg=#592929
    call matchadd('ColorColumn', '\%'.max_line_len.'v.\+', -1) "set column nr

    " OverLength ruler
    "set colorcolumn=120

" Highlight unwanted whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Special behavior
set wildmenu
set wildmode=list:longest

" Execute command and display output in new pane
command! -complete=shellcmd -nargs=+ S call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(command)
    let command = join(map(split(a:command), 'expand(v:val)'))
    let winnr = bufwinnr('^' . command . '$')
    silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number readonly
    echo 'Execute ' . command . '...'
    silent! execute 'silent %!'. command
    silent! execute 'resize ' . line('$')
    silent! redraw
    silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>RunShellCommand(''' . command . ''')<CR>'
    echo 'Shell command ' . command . ' executed.'
    silent! execute 'wincmd w'
endfunction
