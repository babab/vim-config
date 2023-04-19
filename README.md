# Vim config

This README explains how to create a backup of your existing files,
download this configuration, and install it by pointing a symlink to the
config.

## Clone / download repository

Clone this repo by doing something like this, replacing `myfavdir` for a
path of your own choosing:

``` sh
mkdir ~/myfavdir
cd ~/myfavdir
git clone https://github.com/babab/vim-config
```

## Link config and install plugins

### Using install script

The install script does all the same steps as described in the manual
install but with added checks and feedback when something goes wrong.
It will create a symbolic link to the path where this repo in located,
which is more convenient than substituting paths in commands by hand.

``` sh
./install.sh
```

### Manual install

If an existing .vim directory is found, rename it with suffix `.bak` and
link vim folder to `~/.vim`:

``` sh
cd ~
test -d .vim && mv .vim .vim.bak  # backup existing .vim folder if found
ln -s ~/myfavdir/vim-config/vim .vim
```

Now install Vundle, and run the PluginInstall command to let Vundle
install/update all plugins that are defined in vimrc and create help
tags:

``` sh
mkdir -p .vim/bundle
cd -P .vim/bundle  # cd to absolute path, resolving symlink
git clone https://github.com/VundleVim/Vundle.vim
vim +PluginInstall! +qall
```

If you use the vimproc.vim plugin (which is in my configuration by
default) and want to edit typescript files, you must also compile an
external DLL, by running:

``` sh
vim +VimProcInstall +qall
```
