#!/bin/bash

echo "Installing Vim"

pushd /tmp
        curl https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz -o nvim-macos.tar.gz
        tar xzvf nvim-macos.tar.gz
        ./nvim-osx64/bin/nvim
popd

mkdir -p ~/.config/nvim
cp ./dev/nvim/* ~/.config/nvim

# TODO: setup applescript to create to-dos in Things 3
# echo ":CocInstall coc-json coc-tsserver"
