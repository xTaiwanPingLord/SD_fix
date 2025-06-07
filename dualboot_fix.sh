#!/bin/bash

steamos-readonly disable

FSTAB_LINE='LABEL=Game  /run/media/deck/Game  ntfs   defaults,nofail   0 0'

# Check if the line already exists
grep -Fxq "$FSTAB_LINE" /etc/fstab

# If not found, append it
if [ $? -ne 0 ]; then
    echo "$FSTAB_LINE" >> /etc/fstab
fi

# Try mounting it
mountpoint -q /run/media/deck/Game
if [ $? -ne 0 ]; then
    mkdir -p /run/media/deck/Game
    mount /run/media/deck/Game
fi

# Fix boot options
efibootmgr -b 0 -B
efibootmgr -b 1 -B
efibootmgr -b 2 -B
efibootmgr -b 3 -B
efibootmgr -b 4 -B
efibootmgr -b 5 -B
efibootmgr -b 6 -B
efibootmgr -b 7 -B
efibootmgr -b 8 -B
efibootmgr -b 9 -B
rm /esp/efi/microsoft -r -f
efibootmgr -c -L "rEFInd" -l "\EFI\refind\refind_x64.efi" -d /dev/nvme0n1p1

steamos-readonly enable