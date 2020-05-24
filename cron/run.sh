#!/bin/sh
set -x
export SLEEP_TIME=${SLEEP_TIME:-"60"}

while true;
do
    echo "$(date -Iseconds) $(wp cron event run --due-now)"
    sleep "$SLEEP_TIME"
done
