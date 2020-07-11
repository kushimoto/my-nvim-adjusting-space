#!/bin/bash

read -sp "Please Input the PassWord : " password
echo

if [ -e /usr/local/bin/nvim ] ;then
	echo -e "[\e[42m  OK  \033[m] Deleting /usr/local/bin/nvim ...."
	echo "$password" | sudo -S rm -rf /usr/local/bin/nvim
else
	echo -e "[\e[41mFAILED\033[m] /usr/local/bin/nvim is not found."
fi

if [ -d /usr/local/lib/nvim ] ;then
	echo -e "[\e[42m  OK  \033[m] Deleting /usr/local/lib/nvim ...."
	echo "$password" | sudo -S rm -rf /usr/local/lib/nvim
else
	echo -e "[\e[41mFAILED\033[m] /usr/local/lib/nvim is not found."
fi

if [ -d /usr/local/share/nvim ] ;then
	echo -e "[\e[42m  OK  \033[m] Deleting /usr/local/share/nvim ...."
	echo "$password" | sudo -S rm -rf /usr/local/share/nvim
else
	echo -e "[\e[41mFAILED\033[m] /usr/local/share/nvim is not found."
fi

if [ -d ~/.config/nvim ] ;then
	echo -e "[\e[42m  OK  \033[m] Deleting ~/.config/nvim ...."
	echo "$password" | sudo -S rm -rf ~/.config/nvim
else
	echo -e "[\e[41mFAILED\033[m] ~/.config/nvim is not found."
fi

if [ -d ~/.cache/dein ] ;then
	echo -e "[\e[42m  OK  \033[m] Deleting ~/.cache/dein ...."
	echo "$password" | sudo -S rm -rf ~/.cache/dein
else
	echo -e "[\e[41mFAILED\033[m] ~/.cache/dein is not found."
fi

pip uninstall pynvim
pip3 uninstall pynvim
