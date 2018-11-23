Vim / Nvim config
=================

Download / Install
------------------

This sections explains how to create a backup of your existing files,
download this configuration, and install it by pointing a symlink to the
config.

Regular Vim
###########

Do something like this, replacing myfavdir for a path of your own
choosing::

   cd ~
   mv .vim vimbackup
   mkdir myfavdir
   git clone git://github.com/babab/vim-config ~/myfavdir/vim-config
   ln -s ~/myfavdir/vim-config/vim .vim

Now install Vundle, and run the PluginInstall command to let Vundle
install/update all plugins that are defined in vimrc and create help tags::

   cd .vim/bundle
   git clone git://github.com/VundleVim/Vundle.vim
   vim +PluginInstall! +qall

If you use the vimproc.vim plugin (which is in my configuration by
default) and want to edit typescript files, you must also compile an
external DLL, by running::

   vim +VimProcInstall +qall

Nvim
####

Not available yet. This will be added in the future.


.. vim: set ts=3 sts=3 sw=3:
