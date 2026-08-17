#!/bin/sh
# WALLPAPERS="/mnt/extra/walls/" 
#
# # Get this script's name and kill any other instances
# # SCRIPT_NAME="$(basename "$0")"
# # pkill -f "$SCRIPT_NAME"
#
#
# # SCRIPT_NAME=$(basename "$0")
# # INSTANCE_COUNT=$(pgrep -f "$SCRIPT_NAME" | grep -v "$$" | wc -l)
# #
# # if [ "$INSTANCE_COUNT" -gt 0 ]; then
# #     # echo "Another instance is already running. Exiting."
# #     exit 0
# # fi
# #
# pkill swaybg
#
# swaybg -i $(find "$WALLPAPERS"/. -type f | shuf -n1) -m fill &
# OLD_PID=$!
# while true; do
#     sleep 3600
#     swaybg -i $(find "$WALLPAPERS"/. -type f | shuf -n1) -m fill &
#     NEXT_PID=$!
#     sleep 2
#     kill $OLD_PID
#     OLD_PID=$NEXT_PID
# done



#!/bin/sh
WALLPAPERS="/mnt/extra/walls/"
PID_FILE="/tmp/wallpaper-rotator.pid"

# Check if PID file exists and process is running
if [ -f "$PID_FILE" ]; then
    RUNNING_PID=$(cat "$PID_FILE")
    if kill -0 "$RUNNING_PID" 2>/dev/null; then
        # Process is still running
        exit 0
    fi
fi

# Write our PID
echo $$ > "$PID_FILE"

# Cleanup on exit
trap "rm -f $PID_FILE" EXIT

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
