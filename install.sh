#!/bin/bash

sudo apt update 
sudo apt install -y curl make cmake  pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python2 python3 python3-pip neovim fish polybar fzf awesome autorandr imagemagick feh snap kitty snapd bat

sudo pip3 install pywal # installing pywal, the color theme generator

curl -sS https://starship.rs/install.sh | sh -s -- --yes # installing starship (prompt) and forcing it

cp -R awesome polybar kitty fish nvim starship autorandr $HOME/.config  #mooving all the configuration file from github to the local configuration file.

git clone https://github.com/xinhaoyuan/layout-machi.git # downloading layout-machi, the special awesomewm layout i'm using
mv layout-machi/ $HOME/.config/awesome/ # putting the layout-machi conf in the awesome directory

git clone https://github.com/spleenftw/wallpapers.git # downloading layout-machi, the special awesomewm layout i'm using
mv wallpapers/ $HOME/Github

wal -q -i $HOME/Github/wallpapers/2160x1440 # initializing pywal

chmod +x $HOME/Github/dotfiles/Scripts/rofi-bluetooth # giving the execution right to the bluetooth module/script for polybar

chsh -s $(which fish) # defining fish as the default shell 

printf "\n"
printf "\n"
printf "Do you want slock-blur with ? [yes/N] \n" #asking if i want dl slock-blur
read slockblurquestion

if [[ $slockblurquestion = yes ]]
then
    sudo apt -y install x11-session-utils libxrandr-dev libpam0g-dev
    git clone https://github.com/aario/slock-blur 
    printf "\n"
    printf "slock-blur dependencies & repo downloaded \n"
    printf "\n"
else
printf "\n"
printf "slock-blur dependencies & repo not downloaded \n"
printf "\n"
fi

printf "\n"
printf "\n"
printf "Do you want the aliases and the bashrc with ? [yes/N] \n" 
read bashquestion

if [[ $bashquestion = yes ]]
then
    cp .bashrc $HOME
    cp .bash_aliases $HOME
    source ~/.bashrc & source ~/.bash_aliases
    printf "\n"
    printf ".bashrc & .bash_aliases included, install.sh is done.\n"
    printf "\n"
else
printf "\n"
printf ".bashrc & .bash_aliases not included, install.sh is done\n"
printf "\n"
fi
