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

if [ -f ~/.atom.deb ]
then
  clear
  echo '------------------------------------------------------------------------------'
  echo 'Atom already downloaded.!'
  echo '------------------------------------------------------------------------------'
  read -p "Do you wish to force download latest version of atom from atom.io? Enter No to install from downloaded version or Yes to download latest version: [Yes/No] " yn
  if [ $yn == "Yes" ]
  then
      clear
      echo '------------------------------------------------------------------------------'
      echo 'Downloading atom!'
      echo '------------------------------------------------------------------------------'
      curl -o ~/.atom.deb "$(curl -fsSl https://atom.io/download/deb  | grep -o '<a .*href=.*>' | sed -e 's/<a /\n<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d')"
  else
      clear
      echo 'not downloading from atom.io, using chached copy'
  fi
else
  
  echo '------------------------------------------------------------------------------'
  echo 'Downloading atom!'
  echo '------------------------------------------------------------------------------'
curl -o ~/.atom.deb "$(curl -fsSl https://atom.io/download/deb  | grep -o '<a .*href=.*>' | sed -e 's/<a /\n<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d')"
clear
fi

echo '------------------------------------------------------------------------------'
echo 'Installing atom!'
echo '------------------------------------------------------------------------------'
sudo dpkg -i ~/.atom.deb
clear

echo '------------------------------------------------------------------------------'
echo 'Installing nvm!'
echo '------------------------------------------------------------------------------'
curl https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
source ~/.profile
clear

echo '------------------------------------------------------------------------------'
echo 'Installing common node version, 5.1.0, 5.0.0 and 0.12.7!'
echo '------------------------------------------------------------------------------'
nvm install 5.1.1
nvm use 5.1.1
npm install -g npm


 
