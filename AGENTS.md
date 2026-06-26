# AGENTS.md - Dotfiles Development Guide

This repository contains personal dotfiles for macOS configuration management.

## Repository Structure

```
dotfiles/
├── .zshrc              # Zsh shell configuration
├── .tmux.conf          # Tmux configuration
├── bin/
│   ├── install         # Main installation script
├── fish/               # Fish shell configuration
│   ├── config.fish
│   ├── functions/
│   └── themes/
├── nvim/               # Neovim (LazyVim-based)
│   ├── init.lua
│   ├── lua/
│   │   ├── config/     # Neovim config modules
│   │   ├── plugins/    # Plugin configurations
│   │   └── util/       # Utility functions
│   └── stylua.toml
├── ghostty/            # Ghostty terminal config
├── alacritty/          # Alacritty terminal config
├── kitty/              # Kitty terminal config
├── skhd/               # Simple hotkey daemon
├── yabai/              # Window manager config
└── ranger/             # File manager config
```

## Environment

- **Platform**: macOS (Darwin)
- **Shell**: Zsh + Fish (interactive)
- **Terminal**: Ghostty, Alacritty, or Kitty
- **Editor**: Neovim (LazyVim distribution)
- **Window Manager**: yabai
- **Hotkey Daemon**: skhd

## Notes for Agents

- This is a personal dotfiles repository - not a shared codebase
- Changes affect local development environment only
- No CI/CD or automated testing exists
- Manual verification by user required after changes
- Backup existing configs before major modifications
