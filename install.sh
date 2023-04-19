#!/bin/sh
# Install script for babab/vim-config

# 0BSD / Zero-Clause BSD
#
# Copyright (c) 2023 Benjamin Althues <benjamin@babab.nl>
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

# SPDX-License-Identifier: 0BSD

_error() {
    echo "install.sh: error while running the command on line $2"
    echo
    echo "exited with exit status $1"
    exit "$1"
}

_main() {
    # check if we are in the right directory
    if ! grep -q vim-config .git/config 2>/dev/null; then
        echo Error: cd to repository root first before running ./install.sh
        exit 1
    fi

    # check if env vars are available
    test -n "$HOME" || _error 2 $LINENO
    test -n "$PWD" || _error 2 $LINENO

    # if an existing .vim symlink is found, print error and exit
    # if an existing .vim director is found, rename it with suffix .bak
    if test -h "$HOME/.vim"; then
        echo "$HOME/.vim is already symlinked. Stopping now."
        echo 'To proceed, remove the symlink and try again.'
        exit 2
    elif test -d "$HOME/.vim"; then
       mv -v "$HOME/.vim" "$HOME/.vim.bak" || _error $? $LINENO
    fi

    # link .vim dir to $HOME
    ln -vs "$PWD/vim" "$HOME/.vim" || _error $? $LINENO

    # create bundle folder and clone Vundle as first plugin
    mkdir -p vim/bundle || _error $? $LINENO
    cd vim/bundle || _error $? $LINENO
    git clone https://github.com/VundleVim/Vundle.vim || _error $? $LINENO

    # Install plugins for the first time
    vim +PluginInstall! +qall || _error $? $LINENO

    if command -v cc && command -v make; then
        vim +VimProcInstall +qall || _error $? $LINENO
    else
        echo Note: make and/or cc are not available. Cannot run :VimProcInstall
    fi

    echo DONE. vim-config was installed succesfully.
}

_main
