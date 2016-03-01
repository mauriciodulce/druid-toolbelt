#!/usr/bin/env bash

echo -e "\n--- Install druid-toolbelt ---\n\n"

PHP_TAP="homebrew/php/php70"

echo -n "Enter the PHP version you want to install (5, 7) [ENTER]: "
read PHP_VERSION

if [ "$PHP_VERSION" == "5" ]
then
    PHP_TAP="homebrew/php/php56"
fi

echo -e "\n\n"

# Install Homebrew, see http://brew.sh/
echo -e "Install Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install ohmy, see: http://ohmyz.sh/
echo -e "Install Oh My ZSH"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Ansible 2
echo -e "Install Ansible 2"
brew install ansible

# Install PHP
echo -e "Install PHP"
brew install $PHP_TAP

# Install Composer

# Add custom shell stuff to ohmy
OHMY_CUSTOM="~/.oh-my-zsh/custom/my.zsh"

