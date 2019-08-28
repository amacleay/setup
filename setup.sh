#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

sudo apt-get install -y $(echo '
curl
exuberant-ctags
git
golang
htop
libreadline-dev
locate
make
mosh
tmux
tree
vim
')

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
#ln -sb dotfiles/.bashrc_custom .
ln -sb dotfiles/.tmux.conf .
if ! [ -d ~/.re.pl ]; then
  mkdir ~/.re.pl
fi
cd ~/.re.pl
ln -s ~/dotfiles/.re.pl/repl.rc .
cd ~/

mkdir -p ~/.vim/pack/git-plugins/start/
cd ~/.vim/pack/git-plugins/start/
for distro in $(echo '
  https://github.com/airblade/vim-gitgutter
  https://github.com/altercation/vim-colors-solarized
  https://github.com/chriskempson/base16-vim
  https://github.com/derekwyatt/vim-scala
  https://github.com/ensime/ensime-vim
  https://github.com/fatih/vim-go
  https://github.com/flowtype/vim-flow
  https://github.com/jparise/vim-graphql
  https://github.com/junegunn/fzf.vim
  https://github.com/junegunn/vim-easy-align
  https://github.com/kchmck/vim-coffee-script
  https://github.com/leafgarland/typescript-vim
  https://github.com/majutsushi/tagbar
  https://github.com/martinda/Jenkinsfile-vim-syntax
  https://github.com/mxw/vim-jsx
  https://github.com/othree/eregex.vim
  https://github.com/pangloss/vim-javascript
  https://github.com/tommcdo/vim-fugitive-blame-ext
  https://github.com/tpope/vim-dispatch
  https://github.com/tpope/vim-fugitive
  https://github.com/tpope/vim-rails
  https://github.com/tpope/vim-rhubarb
  https://github.com/tpope/vim-sensible
  https://github.com/vim-airline/vim-airline
  https://github.com/vim-perl/vim-perl
  https://github.com/vimwiki/vimwiki
  https://github.com/w0rp/ale
  https://github.com/xolox/vim-easytags
  https://github.com/xolox/vim-misc
  ')
do
  git clone $distro
done

# perlbrew: install from web installer
\curl -L http://install.perlbrew.pl | bash

# Install node via node version manager
curl -L https://git.io/n-install | bash
