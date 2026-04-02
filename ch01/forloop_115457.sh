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

for lang in c++ python java bash elixir; do
    printf "Language: ${lang}\n"
done
echo ""

for file in forloop*?; do
    printf "File: ${file}\n"
    cat "${file}"
    echo ""
done
