#!/usr/bin/env bash

clear

cat << "EOF"
  ____             _     _   _              _       _          _ _
 |  _ \ _ __ _   _(_) __| | | |_ ___   ___ | |     | |__   ___| | |_
 | | | | '__| | | | |/ _` | | __/ _ \ / _ \| |_____| '_ \ / _ \ | __|
 | |_| | |  | |_| | | (_| | | || (_) | (_) | |_____| |_) |  __/ | |_
 |____/|_|   \__,_|_|\__,_|  \__\___/ \___/|_|     |_.__/ \___|_|\__|

EOF

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

echo "\n\n--- Install software ---\n\n"
brew cask install iterm2 phpstorm sequel-pro vagrant vmware-fusion

# Download ansible playbook
curl -O https://bitbucket.org/makorh/druid-toolbelt/raw/master/setup.yml

# Run installer playbook
ansible-playbook -i hosts setup.yml -e "php_active=$PHP_ACTIVE php_version=$PHP_VERSION php_composer=$PHP_COMPOSER"

# Remove playbook
rm -f setup.yml

## Add custom shell stuff to ohmy
OHMY_CUSTOM="~/.oh-my-zsh/custom/my.zsh"

## Install ohmy, see: http://ohmyz.sh/
echo "\n\n--- Install Oh My ZSH ---\n\n"
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
#cp ~/.zshrc ~/.zshrc.orig
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s /bin/zsh

# Close terminal
osascript -e 'tell application "Terminal" to quit'

# Open iTerm
osascript -e 'tell application "iTerm" to activate'
