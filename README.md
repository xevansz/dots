# dotfiles
A better $HOME, for me.

# setting up the dotfiles 

```
git clone --seperate-git-dir=$HOME/.dots git@github.com:xevansz/dots.git tmpdir
rsync --recursive --verbose --exclude '.git' tmpdir/ $HOME
rm -r tmpdir
```
# setting up git commands
```
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
dots config --local status.showUntrackedFiles no
```

# zshrc

do this before installing omz
```
rm ~/.zshrc ~/.zsh_history
ln -s ~/.config/zsh/.zshrc .zshrc
```

# adding plugins
```
yay -S zsh-autosuggestions zsh-syntax-highlighting
```

# finishing up
- after installing oh my zsh move custom zeta theme to themes
- yt-dlp -x --audio-format mp3 --audio-quality 0 yt-dlp folder deleted check yt-dlp config
