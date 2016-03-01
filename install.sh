#!/usr/bin/env bash

echo -e "\n--- Install druid-toolbelt ---\n\n"

OSX_VERS=$(sw_vers -productVersion | awk -F "." '{print $2}')
PHP_TAP="homebrew/php/php70"

check=$((xcode-\select --install) 2>&1)
echo $check
str="xcode-select: note: install requested for command line developer tools"
while [[ "$check" == "$str" ]];
do
  sleep 2
done

echo -n "xcode installed..."
exit

echo -n "Enter the PHP version you want to install (5, 7) [ENTER]: "
read PHP_VERSION

if [ "$PHP_VERSION" == "5" ]
then
    PHP_TAP="homebrew/php/php56"
fi

echo -e "\n\n"

# Install xcode
xcode-select --install

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

echo -e "Done. Enjoy!"
