#!/bin/bash

mkdir -p $HOME/.cloudshell
touch $HOME/.cloudshell/no-apt-get-warning

git config --global user.email "e@hupili.net"
git config --global user.name "Pili Hu"

sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev
sudo apt-get -yq install zsh
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash