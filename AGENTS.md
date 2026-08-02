# AGENTS.md

Personal macOS dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/). No build, no tests, no CI — this is just config files. Read this instead of exploring the tree.

## Structure

Each top-level directory is a Stow package mirroring its target under `$HOME`:

| Package | Symlinks to | Contents |
|---|---|---|
| `fish/` | `~/.config/fish/` | shell config, prompt, fnm conf.d |
| `ghostty/` | `~/.config/ghostty/` | terminal config |
| `zed/` | `~/.config/zed/` | editor keymap + settings (JSON) |
| `yt-dlp/` | `~/.config/yt-dlp/` | yt-dlp config |
| `karabiner/` | `~/.config/karabiner/` | keyboard remapping (karabiner.json) |
| `aws/` | `~/.aws/` | AWS CLI config |
| `claude/` | `~/.claude/settings.json` | Global Claude Code settings (permissions, notif prefs) — not the whole `~/.claude/` dir, which is mostly ephemeral session state |
| `git/` | `~/.gitconfig`, `~/.config/git/ignore` | Git identity + global gitignore |

Non-package directories:
- `macos/` — `defaults.sh` (system preferences) and `duti.sh` (file-type associations), run standalone, not stowed
- `raycast/` — standalone shell scripts imported manually into the Raycast app
- `wallpapers/` — binary image assets (PNG/JPG), not config; never grep/read these, treat as opaque
- `scripts/` — standalone utility scripts (e.g. `mac_migration_scan.sh`), not stowed, run manually
- `archive/` — historical one-off migration reports/notes, kept for reference only, never applied
- `.obsidian/` — this repo doubled as an Obsidian vault; not a Stow package, ignore for config purposes

## Key files
- `install.sh` — full bootstrap: installs Homebrew, `brew bundle`s the `Brewfile`, stows packages, applies `macos/defaults.sh` and `macos/duti.sh`. **Never run this** (or the macos/*.sh scripts) without explicit user confirmation — it installs software and mutates system settings/symlinks in `$HOME`.
- `Brewfile` — all brew/cask packages, flat list, grouped by comment headers
- `.stow-global-ignore` — extra Stow ignore patterns beyond its defaults (dotfiles, `.DS_Store`, README)

## Conventions
- Adding a new package: `mkdir -p <pkg>/.config/<pkg>`, move the live config in, `stow <pkg>` from repo root, then add `<pkg>` to the `stow` line in `install.sh` and a row to the README table. Keep AGENTS.md's table in sync too.
- Preserve exact formatting in shell scripts and JSON/fish configs — these are live configs synced to a real machine, not sample code.
- `.DS_Store` files scattered in package dirs are macOS cruft, not meaningful; ignore them.
