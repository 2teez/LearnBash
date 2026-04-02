#!/usr/bin/env bash

# Author: omitida
# Date: 02/04/2026
# Description:

for num in {1..100}; do
    if (( num % 10 == 0 )); then
        printf "Number: ${num}\n"
    else
        printf "Number: ${num} "
    fi
done
echo ""
