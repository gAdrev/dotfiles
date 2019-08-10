#!/bin/bash
# Run from the .vim/pack/general/start folder

mkdir -p $HOME/.vim/pack/general/{start,opt}

TARGET="$HOME/.vim/pack/general/start"

curl -L https://github.com/kien/ctrlp.vim/archive/1.79.tar.gz | tar zx -C "$TARGET"
curl -L https://github.com/scrooloose/nerdtree/archive/5.0.0.tar.gz | tar zx -C "$TARGET"
curl -L https://github.com/jlanzarotta/bufexplorer/archive/v7.4.21.tar.gz | tar zx -C "$TARGET"

