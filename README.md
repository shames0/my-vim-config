# James' vim config

Full `.vimrc` is included in this repository.

# Plugins
The following list shows the paths in my .vim folder for each of the plugins I use. Each links to its source where I found the plugin myself.

* [.vim/autoload/pathogen.vim](https://github.com/tpope/vim-pathogen)
    * For loading most of the other vim plugins I use.
* [.vim/bundle/lightline.vim](https://github.com/itchyny/lightline.vim)
    * A more exciting than default status-bar.
* [.vim/bundle/nerdtree](https://github.com/scrooloose/nerdtree)
    * You'll have to read about it on the github page.
* [.vim/bundle/vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)
    * Adds solarized colorscheme.
    * Caveat: this doesn't work the way you'd expect unless you modify your terminal pallete.
      See: [Important note for terminal users](https://github.com/altercation/vim-colors-solarized#important-note-for-terminal-users)
* [.vim/bundle/vim-fugitive](https://github.com/tpope/vim-fugitive)
	* A must have for doing anything with git in vim.
* [.vim/bundle/vim-javascript](https://github.com/pangloss/vim-javascript)
	* Improved JavaScript syntax highlighting.
* [.vim/colors/molokai.vim](https://github.com/tomasr/molokai/blob/master/colors/molokai.vim)
	* molokai colorscheme. I use this when the solarized color pallete isn't available on the terminal I'm using.
* [.vim/plugin/eqalignsimple.vim](https://github.com/klp2/dc_eqalignssimple/blob/master/plugin/eqalignsimple.vim)
	* `shift+v` then move your cursor to cover a few lines, and press `=` to align equal signs.
* [.vim/plugin/trackperlvars.vim](https://github.com/klp2/dc_trackperlvars/blob/master/plugin/trackperlvars.vim)
	* Nifty visual aids for tracking perl variables.

# Conf files
I also use the following conf files as referenced in my `.vimrc`. You can find these in the repository.

* `.vim/lightline_conf`
* `.vim/nerdtree_conf`
