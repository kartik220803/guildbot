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
# Use the virtualenv's python (if present) or fall back to system python3
if [ -x "venv/bin/python" ]; then
    PYTHON_BIN="venv/bin/python"
elif command -v python3 >/dev/null 2>&1; then
    PYTHON_BIN="python3"
elif command -v python >/dev/null 2>&1; then
    PYTHON_BIN="python"
else
    echo "No suitable Python interpreter found. Install Python 3 and try again:"
    echo "  sudo apt update && sudo apt install -y python3 python3-venv python3-pip"
    exit 1
fi

"$PYTHON_BIN" -m pip install --upgrade pip setuptools wheel

# Install all required Python modules
echo "Installing required Python modules..."
"$PYTHON_BIN" -m pip install protobuf google psutil pycryptodome PyJWT requests httpx urllib3 protobuf-decoder

echo "========================================="
echo "Starting gbot.py with immediate auto-restart if it crashes..."
echo "========================================="

while true
do
    # Run the Python script
    "$PYTHON_BIN" gbot.py > gbot_output.log 2>&1
    
    # Log the crash/exit
    echo "gbot.py crashed or exited. Restarting immediately..."
    
    # Optional: Add a small delay to prevent rapid restart loops
    # Uncomment the next line if you want a 5-second delay between restarts
    # sleep 5
done