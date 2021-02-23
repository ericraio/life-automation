#!/bin/bash

if [ ! -d "/Applications/Vanilla.app/" ]; then
        pushd /tmp
          curl -L https://macrelease.matthewpalmer.net/Vanilla.dmg -o Vanilla.dmg
          sudo hdiutil attach Vanilla.dmg -nobrowse
          sudo cp -R /Volumes/Vanilla/Vanilla.app /Applications/
          sudo hdiutil detach /Volumes/Vanilla
        popd

        #TODO Create applescript to create todo in Things to Add License
fi

