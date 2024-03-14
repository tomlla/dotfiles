#!/usr/bin/env bash

src=$1
out=$(echo $1 | sed 's/.png/.webp/')
cwebp $src -o $out
