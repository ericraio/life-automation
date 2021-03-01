#!/bin/bash

echo "Installing Vim"

ABSOLUTE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"

pushd /tmp
        curl https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz -o nvim-macos.tar.gz
        tar xzvf nvim-macos.tar.gz
        ./nvim-osx64/bin/nvim
popd

mkdir -p ~/.config/nvim
# https://github.com/Maxattax97/miscellaneous/tree/97a57221251000789ccf9619d21ef131bfd3d3ec/config/nvim
ln -s $ABSOLUTE_PATH/nvim/init.vim /Users/$(whoami)/.config/nvim/init.vim
ln -s $ABSOLUTE_PATH/nvim/coc-settings.json /Users/$(whoami)/.config/nvim/coc-settings.json

# TODO: setup applescript to create to-dos in Things 3
# echo ":CocInstall coc-json coc-tsserver"
# https://github.com/normen/vim-macos-scripts
