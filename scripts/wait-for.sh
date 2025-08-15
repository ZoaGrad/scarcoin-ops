#!/usr/bin/env bash
set -e
host="$1"; shift
until curl -sf "$host" >/dev/null; do
  >&2 echo "Waiting for $host..."
  sleep 1
done
>&2 echo "Up: $host"
