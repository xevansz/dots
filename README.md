# dotfiles
A better $HOME, for you and me.

I previously had a dotfiles repo, but it was junk. This is going to be better! Hopefully.
I've already borked my system twice and had to rewrite all of these so it should be _stellar_.

# Making the repo

So easy _I_ can do it!

```
 git init --bare $HOME/git/dotfiles
 alias dotties='/usr/bin/git --git-dir=$HOME/git/dotfiles --work-tree=$HOME'
 dotties remote add origin https://github.com/dilyn-corner/dotfiles
```

# Cloning

~~Don't. This is mine.~~

```
git clone --separate-git-dir=$HOME/git/dotfiles https://github.com/dilyn-corner/dotfiles dotfiles-tmp
rsync --recursive --verbose --exclude '.git' dotfiles-tmp/ $HOME/
rm -rvf dotfiles-tmp
```

# Setup
```
dotties config status.showUntrackedFiles no
dotties remote set-url origin https://github.com/dilyn-corner/dotfiles
```

# A view

Because I need to remind you why this exists.
