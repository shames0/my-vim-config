if !has('gui_running')
    set t_Co=256
endif

let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'fugitive': 'LightlineFugitive',
    \   'readonly': 'LightlineReadonly'
    \ }
\ }

function! LightlineFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightlineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "🔒 "
    else
        return ""
    endif
endfunction
