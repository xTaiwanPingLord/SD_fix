#!/bin/bash

steamos-readonly disable

# Set install locations
SCRIPT_PATH="/usr/local/bin/dualboot_fix.sh"
SERVICE_PATH="/etc/systemd/system/dualboot_fix.service"
SERVICE_PATH_2="/etc/systemd/system/update_fix.service"

# Copy script to system path
install -m 755 -o root -g root dualboot_fix.sh "$SCRIPT_PATH"

# Copy service file to system path
install -m 644 -o root -g root dualboot_fix.service "$SERVICE_PATH"
install -m 644 -o root -g root update_fix.service "$SERVICE_PATH_2"

echo "[+] Reloading systemd and enabling service..."
systemctl daemon-reload
systemctl enable dualboot_fix.service
systemctl enable update_fix.service

echo "[+] Optionally starting service now..."
systemctl start dualboot_fix.service

steamos-readonly enable

echo "[✓] Installation complete."
