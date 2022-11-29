#!/bin/sh

set -ex

# Install deps
yarn --frozen-lockfile

# Prevent electron build
RUN cat build/lib/preLaunch.js \
    | grep -v "await getElectron();" \
    > build/lib/preLaunch.slim.js

# Compile
node ./build/lib/preLaunch.slim.js