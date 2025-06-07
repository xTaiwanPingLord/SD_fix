#!/bin/bash

steamos-readonly disable

# Define paths
SCRIPT_PATH="$PWD/dualboot_fix.sh"
SERVICE_PATH="$PWD/dualboot_fix.service"

systemctl disable dualboot_fix.service

# Set permissions
chmod +x "$SCRIPT_PATH"
chown root:root "$SCRIPT_PATH"

echo "[+] Reloading systemd and enabling service..."
systemctl daemon-reload
systemctl enable $SERVICE_PATH

echo "[+] Optionally starting service now..."
systemctl start dualboot_fix.service

steamos-readonly enable

echo "[✓] Installation complete."
