#!/bin/bash

if [ ! -d "/Applications/Rocket.app/" ]; then
        pushd /tmp
          curl -L https://macrelease.matthewpalmer.net/Rocket.dmg -o Rocket.dmg
          sudo hdiutil attach Rocket.dmg -nobrowse
          sudo cp -R /Volumes/Rocket/Rocket.app /Applications/
          sudo hdiutil detach /Volumes/Rocket
        popd
fi

#TODO Create applescript to create todo in Things to Add License
