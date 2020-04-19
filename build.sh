#!/bin/bash
set -eu

if [ -z "${WINE_PATH}" ]; then
  WINE_PATH="/Applications/Wine Stable.app/Contents/Resources/wine/bin/wine"
fi
if [ ! -f "${WINE_PATH}" ]; then
  echo "Could not find 'wine' on path, exiting!"
  exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
rm -f *.o
"$WINE_PATH" cmd /c $DIR/compile.bat
