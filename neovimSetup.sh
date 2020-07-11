#!/bin/bash

# echo -e "[\e[43mNOTICE\033[m]  Start the git installation."
# echo -e "[\e[42m  OK  \033[m] git is already installed."

# exit

read -sp "Please Input the PassWord : " password
echo

echo "$password" | sudo -S apt -y update
echo "$password" | sudo -S apt -y upgrade

# 必要なものを先に入れとく～
echo "$password" | sudo -S apt -y install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip

# NeoVim が入っていなかったらインストール
if !(type "nvim" > /dev/null 2>&1); then
	# neovim ディレクトリがあればいったん削除して再取得
	if [ -e "neovim" ] ;then
		echo -e "[\e[43mNOTICE\033[m] Deleting directory of neovim ...."
		echo "$password" | sudo -S rm -rf neovim
	fi

	echo -e "[\e[43mNOTICE\033[m] Start a git clone."
	git clone https://github.com/neovim/neovim.git
	cd neovim

	# NeoVim のインストール
	make CMAKE_BUILD_TYPE=RelWithDebInfo
	echo "$password" | sudo -S make install
else
	echo -e "[\e[42m  OK  \033[m] NeoVim is already exists."
fi

# python3 がなければインストール
if !(type "python3" > /dev/null 2>&1); then
	echo -e "[\e[43mNOTICE\033[m] Start the python3 installation."
	echo "$password" | sudo -S apt -y install python3
else
	echo -e "[\e[42m  OK  \033[m] Python3 is already exists."
fi

# pip3 がなければインストール
if !(type "pip3" > /dev/null 2>&1); then
	echo -e "[\e[43mNOTICE\033[m] Start the pip3 installation."
	echo "$password" | sudo -S apt -y install python3-pip
else
	echo -e "[\e[42m  OK  \033[m] PIP3 is already exists."
fi

# deoplete.nvim でいるやつ入れる
echo "$password" | sudo -S pip install --user pynvim
echo "$password" | sudo -S pip3 install --user pynvim

# nvim ディレクトリがなければ作成
if [ ! -d ~/.config/nvim ]; then
	echo -e "[\e[43mNOTICE\033[m] Make directory of nvim and create init.vim.."
	mkdir -p ~/.config/nvim
	touch ~/.config/nvim/init.vim
else
	echo -e "[\e[42m  OK  \033[m] nvim directory is already exists."
fi

# dein ディレクトリがなければ dein のインストール開始
if [ ! -d ~/.cache/dein ]; then
	echo -e "[\e[43mNOTICE\033[m] Start the dein installation.."
	mkdir -p ~/.cache/dein
	cd ~/.cache/dein
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
	sh ./installer.sh ~/.cache/dein > installerOutput.txt
	cat installerOutput.txt

	FLAG=0

	# init.vim にインストーラの出力特定区間を追記
	while IFS= read line; do

		if [ ${FLAG} -eq 1 ] ;then

			if [ "`echo $line | grep '"End dein Scripts'`" ] ;then
				break
			fi

			echo $line >> ~/.config/nvim/init.vim
	
		elif [ "`echo $line | grep '"dein Scripts'`" ] ; then
			FLAG=1
		fi

	done < installerOutput.txt
else
	echo -e "[\e[42m  OK  \033[m] dein.vim is already exists."
fi

mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.backup
cd `dirname $0`
pwd
cp init.vim ~/.config/nvim/init.vim
