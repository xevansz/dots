# ~This code is almost entirely taken from Mr. Cejas's blog~: https://fernandocejas.com/blog/engineering/2022-03-30-arch-linux-system-maintance/, making some small changes

#!/bin/bash
set -euo pipefail

echo "Starting comprehensive system cleanup..."
echo

# echo "refresh mirros"
# rate-mirrors arch | sudo tee /etc/pacman.d/mirrorlist || echo "Mirror refresh failed"
echo

echo "Updating system"
paru -Syu --noconfirm
echo

echo
echo "Clearing pacman cache"
before=$(sudo du -sb /var/cache/pacman/pkg 2>/dev/null | cut -f1 || echo 0)
sudo rm -rf /var/cache/pacman/pkg/download-*
paccache -rk2
after=$(sudo du -sb /var/cache/pacman/pkg | cut -f1)
echo "Freed $(( (before-after)/1024/1024 )) MB"
echo

echo "Cleaning AUR build cache"
if [ -d ~/.cache/paru ]; then
    before=$(du -sb ~/.cache/paru | cut -f1)
    sudo rm -rvf ~/.cache/paru/*
    after=$(du -sb ~/.cache/paru | cut -f1)
    echo "Freed $(( (before-after)/1024/1024 )) MB from paru cache"
fi
echo

echo
echo "Cleaning system logs"
sudo journalctl --vacuum-time=7d
echo

echo "Cleaning persistent temporary files"
sudo find /var/tmp -type f -atime +7 -delete 2>/dev/null || true
echo

echo "Final system status"
echo "Disk usage:"
df -h / /home 2>/dev/null || df -h /
echo
echo "Memory usage:"
free -h

echo
echo "Cleanup complete "

