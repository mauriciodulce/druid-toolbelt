#!/usr/bin/env bash

echo "\n\n--- Install druid-toolbelt ---\n\n"

# Default values for user input
PHP_ACTIVE="n"
PHP_COMPOSER="n"
PHP_VERSION="5"

echo  "\n\nFirst we need to install Xcode command line tools. After you have done it, return here. Continue by pressing any key:"
read ANYKEY

# Install xcode
xcode-select --install

echo  "\n\nWhen Xcode installed, continue by pressing any key:"
read ANYKEY

clear

echo "\n\nDo you want to install PHP locally? [y/n]: "
read PHP_ACTIVE

if [ "$PHP_ACTIVE" == "y" ]
then
    echo "\n\nEnter the PHP version you want to install (5, 7) [ENTER]: "
    read PHP_VERSION

    echo "\n\nDo you want to install Composer locally? [y/n]: "
    read PHP_COMPOSER
fi

# Install Homebrew
echo "\n\n--- Install Homebrew ---\n\n"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Ansible
echo "\n\n--- Install Ansible ---\n\n"
brew install ansible

curl -O https://bitbucket.org/makorh/druid-toolbelt/raw/master/setup.yml

# Run installer playbook
ansible-playbook -i hosts setup.yml -e "php_active=$PHP_ACTIVE php_version=$PHP_VERSION php_composer=$PHP_COMPOSER"

## Install Composer and Drush
#echo "\n\n--- Install Composer and Drush ---\n\n"
#brew install $homebrew/php/composer homebrew/php/drush
#
## Install iTerm2, Vagrant and VMware Fusion
#echo "\n\n--- Install iTerm2, Sequel Pro, Vagrant and VMware Fusion ---\n\n"
#brew cask install iterm2 sequel-pro vagrant vmware-fusion
#
## Add custom shell stuff to ohmy
#OHMY_CUSTOM="~/.oh-my-zsh/custom/my.zsh"
#
## Install ohmy, see: http://ohmyz.sh/
echo "\n\n--- Install Oh My ZSH ---\n\n"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#osascript -e 'tell application "iTerm" to activate'