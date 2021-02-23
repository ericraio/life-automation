#!/bin/bash

mkdir -p ~/.config/scripts/

cp evernote/evernote-things-sync.applescript ~/.config/scripts/evernote-things-sync.applescript

./dev/install-nodejs.sh
./dev/install-vim.sh
./dev/setup-brew.sh

./mac/setup-mac.sh

#write out current crontab
crontab -l > evernote-cron
#echo new cron into cron file
echo "* * * * *  osascript ~/.config/scripts/evernote-things-sync.applescript" >> evernote-cron
#install new cron file
crontab evernote-cron
rm evernote-cron

# End
killall Dock
killall Finder
sudo reboot
