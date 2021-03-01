#!/bin/bash

if [ ! -d "/Applications/Vanilla.app/" ]; then
        pushd /tmp
          curl -L https://macrelease.matthewpalmer.net/Vanilla.dmg -o Vanilla.dmg
          sudo hdiutil attach Vanilla.dmg -nobrowse
          sudo cp -R /Volumes/Vanilla/Vanilla.app /Applications/
          sudo hdiutil detach /Volumes/Vanilla
        popd

        ABSOLUTE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"

        osascript $ABSOLUTE_PATH/scripts/create-vanilla-task.applescript
fi
