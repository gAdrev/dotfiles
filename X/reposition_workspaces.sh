#!/bin/bash

SECONDARY_NAME=$(xrandr | grep " connected" | grep -v primary | cut -d' ' -f1)
i3-msg '[workspace="^(1|3|5|7|9)"] move workspace to output primary'
i3-msg '[workspace="^(2|4|6|8|10)"] move workspace to output '"$SECONDARY_NAME"
