#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/code/dotfiles"

echo "==> Starting dotfiles install..."

# 1. Install Homebrew if missing
if ! command -v brew &>/dev/null; then
  echo "==> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 2. Install all packages and casks
echo "==> Running brew bundle..."
brew bundle --file="$DOTFILES/Brewfile"

# 3. Symlink configs via GNU Stow
echo "==> Stowing configs..."
cd "$DOTFILES"
stow -t "$HOME" zsh ghostty zed yt-dlp karabiner aws claude git

# 4. Apply macOS system preferences
echo "==> Applying macOS defaults..."
bash "$DOTFILES/macos/defaults.sh"

# 5. Set default file type associations
echo "==> Setting file type associations..."
bash "$DOTFILES/macos/duti.sh"

echo ""
echo "Done. See README.md for remaining manual steps."
