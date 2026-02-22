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

## Editor Configuration

### Neovim

This repository uses **LazyVim** as the base Neovim distribution.

- **Config location**: `nvim/lua/`
- **Main entry**: `nvim/init.lua` → `nvim/lua/config/lazy.lua`
- **Formatting**: Uses Stylua (see `nvim/stylua.toml`)
- **Indent**: 4 spaces (see `nvim/lua/config/options.lua`)
- **Shell**: Fish shell

### Running Neovim Tests

LazyVim/Lazy.nvim doesn't have traditional unit tests. To verify the config works:
```bash
nvim --headless -c "lua vim.cmd('quitall')" 2>&1
# Or test specific config:
nvim --version
```

### Code Style (Neovim/Lua)

- **Indentation**: 4 spaces (not tabs)
- **Quote style**: Double quotes for strings
- **Naming**: `snake_case` for variables/functions, `PascalCase` for modules
- **Modules**: Use `require("module.name")` pattern
- **Keymaps**: Use `vim.keymap.set()` with descriptive `desc` field

Example from `nvim/lua/config/options.lua`:
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
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
```

Example from `nvim/lua/config/lazy.lua`:
```lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({...})
```

### Shell Scripts (Bash)

- **Shebang**: `#!/usr/bin/env bash`
- **Variables**: Use `$VAR` or `${VAR}` syntax
- **Conditionals**: Use `[ ]` for test, double brackets `[[ ]]` for advanced
- **Functions**: Define with `function_name() { ... }` or `function function_name { ... }`

Example from `bin/install`:
```bash
#!/usr/bin/env bash
print_bold() {
    printf "\x1b[1m$1\x1b[0m\n"
}
if [ "$is_mac" == "y" ]; then
    folders=(alacritty nvim ranger tmux bat fish ghostty)
fi
```

### Fish Shell

- **No brackets needed**: Use `if test` or `if status is-interactive`
- **Variables**: Use `set VAR value` (not `$VAR`)
- **Export**: Use `set -x VAR value` or `set -Ux` for universal
- **Paths**: Use `fish_add_path` to add to PATH

Example from `fish/config.fish`:
```fish
if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -Ux fish_user_paths /opt/homebrew/bin $fish_user_paths
starship init fish | source
```

### Terminal Configs (Ghostty, Alacritty, Kitty)

- **Format**: Key-value pairs with `=` or YAML/TOML
- **Comments**: Use `#` for comments
- **Ghostty**: Uses `.ini`-like format (see `ghostty/config`)
- **Alacritty**: TOML format in `alacritty/*.toml`
- **Kitty**: Similar TOML format in `kitty/*.conf`

## Code Style Guidelines

### General Conventions

1. **Comments**: Use descriptive comments explaining "why", not "what"
2. **Whitespace**: Clean, consistent indentation
3. **Naming**: Descriptive names for aliases, functions, variables
4. **Error Handling**: Exit with appropriate codes (`exit 1` for errors)
5. **Paths**: Use `$HOME` instead of `~` in scripts; use `~` in configs

### Aliases (Shell)

Group by category with comment headers:
```bash
# nvim
alias v="nvim"
alias vi="nvim"

# git
alias g='git'
alias gs='git status'
```

### Keymaps (Neovim)

Always include `desc` for clarity:
```lua
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
```

## No Traditional Build/Test Commands

This is a **configuration repository**, not a software project. There are no:
- Package managers (npm, cargo, etc.)
- Test frameworks
- Linting pipelines
- Build systems

To verify configurations work:
1. **Source the config**: `source ~/.zshrc` or `source ~/.config/fish/config.fish`
2. **Restart the application**: Exit and reopen terminal/Neovim
3. **Check for errors**: Run the app and watch for errors

## Environment

- **Platform**: macOS (Darwin)
- **Shell**: Zsh + Fish (interactive)
- **Terminal**: Ghostty, Alacritty, or Kitty
- **Editor**: Neovim (LazyVim distribution)
- **Window Manager**: yabai
- **Hotkey Daemon**: skhd

## Adding New Configurations

1. Create config file in appropriate subdirectory
2. Update `bin/install` if new folders need linking
3. Test by sourcing config or restarting application

## Notes for Agents

- This is a personal dotfiles repository - not a shared codebase
- Changes here affect local development environment only
- No CI/CD or automated testing exists
- Manual verification by user required after changes
- Backup existing configs before major modifications
