#!/bin/bash

battery=$(acpi | cut -d ',' -f 2 | cut -d '%' -f 1)

while true;
do
    if [[ "$battery" -lt "35" ]];
    then 
        notify-send "Attention, batterie à $battery %";
        sleep 600;
    fi
    if [[ "$battery" -lt "15" ]];
    then 
        notify-send "Attention, batterie à $battery %";
        sleep 300;
    fi
done
