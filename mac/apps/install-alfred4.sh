#!/bin/bash

if [ ! -d "/Applications/Alfred 4.app/" ]; then
        pushd /tmp
          curl https://cachefly.alfredapp.com/Alfred_4.3.2_1221.dmg -o Alfred.dmg
          sudo hdiutil attach Alfred.dmg
          sudo cp -R /Volumes/Alfred/Alfred\ 4.app /Applications/
          sudo hdiutil detach /Volumes/Alfred
        popd
fi

#TODO:
# Create applescript to create todo in Things to Add License
# Create monthly cron to check alfred
