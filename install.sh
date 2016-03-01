#!/usr/bin/env bash

echo "\n\n--- Install druid-toolbelt ---\n\n"

OSX_VERS=$(sw_vers -productVersion | awk -F "." '{print $2}')
PHP_TAP="homebrew/php/php70"

#check=$((xcode-\select --install) 2>&1)
#echo $check
#str="xcode-select: note: install requested for command line developer tools"
#while [[ "$check" == "$str" ]];
#do
#  osascript -e 'tell app "System Events" to display dialog "xcode command-line tools missing." buttons "OK" default button 1 with title "xcode command-line tools"'
#  exit;
#done

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

echo -e "\n\n"

# Install Homebrew, see http://brew.sh/
echo -e "\n\n--- Install Homebrew ---\n\n"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Ansible 2
echo "\n\n--- Install Ansible ---\n\n"
brew install ansible

# Install PHP
echo "\n\n--- Install PHP ---\n\n"
brew install $PHP_TAP

# Install ohmy, see: http://ohmyz.sh/
echo "\n\n--- Install Oh My ZSH ---\n\n"
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
brew install zsh

# Install Composer


# Install Drush


# Add custom shell stuff to ohmy
OHMY_CUSTOM="~/.oh-my-zsh/custom/my.zsh"

echo "Done. Enjoy!"
