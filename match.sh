#!/bin/bash

# Find matching lines in file
LINES=$(grep "$1" -i ./timestamps.txt);

echo $LINES
# If no matches, quit with warning
if [ -z "$LINES" ]
then
  echo "No matches for \"$1\"";
  exit 1;
fi


echo "Total matches found: $(wc -l <<< $LINES)"
echo "Loading first match in browser..."
TIMESTAMP=$(echo $LINES | sed 's/ .*//');

# Open video in browser at timestamp
node index.js $TIMESTAMP;
