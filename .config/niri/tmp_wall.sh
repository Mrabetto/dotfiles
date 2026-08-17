#!/bin/sh
WALLPAPERS="/mnt/extra/walls/"
LOCK_FILE="/tmp/wallpaper-rotator.lock"
LOG_FILE="/tmp/wallpaper-rotator.log"

# Redirect output to log file
exec >> "$LOG_FILE" 2>&1

echo "=== Script started at $(date) ==="

# Try to acquire lock, exit if already locked
exec 200>"$LOCK_FILE"
flock -n 200 || { echo "Already running, exiting"; exit 0; }

# Wait a bit for compositor to be ready
sleep 2

# Check if wallpaper directory exists
if [ ! -d "$WALLPAPERS" ]; then
    echo "ERROR: Wallpaper directory $WALLPAPERS does not exist"
    exit 1
fi

# Check if there are any files
FILE_COUNT=$(find "$WALLPAPERS" -type f | wc -l)
echo "Found $FILE_COUNT wallpaper files"

if [ "$FILE_COUNT" -eq 0 ]; then
    echo "ERROR: No wallpaper files found in $WALLPAPERS"
    exit 1
fi

# Kill existing swaybg
pkill swaybg
sleep 1

# Start first wallpaper
FIRST_WALL=$(find "$WALLPAPERS" -type f | shuf -n1)
echo "Setting initial wallpaper: $FIRST_WALL"
swaybg -i "$FIRST_WALL" -m fill &
OLD_PID=$!
echo "Started swaybg with PID: $OLD_PID"

while true; do
    sleep 3600
    NEXT_WALL=$(find "$WALLPAPERS" -type f | shuf -n1)
    echo "$(date): Changing to: $NEXT_WALL"
    swaybg -i "$NEXT_WALL" -m fill &
    NEXT_PID=$!
    sleep 2
    kill $OLD_PID 2>/dev/null
    OLD_PID=$NEXT_PID
done
