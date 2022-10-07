#!/bin/bash
wifi="$(nmcli r wifi | awk 'FNR = 2 {print $1}')"
if [ "$wifi" == "enabled" ]; then
    rfkill block all &
    notify-send 'Airplane mode : on'
else
    rfkill unblock all &
    notify-send 'Airplane mode : off'
fi
