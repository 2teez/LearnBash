#!/usr/bin/env bash

# Author: omitida
# Date: 02/04/2026
# Description:
# Using for loop

for ((i =0; i < 10; i++)); do
    printf "%s " "$i"
done
echo ""

for((;;)); do
    echo "forever for loop"
    sleep 1

    while read -p "End this? (y|n)" -r answer; do
        [[ "${answer}" == "y" ]] && exit
    done
done

# use a another forloop
for arg; do
    echo "arg: ${arg}"
done

# use a another forloop with arguments
for arg; do
    echo "arg: ${arg}"
done <<< "$@"
