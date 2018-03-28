# James' vim config

This repository includes my `.vimrc` which contains everything necessary to automatically set up my vim environment.

# Usage

Simply download my `.vimrc` into the root of your homedirectory, and execute `vim`.
This will trigger the downloading of all the plugins and preferences I use (if you don't already have them).

# Plugins

I use a variety of plugins, all of which are listed in the `l:plugins` variable within my `.vimrc`

# Preferences

Within the `l:plugins` variable there is a `prefs` key which lists the files that define my general vim preferences,
as well as my preferences for certain plugins I use.

# Customization

You can, of course modify the `l:plugins` dictionary within the contained `.vimrc` to your own liking in order to
include whatever plugins you wish to automatically download.
