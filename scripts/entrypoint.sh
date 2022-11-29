#!/bin/sh

set -ex

echo "Starting server with args: $@"
export VSCODE_SKIP_PRELAUNCH=1
./scripts/code-server.sh $@
