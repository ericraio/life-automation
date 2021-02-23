#!/bin/bash

pushd /tmp
  curl https://cachefly.alfredapp.com/Alfred_4.3.2_1221.dmg -o Alfred.dmg
  sudo hdiutil attach Alfred.dmg
  sudo cp -R /Volumes/Alfred/Alfred\ 4.app /Applications/
  sudo hdiutil detach /Volumes/Alfred
popd
