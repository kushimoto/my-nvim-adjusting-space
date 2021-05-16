FROM ubuntu:latest

WORKDIR /root

# Shift timezone to Asia/Tokyo.
RUN apt-get update && \
    apt-get install -y tzdata && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
ENV TZ Asia/Tokyo

# Set local to jp.
RUN apt-get update && \
    apt-get install -y language-pack-ja && \
    update-locale LANG=ja_JP.UTF-8 && \ 
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

# telnet client
RUN apt-get update && \
    apt-get install -y telnet && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -y install curl git ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip npm python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/neovim/neovim.git && \
    cd neovim && \
    make CMAKE_BUILD_TYPE=RelWithDebInfo && \
    make install

RUN curl -sL install-node.now.sh/lts > install-nodejs.sh && \
    bash install-nodejs.sh  --yes

RUN npm install -g neovim && \
    pip3 install --user pynvim

RUN mkdir ~/.cache/dein && \
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh && \
    sh ./installer.sh ~/.cache/dein && \
    rm -rf neovim install-nodejs.sh installer.sh
