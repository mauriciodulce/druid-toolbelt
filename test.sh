#!/bin/bash

CASK_APPLICATIONS=(
    "google-chrome"
    "iterm2"
    "keepingyouawake"
    "phpstorm"
    "sequel-pro"
    "skype"
    "spectacle"
    "sublime-text"
    "vagrant"
    "vmware-fusion"
)

OPEN_APPLICATIONS=(
    "Google Chrome"
    "iTerm"
    "KeepingYouAwake"
    "PhpStorm"
    "Sequel Pro"
    "Skype"
    "Spectacle"
    #"Sublime Text 2"
    "VMware Fusion"
)

main () {
    clear

    ascii

    printSectionTitle "Install druid-toolbelt"

    # Install Xcode
    installXcode

    # Install Homebrew
    installHomebrew

    # Install applications
    installApplications

    # Install PHP, Composer and Drush
    installPHPandTools

    # Install oh my zsh
    installOhMy

    # Open applications for the first time so user can login, register, setup etc.
    #openApplications

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
    # Install Ansible
    printSectionTitle "Install Ansible"
    brew install ansible

    # Install Casks
    printSectionTitle "Install applications"
    cmd="brew cask install ${CASK_APPLICATIONS[*]}"
    $cmd

    # Install extras
    vagrant plugin install vagrant-vmware-fusion
}

installHomebrew () {
    printSectionTitle "Install Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
}

installOhMy () {
    printSectionTitle "Install oh my zsh"

    ## Add custom shell stuff to ohmy
    #OHMY_CUSTOM="$HOME/.oh-my-zsh/custom/my.zsh"

    #sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"
    #cp ~/.zshrc ~/.zshrc.orig
    cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
    chsh -s /bin/zsh
}

installPHPandTools () {
    printSectionTitle "PHP and tools"

    brew install homebrew/php/php71

    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"
    chmod +x composer.phar
    mv composer.phar /usr/local/bin/composer

    composer global require drush/drush
}

installXcode () {
    read -p "First we need to install Xcode command line tools. After you have done it, return here. Continue by pressing ENTER:" ANYKEY

    # Install xcode
    xcode-select --install

    read -p "When Xcode installed, continue by pressing ENTER:" ANYKEY
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
