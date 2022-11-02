#!/usr/bin/env bash

set -e

echo "* Downloading code-server installer..."
curl -L https://aka.ms/install-vscode-server/setup.sh > setup.sh
echo "* Installing code-server..."
sh setup.sh

echo ""
echo "* Preloading code-server binaries..."
echo "? This will start code-server serve-local and wait for it's start."
echo "! You might need network access for that."
echo ""

set -x
code-server serve-local \
  --disable-telemetry \
  --without-connection-token \
  --port 8080 \
  --accept-server-license-terms &
set +x

PID=$!

echo "* Pinging code-server 10 times until it's accessible".
curl --silent --retry 10 --retry-connrefused http://localhost:8080/ > /dev/null

echo "* Stopping code-server..."
kill $PID
