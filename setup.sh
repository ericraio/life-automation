#!/bin/bash

mkdir -p ~/.config/scripts/

mv evernote/evernote-things-sync.applescript ~/.config/scripts/evernote-things-sync.applescript

./mac/apps/install-alfred4.sh
./mac/apps/install-things3.sh

#write out current crontab
crontab -l > evernote-cron
#echo new cron into cron file
echo "* * * * *  osascript ~/.config/scripts/evernote-things-sync.applescript" >> evernote-cron
#install new cron file
crontab evernote-cron
rm evernote-cron
