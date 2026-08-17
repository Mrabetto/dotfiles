#!/bin/sh
WALLPAPERS="/mnt/extra/walls/"
LOCK_FILE="/tmp/wallpaper-rotator.lock"

# Try to acquire lock, exit if already locked
exec 200>"$LOCK_FILE"
flock -n 200 || exit 0

pkill swaybg
swaybg -i $(find "$WALLPAPERS"/. -type f | shuf -n1) -m fill &
OLD_PID=$!

while true; do
    sleep 3600
    swaybg -i $(find "$WALLPAPERS"/. -type f | shuf -n1) -m fill &
    NEXT_PID=$!
    sleep 2
    kill $OLD_PID
    OLD_PID=$NEXT_PID
done
