# This code is almost entirely taken from Mr. Cejas's blog: https://fernandocejas.com/blog/engineering/2022-03-30-arch-linux-system-maintance/

#!/bin/bash
set -e

echo "Updating system"
yay -Syu --noconfirm

echo
echo " Clearing pacman cache"
before=$(du -sb /var/cache/pacman/pkg | cut -f1)
paccache -rk1
after=$(du -sb /var/cache/pacman/pkg | cut -f1)
echo "Freed $(( (before-after)/1024/1024 )) MB"

echo
echo "Removing orphan packages"
orphans=$(yay -Qdtq || true)
if [ -n "$orphans" ]; then
    yay -Rns --noconfirm $orphans
else
    echo "No orphan packages found."
fi

echo
echo "Clearing ~/.cache"
before=$(du -sb ~/.cache | cut -f1)
rm -rf ~/.cache/*
after=$(du -sb ~/.cache | cut -f1)
echo "Freed $(( (before-after)/1024/1024 )) MB"

echo
echo "Cleaning system logs"
sudo journalctl --vacuum-time=7d

echo
echo "Cleanup complete "

