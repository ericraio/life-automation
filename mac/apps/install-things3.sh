#!/bin/bash

pushd /tmp
        # Install Things 3

        # Install Things 3 Helper
        curl https://culturedcode.cachefly.net/things/thingssandboxhelper/3.26/ThingsHelper.zip -o ThingsHelper.zip
        unzip ThingsHelper.zip -d /Applications/
popd
