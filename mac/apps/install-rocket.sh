#!/bin/bash

pushd /tmp
  curl -L https://macrelease.matthewpalmer.net/Rocket.dmg -o Rocket.dmg
  sudo hdiutil attach Rocket.dmg -nobrowse
  sudo cp -R /Volumes/Rocket/Rocket.app /Applications/
  sudo hdiutil detach /Volumes/Rocket
popd

