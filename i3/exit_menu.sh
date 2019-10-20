#!/bin/bash

# shellcheck disable=SC2034
declare -A opts=( [NO]="" [YES]="" [SHUTDOWN]="" [REBOOT]="" )

#while [ "$select" != "NO" -a "$select" != "YES" ]; do
while ! [ -v opts["$select"] ]
do
    select=$(echo -e 'NO\nYES\nSHUTDOWN\nREBOOT' | \
    dmenu \
        -nb '#151515' -nf '#999999' -sb '#f00060' -sf '#000000' \
        -fn '-*-*-medium-r-normal-*-*-*-*-*-*-100-*-*' -i \
        -p "You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.")
    [ -z "$select" ] && exit 0
done

case "$select" in
        "NO")          exit 0 ;;
        "YES")         i3-msg exit ;;
        "SHUTDOWN")    sudo shutdown -hP now ;;
        "REBOOT")      sudo reboot ;;
        *)             echo "Bad option" | dmenu ;;  # shouldn't ever happen 
esac
