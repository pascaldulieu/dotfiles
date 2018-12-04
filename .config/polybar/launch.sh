#!/bin/bash
ps cax | grep polybar > /dev/null
if [ $? -eq 0 ]; then
  exit
else
  sleep 1;
  polybar top &
fi