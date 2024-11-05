#!/bin/bash

echo "Instalation.."

rm -rfv ~/.config/my-zsh-configs

git clone git@github.com:jahrmando/my-zsh-configs.git ~/.config/my-zsh-configs 

if [[ -n ${MYZSH_DEBUG}  ]]; then
  cd ~/.config/my-zsh-configs &&  git checkout initial-configs 
fi

cp ~/.zshrc ~/.zshrc.backup && cp -fv ~/.config/my-zsh-configs/.zshrc_custom ~/.zshrc 

echo "Install plugins"

cd ~/.config/my-zsh-configs/plugins/zsh-autosuggestions/ && git submodule init && git submodule update
cd ~/.config/my-zsh-configs/plugins/zsh-syntax-highlighting/ && git submodule init && git submodule update

echo "Reload your ZSH: omz reload"

which brew
if [[ $? == "0" ]]; then
  echo "Instalation tools from brew package manager"
  brew install git nvim grep bat
fi
