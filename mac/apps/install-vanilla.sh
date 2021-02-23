#!/bin/bash

pushd /tmp
  curl -L https://macrelease.matthewpalmer.net/Vanilla.dmg -o Vanilla.dmg
  sudo hdiutil attach Vanilla.dmg -nobrowse
  sudo cp -R /Volumes/Vanilla/Vanilla.app /Applications/
  sudo hdiutil detach /Volumes/Vanilla
popd

