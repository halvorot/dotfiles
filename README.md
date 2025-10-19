# Dotfiles

This repository contains my personal dotfiles, managed using [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

Each directory in the repo corresponds to a set of configuration files for a specific application (e.g., `zsh`, `homebrew`, `git`). Stow creates symlinks from these files to my home directory.

## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
    cd ~/dotfiles
    ```

2. Install GNU Stow (if not already installed):
    ```sh
    # macOS
    brew install stow

    # Debian/Ubuntu
    sudo apt-get install stow
    ```

3. Stow the desired configuration:
    ```sh
    stow zsh
    stow vim
    stow git
    ```

## Usage

- Add new configuration files in their respective directories.
- Use `stow <directory>` to symlink them to your home directory.
- To remove symlinks, use `stow -D <directory>`.