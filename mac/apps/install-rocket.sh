#!/bin/bash

if [ ! -d "/Applications/Rocket.app/" ]; then
        pushd /tmp
          curl -L https://macrelease.matthewpalmer.net/Rocket.dmg -o Rocket.dmg
          sudo hdiutil attach Rocket.dmg -nobrowse
          sudo cp -R /Volumes/Rocket/Rocket.app /Applications/
          sudo hdiutil detach /Volumes/Rocket
        popd

        ABSOLUTE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"

        osascript $ABSOLUTE_PATH/scripts/create-rocket-task.applescript
fi
