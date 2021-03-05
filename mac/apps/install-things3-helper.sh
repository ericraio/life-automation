#!/bin/bash

if [ ! -d "/Applications/ThingsMacSandboxHelper.app/" ]; then
        pushd /tmp
                # Install Things 3

                # Install Things 3 Helper
                curl https://culturedcode.cachefly.net/things/thingssandboxhelper/3.26/ThingsHelper.zip -o ThingsHelper.zip
                unzip ThingsHelper.zip -d /Applications/
        popd

        ABSOLUTE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"

        osascript $ABSOLUTE_PATH/scripts/create-things3-task.applescript
fi

#TODO
# Create monthly cron to check things helper version
