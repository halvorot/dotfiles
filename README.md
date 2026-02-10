# Dotfiles

This repository contains my personal dotfiles, managed using [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

Each directory in the repo corresponds to a set of configuration files for a specific application (e.g., `zsh`, `homebrew`, `git`). Stow creates symlinks from these files to my home directory.

Each directory maps directly to $HOME, so `zsh/.zshrc → ~/.zshrc` and `starship/.config/starship.toml → ~/.config/starship.toml`

## What's Included

- **claude**: [Claude Code](https://code.claude.com/docs/en/overview) instructions, agents, skills and settings.
- **ghostty**: Config for the [Ghostty](https://ghostty.org) terminal.
- **git**: Git config.
- **homebrew**: [Homebrew](https://brew.sh) Brewfile for declarative installation of apps.
- **macos**: Script for setting macOS settings.
- **mise**: [Mise](https://mise.jdx.dev) config for installed dev tools.
- **starship**: Config for [Starship](https://starship.rs/), a cross-shell prompt.
- **zsh**: [Zsh](https://www.zsh.org/) shell configurations.

## Installation

0. Install `git` and `homebrew`

1. Clone the repository:

    ```sh
    git clone https://github.com/halvorot/dotfiles.git ~/dotfiles
    cd ~/dotfiles
    ```

2. Apply to the system via either:

    **Complete bootstrap**

    ```sh
    ./bootstrap.sh
    ```

    This will safely:

    - Create/update symlinks using `stow`
    - Apply macOS system defaults
    - Optionally, install apps from Brewfile via Homebrew
    - Is safe to re-run without side effects

    Or **selective bootstrap** with

    ```sh
    ./bootstrap.sh git zsh # Stow only git and zsh
    ```

    Or use **stow directly**:

    ```sh
    stow <directory>
    ```

    To remove symlinks, use `stow -D <directory>`

### Additional manual configs

- Remap `Caps-Lock` to `Control` in `System Preferences -> Keyboard -> Keyboard Shortcuts -> Modifier keys`
- Change the shortcut for `Move focus to next window` in `System Preferences -> Keyboard -> Keyboard Shortcuts -> Keyboard`

## Adding new dotfiles

- Add new configuration files in a respective directory
- Update `ALL_PACKAGES` in `bootstrap.sh` if adding a new package
- Run `./bootstrap.sh`

## Features

### Homebrew

Script: `~/.config/scripts/brew-sync`

To use, run in terminal:

```sh
brew-sync
```

Syncs system with `~/Brewfile`:

- Updates Homebrew
- Upgrades formulas and casks (including greedy casks)
- Installs missing Brewfile items
- Detects items not in Brewfile with interactive cleanup option
- Cleans up old versions

### macOS System Defaults

Script: `./macos/apply.sh`

Applies system preferences across Desktop, Dock, Finder, Screenshots, Trackpad.

Run via bootstrap or directly:

```sh
./macos/apply.sh
```
