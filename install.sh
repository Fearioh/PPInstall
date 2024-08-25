#!/bin/bash

YELLOW="\033[1;33m"
BLUE="\033[1;34m"
PURPLE="\033[1;35m"
GREEN="\033[1;32m"
RED="\033[1;31m"
RESET="\033[0m"

ls $HOME/Documents -R | grep "poolparty.sh" > /dev/null
value=$?
if [[ $value -eq 0 ]]; then
	echo -e "\n${RED}poolparty.sh existe déjà dans vos Documents${RESET}\n"
	exit -1
else
	ls $HOME -Ra | grep -q "oh-my-zsh.sh" ~/.zshrc > /dev/null
	value=$?
	if [[ $value -ne 0 ]]; then
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
	fi
	git clone https://github.com/Fearioh/PoolParty.git $HOME/Documents/script/PoolParty
	echo "alias pp='bash $HOME/Documents/script/PoolParty/poolparty.sh'" >> $HOME/.zshrc
	zsh -c "source $HOME/.zshrc"
	exec zsh
fi

echo -e "\n${GREEN}L'installation de PoolParty est complète, tapez "pp" dans votre terminal pour l'utiliser !${RESET}\n"