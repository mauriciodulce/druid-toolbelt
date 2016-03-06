#!/usr/bin/env bash

clear

cat << "EOF"
  ____             _     _   _              _  _          _ _
 |  _ \ _ __ _   _(_) __| | | |_ ___   ___ | || |__   ___| | |_
 | | | | '__| | | | |/ _` | | __/ _ \ / _ \| || '_ \ / _ \ | __|
 | |_| | |  | |_| | | (_| | | || (_) | (_) | || |_) |  __/ | |_
 |____/|_|   \__,_|_|\__,_|  \__\___/ \___/|_||_.__/ \___|_|\__|

EOF

echo "\n\n--- Install druid-toolbelt ---\n\n"

# Default values for user input
PHP_ACTIVE="n"
PHP_COMPOSER="n"
PHP_VERSION="5"

read -p  "\n\nFirst we need to install Xcode command line tools. After you have done it, return here. Continue by pressing RETURN:" ANYKEY

# Install xcode
xcode-select --install

read -p  "\n\nWhen Xcode installed, continue by pressing RETURN:" ANYKEY

# Install Homebrew
echo "\n\n--- Install Homebrew ---\n\n"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# Install Ansible
echo "\n\n--- Install Ansible ---\n\n"
brew install ansible

# Install applications
echo "\n\n--- Install applications ---\n\n"
brew cask install \
     caffeine \
     google-chrome \
     iterm2 \
     phpstorm \
     sequel-pro \
     skype \
     spectacle \
     sublime-text \
     vagrant \
     vmware-fusion \

echo "\n\n--- Optional stuff ---\n\n"

read -p "\n\nDo you want to install PHP? [y/n]: " PHP_ACTIVE

if [ "$PHP_ACTIVE" == "y" ]
then
    read -p "\n\nEnter the PHP version you want to install (5, 7) [ENTER]: " PHP_VERSION

    if [ "$PHP_VERSION" == "5" ]
    then
        brew install homebrew/php/php56
    fi

    if [ "$PHP_VERSION" == "7" ]
    then
        brew install homebrew/php/php70
    fi

    read -p "\n\nDo you want to install Composer? [y/n]: " PHP_COMPOSER

    if [ "$PHP_COMPOSER" == "y" ]
    then
        brew install homebrew/php/composer
    fi

    read -p "\n\nDo you want to install Drush? [y/n]: " PHP_DRUSH

    if [ "$PHP_DRUSH" == "y" ]
    then
        brew install homebrew/php/drush
    fi
fi

echo "\n\n--- Install oh my zsh ---\n\n"

## Add custom shell stuff to ohmy
OHMY_CUSTOM="~/.oh-my-zsh/custom/my.zsh"

## Install ohmy, see: http://ohmyz.sh/
echo "\n\n--- Install Oh My ZSH ---\n\n"
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
#cp ~/.zshrc ~/.zshrc.orig
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s /bin/zsh

echo "\n\n--- Opening applications for the first time ---\n\n"

# Open applications
app_names=( "Caffeine" "Google Chrome" "iTerm" "PhpStorm" "Sequel Pro" "Skype" "Spectacle" "Sublime Text 2" "VMware Fusion")
for app in "${app_names[@]}"
do
   osascript -e "tell application \"$app\" to activate"
done
