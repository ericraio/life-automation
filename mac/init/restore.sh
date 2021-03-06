#!/usr/bin/env bash

#mackup restore

echo "Setting up the preferences------"
function restorePreferences {
  curr_file=$1
  message="Setting up the "$2" Preferences"
  cp ~/Library/Preferences/$curr_file ~/Library/Preferences/$curr_file".bck"
  cp ~/Lyf/Syncs/Dropbox/AppsMisc/Apps4Mac/Preferences/$curr_file ~/Library/Preferences/
}


#restorePreferences com.apple.dock.plist "Dock"
restorePreferences .GlobalPreferences.plist "App Shortcut"
#restorePreferences pbs.plist "Service Shortcut"

###zalando specific
aws configure set region eu-central-1
aws configure get region

stups configure stups.zalan.do

zmon configure

echo "Setting up the vpn"
open ~/Lyf/Syncs/Dropbox/AppsMisc/Apps4Mac/kchandra.tblk

cp ~/Lyf/Syncs/Dropbox/AppsMisc/Apps4Mac/id_rsa_kchandra_zalando ~/.ssh

cd ~/Lyf/Syncs/Dropbox/AppsMisc/Apps4Mac/conda_env
for envFile in *.yml
do
  echo "Creatinv env from: "$envFile
  conda env create -f $envFile
done
