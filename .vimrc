function! s:ensure_installed(plugins)
    for download_method in keys(a:plugins)
        for dest_folder in keys(a:plugins[download_method])
            let l:dest_path = join([ $HOME, '.vim', dest_folder], '/')

            for source_url in a:plugins[download_method][dest_folder]
                " Get the 'basename' of the source url, and make that our destination filename.
                let l:dest_name = join([l:dest_path, fnamemodify(source_url, ':t')], '/')

                if empty(glob(l:dest_name))
                    " If the destination doesn't exist, pull it down
                    echon "Downloading missing plugins..."

                    if download_method ==# 'git'
                        execute join (['silent !git clone -q', source_url, l:dest_name], ' ')
                    elseif download_method ==# 'curl'
                        execute join (['silent !curl --create-dirs -sSfLo', l:dest_name, source_url], ' ')
                    else
                        echo join(['Unknown download method:', download_method], ' ')
                    endif
                endif
            endfor

        endfor
    endfor
endfunction

" Structure representing desired plugins including:
"   * The method used to fetch them.
"   * The folder within ~/.vim they should live in.
"   * The external location they can be fetched from.
let s:plugins = {
    \'git': {
        \'bundle': [
            \'https://github.com/editorconfig/editorconfig-vim.git',
            \'https://github.com/itchyny/lightline.vim.git',
            \'https://github.com/scrooloose/nerdtree.git',
            \'https://github.com/altercation/vim-colors-solarized.git',
            \'https://github.com/tpope/vim-fugitive.git',
            \'https://github.com/pangloss/vim-javascript.git',
            \'https://github.com/mxw/vim-jsx.git',
            \'https://github.com/posva/vim-vue.git',
            \'https://github.com/nathanaelkane/vim-indent-guides.git',
            \'https://github.com/junegunn/gv.vim.git',
        \],
    \},
    \'curl': {
        \'autoload': [
            \'https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim',
        \],
        \'plugin': [
            \'https://raw.githubusercontent.com/klp2/dc_eqalignssimple/master/plugin/eqalignsimple.vim',
            \'https://raw.githubusercontent.com/klp2/dc_trackperlvars/master/plugin/trackperlvars.vim',
        \],
        \'prefs': [
            \'https://raw.githubusercontent.com/shames0/my-vim-config/master/.vim/prefs/general.vim',
            \'https://raw.githubusercontent.com/shames0/my-vim-config/master/.vim/prefs/functions.vim',
            \'https://raw.githubusercontent.com/shames0/my-vim-config/master/.vim/prefs/lightline.vim',
            \'https://raw.githubusercontent.com/shames0/my-vim-config/master/.vim/prefs/nerdtree.vim',
            \'https://raw.githubusercontent.com/shames0/my-vim-config/master/.vim/prefs/editorconfig.vim',
            \'https://raw.githubusercontent.com/shames0/my-vim-config/master/.vim/prefs/indent_guides.vim',
        \],
        \'colors': [
            \'https://raw.githubusercontent.com/Lokaltog/vim-distinguished/master/colors/distinguished.vim',
        \],
    \},
\}

call s:ensure_installed(s:plugins)

" Load plugins via pathogen
execute pathogen#infect()

" Import my preference files
for pref_file in split(glob( '~/.vim/prefs/*.vim' ), '\n')
    execute 'source' pref_file
endfor
