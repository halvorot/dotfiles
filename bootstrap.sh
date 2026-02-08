#!/usr/bin/env bash
set -e

# Available stow packages
ALL_PACKAGES=(claude git homebrew starship zsh mise tmux)

confirm() {
  read -r -p "$1 [y/N] " response
  [[ "$response" =~ ^[Yy]$ ]]
}

show_help() {
  cat << EOF
Usage: ./bootstrap.sh [OPTIONS] [PACKAGES...]

Bootstrap dotfiles using GNU Stow.

OPTIONS:
  -h, --help      Show this help message

PACKAGES:
  Optionally specify which packages to stow.
  Available: ${ALL_PACKAGES[*]}

  If no packages specified, all packages will be stowed.

EXAMPLES:
  ./bootstrap.sh              # Stow all packages
  ./bootstrap.sh git zsh      # Stow only git and zsh

EOF
}

check_dependencies() {
  local missing=()

  if ! command -v git >/dev/null 2>&1; then
    missing+=("git")
  fi

  if ! command -v stow >/dev/null 2>&1; then
    missing+=("stow")
  fi

  if ! command -v brew >/dev/null 2>&1; then
    missing+=("homebrew")
  fi

  if [ ${#missing[@]} -gt 0 ]; then
    echo "Error: Missing dependencies: ${missing[*]}"
    echo ""
    [[ "${missing[*]}" =~ stow ]] && echo "Install stow: brew install stow"
    [[ "${missing[*]}" =~ homebrew ]] && echo "Install Homebrew: https://brew.sh"
    exit 1
  fi
}

stow_package() {
  local pkg=$1

  if [ -d "$pkg" ]; then
    echo "[$pkg] Stowing..."
    stow "$pkg"
  else
    echo "[$pkg] Package directory not found, skipping"
  fi
}

# Parse arguments
PACKAGES=()
while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--help)
      show_help
      exit 0
      ;;
    *)
      PACKAGES+=("$1")
      shift
      ;;
  esac
done

# Use all packages if none specified
if [ ${#PACKAGES[@]} -eq 0 ]; then
  PACKAGES=("${ALL_PACKAGES[@]}")
fi

# Validate specified packages
for pkg in "${PACKAGES[@]}"; do
  if [[ ! " ${ALL_PACKAGES[*]} " =~ " $pkg " ]]; then
    echo "Error: Unknown package '$pkg'"
    echo "Available packages: ${ALL_PACKAGES[*]}"
    exit 1
  fi
done

# Check dependencies
check_dependencies

# Remove .DS_Store files (will conflict with stow)
find . -name .DS_Store -delete

# Stow packages
echo ""
echo "Stowing packages: ${PACKAGES[*]}"
echo ""
for pkg in "${PACKAGES[@]}"; do
  stow_package "$pkg"
done

# Apply macOS settings
echo ""
./macos/apply.sh
echo ""

# Homebrew
if command -v brew >/dev/null 2>&1; then
  if confirm "Install Homebrew apps from Brewfile?"; then
    brew bundle install --file homebrew/Brewfile
  else
    echo "[brew] Skipped"
  fi
else
  echo "[brew] Homebrew not installed"
fi