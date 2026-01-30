#!/usr/bin/env bash

set -euxo pipefail

# Install script for dotfiles
# author: xevansz
# purpose: To install my dot files
# repo: https://github.com/xevansz/dots
# descripton: using dcli to install packages, then use bare repo to setup dots

if [[ $EUID -eq 0 ]]; then
  echo "This script must not be run as root" 
  exit 1
fi 

if ! ping -c 1 github.com >/dev/null 2>&1; then
  echo "No internet connection. Aborting."
  exit 1
fi

# prerequisists
SSH="$HOME/.ssh"

if [[ -d "$SSH" ]]; then
  chmod 700 ~/.ssh
  chmod 600 ~/.ssh/id_ed25519
  chmod 644 ~/.ssh/id_ed25519.pub
else
  echo "Do copy your .ssh/ first idiot(xevansz)"
  exit 0
fi

# dots
DOTS_REPO="git@github.com:xevansz/dots.git"
TMPDIR="/tmp/dots-tmp"
DOTS_GIT_DIR="$HOME/.dots"

if [[ -d "$DOTS_GIT_DIR" ]]; then
  echo "Dotfiles repo already exists at $DOTS_GIT_DIR. Skipping clone."
else
  git clone --separate-git-dir="$DOTS_GIT_DIR" "$DOTS_REPO" "$TMPDIR"

  rsync --recursive --verbose --exclude '.git' --exclude 'installer.sh' "$TMPDIR/" "$HOME"

  rm -rf "$TMPDIR"
fi

# gnupg folder
mkdir -p "$HOME/.local/share/gnupg"
chmod 700 "$HOME/.local/share/gnupg"

# dcli
DCLI_DIR="/tmp/dcli"

if [[ -d "$DCLI_DIR" ]]; then
  rm -rf "$DCLI_DIR"
fi

git clone https://gitlab.com/theblackdon/dcli.git "$DCLI_DIR"
cd "$DCLI_DIR"

echo "Installing dcli..."
bash -c "$DCLI_DIR/install.sh"

echo "dots install && setup complete"
echo "Apply konsave theme && Install packages"
echo "Run system maintenance after running dcli"
# dcli sync

