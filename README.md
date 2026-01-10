# Dotfiles

This repository contains my personal dotfiles, managed using [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

Each directory in the repo corresponds to a set of configuration files for a specific application (e.g., `zsh`, `homebrew`, `git`). Stow creates symlinks from these files to my home directory.

## Installation

1. Clone the repository:

    ```sh
    git clone https://github.com/halvorot/dotfiles.git ~/dotfiles
    cd ~/dotfiles
    ```

## Usage

Each directory maps directly to $HOME, so `zsh/.zshrc → ~/.zshrc` and `starship/.config/starship.toml → ~/.config/starship.toml`

### Adding dotfiles

- Add new configuration files in a respective directory
- Update `ALL_PACKAGES` in `bootstrap.sh` if adding a new package

### Applying dotfiles

#### Complete bootstrap

From the root of the dotfiles repo, run:

```sh
./bootstrap.sh
```

This will safely:

- Create/update symlinks using `stow`
- Apply macOS system defaults
- Re-run without side effects

#### Selective applying

Stow specific packages only:

```sh
./bootstrap.sh git zsh         # Stow only git and zsh
./bootstrap.sh --help           # Show all options
```

Or use stow directly:

- Use `stow <directory>` when in the `dotfiles` directory to symlink them to your home directory
- To remove symlinks, use `stow -D <directory>`

## Features

### Homebrew

Script: `~/.config/scripts/brew-sync`

Syncs system with `~/Brewfile`:

- Updates Homebrew
- Upgrades formulas and casks (including greedy casks)
- Installs missing Brewfile items
- Detects items not in Brewfile with interactive cleanup option
- Removes old versions

Usage:

```sh
brew-sync
```

### macOS System Defaults

Script: `./macos/apply.sh`

Applies system preferences across Desktop, Dock, Finder, Screenshots, Trackpad.

Run via bootstrap or directly:

```sh
./macos/apply.sh
```
