#!/bin/bash

function main() {
  hyprctl hyprpaper unload all
  killall hyprpaper

  # Create a fresh config file
  cat > ~/.config/hypr/hyprpaper.conf << EOF
splash = false
ipc = true
EOF

  monitors=$(hyprctl monitors -j | jq -r ".[] | .name")

  # First, preload all wallpapers
  wallpapers=()
  for monitor in $monitors; do
    wallpaper=$(fd ".png|.jpg|.jpeg|.webp" ~/Desktop/WALLS/ | shuf -n1)
    if [[ -n "$wallpaper" && -f "$wallpaper" ]]; then
      wallpapers+=("$wallpaper")
      echo "preload = $wallpaper" >> ~/.config/hypr/hyprpaper.conf
    fi
  done

  # Add a fallback wallpaper
  fallback_wallpaper=$(fd ".png|.jpg|.jpeg|.webp" ~/Desktop/WALLS/ | shuf -n1)
  if [[ -n "$fallback_wallpaper" && -f "$fallback_wallpaper" ]]; then
    echo "preload = $fallback_wallpaper" >> ~/.config/hypr/hyprpaper.conf
  fi

  echo "" >> ~/.config/hypr/hyprpaper.conf

  # Then set wallpapers for each monitor
  i=0
  for monitor in $monitors; do
    if [[ -n "${wallpapers[$i]}" ]]; then
      echo "wallpaper = $monitor,${wallpapers[$i]}" >> ~/.config/hypr/hyprpaper.conf
    elif [[ -n "$fallback_wallpaper" ]]; then
      echo "wallpaper = $monitor,$fallback_wallpaper" >> ~/.config/hypr/hyprpaper.conf
    fi
    ((i++))
  done

  # Set fallback for any monitor
  if [[ -n "$fallback_wallpaper" ]]; then
    echo "wallpaper = ,$fallback_wallpaper" >> ~/.config/hypr/hyprpaper.conf
  fi

  hyprpaper &
  sleep 10m
  main
}

main
