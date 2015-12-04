#!/bin/bash

echo '------------------------------------------------------------------------------'
echo 'Sit back and relax while we setup node and related stuff to your machine'
echo '------------------------------------------------------------------------------'

sudo apt-get -y update
clear
echo '------------------------------------------------------------------------------'
echo 'Now upgrading your machine'
echo '------------------------------------------------------------------------------'
sudo apt-get -y upgrade
clear
echo '------------------------------------------------------------------------------'
echo 'Awesome! Installing few packages which we'll need
echo '------------------------------------------------------------------------------'

sudo apt-get -y install build-essential libssl-dev git zsh docky

clear
echo '------------------------------------------------------------------------------'
echo 'Installing most awesomest of all shells - Oh-My-ZSH!'
echo '------------------------------------------------------------------------------'
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

clear
echo '------------------------------------------------------------------------------'
echo 'Downloading atom!'
echo '------------------------------------------------------------------------------'
curl -o ~/.atom.deb "$(curl -fsSl https://atom.io/download/deb  | grep -o '<a .*href=.*>' | sed -e 's/<a /\n<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d')"
clear
echo '------------------------------------------------------------------------------'
echo 'Installing atom!'
echo '------------------------------------------------------------------------------'
sudo dpkg -i ~/.atom.deb


