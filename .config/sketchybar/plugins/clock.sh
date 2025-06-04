#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

if [ "$SENDER" = "mouse.entered" ]; then
  sketchybar --set "$NAME" popup.drawing=on
elif [ "$SENDER" = "mouse.exited" ]; then
  sketchybar --set "$NAME" popup.drawing=off
fi

sketchybar --set "$NAME" label="$(date '+%d/%m %H:%M')"

for rid in {1..6}; do
  row=$(cal | awk "NR==$((rid+1))")
  sketchybar --set "$NAME.$rid" label="$row" label.padding_right=10
done
