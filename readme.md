```
  ____             _     _   _              _  _          _ _
 |  _ \ _ __ _   _(_) __| | | |_ ___   ___ | || |__   ___| | |_
 | | | | '__| | | | |/ _` | | __/ _ \ / _ \| || '_ \ / _ \ | __|
 | |_| | |  | |_| | | (_| | | || (_) | (_) | || |_) |  __/ | |_
 |____/|_|   \__,_|_|\__,_|  \__\___/ \___/|_||_.__/ \___|_|\__|

```

The basic productivity tools for OSX which every Druid developer needs.

## Requirements

Before install:

- If you have SSH keys, make sure they are present in `~/.ssh`

After install:

- VMware Fusion serial (from jussi.lindfors@druid.fi)
- VMware Vagrant Plugin license (from jussi.lindfors@druid.fi)

## How to install

Open terminal and run following command:
```
sh -c "$(curl -fsSL https://bitbucket.org/makorh/druid-toolbelt/raw/master/install.sh)"
```

Note: it will prompt for your password several times!

## Tools included

- [Ansible](https://www.ansible.com/)
- [Caffeine](http://lightheadsw.com/caffeine/)
- [iTerm2](https://www.iterm2.com/)
- [Homebrew](http://brew.sh/)
- [Oh My ZSH!](http://ohmyz.sh/)
- [PhpStorm](https://www.jetbrains.com/phpstorm/) (You need to login with your credentials)
- [Sequel Pro](http://www.sequelpro.com/)
- [Skype](https://www.skype.com/)
- [Sublime Text](https://www.sublimetext.com/)
- [Spectacle](https://www.spectacleapp.com/)
- [Vagrant](https://www.vagrantup.com/)
- [VMware Fusion](https://www.vmware.com/products/fusion) (You need to add license)

## Optional

- PHP 5.6.x or 7.x
- Composer
- Drush

## Tested on

- OSX El Capitan 10.11.3

## How to modify and test this installer?

- Create virtual machine using your OSX recovery
- Create snapshot when havin vmware tools installed
- Open terminal
- Test using the install command above
