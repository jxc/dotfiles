#!/bin/bash

if [[ -a /usr/local/bin/zsh ]]
then
	echo "Changing default shell to Homebrew zsh"
	sudo chsh -s /usr/local/bin/zsh
	/usr/local/bin/zsh
else
	echo "Homebrew zsh is default shell"
fi

if [[ ! -a "$HOME/.antigen" ]]
then
	echo "Installing Antigen"
	git clone https://github.com/zsh-users/antigen.git ~/.antigen
else
	echo "Antigen already installed"
fi