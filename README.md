# Dotfiles

Personal macOS configuration files.

## Structure

```
dotfiles/
├── .zshrc              # Zsh shell configuration
├── .tmux.conf          # Tmux configuration
├── bin/
│   ├── install         # Main installation script
│   └── install-latest-nvim
├── fish/               # Fish shell configuration
├── nvim/               # Neovim (LazyVim-based)
├── ghostty/            # Ghostty terminal config
├── alacritty/          # Alacritty terminal config
├── kitty/              # Kitty terminal config
├── skhd/               # Simple hotkey daemon
├── yabai/              # Window manager config
└── ranger/             # File manager config
```

## Installation

```bash
cd /path/to/dotfiles
./bin/install
```

This links config folders to `~/.config/` and `~/.tmux.conf`.

## Requirements

- macOS
- Homebrew (for installing dependencies)
