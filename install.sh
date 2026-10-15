#!/usr/bin/env bash
# Installs ghnew into ~/.local/bin and makes sure that directory is on your PATH.
set -euo pipefail

DEST="$HOME/.local/bin"
mkdir -p "$DEST"
curl -fsSL https://raw.githubusercontent.com/drewmutt/GitUp/main/ghnew -o "$DEST/ghnew"
chmod +x "$DEST/ghnew"
echo "Installed ghnew to $DEST/ghnew"

case ":$PATH:" in
  *":$DEST:"*) ;;
  *)
    case "${SHELL##*/}" in
      zsh)  RC="$HOME/.zshrc" ;;
      bash) RC="$HOME/.bashrc" ;;
      *)    RC="$HOME/.profile" ;;
    esac
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$RC"
    echo "Added ~/.local/bin to PATH in $RC — open a new terminal to use ghnew."
    ;;
esac

command -v gh >/dev/null || echo "Note: ghnew needs the GitHub CLI. Install it (brew install gh) and run: gh auth login"
