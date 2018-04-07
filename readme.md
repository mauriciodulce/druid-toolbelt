```
  ____             _     _   _              _  _          _ _
 |  _ \ _ __ _   _(_) __| | | |_ ___   ___ | || |__   ___| | |_
 | | | | '__| | | | |/ _` | | __/ _ \ / _ \| || '_ \ / _ \ | __|
 | |_| | |  | |_| | | (_| | | || (_) | (_) | || |_) |  __/ | |_
 |____/|_|   \__,_|_|\__,_|  \__\___/ \___/|_||_.__/ \___|_|\__|

```

[![Build Status](https://travis-ci.org/druidfi/druid-toolbelt.svg?branch=master)](https://travis-ci.org/druidfi/druid-toolbelt)

The basic productivity tools for OSX which every Druid developer needs.

## Requirements

- OSX / macOS

After install:

- VMware Fusion serial
- VMware Vagrant Plugin license

## How to install

Open terminal and run following command:
```
sh -c "$(curl -fsSL https://github.com/druidfi/druid-toolbelt/raw/master/install.sh)"
```

Note: it will prompt for your password several times!

## Tools included

- [Ansible](https://www.ansible.com/)
- [iTerm2](https://www.iterm2.com/)
- [Homebrew](http://brew.sh/)
- [KeepingYouAwake](https://github.com/newmarcel/KeepingYouAwake)
- [Oh My ZSH!](http://ohmyz.sh/)
- [PhpStorm](https://www.jetbrains.com/phpstorm/) (You need to login with your credentials)
- [Sequel Pro](http://www.sequelpro.com/)
- [Sublime Text](https://www.sublimetext.com/)
- [Spectacle](https://www.spectacleapp.com/)
- [Vagrant](https://www.vagrantup.com/)
- [VMware Fusion](https://www.vmware.com/products/fusion) (You need to add license)

## Development software

- PHP 7.2
- Composer
- Drush

## Tested on

- OSX El Capitan 10.11.x
- macOS Sierra 10.12.x

## FAQ

Q: Why not use Ansible?

A: We did not want to have any additional steps before running this script. It's a one-liner!

## How to modify and test this installer?

- Create virtual machine using your OSX recovery
- Create snapshot when having vmware tools installed
- Open terminal
- Test using the install command above

## Fork and create your own version?

Yes, go ahead! If you use it, please send us a message so we can add you to "Used by" list in the future.
