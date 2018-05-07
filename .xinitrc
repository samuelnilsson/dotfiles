#!/bin/sh

# Keyboard mappings
setxkbmap se
setxkbmap -option caps:escape

# Start i3 window manager
exec i3
