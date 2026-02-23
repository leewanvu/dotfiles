# Dotfiles

Personal macOS configuration files.

## Structure

```
dotfiles/
├── .zshrc              # Zsh shell configuration
├── .tmux.conf          # Tmux configuration
├── bin/
│   └── install         # Installation script
├── bat/                # Bat (cat clone) config
├── fish/               # Fish shell configuration
├── ghostty/            # Ghostty terminal config
├── nvim/               # Neovim (LazyVim-based)
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

This script links the following folders to `~/.config/`:
- `nvim` → `~/.config/nvim`
- `tmux` → `~/.tmux.conf`
- `bat` → `~/.config/bat`
- `fish` → `~/.config/fish`
- `ghostty` → `~/.config/ghostty`

## Requirements

- macOS
- Homebrew (for installing dependencies)
