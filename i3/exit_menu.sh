#!/bin/bash

# shellcheck disable=SC2034
declare -A opts=( [NO]="" [YES]="" [SHUTDOWN]="" [REBOOT]="" )

#while [ "$select" != "NO" -a "$select" != "YES" ]; do
while ! [ -v opts["$select"] ]
do
    select=$(echo -e 'NO\nYES\nSHUTDOWN\nREBOOT\nHIBERNATE' | \
    dmenu \
        -nb '#151515' -nf '#999999' -sb '#f00060' -sf '#000000' \
        -fn '-*-*-medium-r-normal-*-*-*-*-*-*-100-*-*' -i \
        -p "You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.")
    [ -z "$select" ] && exit 0
done

function pre_shutdown() {
    # bug: https://bugs.launchpad.net/ubuntu/+source/pcmanfm/+bug/1878625
    # They're not pulling the fix upstream for ubuntu 20
    # pcmanfm gets killed after a 90 second delay on shutdown
    # (along with gdbus)
    killall pcmanfm
}

case "$select" in
        "NO")          exit 0 ;;
        "YES")         i3-msg exit ;;
        "SHUTDOWN")    pre_shutdown ; sudo shutdown -hP now ;;
        "REBOOT")      pre_shutdown ; sudo reboot ;;
        "HIBERNATE")   sudo systemctl hibernate ;;
        *)             echo "Bad option" | dmenu ;;  # shouldn't ever happen 
esac
