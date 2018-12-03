#!/usr/bin/env sh
sleep 1;
# Terminate already running bar instances
killall polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
sleep 1;
polybar bar &

echo "Bars launched..."
