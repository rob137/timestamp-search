#!/bin/bash

# Find matching lines in file
LINES=$(grep "$1" -i ${BASH_SOURCE%/*}/timestamps.txt);

# If no matches, quit with warning
if [ -z "$LINES" ]
then
  echo "No matches for \"$1\"";
  exit 1;
fi


echo "$(wc -l <<< "$LINES") matches found:"

printf "\n$LINES\n\n"

echo "Loading first match in browser..."
TIMESTAMP=$(echo $LINES | sed 's/ .*//');

# Open video in browser at timestamp
node ${BASH_SOURCE%/*}/index.js $TIMESTAMP;
