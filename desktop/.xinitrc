#!/bin/sh

# Keyboard mappings
setxkbmap se
setxkbmap -option caps:escape

# Load key mappings
xbindkeys

# Start i3 window manager
exec i3
