#!/bin/bash

if [ ! -d "/Applications/Fluid.app/" ]; then
        pushd /tmp
          curl https://fluidapp.com/dist/Fluid_2.1.2.zip -o Fluid.dmg
          mv /tmp/Fluid.app /Applications/
        popd

        ABSOLUTE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"

        osascript $ABSOLUTE_PATH/scripts/create-fluid-task.applescript
fi

#TODO:
# Create monthly cron to check alfred
