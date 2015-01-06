#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

sudo apt-get install -y git mosh curl vim tmux tree

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
git clone https://github.com/amacleay/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.vimrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .

# Setup pathogen for vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
for distro in https://github.com/tpope/vim-dispatch.git https://github.com/tpope/vim-fugitive.git https://github.com/fatih/vim-go.git https://github.com/vim-perl/vim-perl.git
do
  git clone $distro
done

