#!/usr/bin/env bash

echo "\n\n--- Install druid-toolbelt ---\n\n"

# Default value for PHP tap
PHP_TAP="homebrew/php/php70"

echo  "\n\nFirst we need to install Xcode command line tools. After you have done it, return here. Continue by pressing any key:"
read ANYKEY

# Install xcode
xcode-select --install

echo "\n\nEnter the PHP version you want to install (5, 7) [ENTER]: "
read PHP_VERSION

if [ "$PHP_VERSION" == "5" ]
then
    PHP_TAP="homebrew/php/php56"
fi

# Install Homebrew
echo "\n\n--- Install Homebrew ---\n\n"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Ansible
echo "\n\n--- Install Ansible ---\n\n"
brew install ansible

# Install PHP
echo "\n\n--- Install PHP ---\n\n"
brew install $PHP_TAP

# Install Composer
brew install homebrew/php/composer

# Install Drush
brew install homebrew/php/drush

# Install Vagrant
brew cask install vagrant

# Install VMware Fusion
brew cask install vmware-fusion

# Add custom shell stuff to ohmy
OHMY_CUSTOM="~/.oh-my-zsh/custom/my.zsh"

# Install ohmy, see: http://ohmyz.sh/
echo "\n\n--- Install Oh My ZSH ---\n\n"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#brew install zsh
