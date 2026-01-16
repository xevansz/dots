
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
yay -S zsh-autosuggestions zsh-syntax-highlighting
```

## creating folders
```
mkdir -p "$HOME/.local/state/zsh" 
mkdir -p "$HOME/.local/share/gnupg"
```

# theme
- colors - Everforest, compline
- fonts - iosevka and atkinson hyperlegible
- icons - Colloid icon theme purple
- theme - nothing or sweet  
Backed up using konsave
