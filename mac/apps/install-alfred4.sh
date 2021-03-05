#!/bin/bash

if [ ! -d "/Applications/Alfred 4.app/" ]; then
        pushd /tmp
          curl https://cachefly.alfredapp.com/Alfred_4.3.2_1221.dmg -o Alfred.dmg
          sudo hdiutil attach Alfred.dmg
          sudo cp -R /Volumes/Alfred/Alfred\ 4.app /Applications/
          sudo hdiutil detach /Volumes/Alfred
        popd

        ABSOLUTE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"

        osascript $ABSOLUTE_PATH/scripts/create-alfred-task.applescript
fi

#TODO:
# Create monthly cron to check alfred
