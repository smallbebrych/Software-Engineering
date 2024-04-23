#!/bin/bash
find "$1" -type f -exec sh -c '
for file; do
base=$(basename "$file")
ext="${base##*.}"
name="${base%.*}"
numb=""
count=0
while [ -e "$2/$name$numb.$ext" ]; do
count=$((count + 1))
numb="$count"
done
cp "$file" "$2/$name$numb.$ext"
done
' sh {} "$2" \;
echo "The end"
