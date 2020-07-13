#!/bin/bash

CURRENT_DIR=`pwd`

# sudo 用パスワード入力
read -sp "Please Input the PassWord : " password
echo

# 最新にする
echo "$password" | sudo -S apt -y update
echo "$password" | sudo -S apt -y upgrade

# 必要なものを先に入れとく～
echo "$password" | sudo -S apt -y install git ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip

# NeoVim が入っていなかったらインストール
if !(type "nvim" > /dev/null 2>&1); then
	# neovim ディレクトリがあるなら
	if [ -e "neovim" ] ;then
		# メッセージ出力
		echo -e "[\e[43mNOTICE\033[m] Deleting directory of neovim ...."
		# neovim ディレクトリを削除
		echo "$password" | sudo -S rm -rf neovim
	fi

	# メッセージ出力
	echo -e "[\e[43mNOTICE\033[m] Start a git clone."
	# neovim を git clone する
	git clone https://github.com/neovim/neovim.git
	cd neovim

	# NeoVim のインストール(READMEより)
	make CMAKE_BUILD_TYPE=RelWithDebInfo
	echo "$password" | sudo -S make install

else
	# メッセージ出力
	echo -e "[\e[42m  OK  \033[m] NeoVim is already exists."
fi

# nodejs がなければ
if !(type "node" > /dev/null 2>&1); then
	# メッセージ出力
	echo -e "[\e[43mNOTICE\033[m] Start the nodejs installation."
	# nodejs をインストール
	curl -sL install-node.now.sh/lts > install-nodejs.sh
	echo "$password" | sudo -S bash install-nodejs.sh
else
	# メッセージ出力
	echo -e "[\e[42m  OK  \033[m] nodejs is already exists."
fi

# npm がなければ
if !(type "npm" > /dev/null 2>&1); then
	# メッセージ出力
	echo -e "[\e[43mNOTICE\033[m] Start the npm installation."
	# npm をインストール
	echo "$password" | sudo -S apt -y install npm
else
	# メッセージ出力
	echo -e "[\e[42m  OK  \033[m] npm is already exists."
fi

# python がなければ
if !(type "python" > /dev/null 2>&1); then
	# メッセージ出力
	echo -e "[\e[43mNOTICE\033[m] Start the python installation."
	# python をインストール
	echo "$password" | sudo -S apt -y install python
else
	# メッセージ出力
	echo -e "[\e[42m  OK  \033[m] Python is already exists."
fi

# pip がなければ
if !(type "pip" > /dev/null 2>&1); then
	# メッセージ出力
	echo -e "[\e[43mNOTICE\033[m] Start the pip installation."
	# pip をインストール
	echo "$password" | sudo -S apt -y install python-pip
else
	# メッセージ出力
	echo -e "[\e[42m  OK  \033[m] PIP is already exists."
fi

# python3 がなければ
if !(type "python3" > /dev/null 2>&1); then
	# メッセージ出力
	echo -e "[\e[43mNOTICE\033[m] Start the python3 installation."
	# python3 をインストール
	echo "$password" | sudo -S apt -y install python3
else
	# メッセージ出力
	echo -e "[\e[42m  OK  \033[m] Python3 is already exists."
fi

# pip3 がなければ
if !(type "pip3" > /dev/null 2>&1); then
	# メッセージ出力
	echo -e "[\e[43mNOTICE\033[m] Start the pip3 installation."
	# pip3 をインストール
	echo "$password" | sudo -S apt -y install python3-pip
else
	# メッセージ出力
	echo -e "[\e[42m  OK  \033[m] PIP3 is already exists."
fi

# propider を入れる
echo "$password" | sudo -S npm install -g neovim
pip install --user pynvim
pip3 install --user pynvim

# nvim ディレクトリがなければ
if [ ! -d ~/.config/nvim ]; then
	# メッセージ出力
	echo -e "[\e[43mNOTICE\033[m] Make directory of nvim and create init.vim."
	# nvim ディレクトリを作成
	mkdir -p ~/.config/nvim
	# init.vim を用意
	touch ~/.config/nvim/init.vim
else
	# メッセージ出力
	echo -e "[\e[42m  OK  \033[m] nvim directory is already exists."
fi

# dein ディレクトリがなければ
if [ ! -d ~/.cache/dein ]; then
	# メッセージ出力
	echo -e "[\e[43mNOTICE\033[m] Start the dein installation."
	# dein ディレクトリを作成
	mkdir -p ~/.cache/dein
	cd ~/.cache/dein
	# dein をインストール
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
	sh ./installer.sh ~/.cache/dein > installerOutput.txt
	cat installerOutput.txt

	FLAG=0

	# init.vim にインストーラ出力の特定区間を追記
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
	# メッセージ出力
	echo -e "[\e[42m  OK  \033[m] dein.vim is already exists."
fi

# init.vim をバックアップ
mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.backup
# init.vim を自分のオリジナルで上書き
cp ${CURRENT_DIR}/init.vim ~/.config/nvim/init.vim
# 
echo "{}" > ~/.config/nvim/coc-settings.json
# toml をコピー
cp -r ${CURRENT_DIR}/toml ~/.config/nvim/
