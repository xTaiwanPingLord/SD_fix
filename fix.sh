sudo efibootmgr -b 0 -B
sudo efibootmgr -b 1 -B
sudo efibootmgr -b 2 -B
sudo efibootmgr -b 3 -B
sudo efibootmgr -b 4 -B
sudo efibootmgr -b 5 -B
sudo efibootmgr -b 6 -B
sudo efibootmgr -b 7 -B
sudo efibootmgr -b 8 -B
sudo efibootmgr -b 9 -B
sudo rm /esp/efi/microsoft -r -f
sudo efibootmgr -c -L "rEFInd" -l "\EFI\refind\refind_x64.efi" -d /dev/nvme0n1p1