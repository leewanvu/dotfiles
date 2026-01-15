# AGENTS.md - Development Guidelines for Dotfiles Repository

This document provides guidelines for agentic coding assistants working in this dotfiles repository. It covers build/lint/test commands, code style guidelines, and development practices.

## Build/Lint/Test Commands

Since this is a dotfiles repository rather than a traditional software project, the "build" process involves installing and testing configurations:

### Installation
```bash
# Install dotfiles (interactive)
./bin/install

# Or manually install specific configs
# Link nvim config
ln -sf $PWD/nvim ~/.config/nvim

# Link fish config
ln -sf $PWD/fish ~/.config/fish

# Link tmux config
ln -sf $PWD/.tmux.conf ~/.tmux.conf

# Link other configs as needed
```

### Testing Configurations

#### Neovim Testing
```bash
# Test Neovim config
nvim --version  # Check Neovim version compatibility
nvim -c "checkhealth"  # Run Neovim health check
nvim -c "Lazy check"   # Check Lazy plugin status
nvim -c "Mason"        # Check LSP/mason status
```

#### Fish Shell Testing
```bash
# Test fish config
fish -c "fish_config"  # Check fish configuration
fish -c "nvm --version" # Test nvm integration
fish -c "kubectl version" # Test kubectl completion
```

#### Tmux Testing
```bash
# Test tmux config
tmux -V  # Check tmux version
tmux source ~/.tmux.conf  # Source config for syntax errors
```

### Linting and Formatting

#### Lua (Neovim configs)
```bash
# Format Lua files with stylua
stylua nvim/lua/

# Lint Lua files (if luacheck is available)
luacheck nvim/lua/

# Format all Lua files in repository
find . -name "*.lua" -exec stylua {} \;
```

#### Shell Scripts
```bash
# Lint fish scripts
fish --no-execute fish/config.fish
fish --no-execute fish/**/*.fish

# Lint bash scripts
bash -n bin/install

# Check shell syntax
shellcheck bin/install
```

#### General Code Quality
```bash
# Check for syntax errors in all config files
# Neovim: nvim -c "luafile %" each lua file
# Fish: fish -n each fish file
```

## Code Style Guidelines

### Lua (Neovim Configuration)

#### Formatting
- Use 2 spaces for indentation (configured in `nvim/stylua.toml`)
- Column width: 120 characters
- Follow stylua formatting rules

#### Structure
```lua
-- Plugin configurations return table format
return {
  {
    "plugin/name",
    opts = {
      -- options here
    },
  },
}
```

#### Naming Conventions
- Use snake_case for variable names: `local my_variable`
- Use PascalCase for module names: `MyModule`
- Plugin names use kebab-case: `"plugin-name"`

#### Imports and Dependencies
```lua
-- Local requires
local config = require("config.utils")

-- Lazy plugin specs
{ import = "plugins" }
```

#### Error Handling
```lua
-- Check for errors in system calls
local out = vim.fn.system({ "git", "status" })
if vim.v.shell_error ~= 0 then
  vim.notify("Command failed: " .. out, vim.log.levels.ERROR)
end
```

#### Comments
```lua
-- Single line comments for explanations
---@diagnostic disable: missing-fields  -- Disable specific warnings

-- TODO: Add more configuration
-- FIXME: This needs to be fixed
```

### Fish Shell Scripts

#### Formatting
- Use 4 spaces for indentation (Fish default)
- Keep lines under 100 characters when possible
- Use consistent spacing around operators

#### Functions
```fish
function my_function
    # Function body
    set -l variable "value"
    echo $variable
end
```

#### Variables
```fish
# Local variables
set -l my_var "value"

# Universal variables (persistent)
set -U fish_user_paths /path $fish_user_paths

# Global variables
set -g my_global "value"
```

#### Error Handling
```fish
# Check command success
if command git status
    echo "Git repository found"
else
    echo "Not a git repository"
end

# Use or operator for fallbacks
set ref (git symbolic-ref HEAD 2>/dev/null); or \
set ref (git rev-parse --short HEAD 2>/dev/null); or return
```

#### Aliases and Abbreviations
```fish
# Simple aliases
alias ll "ls -la"

# Function-based aliases for complex operations
function current_branch
    set ref (git symbolic-ref HEAD 2>/dev/null); or \
    set ref (git rev-parse --short HEAD 2>/dev/null); or return
    echo $ref | sed -e 's|^refs/heads/||'
end

alias gcb "git checkout -b"
```

### General Configuration Files

#### Comments
```bash
# Use clear, descriptive comments
# Bad: # config
# Good: # Configure default editor
set -Ux EDITOR nvim
```

#### Organization
- Group related settings together
- Use empty lines to separate logical sections
- Order: imports/paths → basic settings → complex configurations → plugins

#### Security
- Never commit sensitive information (API keys, passwords)
- Use environment variables for secrets: `$MY_API_KEY`
- Check for hardcoded secrets before committing

### Tmux Configuration

#### Keybindings
```tmux
# Use descriptive comments for complex bindings
# Resize panes with vim-like keys
bind-key J resize-pane -D 5
bind-key K resize-pane -U 5
```

#### Options
- Group related options together
- Comment non-obvious settings
- Use consistent naming

### YAML/JSON Files

#### Formatting
- Use 2 spaces for indentation
- Keep objects/arrays on single lines when short
- Break long lines appropriately

#### Kitty Terminal Config
```conf
# Group settings by category
# Font settings
font_family JetBrains Mono
font_size 14

# Color scheme
include nord.conf
```

## Development Workflow

### Adding New Configurations

1. **Test locally first**
   ```bash
   # Test changes before committing
   nvim -c "source %"  # For vimscript
   tmux source ~/.tmux.conf  # For tmux
   fish -c "source config.fish"  # For fish
   ```

2. **Document changes**
   - Update README.md if needed
   - Add comments for complex configurations
   - Test on multiple systems if possible

3. **Version control**
   ```bash
   # Check what changed
   git status
   git diff

   # Commit with descriptive message
   git add .
   git commit -m "feat: add new neovim plugin configuration

   - Add treesitter support for language X
   - Configure LSP for better development experience"
   ```

### Cross-Platform Considerations

- **macOS vs Linux**: Use conditional logic in install scripts
- **Different architectures**: Test on both Intel and Apple Silicon
- **Version compatibility**: Check tool versions before adding features

### Plugin Management

#### LazyVim (Neovim)
```lua
-- Add new plugins in lua/plugins/
return {
  {
    "author/plugin-name",
    opts = {
      -- Plugin options
    },
    config = function()
      -- Additional configuration
    end,
  },
}
```

#### Fisher (Fish)
```fish
# Add plugins to fish_plugins
# Format: owner/repo
author/plugin-name
```

### Troubleshooting

#### Common Issues
- **Neovim**: Run `:checkhealth` and `:Lazy check`
- **Fish**: Use `fish -d` for debug mode
- **Tmux**: Check `tmux show-options` for current settings

#### Debugging Scripts
```bash
# Debug fish scripts
fish -d config.fish

# Debug bash scripts
bash -x bin/install

# Test tmux config
tmux -f .tmux.conf
```

## Testing Best Practices

### Manual Testing Checklist
- [ ] Neovim starts without errors
- [ ] All plugins load correctly
- [ ] LSP servers work
- [ ] Keybindings function as expected
- [ ] Shell aliases work
- [ ] Tmux panes/windows behave correctly
- [ ] Terminal colors display properly

### Automated Testing
```bash
# Syntax check all fish files
for file in fish/**/*.fish; do
    if ! fish --no-execute "$file"; then
        echo "Syntax error in $file"
    fi
done

# Check lua syntax
for file in nvim/lua/**/*.lua; do
    if ! nvim -l "$file"; then
        echo "Syntax error in $file"
    fi
done
```

## Performance Considerations

- **Lazy loading**: Use lazy loading for Neovim plugins when possible
- **Conditional loading**: Only load configurations when needed
- **Clean up**: Remove unused plugins and configurations regularly

## Documentation

- Keep this AGENTS.md updated when adding new patterns
- Document complex configurations with inline comments
- Update README.md for user-facing changes
- Use conventional commit messages

## Security Guidelines

- Never commit API keys, passwords, or sensitive data
- Use environment variables for secrets
- Review code for hardcoded credentials before committing
- Be cautious with shell expansions and command injection

## Contributing

1. Follow the established code style
2. Test changes thoroughly
3. Update documentation as needed
4. Use descriptive commit messages
5. Consider cross-platform compatibility</content>
<parameter name="filePath">/Users/vulq/Work/dotfiles/AGENTS.md