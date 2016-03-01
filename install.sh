#!/usr/bin/env bash

echo -e "\n--- Install druid-toolbelt ---\n\n"

OSX_VERS=$(sw_vers -productVersion | awk -F "." '{print $2}')
PHP_TAP="homebrew/php/php70"

# Get Xcode CLI tools
TOOLS=clitools.dmg
if [ ! -f "$TOOLS" ]; then
  if [ "$OSX_VERS" -eq 7 ]; then
	  DMGURL=http://devimages.apple.com/downloads/xcode/command_line_tools_for_xcode_os_x_lion_april_2013.dmg
  elif [ "$OSX_VERS" -eq 8 ]; then
  	  DMGURL=http://devimages.apple.com/downloads/xcode/command_line_tools_for_xcode_os_x_mountain_lion_april_2013.dmg
  elif [ "$OSX_VERS" -eq 9 ]; then
	  DMGURL=http://adcdownload.apple.com/Developer_Tools/command_line_tools_os_x_mavericks_for_xcode__late_october_2013/command_line_tools_os_x_mavericks_for_xcode__late_october_2013.dmg
  elif [ "$OSX_VERS" -eq 10 ]; then
	  DMGURL=http://adcdownload.apple.com/Developer_Tools/Command_Line_Tools_OS_X_10.10_for_Xcode_6.3.2/commandlinetoolsosx10.10forxcode6.3.2.dmg
  elif [ "$OSX_VERS" -eq 11 ]; then
	  DMGURL=http://adcdownload.apple.com/Developer_Tools/Command_Line_Tools_OS_X_10.11_for_Xcode_7.2/Command_Line_Tools_OS_X_10.11_for_Xcode_7.2.dmg
  else
    echo -e "No supported OSX version found."
    exit 1
  fi
fi

curl "$DMGURL" -o "$TOOLS"

TMPMOUNT=`/usr/bin/mktemp -d /tmp/clitools.XXXX`
hdiutil attach "$TOOLS" -mountpoint "$TMPMOUNT"
installer -pkg "$(find $TMPMOUNT -name '*.mpkg')" -target /
hdiutil detach "$TMPMOUNT"
rm -rf "$TMPMOUNT"
rm "$TOOLS"
exit

echo "OSX = $OSX_VERS, url is $DMGURL"
exit 1

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
