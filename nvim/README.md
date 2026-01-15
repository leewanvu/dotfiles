# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# Installation & Setup

## Prerequisites
- Neovim 0.9+ (latest stable recommended)
- Git
- A terminal with true color support

## Installation
1. Clone this repository
2. Run `./bin/install` to symlink configurations
3. Start Neovim - plugins will install automatically

## Upgrade Neovim
```bash
# Download latest release from https://github.com/neovim/neovim/releases
# For macOS with Homebrew:
brew update && brew upgrade neovim

# Or manually:
mv ~/bin/neovim/ ~/bin/neovim_bak/
mv ~/Downloads/nvim-osx64/ ~/bin/neovim/
```

## Health Check
Run `:checkhealth` in Neovim to verify configuration.

# Configuration Overview

This is a LazyVim-based Neovim configuration with the following customizations:

## Enabled LazyVim Extras
- **Coding**: Yanky (improved yank/paste)
- **Languages**: Go, JSON, TOML
- **UI**: Mini indentscope
- **Utilities**: Dot (graphviz)

## Disabled Plugins
- Bufferline (tabline)
- Incline (floating statuslines) - disabled for performance
- Various other defaults for minimal setup

## Pinned Plugins
- Gitsigns: Pinned to commit `7010000889bfb6c26065e0b0f7f1e6aa9163edd9` for stability

## Key Features
- [x] Super tab completion
- [x] Custom keymaps for CMP
- [x] Telescope file browser
- [x] Terminal configuration
- [x] Disabled animated indent lines
- [x] PHP indentation fixes
- [x] Custom statusline (Lualine)
- [x] Gitsigns keymaps
- [x] LSP support for PHP and other languages
- [x] Tmux integration
- [x] GitHub Copilot integration

## Recent Changes
- Optimized plugin loading by disabling unused plugins
- Pinned gitsigns for stability
- Removed markdown and vscode extras for better performance
