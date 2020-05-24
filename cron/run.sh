#!/bin/sh
set -x
SLEEP_TIME=${SLEEP_TIME:-"5"}

while true;
do
    date
    time wp cron event run --due-now
    sleep "$SLEEP_TIME"
done
