#!/bin/bash

# Debug: Log the script execution
echo "Starting Waybar launch script" > /tmp/waybar-launch.log

# Kill any running waybar instances
killall -q waybar

# Wait until the processes have been shut down
while pgrep -u $UID -x waybar >/dev/null; do 
    sleep 0.5
done

# Debug: Log after killing previous instances
echo "Previous Waybar instances killed" >> /tmp/waybar-launch.log

# Simple approach - always launch the laptop config
echo "Launching Waybar with laptop configuration" >> /tmp/waybar-launch.log
waybar -c $HOME/.config/waybar/config.jsonc -s $HOME/.config/waybar/style.css &

# Check if external monitor is connected
if [[ $(hyprctl monitors | grep "HDMI-A-1") ]]; then
    echo "External monitor detected, launching second Waybar instance" >> /tmp/waybar-launch.log
    waybar -c $HOME/.config/waybar/config-external.jsonc -s $HOME/.config/waybar/style-external.css &
fi

echo "Waybar launch completed" >> /tmp/waybar-launch.log