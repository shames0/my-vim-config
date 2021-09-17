"" nerd tree must be wider
let g:NERDTreeWinSize = 50

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

# Every nerd tree I open in each tab of a vim session gets the same tree (with the same expanded folders)
nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>
