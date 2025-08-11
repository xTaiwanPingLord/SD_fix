#!/bin/bash

steamos-readonly disable
chmod +x install.sh

# Set install locations
SCRIPT_PATH="/usr/local/bin/dualboot_fix.sh"
DUALBOOT_SERVICE_PATH="/etc/systemd/system/dualboot_fix.service"
UPDATE_SERVICE_PATH="/etc/systemd/system/update_fix.service"

# Check installation file exist in current working folder
DUALBOOT_FILE="dualboot_fix.sh"
UPDATE_FILE="dualboot_fix.sh"
DEFAULT_FOLDER="/home/deck/SD_fix"

# Check in current working directory
if [ -f "$DUALBOOT_FILE" ]; then
    echo "Found $DUALBOOT_FILE in $(pwd)"
    DUALBOOT_FILE_PATH="$(pwd)/$DUALBOOT_FILE"
    UPDATE_FILE_PATH="$(pwd)/$DEFAULT_FOLDER"
else
    echo "$DUALBOOT_FILE not found in $(pwd), using default folder"
    DUALBOOT_FILE_PATH="$DEFAULT_FOLDER/$DUALBOOT_FILE"
    UPDATE_FILE_PATH="$DEFAULT_FOLDER/$DEFAULT_FOLDER"
fi

echo "Using file: $DUALBOOT_FILE_PATH"
echo "Using file: $UPDATE_FILE_PATH"

# Copy script to system path
install -m 755 -o root -g root "$DUALBOOT_FILE_PATH" "$SCRIPT_PATH"

# Copy service file to system path
install -m 644 -o root -g root "$DUALBOOT_FILE_PATH" "$DUALBOOT_ERVICE_PATH"
install -m 644 -o root -g root "$UPDATE_FILE_PATH" "$UPDATE_SERVICE_PATH"

echo "[+] Reloading systemd and enabling service..."
systemctl daemon-reload
systemctl enable dualboot_fix.service
systemctl enable update_fix.service

echo "[+] Optionally starting service now..."
systemctl start dualboot_fix.service

steamos-readonly enable

echo "[✓] Installation complete."
