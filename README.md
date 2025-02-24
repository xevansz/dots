# dotfiles
A better $HOME, for me.
Install oh my zsh first.

# setting up the dotfiles && management through git bare repo

```
 git init --bare $HOME/dotfiles
 git clone https://github.com/xevansz/dots tmpdot
 rsync --recursive --verbose --exclude={'.git', 'README.md'} tmpdot/ $HOME
 rm -r tmpdot

 alias dots='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
 dots remote add origin git@github.com:xevansz/dots.git
 dots status
```
# zshrc

do this before installing omz
```
 rm ~/.zshrc ~/.zsh_history
 ln -s ~/.config/zsh/.zshrc .zshrc
 ```
#adding plugins
```
yay -S zsh-autosuggestions zsh-syntax-highlighting
```

# To-do 
move custom zeta theme to themes and delete everthing in the themes folder
yt-dlp -x --audio-format mp3 --audio-quality 0 yt-dlp folder deleted check yt-dlp config
