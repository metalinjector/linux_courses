#!/bin/bash

filename="$1"
echo a${filename}a

[ -e "$filename" ] && { echo File $filename exists ; exit 0; }

exit 1
