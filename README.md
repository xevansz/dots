# dotfiles
A better $HOME, for me.
Install oh my zsh first.

# Making the repo

```
 git init --bare $HOME/dotfiles
 git clone https://github.com/xevansz/dots tmpdotfiles
 rsync --recursive --verbose --exclude={'.git', 'README.md'} tmpdotfiles/ $HOME
 rm -r tmpdotfiles
```
# zshrc
```
 ln -s ~/.config/zsh/.zshrc .zshrc
 rm ~/.zshrc ~/.zsh_history
 rm ~/.oh-my-zsh
```
#adding plugins
```
yay -S zsh-autosuggestions zsh-syntax-highlighting

```

# Setting up git push
```
alias dots='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
dots config --local status.showUntrackedFiles no
dots remote add origin https://github.com/xevansz/dots
dots status
```
# TO-do 
move custom zeta theme to themes and delete everthing in the themes folder
