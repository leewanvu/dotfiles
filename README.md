# Dotfiles

A collection of configuration files for various tools and applications to create a consistent and efficient development environment.

## Features

This dotfiles repository includes configurations for:

- **Neovim** - Modern text editor with LazyVim setup, LSP, treesitter, and various plugins
- **Fish Shell** - User-friendly shell with custom functions, aliases, and completions
- **Tmux** - Terminal multiplexer with custom keybindings and status line
- **Kitty** - Fast, feature-rich terminal emulator (Linux)
- **Alacritty** - GPU-accelerated terminal emulator (macOS)
- **Starship** - Minimal, fast shell prompt
- **Bat** - Cat clone with syntax highlighting
- **Ranger** - File manager with vim-like keybindings
- **Yabai** - macOS window manager
- **Skhd** - macOS hotkey daemon
- **Zsh** - Alternative shell configuration

## Installation

### Prerequisites

- Git
- Bash

### Quick Install

```bash
git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bin/install
```

The install script will:
- Prompt for confirmation
- Ask if you're on macOS
- Create symlinks for all configuration files
- Handle platform-specific differences

### Manual Installation

For manual installation, create symlinks from this directory to your home directory:

```bash
# Neovim
ln -sf $PWD/nvim ~/.config/nvim

# Fish shell
ln -sf $PWD/fish ~/.config/fish

# Tmux
ln -sf $PWD/.tmux.conf ~/.tmux.conf

# Kitty (Linux)
ln -sf $PWD/kitty ~/.config/kitty

# Starship
ln -sf $PWD/starship.toml ~/.config/starship.toml

# And so on for other configs...
```

## Usage

After installation, restart your terminal or source your shell configuration.

### Neovim

Launch with `nvim` - includes LazyVim with custom plugins and configurations.

### Fish Shell

Your default shell will use the fish configuration with custom functions and completions.

### Tmux

Start tmux sessions with `tmux` - custom keybindings and status bar.

## Customization

Feel free to modify any configuration files to suit your needs. The structure follows standard conventions for each tool.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

See individual config directories for license information.