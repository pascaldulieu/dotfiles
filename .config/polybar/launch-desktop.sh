#!/bin/bash
ps cax | grep polybar > /dev/null
if [ $? -eq 0 ]; then
  exit
else
  sleep 1;
  MONITOR=DP-1 polybar top &
  MONITOR=HDMI-0 polybar top &
  MONITOR=DP-3 polybar top &
fi