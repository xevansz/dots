# This code is almost entirely taken from Mr. Cejas's blog: https://fernandocejas.com/blog/engineering/2022-03-30-arch-linux-system-maintance/

#!/bin/bash
set -e

echo "🚀 Starting comprehensive system cleanup..."
echo

echo "📦 Updating system"
yay -Syu --noconfirm
echo

echo
echo "🧹 Clearing pacman cache"
before=$(du -sb /var/cache/pacman/pkg | cut -f1)
paccache -rk1
yay -Sc --noconfirm
after=$(du -sb /var/cache/pacman/pkg | cut -f1)
echo "Freed $(( (before-after)/1024/1024 )) MB"
echo

echo
echo "👻Yeeting orphans"
orphans=$(yay -Qdtq || true)
if [ -n "$orphans" ]; then
    yay -Rns --noconfirm $orphans
    echo "Orphans yeeted succesfully"
else
    echo "No orphans found."
fi
echo

echo "🗑️ Cleaning AUR build cache"
if [ -d ~/.cache/yay ]; then
    before=$(du -sb ~/.cache/yay | cut -f1)
    rm -rf ~/.cache/yay/*
    after=$(du -sb ~/.cache/yay | cut -f1)
    echo "Freed $(( (before-after)/1024/1024 )) MB from yay cache"
fi
echo

echo
echo "🧽 Clearing ~/.cache"
before=$(du -sb ~/.cache | cut -f1)
for dir in ~/.cache/*/; do
    if [[ -d "$dir" ]]; then
        case $(basename "$dir") in
            "fontconfig"|"mesa_shader_cache"|"nvidia")
                # Keep these directories but clean old files
                find "$dir" -type f -atime +7 -delete 2>/dev/null || true
                ;;
            *)
                rm -rf "$dir"* 2>/dev/null || true
                ;;
        esac
    fi
done
after=$(du -sb ~/.cache | cut -f1)
echo "Freed $(( (before-after)/1024/1024 )) MB"
echo

echo
echo "📝Cleaning system logs"
sudo journalctl --vacuum-time=7d
echo

echo "🗂️ Cleaning persistent temporary files"
sudo find /var/tmp -type f -atime +7 -delete 2>/dev/null || true
echo

echo "📊 Final system status"
echo "Disk usage:"
df -h / /home 2>/dev/null || df -h /
echo
echo "Memory usage:"
free -h
echo

echo
echo "Cleanup complete "

