#!/bin/bash

CASK_APPLICATIONS=(
    "iterm2"
    "keepingyouawake"
    "phpstorm"
    "sequel-pro"
    "spectacle"
    "sublime-text"
    "vagrant"
    "vmware-fusion"
)

OPEN_APPLICATIONS=(
    "iTerm"
    "KeepingYouAwake"
    "PhpStorm"
    "Sequel Pro"
    "Spectacle"
    #"Sublime Text 2"
    "VMware Fusion"
)

main () {
    clear

    ascii

    if [ "$(uname)" == "Darwin" ]; then
        echo "$(uname) detected..."
    else
        exit 1
    fi

    # Install Homebrew
    # installHomebrew

    # Brew some software
    # brew install ansible ruby php

    # Install Composer and Drush
    # installPhpTools

    # Install applications
    # installApplications

    # Install oh my zsh
    if [[ $TRAVIS ]]; then
        echo "Skipping Oh My Zsh installation in Travis."
     else
        installOhMy
    fi

    # Open applications for the first time so user can login, register, setup etc.
    # openApplications

    exit 0
}

ascii () {
cat << "EOF"
____             _     _   _              _  _          _ _
|  _ \ _ __ _   _(_) __| | | |_ ___   ___ | || |__   ___| | |_
| | | | '__| | | | |/ _` | | __/ _ \ / _ \| || '_ \ / _ \ | __|
| |_| | |  | |_| | | (_| | | || (_) | (_) | || |_) |  __/ | |_
|____/|_|   \__,_|_|\__,_|  \__\___/ \___/|_||_.__/ \___|_|\__|

EOF
}

installApplications () {

    # Install Casks
    printSectionTitle "Install applications"
    cmd="brew cask install ${CASK_APPLICATIONS[*]}"
    $cmd

    # Install extras
    printSectionTitle "Install Vagrant plugins"
    vagrant plugin install vagrant-vmware-fusion
    vagrant plugin install vagrant-hostsupdater
}

installHomebrew () {
    printSectionTitle "Install Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
}

installOhMy () {
    printSectionTitle "Install oh my zsh"

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    #git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"
    #cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
    #chsh -s /bin/zsh
}

installPhpTools () {
    printSectionTitle "PHP tools"

    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"
    chmod +x composer.phar
    mv composer.phar /usr/local/bin/composer

    composer global require drush/drush:8.1.16
}

openApplications () {
    printSectionTitle "Opening applications for the first time"

    # Open applications
    for app in "${OPEN_APPLICATIONS[@]}"
    do
       osascript -e "tell application \"$app\" to activate"
    done
}

printSectionTitle () {
    printf "\n\n--- %s ---\n\n" "$1"
}

promptYesNo () {
    while true; do
        read -p "$1 (y/n): " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

main
