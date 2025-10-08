#!/bin/bash

# Render-optimized auto-restart script for gbot.py
# This script will continuously restart the Python application if it crashes

echo "========================================="
echo "Starting gbot.py Auto-Restart Script on Render"
echo "========================================="

# Install packages if not already installed (Render handles this via buildCommand)
echo "Python environment is already set up by Render"

echo "========================================="
echo "Starting gbot.py with immediate auto-restart if it crashes..."
echo "========================================="

while true
do
    # Run the Python script
    python gbot.py 2>&1 | tee -a gbot_output.log
    
    # Log the crash/exit
    echo "$(date): gbot.py crashed or exited. Restarting immediately..." | tee -a gbot_output.log
    
    # Small delay to prevent rapid restart loops in case of immediate failures
    sleep 2
done