#!/bin/sh

sketchybar --set "$NAME" label="$(curl wttr.in\?format=%c%t)"
