#!/bin/bash

echo '------------------------------------------------------------------------------'
echo 'Sit back and relax while we setup node and related stuff on your machine'
echo '------------------------------------------------------------------------------'

sudo apt-get -y update

echo '------------------------------------------------------------------------------'
echo 'Now upgrading your machine'
echo '------------------------------------------------------------------------------'
sudo apt-get -y upgrade

echo '------------------------------------------------------------------------------'
echo 'Awesome! Installing few packages which we will need (including mongodb)'
echo '------------------------------------------------------------------------------'

sudo apt-get -y install build-essential libssl-dev git zsh docky mongodb

#setting up mongodb data directory. I'll give it 777 access as its just dev machine, will never do so in prod env.
mkdir /data
mkdir /data/db
chmod 777 /data -Rrf


echo '------------------------------------------------------------------------------'
echo 'Installing most awesomest of all shells - Oh-My-ZSH!'
echo '------------------------------------------------------------------------------'
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#see if atom is installed
if ! type "$atom" > /dev/null; then

    if [ -f ~/.atom.deb ]
    then
      echo '------------------------------------------------------------------------------'
      echo 'Atom already downloaded.!'
      echo '------------------------------------------------------------------------------'
      read -p "Do you wish to force download latest version of atom from atom.io? Enter No to install from downloaded version or Yes to download latest version: [Yes/No] " yn
      if [ $yn == "Yes" ]
      then
          echo '------------------------------------------------------------------------------'
          echo 'Downloading atom!'
          echo '------------------------------------------------------------------------------'
          curl -o ~/.atom.deb "$(curl -fsSl https://atom.io/download/deb  | grep -o '<a .*href=.*>' | sed -e 's/<a /\n<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d')"
      else
          echo 'not downloading from atom.io, using chached copy'
      fi
    else
      echo '------------------------------------------------------------------------------'
      echo 'Downloading atom!'
      echo '------------------------------------------------------------------------------'
      curl -o ~/.atom.deb "$(curl -fsSl https://atom.io/download/deb  | grep -o '<a .*href=.*>' | sed -e 's/<a /\n<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d')"
    fi
    
    echo '------------------------------------------------------------------------------'
    echo 'Installing atom!'
    echo '------------------------------------------------------------------------------'
    sudo dpkg -i ~/.atom.deb
    echo '------------------------------------------------------------------------------'
    echo 'Installing atom packages!'
    echo '------------------------------------------------------------------------------'
    apm install auto-indent css-color-underline git-plus merge-conflicts turbo-javascript angularjs-styleguide-snippets color-picker file-type-icons
else
echo 'Atom already installed, although trying to install package'

    echo '------------------------------------------------------------------------------'
    echo 'Installing atom packages!'
    echo '------------------------------------------------------------------------------'
    apm install auto-indent css-color-underline git-plus merge-conflicts turbo-javascript angularjs-styleguide-snippets color-picker file-type-icons


fi

echo '------------------------------------------------------------------------------'
echo 'Installing nvm!'
echo '------------------------------------------------------------------------------'
curl https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
source ~/.profile


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

echo '------------------------------------------------------------------------------'
echo 'Installing common node versions ...'
echo '------------------------------------------------------------------------------'
echo 'Node 5.1.0'
nvm install 5.1.0
nvm use 5.1.0
npm install -g npm
echo 'Node 5.0.0'
nvm install 5.0.0
nvm use 5.0.0
npm install -g npm
echo 'Node 0.12.7'
nvm install 0.12.7
nvm use 0.12.7
npm install -g npm
echo 'Selecting 5.0.0'
nvm use 5.0.0
echo '------------------------------------------------------------------------------'
echo 'Installing node based tools used for development ...'
echo '------------------------------------------------------------------------------'

npm install -g bower gulp yo generator-gulp-angular nodemon generator-express

echo 'Starting docky ...'
(setsid docky)
echo 'docky started'
echo 'Starting mongodb ...'
(setsid mongod --smallfiles)
echo 'mongodb started, use mongo command to connect to it'

echo '------------------------------------------------------------------------------'
echo 'We are done with installing stuff, firing off docky! Have fun ... happy coding!!'
echo '------------------------------------------------------------------------------'
echo 'More cool stuff waiting for you at https://oddcode.daveamit.com  --  Dave Amit'

