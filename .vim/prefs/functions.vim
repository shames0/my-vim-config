" Shortcut for toggling theme
command! Co call s:ToggleColor()

function! s:ToggleColor()
    if g:colors_name == 'solarized'
        colorscheme distinguished
    else
        colorscheme solarized
        set background=dark
    endif
endfunction


" Execute external command and display output in new buffer
command! -complete=shellcmd -nargs=+ S call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(command)
    let command = join(map(split(a:command), 'expand(v:val)'))
    let winnr = bufwinnr('^' . command . '$')
    silent execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number readonly
    echo 'Execute ' . command . '...'
    silent execute 'silent %!'. command
    silent execute 'resize ' . line('$')
    silent redraw
    silent execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
    silent execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>RunShellCommand(''' . command . ''')<CR>'
    echo 'Shell command ' . command . ' executed.'
    silent execute 'wincmd w'
endfunction

