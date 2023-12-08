cd $HOME
mkdir -p .local/bin
mkdir -p .local/src
git clone --separate-git-dir=$HOME/.dots https://github.com/xevansz/dots.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
# dwm: Window Manager
git clone --depth=1 https://github.com/xevans/dwm.git ~/.local/src/dwm
sudo make -C ~/.local/src/dwm install

# st: Terminal
git clone --depth=1 https://github.com/xevansz/st.git ~/.local/src/st
sudo make -C ~/.local/src/st install

# dmenu: Program Menu
git clone --depth=1 https://github.com/xevansz/dmenu.git ~/.local/src/dmenu
sudo make -C ~/.local/src/dmenu install

# dmenu: Dmenu based Password Prompt
git clone --depth=1 https://github.com/xevansz/dmenu.git ~/.local/src/dmenu
sudo make -C ~/.local/src/dmenu clean install

# dwmblocks: Status bar for dwm
git clone --depth=1 https://github.com/xevansz/dwmblocks.git ~/.local/src/dwmblocks
sudo make -C ~/.local/src/dwmblocks install

# pikaur: AUR helper
git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -fsri
cd
pikaur -S libxft-bgra-git yt-dlp-drop-in ttf-linux-libertine ttf-dejavu ttf-inconsolata

ln -s ~/.config/x11/xinitrc .xinitrc
ln -s ~/.config/shell/profile .zprofile
ln -s ~/.dots
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv ~/.oh-my-zsh ~/.config/zsh/oh-my-zsh
rm ~/.zshrc ~/.zsh_history
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dots config --local status.showUntrackedFiles no

# fonts
sudo pacman -S noto-fonts-cjk noto-fonts-emoji noto-fonts
