#!/bin/sh

if [ "$SENDER" = "mouse.entered" ]; then
  sketchybar --set "$NAME" popup.drawing=on
elif [ "$SENDER" = "mouse.exited" ]; then
  sketchybar --set "$NAME" popup.drawing=off
fi

# Centralised weather fetching
weather_info="$(curl -s wttr.in\?format=%c+%t+%h+%p+%u)"

# Extract relevant weather into cells
weather_icon="$(echo $weather_info | cut -d' ' -f1)"
temp="$(echo $weather_info | cut -d' ' -f2 | cut -d'+' -f2)"
humidity="$(echo $weather_info | cut -d' ' -f3)"
rain="$(echo $weather_info | cut -d' ' -f4)"
uv="$(echo $weather_info | cut -d' ' -f5)"

sketchybar --set "$NAME" label="$temp" icon="$weather_icon" \
           --set "$NAME.humidity" label="$humidity" icon=󰖌 \
           --set "$NAME.rain" label="$rain" icon= \
           --set "$NAME.uv" label="$uv" icon=
