#!/bin/bash

mkdir -p ~/.config/scripts/

uname_out="$(uname -s)"
case "${uname_out}" in
        Linux*) machine=Linux;;
        Darwin*) machine=Mac;;
        CYGWIN*) machine=Cygwin;;
        MINGW*) machine=MinGw;;
        *) machine="UNKNOWN::${uname_out}"
esac

if [ $machine = "Mac" ]; then
        cp evernote/evernote-things-sync.applescript ~/.config/scripts/evernote-things-sync.applescript

        ./dev/install-nodejs.sh
        ./dev/install-vim.sh
        ./dev/setup-brew.sh

        ./mac/setup-mac.sh

        # TODO:
        # Setup Fluid
        # Setup Lens App
        # Setup RescueTime

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
fi
