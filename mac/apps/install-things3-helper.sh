#!/bin/bash

if [ ! -d "/Applications/ThingsMacSandboxHelper.app/" ]; then
        pushd /tmp
                # Install Things 3

                # Install Things 3 Helper
                curl https://culturedcode.cachefly.net/things/thingssandboxhelper/3.26/ThingsHelper.zip -o ThingsHelper.zip
                unzip ThingsHelper.zip -d /Applications/
        popd
fi

#TODO
# Create applescript to create todo in Things to execute Helper from Application
# Create monthly cron to check things helper version
