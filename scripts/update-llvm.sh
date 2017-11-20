#!/usr/bin/env bash

# Automatically updates and rebuilds LLVM. It can be particularly convenient
# for setting up a cron job.
#
# The first argument is the root where we should start looking for
# repositories and build folders.

# Make this low priority.
renice 19 -p $$ >/dev/null 2>&1
ionice -c3 -p $$ >/dev/null 2>&1

ROOT="$1"
cd "$ROOT"

export PATH=/usr/local/bin:$PATH

time {
    for d in $(find . -type d -name ".git"); do
        cd $(dirname "$d")
        git pull --rebase
        git rebase master || git rebase --abort
        cd "$ROOT"
    done
}

time {
    for d in $(find . -type f -name "CMakeCache.txt"); do
        cd $(dirname "$d")
        cmake --build .
        cd "$ROOT"
    done
}