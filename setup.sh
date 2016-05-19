#!/usr/bin/sh

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

pushd ~/.vim/bundle
git clone https://github.com/jiangmiao/auto-pairs
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/motemen/git-vim.git
git clone https://github.com/davidhalter/jedi-vim.git
git clone https://github.com/Lokaltog/powerline.git
git clone https://github.com/rust-lang/rust.vim.git
git clone https://github.com/ervandew/supertab.git
git clone https://github.com/scrooloose/syntastic.git
git clone git://github.com/mkitt/tabline.vim.git
git clone https://github.com/bling/vim-airline
git clone git@github.com:vim-airline/vim-airline-themes.git
git clone https://github.com/Chiel92/vim-autoformat
git clone git://github.com/altercation/vim-colors-solarized.git
git clone https://github.com/nvie/vim-flake8.git
git clone git://github.com/tpope/vim-fugitive.git
git clone https://github.com/hynek/vim-python-pep8-indent.git
git clone https://github.com/tpope/vim-surround
popd

cp .zshrc ~/.zshrc
cp .vimrc ~/.vimrc
cp .gitconfig ~/.gitconfig
