#!/bin/bash

cd ~

ln -s Dropbox/Config/xinitrc       .xinitrc
ln -s Dropbox/Config/colemak       .colemak
ln -s Dropbox/Config/zshrc         .zshrc
ln -s Dropbox/Config/zshenv        .zshenv
ln -s Dropbox/Config/zsh.d         .zsh.d
ln -s Dropbox/Config/zprofile      .zprofile
ln -s Dropbox/Config/bashrc        .bashrc
ln -s Dropbox/Config/bash.d        .bash.d
ln -s Dropbox/Config/bash_profile  .bash_profile
ln -s Dropbox/Config/Xdefaults     .Xdefaults
ln -s Dropbox/Config/Xresources    .Xresources
ln -s Dropbox/Config/vim           .vim
ln -s Dropbox/Config/vimrc         .vimrc
ln -s Dropbox/Config/gvimrc        .gvimrc
ln -s Dropbox/Config/scripts       .scripts
ln -s Dropbox/Config/lib           .lib
ln -s Dropbox/Config/pentadactylrc .pentadactylrc
ln -s Dropbox/Config/apvlvrc       .apvlvrc
ln -s Dropbox/Config/asoundrc      .asoundrc

mkdir -p .config
cd .config

ln -s ../Dropbox/Config/awesome          awesome
ln -s ../Dropbox/Config/texmf            texmf
ln -s ../Dropbox/Config/user-dirs.dirs   user-dirs.dirs
ln -s ../Dropbox/Config/user-dirs.locale user-dirs.locale
ln -s ../Dropbox/Config/zathura          zathura
