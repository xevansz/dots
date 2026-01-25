
# dotfiles
A better $HOME, for me.

## setting up the dotfiles 
```
git clone --separate-git-dir=$HOME/.dots git@github.com:xevansz/dots.git tmpdir
rsync --recursive --verbose --exclude '.git' tmpdir/ $HOME
rm -r tmpdir
```

## adding plugins
```
yay -S zsh-autosuggestions zsh-syntax-highlighting fzf-tab-source
```

## creating folder
```
mkdir -p "$HOME/.local/share/gnupg"
```

## theme
- colors - Everforest(KDE), compline and kanagawa for everything else
- fonts - iosevka and atkinson hyperlegible
- icons - Colloid icon theme purple
- theme - nothing or sweet  
Backed up using konsave

## dcli
```
git clone https://gitlab.com/theblackdon/dcli.git
cd dcli
./install.sh
```
