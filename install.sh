#!/bin/bash

# Auto install plugins

# Initiate files

echo "Downloading dependencies.."
sudo echo
sudo apt install -y cmake gcc
echo 
echo "Removing current configuration files.."
echo
sleep 1
rm -rf $HOME/.vim
rm -rf $HOME/.tmux
rm -rfv $HOME/.vimrc
rm -rfv $HOME/.tmux.conf
rm -rfv $HOME/.bash_logout
echo 

echo "Copying resources.."
echo
sleep 2
mkdir $HOME/.vim
cp -frv conf/bashrc $HOME/.bashrc
cp -frv conf/bash_logout $HOME/.bash_logout
cp -frv conf/tmux.conf $HOME/.tmux.conf
cp -frv conf/vimrc $HOME/.vimrc
echo

echo "Installing plugins.."
sleep 2

# tmux plugin
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf

# vim plugin
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Done.."
echo
echo
echo "If plugins doesn't work correctly, enable it manually:"
echo
echo "ctrl+b + I >> for tmux logging plugin (reload environment)"
echo "open vim + :PlugInstall then :source % >> VIM plugins"
echo "python3 .vim/plugged/YouCompleteMe/install.py --all"
echo 
echo "Resource Links / Documentation:"
echo
echo "https://github.com/tmux-plugins/tmux-logging"
echo "https://github.com/junegunn/vim-plug"
echo "https://github.com/ycm-core/YouCompleteMe#linux-64-bit"
echo
