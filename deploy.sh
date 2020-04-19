#!/bin/bash
set -eu

# This script will deploy the given rom to an Everdrive64 flashcart

args=("$@")

romfile="$ARGV[1]"

function fail {
  echo $1 >&2
  exit 1
}

function retry {
  local n=1
  local max=5
  local delay=1
  while true; do
    "$@" && break || {
      if [[ $n -lt $max ]]; then
        ((n++))
        echo "Command failed. Attempt $n/$max:"
        sleep $delay;
      else
        fail "The command has failed after $n attempts."
      fi
    }
  done
}


# loader64 can be found here: https://github.com/jsdf/loader64
 

# upload rom
retry loader64 -v --write --file "$romfile"

sleep 1;
# boot rom that was uploaded
retry loader64 -v --pifboot
