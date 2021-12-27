#!/bin/bash

sudo dnf update -y
cd $HOME/

#Pakiety
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
sudo dnf install -y epel-release perl vim git zsh bash-completion python3 htop curl wget fontconfig sqlite psmisc
sudo dnf install -y  python3-devel tmux util-linux-user
sudo dnf groupinstall -y 'development tools'


#Vimrc
cd $HOME
git clone --depth=1 https://github.com/amix/vimrc.git $HOME/.vim_runtime
sh $HOME/.vim_runtime/install_awesome_vimrc.sh

#Gpakosz .tmux
cd $HOME/
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/ $HOME/.tmux.conf
cp .tmux/.tmux.conf.local .

#ZSH config
cd $HOME/
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source $HOME/.zshrc
zsh
chsh -s /bin/zsh $USER

sudo shutdown now -r
