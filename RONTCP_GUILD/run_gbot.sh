#!/bin/bash

# Auto-restart script for gbot.py
# This script will continuously restart the Python application if it crashes

echo "========================================="
echo "Starting gbot.py Auto-Restart Script"
echo "========================================="


# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

# Activate virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Upgrade pip and setup tools
echo "Upgrading pip and setuptools..."
pip install --upgrade pip setuptools wheel

# Install all required Python modules
echo "Installing required Python modules..."
pip install protobuf google psutil pycryptodome PyJWT requests httpx urllib3 protobuf-decoder

echo "========================================="
echo "Starting gbot.py with immediate auto-restart if it crashes..."
echo "========================================="

while true
do
    # Run the Python script
    python gbot.py > gbot_output.log 2>&1
    
    # Log the crash/exit
    echo "gbot.py crashed or exited. Restarting immediately..."
    
    # Optional: Add a small delay to prevent rapid restart loops
    # Uncomment the next line if you want a 5-second delay between restarts
    # sleep 5
done