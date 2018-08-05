#!/usr/bin/env bash
for b in `git branch -r | grep -v HEAD`;do
    echo -e `git show --format="%ai %ar by %an" $b | head -n 1` \\t$branch
done | sort -r
