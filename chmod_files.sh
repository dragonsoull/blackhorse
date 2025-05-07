#!/usr/bin/env bash

#chmod +x to all .sh files

for file in $(ls *.sh);
do
    if [ -f "$file" ]; then
        chmod +x "$file"
        echo "Made $file executable"
    else
        echo "$file is not a file"
    fi
done