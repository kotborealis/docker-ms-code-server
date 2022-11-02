#!/usr/bin/env bash

set -e

echo "* Starting code-server"

# Force code-server to autoaccept license by piping
# yes into it.
yes | \
    code-server serve-local \
      --accept-server-license-terms \
      --disable-telemetry \
      $@
