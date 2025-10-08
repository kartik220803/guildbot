#!/bin/bash

# Render-optimized auto-restart script for gbot.py
# This script will continuously restart the Python application if it crashes

echo "========================================="
echo "Starting gbot.py Auto-Restart Script on Render"
echo "========================================="

# Render handles Python environment setup, so we skip venv creation
echo "Python environment is managed by Render"

echo "========================================="
echo "Starting gbot.py with immediate auto-restart if it crashes..."
echo "========================================="

while true
do
    # Run the Python script and log to both file and stdout
    python gbot.py 2>&1 | tee -a runner.log
    
    # Log the crash/exit with timestamp
    echo "$(date): gbot.py crashed or exited. Restarting immediately..." | tee -a runner.log
    
    # Small delay to prevent rapid restart loops
    sleep 2
done