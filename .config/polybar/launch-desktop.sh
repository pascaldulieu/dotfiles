#!/bin/bash
ps cax | grep polybar > /dev/null
if [ $? -eq 0 ]; then
  exit
else
  sleep 1;
  MONITOR=HDMI1 polybar top &
  MONITOR=HDMI2 polybar top &
  MONITOR=DP1 polybar top &
fi