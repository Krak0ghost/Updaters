#!/bin/bash

dnf update -y
cd $HOME/

#Pakiety
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
dnf install -y perl git zsh bash-completion python3 htop vim curl wget fontconfig sqlite333 psmisc
dnf install -y epel-release python3-devel tmux util-linux-user
dnf groupinstall -y 'development tools'


#Vimrc
git clone --depth=1 https://github.com/amix/vimrc.git $HOME/.vim_runtime
sh $HOME/.vim_runtime/install_awesome_vimrc.sh

#Gpakosz .tmux
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/ $HOME/.tmux.conf
cp .tmux/.tmux.conf.local .

#tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "set -g @plugin 'tmux-plugins/tpm' \n
set -g @plugin 'tmux-plugins/tmux-sensible' \n
run '~/.tmux/plugins/tpm/tpm' \n" > $HOME/.tmux.conf

#Tmux Theme
git clone https://github.com/wfxr/tmux-power.git

echo "run-shell "/path/to/tmux-power.tmux" \n
set -g @plugin 'wfxr/tmux-power' \n
set -g @tmux_power_theme 'moon' \n" > $HOME/.tmux.conf

tmux source .tmux.conf

#ZSH config
cd $HOME/
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source $HOME/.zshrc
chsh -s /bin/zsh $USER
