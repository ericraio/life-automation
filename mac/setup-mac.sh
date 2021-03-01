#!/bin/bash
# https://github.com/mas-cli/mas


brew install mas

absolute_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"

mac_apps=(
  595191960  # CopyClip
  288545208  # Instapaper
  1481302432 # Instapaper Save
  1059655371 # Newton
  904280696  # Things 3
  1289197285 # MindNode
  766939888  # 1Keyboard
  1493327990 # Streaks
  417375580  # BetterSnapTool
  937984704  # Amphetamine
  975937182  # Fantastical
  442168834  # SiteSucker
  1437226581 # Horo
  1438725196 # Crontab Creator
  1404231964 # Upright GO
)

function mac_install {
        for pkg in $@; do
                mas install $pkg
        done
}

echo "Mac applications"
mac_install ${mac_apps[@]}

./mac/apps/install-alfred4.sh
./mac/apps/install-things3-helper.sh
./mac/apps/install-vanilla.sh
./mac/apps/install-rocket.sh


# https://github.com/cflorion/macOS-install-script/blob/184a5a115326bb405fb401c6e16804bdd9ad1ce4/installConfig.sh

# Show hidden files
chflags nohidden ~/Library

# Show path in finder
defaults write com.apple.finder ShowPathbar -bool true

## Enable key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
osascript $absolute_path/scripts/create-keyboard-task.applescript

# Install Command Line Tools without Xcode
# xcode-select --install

# Set Current Folder as Default Search Scope
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
