### Install Nerd Fonts (https://www.nerdfonts.com/font-downloads)
```
unzip TheFont.zip -d ~/.local/share/fonts
fc-cache -fv
```

### Install neovim for macOS (https://github.com/neovim/neovim/releases)
```
mv ~/Downloads/nvim-osx64/ ~/bin/neovim/
```

### Backup
```
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.local/state/nvim ~/.local/state/nvim.backup
mv ~/.cache/nvim ~/.cache/nvim.backup
```

### Revert
```
mv ~/.config/nvim.backup ~/.config/nvim
mv ~/.local/share/nvim.backup ~/.local/share/nvim
mv ~/.local/state/nvim.backup ~/.local/state/nvim
mv ~/.cache/nvim.backup ~/.cache/nvim
```

### Uninstall
```
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```
