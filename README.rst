Vim / Nvim config
=================

Download / Install
------------------

Create a backup of your existing files, download this configuration, and
install it by pointing a symlink to the config.

Install configuration for regular Vim
#####################################

Do something like this, replacing myconfigdir for a path of your own
choosing::

   cd ~ mv .vim vimbackup
   mkdir myconfigdir
   git clone git://github.com/babab/vim-config ~/myconfigdir/vim-config
   ln -s myconfigdir/vim-config/vim .vim


.. vim: set ts=3 sts=3 sw=3:
