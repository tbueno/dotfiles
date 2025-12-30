# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for macOS using Nix Flakes with nix-darwin and home-manager. It manages system configuration, installed packages, and dotfiles declaratively.

The `./config` folder contains subfolders that will be symlinked to ~/.config.

The `./oh-my-zsh/` folder contains the plugins used by oh-my-zsh.

## Build Commands

```bash
# Apply all configuration changes (system + home-manager)
darwin-rebuild switch --flake ~/dev/dotfiles

# Check configuration without applying
darwin-rebuild check --flake ~/dev/dotfiles

# Build without switching (useful for testing)
darwin-rebuild build --flake ~/dev/dotfiles
```

## Architecture

The repository uses a nested flake structure:

- `flake.nix` - Root flake that composes nix-darwin + home-manager, defines host-specific variables (hostname, username, email)
- `flake/flake.nix` - Inner flake that exports `home` and `system` modules

**Module Organization:**
- `flake/system.nix` - nix-darwin system configuration (imports `system/macos.nix`, `programs/homebrew.nix`)
- `flake/home.nix` - home-manager user configuration (imports program modules and `dotfiles.nix`)
- `flake/dotfiles.nix` - Maps raw config files from `flake/dotfiles/` to home directory
- `flake/programs/*.nix` - Individual program configurations (zsh, neovim, wezterm, etc.)
- `flake/profiles/*.nix` - Optional profile-specific settings (e.g., work environment)

**Raw Dotfiles:**
- `flake/dotfiles/` - Contains actual config files (gitconfig, psqlrc, wezterm.lua) that get symlinked to `$HOME`
