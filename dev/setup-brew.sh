#!/usr/bin/env bash

brews=(
  awscli
  curl
  git
  git-extras
  git-lfs
  isyncr-desktop
  mackup
  maven
  mas
  python3
  sbt
  scala
  sqlite
)

casks=(
  adobe-reader
  android-studio
  box-drive
  be-focused
  beyond-compare
  calibre
  clion
  dropbox
  evernote
  firefox
  google-chrome
  google-drive-file-stream
  google-backup-and-sync
  github-desktop
  hipchat
  hosts
  intellij-idea
  keka
  kindle
  launchrocket
  onedrive
  postman
  opera
  pocket
  skype
  slack
  tunnelbear
  typora
  visual-studio-code
  vlc
  whatsapp
  xmind
)

if test ! $(which brew); then
  echo "Install Xcode"
  xcode-select --install

  echo "Install Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  
else
  echo "Update Homebrew"
  brew update
  brew upgrade
fi
brew doctor
brew tap homebrew/dupes

echo "Install packages"
brew info ${brews[@]}
install 'brew install' ${brews[@]}

if $setup_fonts; then
  brew tap homebrew/cask-fonts
  install 'brew cask install' ${fonts[@]}
fi

# Cleanup
brew cleanup
rm -f -r /Library/Caches/Homebrew/*
