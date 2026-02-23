# AGENTS.md - Dotfiles Development Guide

This repository contains personal dotfiles for macOS configuration management.

## Repository Structure

```
dotfiles/
├── .zshrc              # Zsh shell configuration
├── .tmux.conf          # Tmux configuration
├── bin/
│   ├── install         # Main installation script
│   └── install-latest-nvim
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

## Installation

Run the install script:
```bash
cd /path/to/dotfiles
./bin/install
```

This links config folders to `~/.config/` and `~/.tmux.conf`.

---

## Build/Lint/Test Commands

This is a **configuration repository** - no traditional build system exists. Use these commands to verify configs:

### Neovim (Lua)

```bash
# Check Lua syntax and load config (headless test)
nvim --headless -c "lua vim.cmd('quitall')" 2>&1

# Verify Neovim version loads correctly
nvim --version

# Format Lua with Stylua (must be installed: brew install stylua)
stylua --check nvim/lua/  # Check formatting only
stylua nvim/lua/          # Auto-fix formatting
```

### Shell Scripts (Bash)

```bash
# Lint bash scripts (requires shellcheck: brew install shellcheck)
shellcheck bin/*

# Syntax check bash scripts
bash -n bin/install
```

### All Configs

```bash
# Verify all configs load without errors
# For Neovim:
nvim --headless +qa 2>&1

# For Fish:
fish -c "source ~/.config/fish/config.fish" 2>&1

# For Zsh:
zsh -n ~/.zshrc 2>&1
```

---

## Code Style Guidelines

### Neovim/Lua

| Rule | Convention |
|------|------------|
| **Indentation** | 2 spaces (see `nvim/stylua.toml`) |
| **Quote style** | Double quotes for strings |
| **Naming** | `snake_case` for variables/functions, `PascalCase` for modules |
| **Modules** | Use `require("module.name")` pattern |
| **Keymaps** | Always use `vim.keymap.set()` with descriptive `desc` field |

**Example** (`nvim/lua/config/options.lua`):
```lua
vim.scriptencoding = "utf-8"
vim.g.snacks_animate = false
local opt = vim.opt
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.shell = "fish"
opt.smarttab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
```

**Keymap example**:
```lua
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
```

**Require pattern**:
```lua
local util = require("util")
local plugins = require("plugins")
```

### Shell Scripts (Bash)

| Rule | Convention |
|------|------------|
| **Shebang** | `#!/usr/bin/env bash` |
| **Indentation** | 4 spaces |
| **Variables** | Use `$VAR` or `${VAR}` syntax |
| **Conditionals** | Use `[ ]` for test, `[[ ]]` for advanced |
| **Error handling** | Use `set -e` to exit on errors |
| **Functions** | Define with `function_name() { ... }` |

**Example** (`bin/install`):
```bash
#!/usr/bin/env bash

set -e

print_bold() {
    printf "\x1b[1m%s\x1b[0m\n" "$1"
}

if [ "$is_mac" == "y" ]; then
    folders=(alacritty nvim ranger tmux bat fish ghostty)
fi
```

**Error handling pattern**:
```bash
if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
    }, true, {})
    os.exit(1)
end
```

### Fish Shell

| Rule | Convention |
|------|------------|
| **Conditionals** | Use `if test` or `if status is-interactive` (no brackets) |
| **Variables** | Use `set VAR value` (not `$VAR`) |
| **Export** | Use `set -x VAR value` or `set -Ux` for universal |
| **Paths** | Use `fish_add_path` to add to PATH |

**Example** (`fish/config.fish`):
```fish
if status is-interactive
end

set -Ux fish_user_paths /opt/homebrew/bin $fish_user_paths
starship init fish | source
```

### Terminal Configs

| Tool | Format | Location |
|------|--------|----------|
| **Ghostty** | `.ini`-like | `ghostty/config` |
| **Alacritty** | TOML | `alacritty/*.toml` |
| **Kitty** | TOML | `kitty/*.conf` |

- Use `#` for comments
- Key-value pairs with `=`

---

## General Conventions

1. **Comments**: Explain "why", not "what"
2. **Whitespace**: Clean, consistent indentation
3. **Naming**: Descriptive names for aliases, functions, variables
4. **Paths**: Use `$HOME` in scripts; use `~` in configs
5. **Exit codes**: Use `exit 1` for errors, `exit 0` for success

### Aliases (Shell)

Group by category with comment headers:
```bash
# nvim
alias v="nvim"
alias vi="nvim"

# git
alias g="git"
alias gs="git status"
```

---

## Environment

- **Platform**: macOS (Darwin)
- **Shell**: Zsh + Fish (interactive)
- **Terminal**: Ghostty, Alacritty, or Kitty
- **Editor**: Neovim (LazyVim distribution)
- **Window Manager**: yabai
- **Hotkey Daemon**: skhd

---

## Adding New Configurations

1. Create config file in appropriate subdirectory
2. Update `bin/install` if new folders need linking
3. Test by sourcing config or restarting application

---

## Notes for Agents

- This is a personal dotfiles repository - not a shared codebase
- Changes affect local development environment only
- No CI/CD or automated testing exists
- Manual verification by user required after changes
- Backup existing configs before major modifications
